--SCHEMA ADMBANCO
insert into admbanco.tb_permissoes (id_permissao, descricao) values
	(1, 'Admin, acesso total ao banco, todos os comandos incluidos'),
	(2, 'Desenvolvedor, só não é permitido o comando de delete'),
	(3, 'Visualizador, pode ver todo o banco mas apenas executa comando select');

insert into admbanco.tb_acessosusuarios(id_acesso, id_funcionario, id_grupo_permissao) values
	(1, 1, 1),
	(2, 2, 1),
	(3, 3, 3),
	(4, 4, 3),
	(5, 5, 3),
	(6, 6, 3),
	(7, 7, 2),
	(8, 8, 2),
	(9, 9, 3),
	(10, 10, 3),
	(11, 11, 1),
	(12, 12, 2);
	
--SCHEMA PROJETOS
INSERT INTO projetos.tb_clientes (id_cliente, email, nm_cliente, cnpj)
VALUES
    (1, 'contato@empresaA.com', 'Empresa A', '11223344000155'),
    (2, 'suporte@empresaB.com', 'Empresa B', '22334455000166'),
    (3, 'adm@empresaC.com', 'Empresa C', '33445566000177'),
    (4, 'projetos@empresaD.com', 'Empresa D', '44556677000188'),
    (5, 'contato@empresaE.com', 'Empresa E', '55667788000199');
   
INSERT INTO projetos.tb_projetos (id_projeto, id_cliente, id_gerente_projeto, nm_projeto, custo_total, data_inicio, data_fim, status)
VALUES
    (1, 1, 12, 'Sistema de Gestão', 150000.00, '2022-06-12', '2022-08-15', 'C'),
    (2, 2, 5, 'Aplicativo Mobile', 85000.00, '2023-07-01', '2023-10-20', 'C'),
    (3, 3, 8, 'E-commerce', 120000.00, '2023-12-05', '2024-12-05', 'A'),
    (4, 4, 9, 'Sistema de Automação', 200000.00, '2023-11-20', '2024-11-20', 'A'),
    (5, 5, 7, 'Plataforma de E-learning', 95000.00, '2024-12-01', '2025-12-01', 'P');

insert into projetos.tb_tarefas (id_tarefa, id_funcionario, id_projeto, descricao, status, data_inicio, data_fim) values
    (1, 9, 	1, 'Definir fluxos de aprovação', 						'C', '2022-06-12', '2022-08-15'), 
    (2, 3, 	1, 'Implementar relatórios financeiros', 				'C', '2023-07-01', '2023-10-20'), 
    (3, 7, 	2, 'Criar interface de login', 							'C', '2023-08-05', '2023-10-05'), 
    (4, 8, 	2, 'Desenvolver integração com notificações push', 		'C', '2023-08-20', '2023-10-20'), 
    (5, 12, 3, 'Configurar gateway de pagamento', 					'A', '2024-09-01', '2024-12-01'), 
    (6, 8, 	3, 'Implementar sistema de recomendação de produtos', 	'A', '2024-10-20', '2024-12-05'),
    (7, 10, 4, 'Programar disparos de tarefas', 					'A', '2024-09-20', '2026-11-05'),
    (8, 10, 4, 'Configurar alertas automáticos', 					'P', '2025-03-05', '2026-03-05'),
    (9, 4, 	5, 'Criar módulo de avaliação', 						'P', '2025-03-05', '2026-03-05'),
    (10, 11, 5, 'Desenvolver painel de progresso do aluno', 		'P', '2025-03-05', '2026-03-05');

insert into projetos.tb_custos_projetos (id_custo, id_projeto, descricao, valor, data) values
    (1, 1, 'Licenças de software', 5000.00, '2022-06-15'),
    (2, 2, 'Design do aplicativo', 10000.00, '2022-12-10'),
    (3, 3, 'Serviços de nuvem', 7000.00, '2023-05-01'),
    (4, 4, 'Equipamentos de automação', 15000.00, '2024-03-10'),
    (5, 5, 'Sistema de pagamentos', 5000.00, '2024-07-01');

insert into projetos.tb_status_projetos (status, descricao) values
	('P', 'Projetado, não está em execução no momento'),
	('A', 'Ativo, ainda está em execução'),
	('C', 'Concluído, já foi finalizado'),
	('I', 'Inativado, temporariamente ou definitivamente');
    
--SCHEMA RH
insert into recursoshumanos.tb_cargos (id_cargo, descricao) values
	(1,  'Sócio'),
    (2,  'Gerente RH'),
    (3,  'Gerente Ti'),
    (4,  'Gerente Desenvolvimento'),
    (5,  'Analista RH'),
    (6,  'Analista Ti'),
    (7,  'Analista Desenvolvimento'),
    (8,  'Desenvolvedor'),
    (9,  'Desenvolvedor Ti'),
    (10, 'Auxiliar RH'),
   	(11, 'Auxiliar Ti'),
  	(12, 'Auxiliar Desenvolvimento');
    
insert into recursoshumanos.tb_funcionarios (id_funcionario, id_cargo, nome, cpf, data_contratacao, salario) values
	(1, 1, 	'Fernanda de Carvalho Pinto', 	'524.224.176-47', '2022-05-12', 10000.00), -- Sócio
	(2, 1, 	'Eduardo Yamaguti Teranisi',  	'321.644.536-46', '2022-05-12', 10000.00), -- Sócio
    (3, 2, 	'João Silva', 				 	'813.926.686-89', '2022-05-12', 9000.00), -- Gerente
    (4, 12,	'Ana Lima', 					'542.437.166-33', '2022-05-12', 3000.00), -- Auxiliar Ti
    (5, 4, 	'Paula Roberta', 			 	'227.517.516-44', '2023-09-20', 9000.00), -- Gerente
    (6, 7, 	'Fernanda Castro', 			 	'883.683.026-92', '2022-05-12', 4000.00), -- Analista Desenvolvimento
    (7, 9,	'Bruno Mendes', 				'324.428.946-02', '2022-05-12', 8000.00), -- Desenvolvedor Ti
    (8, 8, 	'Cláudia Ramos', 			 	'739.074.486-34', '2023-02-18', 8000.00), -- Desenvolvedor
    (9, 5,  'Gustavo Pereira', 			 	'975.523.536-19', '2024-08-15', 4000.00), -- Analista RH
    (10, 12,'Camila Santos', 			 	'524.275.326-90', '2023-07-01', 3000.00), -- Auxiliar Desenvolvimento
    (11, 3, 'Maria Oliveira', 			 	'885.337.296-69', '2024-03-01', 9000.00), -- Gerente
    (12, 8, 'Carlos Sousa', 			 	'281.918.866-42', '2024-05-12', 8000.00); -- Desenvolvedor
    
insert into recursoshumanos.tb_departamentos (id_departamento, id_gerente_departamento, nm_deparmento) values
    (1, 3, 'Recursos Humanos'),  -- João Silva como gerente
    (2, 11, 'TI'),                -- Maria Oliveira como gerente
    (3, 12, 'Desenvolvimento');    -- Paula Roberta como gerente
    
--SCHEMA FINANCEIRO
-- insert feito pela stored procedure e funções
    