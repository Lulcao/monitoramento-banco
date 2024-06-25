-- Criação das Tabelas
CREATE TABLE IF NOT EXISTS clientes (
    cliente_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS tecnicos (
    tecnico_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS produtos (
    produto_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

CREATE TABLE IF NOT EXISTS categorias_suporte (
    categoria_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS prioridades (
    prioridade_id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS status_solicitacao (
    status_id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS solicitacoes (
    solicitacao_id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(cliente_id),
    produto_id INT REFERENCES produtos(produto_id),
    categoria_id INT REFERENCES categorias_suporte(categoria_id),
    prioridade_id INT REFERENCES prioridades(prioridade_id),
    status_id INT REFERENCES status_solicitacao(status_id),
    descricao TEXT NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_fechamento TIMESTAMP
);

CREATE TABLE IF NOT EXISTS interacoes (
    interacao_id SERIAL PRIMARY KEY,
    solicitacao_id INT REFERENCES solicitacoes(solicitacao_id),
    tecnico_id INT REFERENCES tecnicos(tecnico_id),
    descricao TEXT NOT NULL,
    data_interacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS historico_solicitacoes (
    historico_id SERIAL PRIMARY KEY,
    solicitacao_id INT REFERENCES solicitacoes(solicitacao_id),
    status_id INT REFERENCES status_solicitacao(status_id),
    data_mudanca TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS avaliacoes (
    avaliacao_id SERIAL PRIMARY KEY,
    solicitacao_id INT REFERENCES solicitacoes(solicitacao_id),
    nota INT CHECK (nota BETWEEN 1 AND 5),
    comentario TEXT,
    data_avaliacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
