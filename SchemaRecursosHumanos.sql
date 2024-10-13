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

create table recursoshumanos.tb_departamentos (
	id_departamento 		int, 
	id_gerente_departamento	int,
	nm_deparmento 			varchar (50),
	constraint pk_id_departamento primary key (id_departamento),
	foreign key (id_gerente_departamento) references recursoshumanos.tb_funcionarios(id_funcionario)
);

