USE OFICINA;
INSERT INTO Cliente (Nome, Endereco, Contato) VALUES ('Joao Silva', 'Av. Centenario, 56', '995253467');
INSERT INTO Cliente (Nome, Endereco, Contato) VALUES ('Maria Santos', 'Rua Dez, 36', '992861734');
INSERT INTO Cliente (Nome, Endereco, Contato) VALUES ('Felipe Costa', 'Rua 13 de Maio, 841', '99168492');

INSERT INTO Veiculo (Placa, Modelo, Ano) VALUES ('PLK5246', 'Honda FIT', 2014);
INSERT INTO Veiculo (Placa, Modelo, Ano) VALUES ('MKY8109', 'Punto', 2003); 
INSERT INTO Veiculo (Placa, Modelo, Ano) VALUES ('SDC8501', 'IX35', 2020);

INSERT INTO Mecanico (Codigo, Nome, Endereco, Especialidade) VALUES ('005', 'Antonio Bandeiras', 'Rua Guarulhos, 63', 'motor');
INSERT INTO Mecanico (Codigo, Nome, Endereco, Especialidade) VALUES ('010', 'Saul Reis', 'Av. Presidente, 58', 'freio');
INSERT INTO Mecanico (Codigo, Nome, Endereco, Especialidade) VALUES ('012', 'Davi Gomes', 'Av. Governador, 865', 'direcao hidraulica');

INSERT INTO Ordem_Servico (Data_Entrega, Numero, Data_Emissao, Valor, Status) VALUES (30/09/2022, '0230', 03/10/2022, 525.36, 'Finalizado');
INSERT INTO Ordem_Servico (Data_Entrega, Numero, Data_Emissao, Valor, Status) VALUES (05/10/2022, '0153', 10/10/2022, 750.36, 'Autorizado'); 
INSERT INTO Ordem_Servico (Data_Entrega, Numero, Data_Emissao, Valor, Status) VALUES (20/10/2022, '0220', 22/10/2022, 1200.23,'Autorizado');

INSERT INTO Tabela_Referencia (Mao_de_Obra, Valor_Servico, Valor_Peca) VALUES ('Reparo Motor', 1850.00, 560.00); 
INSERT INTO Tabela_Referencia (Mao_de_Obra, Valor_Servico, Valor_Peca) VALUES ('Conserto Freio', 720.00, 245.00); 
INSERT INTO Tabela_Referencia (Mao_de_Obra, Valor_Servico, Valor_Peca) VALUES ('Direcao', 1945.00, 799.00); 

INSERT INTO Servicos (Identificacao, Valor) VALUES ('Manutencao', 1035.00); 
INSERT INTO Servicos (Identificacao, Valor) VALUES ('Bateria', 880.00); 
INSERT INTO Servicos (Identificacao, Valor) VALUES ('Manutencao', 965.00); 


INSERT INTO Pecas (Quantidade, Identificacao, Valor) VALUES (3, 'Reparo Motor', 650.00); 
INSERT INTO Pecas (Quantidade, Identificacao, Valor) VALUES (2, 'Conserto Freio', 310.00);  
INSERT INTO Pecas (Quantidade, Identificacao, Valor) VALUES (1, 'Direcao', 835.00);

INSERT INTO Tabela_Referencia (Mao_de_Obra, Valor_Servico, Valor_Peca) VALUES ('Reparo Motor', 1770.00, 560.00); 
INSERT INTO Tabela_Referencia (Mao_de_Obra, Valor_Servico, Valor_Peca) VALUES ('Conserto Freio', 885.00, 245.00); 
INSERT INTO Tabela_Referencia (Mao_de_Obra, Valor_Servico, Valor_Peca) VALUES ('Direcao', 1699.00, 799.00); 

INSERT INTO Cliente (Nome, Endereco, Contato) VALUES ('Inaia Reis', 'Av. Paulista, 214', '985632141');
INSERT INTO Cliente (Nome, Endereco, Contato) VALUES ('Abner Samuel', 'Rua Dez, 96', '995842632');
INSERT INTO Cliente (Nome, Endereco, Contato) VALUES ('Samuel Messias', 'Rua 13 de Maio, 986', '98632541');

INSERT INTO Servicos (Identificacao, Valor) VALUES ('Manutencao', 875.26); 
INSERT INTO Servicos (Identificacao, Valor) VALUES ('Bateria', 356.15); 
INSERT INTO Servicos (Identificacao, Valor) VALUES ('Manutencao', 875.24); 

-- CRIANDO QUERIES

-- Recuperações simples com SELECT Statement
select * from Cliente;

-- Filtros com WHERE Statement
select * from Veiculo where Modelo = 'IX35';

-- Crie expressões para gerar atributos derivados
select (Valor_Servico + Valor_Peca) AS Valor_Total from Tabela_Referencia;

-- Defina ordenações dos dados com ORDER BY
select Identificacao, Valor from Servicos order by Valor desc;

-- Condições de filtros aos grupos – HAVING Statement
select Numero, Valor, Status from Ordem_Servico group by Status having Valor > 500.00;

-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
select *
    from Servicos AS s
    inner join Pecas AS p
    on s.Identificacao = p.Identificacao