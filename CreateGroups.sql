--ROLE ADMIN => próprio usuário postgres

CREATE ROLE desenvolvedor;
CREATE ROLE gerente_projeto;

CREATE USER dev WITH PASSWORD 'senha';
CREATE USER manager_dev WITH PASSWORD 'senha';

GRANT desenvolvedor TO dev;
GRANT gerente_projeto TO manager_dev;