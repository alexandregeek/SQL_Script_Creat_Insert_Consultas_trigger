#SCRIPT PARA CRIAÇÃO DO BANCO



CREATE DATABASE MAPA_DBII_Rede_UNIFARMA;
USE MAPA_DBII_Rede_UNIFARMA;
CREATE TABLE Categoria (
    codcategoria INT PRIMARY KEY,
    categoria VARCHAR(70)
);

CREATE TABLE ItemEntrada (
    coditementrada INT PRIMARY KEY,
    lote VARCHAR(45),
    qtde INT,
    valor DOUBLE,
    Produto_codproduto INT,
    Entrada_codentrada INT
);

CREATE TABLE Entrada(
    codentrada INT PRIMARY KEY,
    dataped DATE,
    dataentr DATE,
    total VARCHAR(45),
    frete DOUBLE,
    numnf INT,
    imposto VARCHAR(45),
    Transportadora_codtransportadora INT
);

CREATE TABLE Produto(
    codproduto INT PRIMARY KEY ,
    descricao VARCHAR(100),
    peso DOUBLE,
    controlado char(1),
    qtditem DOUBLE,
    Fornecedor_codfornecedor INT,
    Categoria_codcategoria INT
);

CREATE TABLE Cidade(
    codcidade INT PRIMARY KEY,
    cidade VARCHAR(45),
    uf CHAR (2)
);

CREATE TABLE Fornecedor(
    codfornecedor INT PRIMARY KEY,
    fornecedor VARCHAR(45),
    endereco VARCHAR(45),
    num INT,
    bairro VARCHAR(45),
    cep VARCHAR(8),
    contato VARCHAR(45),
    CNPJ VARCHAR(14),
    insc VARCHAR(45),
    tel VARCHAR(15),
    Cidade_codcidade INT
);

CREATE TABLE ItemSaida(
    coditemsaida INT PRIMARY KEY,
    lote VARCHAR(45),
    qtde INT,
    valor DOUBLE,
    Produto_codproduto INT,
    Saida_codsaida INT
);

CREATE TABLE Loja(
    codloja INT PRIMARY KEY,
    nome VARCHAR(45),
    endereco VARCHAR(45),
    num INT,
    bairro VARCHAR(45),
    tel VARCHAR(15),
    insc VARCHAR(45),
    cnpj VARCHAR(45),
    Cidade_codcidade INT
);

CREATE TABLE Transportadora(
    codtransportadora INT PRIMARY KEY,
    transportadora VARCHAR(45),
    endereco VARCHAR(45),
    num INT,
    bairro VARCHAR(45),
    cep VARCHAR(8),
    CNPJ VARCHAR(45),
    insc VARCHAR(45),
    contato VARCHAR(45),
    tel VARCHAR(15),
    Cidade_codcidade INT
);

CREATE TABLE Saida(
    codsaida INT PRIMARY KEY,
    total DOUBLE,
    frete DOUBLE,
    imposto VARCHAR(45),
    Loja_codloja INT,
    Transportadora_codtransportadora INT
);

# ALTER TABLE ItemEntrada ADD FOREIGN KEY (COLUMN_NAME) REFERENCES  Table (ID_IN_TABLE_REFERENCED);

ALTER TABLE ItemEntrada ADD FOREIGN KEY fk_ItemEntrada_Produto1_idx (Produto_codproduto) REFERENCES  produto (codproduto);
ALTER TABLE ItemEntrada ADD FOREIGN KEY fk_ItemEntrada_Entrada1_idx (Entrada_codentrada) REFERENCES  Entrada (codentrada);

ALTER TABLE Entrada ADD FOREIGN KEY fk_Entrada_Transportadora1_idx (Transportadora_codtransportadora) REFERENCES  Transportadora (codtransportadora);

ALTER TABLE Fornecedor ADD FOREIGN KEY fk_Fornecedor_Cidade1_idx (Cidade_codcidade) REFERENCES  Cidade (codcidade);

ALTER TABLE Produto ADD FOREIGN KEY fk_Produto_Fornecedor1_idx (Fornecedor_codfornecedor) REFERENCES  Fornecedor (codfornecedor);
ALTER TABLE Produto ADD FOREIGN KEY fk_Produto_Categoria1_idx (Categoria_codcategoria) REFERENCES  Categoria (codcategoria);


ALTER TABLE ItemSaida ADD FOREIGN KEY fk_ItemSaida_Produto1_idx (Produto_codproduto) REFERENCES  Produto (codproduto);
ALTER TABLE ItemSaida ADD FOREIGN KEY fk_ItemSaida_Saida1_idx (Saida_codsaida) REFERENCES  Saida (codsaida);

ALTER TABLE Loja ADD FOREIGN KEY fk_Loja_Cidade1_idx (Cidade_codcidade) REFERENCES  Cidade (codcidade);

ALTER TABLE Transportadora ADD FOREIGN KEY fk_Transportadora_Cidade1_idx (Cidade_codcidade) REFERENCES  Cidade (codcidade);

ALTER TABLE Saida ADD FOREIGN KEY fk_Saida_Loja1_idx (Loja_codloja) REFERENCES  Loja (codloja);
ALTER TABLE Saida ADD FOREIGN KEY fk_Saida_Transportadora1_idx(Transportadora_codtransportadora) REFERENCES  Transportadora (codtransportadora);

