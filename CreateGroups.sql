--ROLE ADMIN => próprio usuário postgres

CREATE ROLE desenvolvedor;
CREATE ROLE visualizador;

CREATE USER dev WITH PASSWORD 'senha';
CREATE USER viewer WITH PASSWORD 'senha';

GRANT desenvolvedor TO dev;
GRANT visualizador TO viewer;