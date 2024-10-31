--GRUPO desenvolvedor
GRANT USAGE ON SCHEMA financeiro TO desenvolvedor;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA financeiro TO desenvolvedor;
ALTER DEFAULT PRIVILEGES IN SCHEMA financeiro GRANT ALL PRIVILEGES ON TABLES TO desenvolvedor; --Define as mesmas permissões para novas tabelas criadas nesse schema

GRANT USAGE ON SCHEMA recursoshumanos TO desenvolvedor;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA recursoshumanos TO desenvolvedor;
ALTER DEFAULT PRIVILEGES IN SCHEMA recursoshumanos GRANT ALL PRIVILEGES ON TABLES TO desenvolvedor; --Define as mesmas permissões para novas tabelas criadas nesse schema

GRANT USAGE ON SCHEMA projetos TO desenvolvedor;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA projetos TO desenvolvedor;
ALTER DEFAULT PRIVILEGES IN SCHEMA projetos GRANT ALL PRIVILEGES ON TABLES TO desenvolvedor; --Define as mesmas permissões para novas tabelas criadas nesse schema



--GRUPO gerente_projeto
GRANT USAGE ON SCHEMA financeiro TO gerente_projeto;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA financeiro TO gerente_projeto WITH GRANT OPTION;
--GRANT OPTION permite que gerente possa compartilhar para outros usuários as suas permissões
ALTER DEFAULT PRIVILEGES IN SCHEMA financeiro GRANT ALL PRIVILEGES ON TABLES TO gerente_projeto;

GRANT USAGE ON SCHEMA recursoshumanos TO gerente_projeto;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA recursoshumanos TO gerente_projeto WITH GRANT OPTION;
--GRANT OPTION permite que gerente possa compartilhar para outros usuários as suas permissões
ALTER DEFAULT PRIVILEGES IN SCHEMA recursoshumanos GRANT ALL PRIVILEGES ON TABLES TO gerente_projeto;

GRANT USAGE ON SCHEMA admbanco TO gerente_projeto;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA admbanco TO gerente_projeto WITH GRANT OPTION;
--GRANT OPTION permite que gerente possa compartilhar para outros usuários as suas permissões
ALTER DEFAULT PRIVILEGES IN SCHEMA admbanco GRANT ALL PRIVILEGES ON TABLES TO gerente_projeto;

GRANT USAGE ON SCHEMA projetos TO gerente_projeto;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA projetos TO gerente_projeto WITH GRANT OPTION;
--GRANT OPTION permite que gerente possa compartilhar para outros usuários as suas permissões
ALTER DEFAULT PRIVILEGES IN SCHEMA projetos GRANT ALL PRIVILEGES ON TABLES TO gerente_projeto;