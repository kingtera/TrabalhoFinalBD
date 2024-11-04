-- Demonstração função de verificação de CPF
-- CPF incorreto
insert into recursoshumanos.tb_funcionarios (id_funcionario, id_cargo, nome, cpf, data_contratacao, salario) values
	(13, 6, 'Maria Joana da Silva', '524.224.176-48', '2024-12-04', 4000.00);

-- CPF correto
insert into recursoshumanos.tb_funcionarios (id_funcionario, id_cargo, nome, cpf, data_contratacao, salario) values
	(13, 6, 'Maria Joana da Silva', '524.224.176-47', '2024-12-04', 4000.00);
	
	
insert into projetos.tb_clientes (id_cliente, email, nm_cliente, cnpj) values
    (6, 'contato@marcio.com', 'Márcio José da Cunha', '11223344000155');

-- Demonstração da função de associação projeto_funcionario por projeto
insert into projetos.tb_projetos (id_projeto, id_cliente, id_gerente_projeto, nm_projeto, custo_total, data_inicio, data_fim, status) values
    (6, 6, 12, 'Projeto final de Banco de dados', 150000.00, '2024-10-01', '2024-11-05', 'A');

-- Demonstração da função de associação projeto_funcionario por tarefa
insert into projetos.tb_tarefas (id_tarefa, id_funcionario, id_projeto, descricao, status, data_inicio, data_fim) values
    (11, 1, 6, 'Entrega do projeto final de BD', 'A', '2024-10-01', '2024-11-05'),
    (12, 2, 6, 'Entrega do projeto final de BD', 'A', '2024-10-01', '2024-11-05');


-- Select da relação de funcionário trabalhando com determinado cliente em determinado projeto
select f.nome as nome_funcionario, c.nm_cliente as nome_cliente, p.nm_projeto as nome_projeto
from projetos.tb_projeto_funcionario pf
join recursoshumanos.tb_funcionarios f on pf.id_funcionario = f.id_funcionario
join projetos.tb_projetos p on pf.id_projeto = p.id_projeto
join projetos.tb_clientes c on p.id_cliente = c.id_cliente
order by p.nm_projeto;

-- Demonstração da função de bonificação por tarefa finalizada antes do prazo
update projetos.tb_tarefas set status = 'C' where id_tarefa in (11, 12);

-- Demonstração da Stored Procedure de geração de pagamento de salário (atual)
call financeiro.pagamento_salario('atual');

-- Select do valor total que deve ser pago a cada funcionario
select f.nome, f.cpf, sum(p.valor) as pagamento_total, p.data_pagamento 
from financeiro.tb_pagamentos p
join recursoshumanos.tb_funcionarios f on p.id_funcionario = f.id_funcionario
where date_trunc('month', p.data_pagamento) = date_trunc('month', current_date)
group by f.id_funcionario, f.nome, f.cpf, p.data_pagamento;

-- Demonstração da Stored Procedure de reajuste de salário
call financeiro.reajustar_salario();

-- Demonstração da Stored Procedure de geração de pagamento de salário (proximo)
call financeiro.pagamento_salario('proximo');

-- Select do valor total que deve ser pago a cada funcionario
select f.nome, f.cpf, sum(p.valor) as pagamento_total, p.data_pagamento 
from financeiro.tb_pagamentos p
join recursoshumanos.tb_funcionarios f on p.id_funcionario = f.id_funcionario
where date_trunc('month', p.data_pagamento) = date_trunc('month', current_date) + interval '1 month'
group by f.id_funcionario, f.nome, f.cpf, p.data_pagamento;

/* Seleção dos projetos ativos mostrando os gastos que houve com o projeto na tb_custos_projetos
 * e os pagamentos que foram registrados de tarefas que são relacionadas à aquele projeto na tb_gastos
 * por último, subtrair esse gasto do custo_total do projeto estabelecido na tb_projetos
 */
select 
    p.id_projeto,
    p.nm_projeto as nome_projeto,
    f.nome as nome_gerente,
    TO_CHAR(COALESCE(SUM(cp.valor), 0), 'L 9G999G990D00') as custo_essencial,
    TO_CHAR(COALESCE(SUM(pp.valor), 0), 'L 9G999G990D00') as custo_tarefas,
    TO_CHAR((p.custo_total - COALESCE(SUM(cp.valor), 0) - COALESCE(SUM(pp.valor), 0)), 'L 9G999G990D00') as valor_disponivel
from projetos.tb_projetos p
join recursoshumanos.tb_funcionarios f on p.id_gerente_projeto = f.id_funcionario
left join projetos.tb_custos_projetos cp on p.id_projeto = cp.id_projeto
left join financeiro.tb_pagamentos pp on p.id_projeto = pp.id_projeto
where p.status = 'A'
group by p.id_projeto, p.nm_projeto, f.nome, p.custo_total
order by p.id_projeto asc;


-- Select do tipo de acesso de cada usuário
select f.nome as nome_funcionario, c.descricao as cargo, p.descricao as permissao
from recursoshumanos.tb_funcionarios f
join recursoshumanos.tb_cargos c on f.id_cargo = c.id_cargo
join admbanco.tb_acessosusuarios au on f.id_funcionario = au.id_funcionario
join admbanco.tb_permissoes p on au.id_grupo_permissao = p.id_permissao
order by f.nome;

-- Demonstrar usuário
-- USER dev WITH PASSWORD 'senha';
insert into projetos.tb_tarefas (id_tarefa, id_funcionario, id_projeto, descricao, status, data_inicio, data_fim) values
    (13, 1, 6, 'Entrega do projeto final de BD', 'A', '2024-10-01', '2024-11-05');
    
update projetos.tb_tarefas set status = 'C' where id_tarefa = 13;
   
delete from projetos.tb_tarefas where id_tarefa = 13;

select * from projeto.tb_tarefas where id_tarefa = 13;

-- USER viewer WITH PASSWORD 'senha';
insert into projetos.tb_tarefas (id_tarefa, id_funcionario, id_projeto, descricao, status, data_inicio, data_fim) values
    (14, 2, 6, 'Entrega do projeto final de BD', 'A', '2024-10-01', '2024-11-05');

update projetos.tb_tarefas set status = 'C' where id_tarefa = 14;

delete from projetos.tb_tarefas where id_tarefa = 14;

select * from projetos.tb_tarefas where id_tarefa = 13;







