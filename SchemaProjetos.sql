create table projetos.tb_clientes (
	id_cliente 	int,
	email 		varchar(80),
	nm_cliente  varchar(80),
	cnpj 		varchar(14),
	constraint pk_id_cliente primary key (id_cliente)
);

create table projetos.tb_projetos(
	id_projeto 			int,
	id_cliente 			int,
	id_gerente_projeto 	int,
	nm_projeto 			varchar(80),
	custo_total 		numeric(10, 2),
	data_inicio 		date,
	data_fim 			date,
	constraint pk_id_projeto primary key (id_projeto),
	foreign key (id_cliente) references projetos.tb_clientes(id_cliente),
	foreign key (id_gerente_projeto) references recursoshumanos.tb_funcionarios(id_funcionario)	
);

create table projetos.tb_tarefas(
	id_tarefa 		int,
	id_funcionario  int,
	id_projeto 		int,
	descricao 		varchar(100),
	status 			char(1),
	data_inicio 	date,
	data_fim 		date,
	constraint pk_id_tarefa primary key (id_tarefa),
	foreign key (id_funcionario) references recursoshumanos.tb_funcionarios(id_funcionario),
	foreign key (id_projeto) references projetos.tb_projetos(id_projeto)
);

create table projetos.tb_custos_projetos(
	id_custo int,
	id_projeto int,
	descricao varchar(100),
	valor numeric(10, 2),
	data date,
	constraint pk_id_custo primary key (id_custo),
	foreign key (id_projeto) references projetos.tb_projetos(id_projeto)
);

create table projetos.projeto_funcionario (
	id_prj_func 	int,
	id_funcionario	int,
	id_projeto 		int,
	constraint pk_id_prj_func primary key (id_prj_func),
	foreign key (id_funcionario) references recursoshumanos.tb_funcionarios(id_funcionario),
	foreign key (id_projeto) references projetos.tb_projetos(id_projeto)
);






