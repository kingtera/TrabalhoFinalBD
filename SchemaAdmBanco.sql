create table admbanco.tb_permissoes(
	id_permissao int		not null,
	id_cargo int			not null,
	descricao varchar(100)	not null,
	constraint pk_id_permissao primary key (id_permissao),
	foreign key (id_cargo) references recursoshumanos.tb_cargos(id_cargo)
);

alter table admbanco.tb_permissoes drop column id_cargo;

create table admbanco.tb_acessosusuarios(
	id_acesso int			not null,
	id_funcionario int		not null,
	id_grupo_permissao int	not null,
	constraint pk_id_acesso primary key (id_acesso),
	foreign key (id_funcionario) references recursoshumanos.tb_funcionarios(id_funcionario),
	foreign key (id_grupo_permissao) references admbanco.tb_permissoes(id_permissao)
);