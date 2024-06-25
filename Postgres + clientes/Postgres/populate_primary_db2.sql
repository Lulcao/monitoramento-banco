-- Inserts para a tabela clientes
INSERT INTO clientes (nome, email, telefone) VALUES 
('Carlos Silva', 'carlos.silva@example.com', '11987654321'),
('Maria Souza', 'maria.souza@example.com', '11987654322'),
('João Pereira', 'joao.pereira@example.com', '11987654323'),
('Ana Oliveira', 'ana.oliveira@example.com', '11987654324'),
('Pedro Santos', 'pedro.santos@example.com', '11987654325');

-- Inserts para a tabela tecnicos
INSERT INTO tecnicos (nome, email, telefone) VALUES 
('Lucas Almeida', 'lucas.almeida@example.com', '21987654321'),
('Fernanda Costa', 'fernanda.costa@example.com', '21987654322'),
('Rafael Lima', 'rafael.lima@example.com', '21987654323'),
('Juliana Martins', 'juliana.martins@example.com', '21987654324'),
('Marcos Dias', 'marcos.dias@example.com', '21987654325');

-- Inserts para a tabela produtos
INSERT INTO produtos (nome, descricao) VALUES 
('Papel A4', 'Papel tamanho A4, 75g/m², pacote com 500 folhas'),
('Envelope Carta', 'Envelope tamanho carta, branco, pacote com 100 unidades'),
('Cartolina Branca', 'Cartolina tamanho A2, branca, pacote com 10 folhas'),
('Caneta Esferográfica', 'Caneta esferográfica azul, pacote com 12 unidades'),
('Lápis Preto', 'Lápis preto nº 2, pacote com 24 unidades');

-- Inserts para a tabela categorias_suporte
INSERT INTO categorias_suporte (nome) VALUES 
('Problema Técnico'),
('Dúvida Comercial'),
('Reclamação'),
('Sugestão'),
('Outros');

-- Inserts para a tabela prioridades
INSERT INTO prioridades (nome) VALUES 
('Baixa'),
('Média'),
('Alta'),
('Urgente'),
('Imediata');

-- Inserts para a tabela status_solicitacao
INSERT INTO status_solicitacao (nome) VALUES 
('Aberta'),
('Em Andamento'),
('Fechada'),
('Pendente'),
('Cancelada');

-- Inserts para a tabela solicitacoes
INSERT INTO solicitacoes (cliente_id, produto_id, categoria_id, prioridade_id, status_id, descricao) VALUES 
((SELECT cliente_id FROM clientes WHERE email='carlos.silva@example.com'), (SELECT produto_id FROM produtos WHERE nome='Papel A4'), (SELECT categoria_id FROM categorias_suporte WHERE nome='Problema Técnico'), (SELECT prioridade_id FROM prioridades WHERE nome='Alta'), (SELECT status_id FROM status_solicitacao WHERE nome='Aberta'), 'Problema na impressão com papel A4'),
((SELECT cliente_id FROM clientes WHERE email='maria.souza@example.com'), (SELECT produto_id FROM produtos WHERE nome='Envelope Carta'), (SELECT categoria_id FROM categorias_suporte WHERE nome='Dúvida Comercial'), (SELECT prioridade_id FROM prioridades WHERE nome='Média'), (SELECT status_id FROM status_solicitacao WHERE nome='Em Andamento'), 'Dúvida sobre o uso de envelopes'),
((SELECT cliente_id FROM clientes WHERE email='joao.pereira@example.com'), (SELECT produto_id FROM produtos WHERE nome='Cartolina Branca'), (SELECT categoria_id FROM categorias_suporte WHERE nome='Reclamação'), (SELECT prioridade_id FROM prioridades WHERE nome='Urgente'), (SELECT status_id FROM status_solicitacao WHERE nome='Fechada'), 'Reclamação sobre a qualidade da cartolina'),
((SELECT cliente_id FROM clientes WHERE email='ana.oliveira@example.com'), (SELECT produto_id FROM produtos WHERE nome='Caneta Esferográfica'), (SELECT categoria_id FROM categorias_suporte WHERE nome='Sugestão'), (SELECT prioridade_id FROM prioridades WHERE nome='Baixa'), (SELECT status_id FROM status_solicitacao WHERE nome='Pendente'), 'Sugestão para novos produtos'),
((SELECT cliente_id FROM clientes WHERE email='pedro.santos@example.com'), (SELECT produto_id FROM produtos WHERE nome='Lápis Preto'), (SELECT categoria_id FROM categorias_suporte WHERE nome='Outros'), (SELECT prioridade_id FROM prioridades WHERE nome='Imediata'), (SELECT status_id FROM status_solicitacao WHERE nome='Cancelada'), 'Outros tipos de suporte necessários');

