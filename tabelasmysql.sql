CREATE DATABASE audocao;
USE audocao;

CREATE TABLE humano (
	nome VARCHAR(80) NOT NULL,
    sobrenome VARCHAR(80) NOT NULL,
    email VARCHAR(80) PRIMARY KEY,
    senha VARCHAR(80) NOT NULL,
    telefone VARCHAR(14) UNIQUE NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    datanascimento DATE NOT NULL,
    rendamensal DECIMAL(10,2) NOT NULL,
    cep INT NOT NULL,
    nomerua VARCHAR(80) NOT NULL,
    numeromoradia INT NOT NULL,
    tipomoradia VARCHAR(80) NOT NULL,
    nomemoradia VARCHAR(80),
    complemento VARCHAR(80)
);

CREATE TABLE adotante (
    email VARCHAR(80) PRIMARY KEY,
    FOREIGN KEY (email) REFERENCES humano(email)
);

CREATE TABLE ajudante (
    email VARCHAR(80) PRIMARY KEY,
    FOREIGN KEY (email) REFERENCES humano(email)
);

CREATE TABLE moderador (
    email VARCHAR(80) PRIMARY KEY,
    FOREIGN KEY (email) REFERENCES humano(email)
);

CREATE TABLE contato (
	id INT PRIMARY KEY AUTO_INCREMENT,
    motivo VARCHAR(80) NOT NULL,
    datainicio DATE NOT NULL,
    datafim DATE,
    relatorio TEXT,
    moderador_email VARCHAR(80),
    adotante_email VARCHAR(80) NOT NULL,
    FOREIGN KEY (moderador_email) REFERENCES moderador(email),
    FOREIGN KEY (adotante_email) REFERENCES adotante(email)
);

CREATE TABLE pet (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(80) NOT NULL,
    especie VARCHAR(80) NOT NULL,
    raca VARCHAR(80) NOT NULL,
    tamanho INT NOT NULL,
    peso INT NOT NULL,
    personalidade TEXT NOT NULL,
    adaptabilidade TEXT NOT NULL,
    ajudante_email VARCHAR(80) NOT NULL,
    FOREIGN KEY (ajudante_email) REFERENCES ajudante(email)
);

CREATE TABLE fotopet (
	id INT PRIMARY KEY AUTO_INCREMENT,
    link VARCHAR(255),
    pet_id INT NOT NULL,
    FOREIGN KEY (pet_id) REFERENCES pet(id)
);

CREATE TABLE adocao (
	id INT PRIMARY KEY AUTO_INCREMENT,
    datarequisicao DATE NOT NULL,
    dataadocao DATE,
    status INT NOT NULL,
    relatorio TEXT,
    moderador_email VARCHAR(80) NOT NULL,
    adotante_email VARCHAR(80) NOT NULL,
    FOREIGN KEY (moderador_email) REFERENCES moderador(email),
    FOREIGN KEY (adotante_email) REFERENCES adotante(email)
);

INSERT INTO humano VALUES('João','Souza','João@mail.com','senha', '(27)99999-8888','111.222.333-44','2010-12-12',1340.99,29100020,'Rua José',23,'Prédio','Mares','apt 302');