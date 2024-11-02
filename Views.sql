-- View para visualizar informações de funcionários com detalhes de cargo
create or replace view vw_funcionarios_cargos as
select f.id_funcionario, f.nome, f.salario, c.descricao as cargo
from recursoshumanos.tb_funcionarios f
join recursoshumanos.tb_cargos c on f.id_cargo = c.id_cargo
order by f.id_funcionario;

select * from vw_funcionarios_cargos;

-- View para listar projetos com seus gerentes
create or replace view vw_projetos_gerentes as
select p.id_projeto, p.nm_projeto, p.custo_total, f.nome as gerente_projeto 
from projetos.tb_projetos p 
join recursoshumanos.tb_funcionarios f on p.id_gerente_projeto = f.id_funcionario
order by p.id_projeto;

select * from vw_projetos_gerentes;
