create table financeiro.tb_pagamentos(
	id_pagamento 	int				not null,
	id_funcionario 	int				not null,
	data_pagamento  date			not null,
	valor 			numeric(10,2)	not null,
	constraint pk_id_pagamento primary key (id_pagamento),
	foreign key (id_funcionario) references recursoshumanos.tb_funcionarios(id_funcionario)
);

alter table financeiro.tb_pagamentos add column id_projeto int references projetos.tb_projetos;