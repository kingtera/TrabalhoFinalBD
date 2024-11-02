-------------------------------------------- GERAR BONIFICAÇÃO --------------------------------------------
/* Função para adicionar pagamento bônus no schema financeiro quando 
 * o status da tarefa na tabela projetos.tb_tarefas for colocado 
 * como Concluido antes da data de fim, é adicionado um bônus 
 * de 0,07% do salário do gerente do projeto no próximo pagamento e 
 * 0,3% para o funcionario que concluiu a tarefa */
create or replace function financeiro.adicionar_bonus()
returns trigger as $$
declare
    salario_gerente decimal(10, 2);
    salario_funcionario decimal(10, 2);
    bonus_gerente decimal(10, 2);
    bonus_funcionario decimal(10, 2);
    data_proximo_pagamento date;
    novo_id_pagamento int;
begin
    -- inserção da data_conclusao com a data atual
    new.data_conclusao := current_date;

    -- verificar se o status é 'C' (concluído) e a nova data_conclusao é menor que a data_fim
    if new.status = 'C' and new.data_conclusao < new.data_fim then
        -- buscar o salário do gerente na tabela tb_funcionarios
        select salario into salario_gerente 
        from recursoshumanos.tb_funcionarios
        where id_funcionario = (select id_gerente_projeto from projetos.tb_projetos where id_projeto = new.id_projeto);
       
        -- buscar o salário do funcionário na tabela tb_funcionarios
        select salario into salario_funcionario 
        from recursoshumanos.tb_funcionarios 
        where id_funcionario = new.id_funcionario;

        -- cálculo dos bônus do funcionário e do gerente do projeto
        bonus_gerente := salario_gerente * 0.0007;
        bonus_funcionario := salario_funcionario * 0.003;

        -- definição da data do próximo pagamento como dia 05 do mês seguinte
        data_proximo_pagamento := date_trunc('month', current_date) + interval '1 month' + interval '4 days';

        -- obter o próximo id de pagamento conforme o maior valor de id na tb_pagamentos
        select coalesce(max(id_pagamento), 0) + 1 into novo_id_pagamento from financeiro.tb_pagamentos;

        -- inserção do bônus do gerente na tabela de pagamentos, incluindo o id_projeto
        insert into financeiro.tb_pagamentos (id_pagamento, id_funcionario, data_pagamento, valor, id_projeto)
        values (novo_id_pagamento,
                (select id_gerente_projeto from projetos.tb_projetos where id_projeto = new.id_projeto),
                data_proximo_pagamento,
                bonus_gerente,
                new.id_projeto);  -- Associando o id_projeto

        -- obter o próximo id de pagamento conforme o maior valor de id na tb_pagamentos
        select coalesce(max(id_pagamento), 0) + 1 into novo_id_pagamento from financeiro.tb_pagamentos;

        -- inserção do bônus do funcionário na tabela de pagamentos, incluindo o id_projeto
        insert into financeiro.tb_pagamentos (id_pagamento, id_funcionario, data_pagamento, valor, id_projeto)
        values (novo_id_pagamento,
                new.id_funcionario,
                data_proximo_pagamento,
                bonus_funcionario,
                new.id_projeto);  -- Associando o id_projeto
    end if;

    return new;
end;
$$ language plpgsql;


-- Trigger para update da variável status na tabela tb_tarefas
create or replace trigger trg_adicionar_bonus
after update of status on projetos.tb_tarefas
for each row
when (new.status = 'C')
execute function financeiro.adicionar_bonus();

------------------------------------------------- VERIFICAR CPF -------------------------------------------------
-- Função que verifica se o CPF adicionado é válido
create or replace function validar_cpf() 
returns trigger as $$
declare
    i int;
    soma int;
    digito1 int;
    digito2 int;
    pesos int[] := array[1, 2, 3, 4, 5, 6, 7, 8, 9];
    cpf varchar;
begin
    -- remoção caracteres não numéricos
    cpf := regexp_replace(new.cpf, '[^0-9]', '', 'g');
    new.cpf := cpf; -- armazenamento somente do números do cpf, para manter um padrão 

    -- verificar se o cpf tem exatamente 11 dígitos
    if length(cpf) != 11 then
        raise exception 'cpf inválido: %', new.cpf;
    end if;
        
    -- calculo do primeiro dígito verificador
    soma := 0;

    for i in 1..9 loop
        soma := soma + cast(substr(cpf, i, 1) as int) * pesos[i];
    end loop;

    digito1 := soma % 11;
    if digito1 = 10 then
        digito1 := 0;
    end if;
	
    -- calculo do segundo dígito verificador
    soma := 0;

    for i in 1..8 loop
        soma := soma + cast(substr(cpf, i+1, 1) as int) * pesos[i];
    end loop;
	
    soma := soma + digito1 * pesos[9];
    digito2 := soma % 11;

    if digito2 = 10 then
        digito2 := 0;
    end if;

    -- verificando se os dígitos verificadores são iguais aos últimos dois dígitos do cpf
    if not (digito1 = cast(substr(cpf, 10, 1) as int) and 
            digito2 = cast(substr(cpf, 11, 1) as int)) then
        raise exception 'cpf inválido: %', new.cpf;
    end if;

    return new; -- retorna a nova linha após a validação
end;
$$ language plpgsql;

-- Trigger para acionar a função após a inserção ou update da tabela tb_funcionarios
create or replace trigger trg_validar_cpf
before insert or update on recursoshumanos.tb_funcionarios
for each row
execute function validar_cpf();


------------------------------------ ADICIONAR REGISTRO PROJETO_FUNCIONARIO ------------------------------------
create or replace function adicionar_projeto_funcionario()
returns trigger as $$
declare
    v_id_funcionario int;
begin
    if tg_table_name = 'tb_projetos' then
        v_id_funcionario := new.id_gerente_projeto;  -- Para tb_projetos, usamos o gerente do projeto
    elsif tg_table_name = 'tb_tarefas' then
        v_id_funcionario := new.id_funcionario;  -- Para tb_tarefas, usamos o funcionário
    else
        v_id_funcionario := null;
    end if;

    if not exists (
        select 1
        from projetos.tb_projeto_funcionario
        where id_funcionario = v_id_funcionario and id_projeto = new.id_projeto
    ) then
        insert into projetos.tb_projeto_funcionario (id_prj_func, id_funcionario, id_projeto)
        values (nextval('projetos.seq_prj_func'), 
                v_id_funcionario, 
                new.id_projeto);
	end if;

    return null; 
end;
$$ language plpgsql;


-- Trigger para acionar a função após a inserção de um novo projeto
create or replace trigger trg_adicionar_projeto_funcionario_projeto
after insert on projetos.tb_projetos
for each row
execute procedure adicionar_projeto_funcionario();


-- Trigger para acionar a função após a inserção de uma nova tarefa
create or replace trigger trg_adicionar_projeto_funcionario_tarefa
after insert on projetos.tb_tarefas
for each row
execute procedure adicionar_projeto_funcionario();


-- Criação de sequência para id_prj_func
create sequence projetos.seq_prj_func start 1;





