--GRUPO desenvolvedor
GRANT USAGE ON SCHEMA financeiro TO desenvolvedor;
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA financeiro TO desenvolvedor;
ALTER DEFAULT PRIVILEGES IN SCHEMA financeiro GRANT ALL PRIVILEGES ON TABLES TO desenvolvedor; --Define as mesmas permissões para novas tabelas criadas nesse schema

GRANT USAGE ON SCHEMA recursoshumanos TO desenvolvedor;
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA recursoshumanos TO desenvolvedor;
ALTER DEFAULT PRIVILEGES IN SCHEMA recursoshumanos GRANT ALL PRIVILEGES ON TABLES TO desenvolvedor; --Define as mesmas permissões para novas tabelas criadas nesse schema

GRANT USAGE ON SCHEMA projetos TO desenvolvedor;
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA projetos TO desenvolvedor;
ALTER DEFAULT PRIVILEGES IN SCHEMA projetos GRANT ALL PRIVILEGES ON TABLES TO desenvolvedor; --Define as mesmas permissões para novas tabelas criadas nesse schema



--GRUPO visualizador
GRANT USAGE ON SCHEMA financeiro TO visualizador;
GRANT SELECT ON ALL TABLES IN SCHEMA financeiro TO visualizador;
ALTER DEFAULT PRIVILEGES IN SCHEMA financeiro GRANT ALL PRIVILEGES ON TABLES TO visualizador; --Define as mesmas permissões para novas tabelas criadas nesse schema

GRANT USAGE ON SCHEMA recursoshumanos TO visualizador;
GRANT SELECT ON ALL TABLES IN SCHEMA recursoshumanos TO visualizador;
ALTER DEFAULT PRIVILEGES IN SCHEMA recursoshumanos GRANT ALL PRIVILEGES ON TABLES TO visualizador; --Define as mesmas permissões para novas tabelas criadas nesse schema

GRANT USAGE ON SCHEMA projetos TO visualizador;
GRANT SELECT ON ALL TABLES IN SCHEMA projetos TO visualizador;
ALTER DEFAULT PRIVILEGES IN SCHEMA projetos GRANT ALL PRIVILEGES ON TABLES TO visualizador; --Define as mesmas permissões para novas tabelas criadas nesse schema