-- criação do banco de dados para o cenário do e-commerce
create database ECOMMERCE;
USE ECOMMERCE;

-- tabela cliente
create table Cliente(
	idCliente int auto_increment primary key,
    Nome VARCHAR(25),
    CPF char(11),
    CNPJ char(15) ,    
    Endereco VARCHAR(25),
    Identificacao VARCHAR(10),
    constraint unique_cpf_cliente unique (CPF),
    constraint unique_cnpj_cliente unique (CNPJ)
);

-- tabela produto
create table Produto(
	idProduto int auto_increment primary key,
    Descricao varchar(15),    
	Categoria varchar(30),
    Valor float     
    );

-- tabela pedido
create table Pedido(
	idPedido int auto_increment primary key,
	StatusPedido VARCHAR(10),
    descricao VARCHAR(30),
    Frete FLOAT,
	constraint fk_Cliente_idCliente foreign key (idPedido) references Cliente(idCliente)  
);

-- tabela pagamento boleto
create table Pagamento_Boleto(
	idPagamento_Boleto int auto_increment primary key,
	Data_Vencimento DATE,
    Valor FLOAT,
	constraint fk_Pedido_Cliente_idCliente foreign key (idPagamento_Boleto) references Pedido(idPedido)  
);

-- tabela pagamento cartao
create table Pagamento_Cartao(
	idPagamento_Cartao int auto_increment primary key,
	Numero_Cartao varchar(20),
	CVV_Cartao VARCHAR(5),
    Nome VARCHAR(30),
    Valor FLOAT    
);

-- tabela entrega
create table Entrega(
	idEntrega int auto_increment primary key,
	Codigo_Rastreio VARCHAR(15),
	Status VARCHAR(10),
    Data_Entrega DATE    
);

-- tabela estoque
create table Estoque(
	idEstoque int auto_increment primary key,
	Localizacao VARCHAR(90),
	Quantidade int default 0,
	constraint fk_Estoque_idEstoque foreign key (idEstoque) references Produto(idProduto)
);

-- tabela fornecedor
create table Fornecedor(
	idFornecedor int auto_increment primary key,
	CNPJ CHAR(11),
	Razao_Social VARCHAR(35),
	constraint fk_Fornecedor_idFornecedor foreign key (idFornecedor) references Produto(idProduto)  
);

-- tabela terceiro vendedor
create table Terceiro_Vendedor(
	idTerceiro_Vendedor int auto_increment primary key,
	Localizacao VARCHAR(35),
	Razao_Social VARCHAR(40),
	constraint fk_Terceiro_Vendedor_idTerceiro_Vendedor foreign key (idTerceiro_Vendedor) references Produto(idProduto) 
); 