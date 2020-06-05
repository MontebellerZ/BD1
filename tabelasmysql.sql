CREATE DATABASE audocao;
USE audocao;

CREATE TABLE Humanos (
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

CREATE TABLE Adotantes (
    email VARCHAR(80) PRIMARY KEY,
    FOREIGN KEY (email) REFERENCES Humanos(email)
);

CREATE TABLE Ajudantes (
    email VARCHAR(80) PRIMARY KEY,
    FOREIGN KEY (email) REFERENCES Humanos(email)
);

CREATE TABLE Moderadores (
    email VARCHAR(80) PRIMARY KEY,
    FOREIGN KEY (email) REFERENCES Humanos(email)
);

CREATE TABLE Contatos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    motivo VARCHAR(80) NOT NULL,
    datainicio DATE NOT NULL,
    datafim DATE,
    relatorio TEXT,
    moderador_email VARCHAR(80),
    adotante_email VARCHAR(80) NOT NULL,
    FOREIGN KEY (moderador_email) REFERENCES Moderadores(email),
    FOREIGN KEY (adotante_email) REFERENCES Adotantes(email)
);

CREATE TABLE Pets (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(80) NOT NULL,
    especie VARCHAR(80) NOT NULL,
    raca VARCHAR(80) NOT NULL,
    tamanho_cm INT NOT NULL,
    peso_kg FLOAT NOT NULL,
    personalidade TEXT NOT NULL,
    adaptabilidade TEXT NOT NULL,
    ajudante_email VARCHAR(80) NOT NULL,
    FOREIGN KEY (ajudante_email) REFERENCES Ajudantes(email)
);

CREATE TABLE Fotopets (
    id INT PRIMARY KEY AUTO_INCREMENT,
    link VARCHAR(255),
    pet_id INT NOT NULL,
    FOREIGN KEY (pet_id) REFERENCES Pets(id)
);

CREATE TABLE Adocoes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    datarequisicao DATE NOT NULL,
    dataadocao DATE,
    status INT NOT NULL,
    relatorio TEXT,
    moderador_email VARCHAR(80) NOT NULL,
    adotante_email VARCHAR(80) NOT NULL,
    FOREIGN KEY (moderador_email) REFERENCES Moderadores(email),
    FOREIGN KEY (adotante_email) REFERENCES Adotantes(email)
);

INSERT INTO Humanos VALUES('João','Adotante','joao@mail.com','senha', '(27)99999-8888','111.222.333-44','1994-03-01',1340.99,29100020,'Rua José',23,'Prédio','Mares','apt 302');
INSERT INTO Humanos VALUES('Matheus','Ajudante','matheus@mail.com','senha', '(27)99999-7777','111.222.333-55','1987-12-12',2000.00,29100030,'Rua Clovis',503,'Prédio','Tall','apt 704');
INSERT INTO Humanos VALUES('Bernardo','Moderador','bernardo@mail.com','senha', '(27)99999-6666','111.222.333-66','1999-10-14',2300.00,29100040,'Rua Alberto Guimarães',458,'Casa','','');

INSERT INTO Adotantes VALUES('joao@mail.com');
INSERT INTO Ajudantes VALUES('matheus@mail.com');
INSERT INTO Moderadores VALUES('bernardo@mail.com');

INSERT INTO Contatos VALUES(0, 'duvida sobre a ração do meu cachorro', '2010-10-27','2010-10-29','a duvida do cliente foi retirada com rapidez e qualidade','bernardo@mail.com','joao@mail.com');

INSERT INTO Pets VALUES(0, 'Thor', 'vira-lata', 'sem raça', 86, 7.806, 'amigável e sociável', 'adaptação rápida e sem problemas', 'matheus@mail.com');
INSERT INTO Fotopets VALUES(0, 'https://www.hypeness.com.br/wp-content/uploads/2019/09/Vira-lata_Caramelo_1.jpg', '1');

INSERT INTO Adocoes VALUES(0, '2015-06-17', '2015-06-23', '4', 'adotado com sucesso e em processo de adaptação', 'bernardo@mail.com', 'joao@mail.com');

SELECT * FROM Humanos;
SELECT * FROM Adotantes;
SELECT * FROM Ajudantes;
SELECT * FROM Moderadores;
SELECT * FROM Contatos;
SELECT * FROM Pets;
SELECT * FROM Fotopets;
SELECT * FROM Adocoes;
