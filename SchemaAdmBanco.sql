create table admbanco.tb_permissoes(
	id_permissao int,
	id_cargo int,
	descricao varchar(100),
	constraint pk_id_permissao primary key (id_permissao),
	foreign key (id_cargo) references recursoshumanos.tb_cargos(id_cargo)
);

create table admbanco.tb_acessosusuarios(
	id_acesso int,
	id_funcionario int,
	id_grupo_permissao int,
	constraint pk_id_acesso primary key (id_acesso),
	foreign key (id_funcionario) references recursoshumanos.tb_funcionarios(id_funcionario),
	foreign key (id_grupo_permissao) references admbanco.tb_permissoes(id_permissao)
);