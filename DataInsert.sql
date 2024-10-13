--SCHEMA ADMBANCO
--FALTA INSERIR DADOS AQUI

--SCHEMA FINANCEIRO
INSERT INTO financeiro.tb_pagamentos (id_pagamento, id_funcionario, data_pagamento, valor)
VALUES
    (1, 1, '2023-08-31', 8500.00),  -- Pagamento para João Silva
    (2, 2, '2023-08-31', 6000.00),  -- Pagamento para Maria Oliveira
    (3, 3, '2023-08-31', 5500.00),  -- Pagamento para Carlos Sousa
    (4, 4, '2023-08-31', 3000.00),  -- Pagamento para Ana Lima
    (5, 5, '2023-08-31', 9000.00),  -- Pagamento para Paulo Roberto
    (6, 6, '2023-08-31', 6200.00),  -- Pagamento para Fernanda Castro
    (7, 7, '2023-08-31', 5700.00),  -- Pagamento para Bruno Mendes
    (8, 8, '2023-08-31', 5800.00),  -- Pagamento para Cláudia Ramos
    (9, 9, '2023-08-31', 3200.00),  -- Pagamento para Gustavo Pereira
    (10, 10, '2023-08-31', 3100.00); -- Pagamento para Camila Santos



--SCHEMA PROJETOS
INSERT INTO projetos.tb_clientes (id_cliente, email, nm_cliente, cnpj)
VALUES
    (1, 'contato@empresaA.com', 'Empresa A', '12345678000195'),
    (2, 'suporte@empresaB.com', 'Empresa B', '23456789000106'),
    (3, 'adm@empresaC.com', 'Empresa C', '34567890000117'),
    (4, 'projetos@empresaD.com', 'Empresa D', '45678901000188'),
    (5, 'contato@empresaE.com', 'Empresa E', '56789012000199');

INSERT INTO projetos.tb_projetos (id_projeto, id_cliente, id_gerente_projeto, nm_projeto, custo_total, data_inicio, data_fim)
VALUES
    (1, 1, 1, 'Sistema de Gestão', 150000.00, '2023-01-10', '2023-12-30'),
    (2, 2, 5, 'Aplicativo Mobile', 85000.00, '2023-03-01', '2023-09-30'),
    (3, 3, 1, 'E-commerce', 120000.00, '2023-04-15', '2023-12-15'),
    (4, 4, 2, 'Sistema de Automação', 200000.00, '2023-05-20', '2024-02-28'), -- Novo projeto
    (5, 5, 5, 'Plataforma de E-learning', 95000.00, '2023-06-01', '2024-01-15'); -- Novo projeto

INSERT INTO projetos.tb_tarefas (id_tarefa, id_funcionario, id_projeto, descricao, status, data_inicio, data_fim)
VALUES
    (1, 3, 1, 'Desenvolver módulo de vendas', 'A', '2023-02-01', '2023-03-15'), -- Carlos Sousa
    (2, 7, 1, 'Implementar integrações', 'A', '2023-03-01', '2023-05-20'), -- Bruno Mendes
    (3, 4, 2, 'Documentar requisitos', 'F', '2023-03-05', '2023-04-10'), -- Ana Lima
    (4, 8, 3, 'Desenvolver API de pagamentos', 'A', '2023-04-20', '2023-06-30'), -- Cláudia Ramos
    (5, 9, 2, 'Testes de funcionalidade', 'A', '2023-06-01', '2023-07-15'), -- Gustavo Pereira
    (6, 7, 4, 'Desenvolver sistema de controle', 'A', '2023-06-05', '2023-09-20'), -- Bruno Mendes, projeto 4
    (7, 2, 4, 'Planejar arquitetura do sistema', 'A', '2023-05-25', '2023-07-15'), -- Fernanda Castro, projeto 4
    (8, 5, 5, 'Desenvolver plataforma de cursos', 'A', '2023-06-15', '2023-11-30'), -- Paulo Roberto, projeto 5
    (9, 6, 5, 'Testar funcionalidades da plataforma', 'A', '2023-08-01', '2023-12-01'); -- Fernanda Castro, projeto 5

INSERT INTO projetos.tb_custos_projetos (id_custo, id_projeto, descricao, valor, data)
VALUES
    (1, 1, 'Licenças de software', 5000.00, '2023-02-15'),
    (2, 2, 'Equipamentos', 10000.00, '2023-03-10'),
    (3, 3, 'Serviços de nuvem', 7000.00, '2023-05-01'),
    (4, 4, 'Equipamentos de automação', 15000.00, '2023-06-10'), -- Custo para o projeto 4
    (5, 5, 'Serviços de hospedagem', 5000.00, '2023-07-01'); -- Custo para o projeto 5

INSERT INTO projetos.projeto_funcionario (id_prj_func, id_funcionario, id_projeto)
VALUES
    (1, 3, 1), -- Carlos Sousa no projeto 1
    (2, 7, 1), -- Bruno Mendes no projeto 1
    (3, 4, 2), -- Ana Lima no projeto 2
    (4, 8, 3), -- Cláudia Ramos no projeto 3
    (5, 9, 2), -- Gustavo Pereira no projeto 2
    (6, 7, 4), -- Bruno Mendes no projeto 4
    (7, 2, 4), -- Fernanda Castro no projeto 4
    (8, 5, 5), -- Paulo Roberto no projeto 5
    (9, 6, 5); -- Fernanda Castro no projeto 5



--SCHEMA RH
INSERT INTO recursoshumanos.tb_cargos (id_cargo, descricao) 
VALUES 
    (1, 'Gerente'),
    (2, 'Analista'),
    (3, 'Desenvolvedor'),
    (4, 'Auxiliar Administrativo');

INSERT INTO recursoshumanos.tb_funcionarios (id_funcionario, id_cargo, nome, cpf, data_contratacao, salario)
VALUES 
    (1, 1, 'João Silva', '12345678901', '2020-01-15', 8500.00), -- Gerente
    (2, 2, 'Maria Oliveira', '23456789012', '2021-03-01', 6000.00), -- Analista
    (3, 3, 'Carlos Sousa', '34567890123', '2022-05-12', 5500.00), -- Desenvolvedor
    (4, 4, 'Ana Lima', '45678901234', '2023-07-10', 3000.00), -- Auxiliar Administrativo
    (5, 1, 'Paulo Roberto', '56789012345', '2019-09-20', 9000.00), -- Gerente
    (6, 2, 'Fernanda Castro', '67890123456', '2021-04-30', 6200.00), -- Analista
    (7, 3, 'Bruno Mendes', '78901234567', '2022-06-05', 5700.00), -- Desenvolvedor
    (8, 3, 'Cláudia Ramos', '89012345678', '2023-02-18', 5800.00), -- Desenvolvedor
    (9, 4, 'Gustavo Pereira', '90123456789', '2023-08-15', 3200.00), -- Auxiliar Administrativo
    (10, 4, 'Camila Santos', '01234567890', '2023-07-01', 3100.00); -- Auxiliar Administrativo


INSERT INTO recursoshumanos.tb_departamentos (id_departamento, id_gerente_departamento, nm_deparmento)
VALUES 
    (1, 1, 'Recursos Humanos'),  -- João Silva como gerente
    (2, 2, 'TI'),                -- Maria Oliveira como gerente
    (3, 3, 'Desenvolvimento');    -- Carlos Sousa como gerente
