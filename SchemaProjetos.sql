create table projetos.tb_clientes (
	id_cliente 	int			not null,
	email 		varchar(80)	not null,
	nm_cliente  varchar(80)	not null,
	cnpj 		varchar(14)	not null,
	constraint pk_id_cliente primary key (id_cliente)
);

create table projetos.tb_projetos(
	id_projeto 			int				not null,
	id_cliente 			int				not null,
	id_gerente_projeto 	int				not null,
	nm_projeto 			varchar(80)		not null,
	custo_total 		numeric(10, 2)	not null,
	data_inicio 		date			not null,
	data_fim 			date,
	constraint pk_id_projeto primary key (id_projeto),
	foreign key (id_cliente) references projetos.tb_clientes(id_cliente),
	foreign key (id_gerente_projeto) references recursoshumanos.tb_funcionarios(id_funcionario)	
);

alter table projetos.tb_projetos add column status char(1) not null;

create table projetos.tb_tarefas(
	id_tarefa 		int			 not null,
	id_funcionario  int			 not null,
	id_projeto 		int			 not null,
	descricao 		varchar(100) not null,
	status 			char(1)		 not null,
	data_inicio 	date		 not null,
	data_fim 		date		 not null,
	constraint pk_id_tarefa primary key (id_tarefa),
	foreign key (id_funcionario) references recursoshumanos.tb_funcionarios(id_funcionario),
	foreign key (id_projeto) references projetos.tb_projetos(id_projeto)
);

alter table projetos.tb_tarefas add column data_conclusao date;

create table projetos.tb_custos_projetos(
	id_custo 	int				not null,
	id_projeto 	int				not null,
	descricao 	varchar(100)	not null,
	valor 		numeric(10, 2)	not null,
	data 		date			not null,
	constraint pk_id_custo primary key (id_custo),
	foreign key (id_projeto) references projetos.tb_projetos(id_projeto)
);

create table projetos.tb_projeto_funcionario (
	id_prj_func 	int	not null,
	id_funcionario	int	not null,
	id_projeto 		int	not null,
	constraint pk_id_prj_func primary key (id_prj_func),
	foreign key (id_funcionario) references recursoshumanos.tb_funcionarios(id_funcionario),
	foreign key (id_projeto) references projetos.tb_projetos(id_projeto)
);

create table projetos.tb_status_projetos(
	status char(1)			not null,
	descricao varchar(50)	not null
);



