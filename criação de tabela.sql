create table Funcionarios(
    id_funcionario  Integer         unique  not null,
    cpf             Varchar2(14)    unique  not null,
    matricula       Varchar2(10)    unique  not null,
    nome            Varchar2(32)            not null,
    sobrenome       Varchar2(32)            not null,
    email           Varchar2(32)    unique          ,
    id_filial       Integer                 not null
);

create table Filiais (
    id_filial number unique not null,
    cnpj varchar2(20) unique not null
);