create table recursoshumanos.tb_cargos (
	id_cargo 	int,
	descricao 	varchar(100),
	constraint pk_id_cargo primary key (id_cargo)
);


create table recursoshumanos.tb_funcionarios (
	id_funcionario 		int,
	id_cargo 			int,
	nome 				varchar(80),
	cpf 				varchar(11),
	data_contratacao 	date,
	salario 			integer,
	constraint pk_id_funcionario primary key (id_funcionario),
	foreign key (id_cargo) references recursoshumanos.tb_cargos(id_cargo)
);

INSERT INTO recursoshumanos.tb_funcionarios (id_tarefa, id_funcionario, data_inicio, data_fim) 
VALUES (1, 2, 'Maria de Souza', '12345678900', '2022-08-10', 5000);

alter table recursoshumanos.tb_funcionarios alter column cpf type varchar(15);

create table recursoshumanos.tb_departamentos (
	id_departamento 		int, 
	id_gerente_departamento	int,
	nm_deparmento 			varchar (50),
	constraint pk_id_departamento primary key (id_departamento),
	foreign key (id_gerente_departamento) references recursoshumanos.tb_funcionarios(id_funcionario)
);