-- Inserts para a tabela interacoes
INSERT INTO interacoes (solicitacao_id, tecnico_id, descricao) VALUES 
((SELECT solicitacao_id FROM solicitacoes WHERE descricao='Problema na impressão com papel A4'), (SELECT tecnico_id FROM tecnicos WHERE email='lucas.almeida@example.com'), 'Técnico analisou o problema e sugeriu solução'),
((SELECT solicitacao_id FROM solicitacoes WHERE descricao='Dúvida sobre o uso de envelopes'), (SELECT tecnico_id FROM tecnicos WHERE email='fernanda.costa@example.com'), 'Técnico respondeu à dúvida comercial'),
((SELECT solicitacao_id FROM solicitacoes WHERE descricao='Reclamação sobre a qualidade da cartolina'), (SELECT tecnico_id FROM tecnicos WHERE email='rafael.lima@example.com'), 'Técnico registrou a reclamação e encaminhou ao setor responsável'),
((SELECT solicitacao_id FROM solicitacoes WHERE descricao='Sugestão para novos produtos'), (SELECT tecnico_id FROM tecnicos WHERE email='juliana.martins@example.com'), 'Técnico agradeceu a sugestão e anotou'),
((SELECT solicitacao_id FROM solicitacoes WHERE descricao='Outros tipos de suporte necessários'), (SELECT tecnico_id FROM tecnicos WHERE email='marcos.dias@example.com'), 'Técnico atendeu ao pedido de suporte adicional');

-- Inserts para a tabela historico_solicitacoes
INSERT INTO historico_solicitacoes (solicitacao_id, status_id) VALUES 
((SELECT solicitacao_id FROM solicitacoes WHERE descricao='Problema na impressão com papel A4'), (SELECT status_id FROM status_solicitacao WHERE nome='Em Andamento')),
((SELECT solicitacao_id FROM solicitacoes WHERE descricao='Dúvida sobre o uso de envelopes'), (SELECT status_id FROM status_solicitacao WHERE nome='Em Andamento')),
((SELECT solicitacao_id FROM solicitacoes WHERE descricao='Reclamação sobre a qualidade da cartolina'), (SELECT status_id FROM status_solicitacao WHERE nome='Fechada')),
((SELECT solicitacao_id FROM solicitacoes WHERE descricao='Sugestão para novos produtos'), (SELECT status_id FROM status_solicitacao WHERE nome='Pendente')),
((SELECT solicitacao_id FROM solicitacoes WHERE descricao='Outros tipos de suporte necessários'), (SELECT status_id FROM status_solicitacao WHERE nome='Cancelada'));

-- Inserts para a tabela avaliacoes
INSERT INTO avaliacoes (solicitacao_id, nota, comentario) VALUES 
((SELECT solicitacao_id FROM solicitacoes WHERE descricao='Problema na impressão com papel A4'), 4, 'Bom atendimento'),
((SELECT solicitacao_id FROM solicitacoes WHERE descricao='Dúvida sobre o uso de envelopes'), 5, 'Excelente atendimento'),
((SELECT solicitacao_id FROM solicitacoes WHERE descricao='Reclamação sobre a qualidade da cartolina'), 3, 'Atendimento satisfatório'),
((SELECT solicitacao_id FROM solicitacoes WHERE descricao='Sugestão para novos produtos'), 4, 'Bom, mas pode melhorar'),
((SELECT solicitacao_id FROM solicitacoes WHERE descricao='Outros tipos de suporte necessários'), 2, 'Atendimento deixou a desejar');

