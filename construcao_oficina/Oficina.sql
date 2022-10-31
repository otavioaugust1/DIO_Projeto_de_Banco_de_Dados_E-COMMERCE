-- criação do banco de dados para o cenário da oficina mecânica
Create database OFICINA;
USE OFICINA;

-- tabela cliente
create table Cliente(
	idCliente int auto_increment primary key,
    Nome VARCHAR(30),
    Endereco VARCHAR(35),
    Contato VARCHAR(15)
);

-- tabela veículo
create table Veiculo(
	idVeiculo int auto_increment primary key,
	Placa VARCHAR(10),
    Modelo VARCHAR(15),
    Ano char(5)
);

-- tabela mecânico
create table Mecanico(
	idMecanio int auto_increment primary key,
	Codigo VARCHAR(20),
    Nome VARCHAR(35),
    Endereco VARCHAR(45),
    Especialidade VARCHAR(20)
);

-- tabela ordem de serviço
create table Ordem_Servico(
	idOrdem_Servico int auto_increment primary key,
	Data_Entrega DATE,
    Numero VARCHAR(21),
    Data_Emissao DATE,
    Valor FLOAT,
    Status VARCHAR(15)
);

-- tabela - tabela de referência
create table Tabela_Referencia(
	idTabela_Referencia int auto_increment primary key,
	Mao_de_Obra VARCHAR(21),
	Valor_Servico FLOAT,
    Valor_Peca FLOAT  
);

-- tabela serviços
create table Servicos(
	idServicos int auto_increment primary key,
	Identificacao VARCHAR(45),
	Valor FLOAT      
);

-- tabela peças
create table Pecas(
	idPecas int auto_increment primary key,
	Quantidade INT,
	Identificacao VARCHAR(45),
	Valor FLOAT,
	constraint fk_Pecas_idPecas foreign key (idPecas) references Ordem_Servico(idOrdem_Servico)  
);