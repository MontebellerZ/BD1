create database adocao;



create table Humano(
    nome varchar(80) not null, 
    sobrenome varchar(80) not null,
    email varchar(80) primary key,
    senha varchar(20) not null,
    telefone integer unique not null,
    cpf varchar(14) unique not null,
    data_de_nascimento date not null,
    renda_mensal float not null,
    cep integer not null,
    nome_rua varchar(80) not null,
    numero_moradia integer not null,
    tipo_moradia varchar(20) not null,
    nome_moradia varchar(80),
    complemento varchar(80)
);




create table Moderador(
    email varchar(80) primary key,
    foreign key (email) references Humano(email)
);



create table Ajudante(
    email varchar(80) primary key,
    foreign key (email) references Humano(email)
);



create table Adotante(
    email varchar(80) primary key,
    foreign key (email) references Humano(email)
);



create table Contato(
    id integer primary key auto_increment,
    motivo varchar(80) not null,
    datainicio date not null,
    datafim date,
    relatorio text,
    moderador_email varchar(80),
    adotante_email varchar(80) not null,
    foreign key (adotante_email) references Adotante(email),
    foreign key (moderador_email) references Moderador(email)
);



create table Pet(
    id integer primary key auto_increment,
    nome varchar(80) not null,
    especie varchar(80) not null,
    raca varchar(80) not null,
    tamanho integer not null,
    peso integer not null,
    personalidade text,
    adaptabilidade text,
    ajudante_email varchar(80) not null,
    foreign key (ajudante_email) references Ajudante(email)
);



create table Adocao(
    id integer primary key auto_increment,
    data_requisicao date not null,
    data_adocao date,
    status integer not null,
    relatorio text,
    pet_id integer not null,
    adotante_email varchar(80) not null,
    moderador_email varchar(80),
    foreign key (adotante_email) references Adotante(email),
    foreign key (moderador_email) references Moderador(email),
    foreign key (pet_id) references Pet(id)
);





create table foto_pet(
    id integer primary key auto_increment,
    link varchar(255) unique not null,
    pet_id integer not null,
    foreign key (pet_id) references Pet(id) 
);



insert into Humano values('JOAO','SOUZA','JOAO@JOAO.COM','SENHA',123456789,'98798860787','2010-12-12',123.45,1234567,'RUAJOSE',23,'PREDIO','','');