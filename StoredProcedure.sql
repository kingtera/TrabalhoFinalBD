--Stored Procedure de reajuste de salário
create or replace procedure financeiro.reajustar_salario()
language plpgsql
as $$
declare
    porcentagem_reajuste decimal(5, 2) := 0.05; -- 5% de aumento
    data_atual date := current_date;
    num_linhas_afetadas integer;
begin
    -- atualiza o salário de funcionários que estão há mais de um ano na empresa
    update recursoshumanos.tb_funcionarios
    set salario = salario * (1 + porcentagem_reajuste)
    where data_contratacao <= data_atual - interval '1 year';

    get diagnostics num_linhas_afetadas = row_count;

    -- mensagem de confirmação
    raise notice '% funcionários tiveram seus salários reajustados em %.', num_linhas_afetadas, porcentagem_reajuste * 100;
end;
$$;

--Stored Procedure de geração de pagamento de salário
create or replace procedure financeiro.pagamento_salario(mes_opcao text)
language plpgsql
as $$
declare
    data_pagamento date;
    novo_id_pagamento int;
    rec_funcionario record;  -- Para armazenar dados de cada funcionário durante a iteração
begin
    -- Definindo a data de pagamento com base na opção escolhida
    if mes_opcao = 'atual' then
        data_pagamento := date_trunc('month', current_date) + interval '4 days';
    elsif mes_opcao = 'anterior' then
        data_pagamento := date_trunc('month', current_date) - interval '1 month' + interval '4 days';
    elsif mes_opcao = 'proximo' then
        data_pagamento := date_trunc('month', current_date) + interval '1 month' + interval '4 days';
    else
        raise exception 'Opção inválida. Utilize "atual", "anterior" ou "proximo".';
    end if;

    -- Iterando por cada funcionário e inserindo o pagamento
    for rec_funcionario in select f.id_funcionario, f.salario from recursoshumanos.tb_funcionarios f loop
        -- Obtendo um novo id_pagamento
        select coalesce(max(id_pagamento), 0) + 1 into novo_id_pagamento from financeiro.tb_pagamentos;

        -- Inserindo o pagamento na tabela
        insert into financeiro.tb_pagamentos (id_pagamento, id_funcionario, valor, data_pagamento)
        values (novo_id_pagamento, rec_funcionario.id_funcionario, rec_funcionario.salario, data_pagamento);
    end loop;

end;
$$;





