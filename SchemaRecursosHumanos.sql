create table recursoshumanos.tb_cargos (
	id_cargo 	int 		 not null,
	descricao 	varchar(100) not null,
	constraint pk_id_cargo primary key (id_cargo)
);

create table recursoshumanos.tb_funcionarios (
	id_funcionario 		int			  not null,
	id_cargo 			int			  not null,
	nome 				varchar(80)	  not null,
	cpf 				varchar(11)	  not null,
	data_contratacao 	date		  not null,
	salario 			numeric(10,2) not null,
	constraint pk_id_funcionario primary key (id_funcionario),
	foreign key (id_cargo) references recursoshumanos.tb_cargos(id_cargo)
);

alter table recursoshumanos.tb_funcionarios alter column cpf type varchar(15);

create table recursoshumanos.tb_departamentos (
	id_departamento 		int			 not null, 
	id_gerente_departamento	int			 not null,
	nm_deparmento 			varchar (50) not null,
	constraint pk_id_departamento primary key (id_departamento),
	foreign key (id_gerente_departamento) references recursoshumanos.tb_funcionarios(id_funcionario)
);
