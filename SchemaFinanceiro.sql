create table financeiro.tb_pagamentos(
	id_pagamento 	int,
	id_funcionario 	int,
	data_pagamento  date,
	valor 			numeric(10,2),
	constraint pk_id_pagamento primary key (id_pagamento),
	foreign key (id_funcionario) references recursoshumanos.tb_funcionarios(id_funcionario)
);