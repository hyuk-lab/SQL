create database transportadora;

use transportadora;

create table caminhoes(
chassiC varchar(80) primary key not null,
modeloC varchar(80) not null,
cap_cargaC int(10) not null,
corC varchar(80) not null);

create table motoristas( 
registroM varchar(80) primary key not null,
cnh_nrm varchar(80) not null,
cnh_dtVencM date not null,
chassiCM varchar(80) not null,
foreign key(chassiCM) references caminhoes (chassiC));

create table empresas(
codigoE varchar(80) primary key not null,
nomeE varchar(120) not null,
enderecoE varchar(80) not null);

create table produtos( 
codigoP varchar(80) primary key not null,
tipo varchar(80) not null,
descricaoP varchar(80) not null,
destino varchar(80) not null);

create table prestaservico(
chassiCPS varchar(80)not null,
codigoEPS varchar(80)not null,
codigoPS varchar(80)not null,
primary key(chassiCPS, codigoEPS, codigoPS),
foreign key (chassiCPS) references caminhoes(chassiC),
foreign key (codigoEPS) references empresas(codigoE),
foreign key (codigoPS) references produtos(codigoP));

create table linha( 
codigoELinha varchar(80) not null,
codigoPLinha varchar(80) not null,
primary key(codigoELinha, codigoPLinha),
foreign key(codigoELinha) references empresas (codigoE),
foreign key(codigoPLinha) references produtos(codigoP));

insert into caminhoes (chassiC,modeloC,cap_cargaC,corC) values 
( '12345678912345678','mercedez',50,'vermelho'),
( '18329485278912348','toyata',100,'azul'),
( '32547894513254678','ferrari',80,'vermelho');

insert into motoristas (registroM,cnh_nrm,cnh_dtVencM,chassiCM) values
('1450','456789452','2030-04-12','12345678912345678'),
('1520','132467985','2045-09-08','18329485278912348'),
('1820','889746523','2028-09-10','32547894513254678');

insert into empresas (codigoE, nomeE,enderecoE) values
('25','SEGA','rua incrivelmente legal, n° 20'),
('50','NINTENDO','rua incrivelmente dahora, n° 55'),
('75','NETFLIX','rua incrivelmente legal2, n° 35');

insert into produtos(codigoP, tipo,descricaoP,destino) values
('1542','tesoura','tesoura com ponta','Loja de Costura'),
('2550','caneta','caneta bic azul','Pepelaria'),
('3100','fita cassete','fita cessete: Chuck 1990','Loja de Fitas cassete');

insert into prestaservico (chassiCPS,codigoEPS,codigoPS)  values
('12345678912345678','25','1542'),
('18329485278912348','50','2550'),
('32547894513254678','75','3100'),
('32547894513254678','50','2550'),
('18329485278912348','25','1542'),
('12345678912345678','75','3100');

insert into linha(codigoELinha, codigoPLinha) values
('25','1542'),
('25','2550'),
('25','3100'),
('50','2550'),
('50','3100'),
('75','3100');

rename table prestaservico to prestaS;

update linha set codigoPLinha = '3100' where codigoELinha ='75';

//Ativdade 3 para terminar

create database instituicaoPB;

use instituicaoPB;

create table Candidatos (
    cpf varchar(11) primary key not null, 
    nome varchar(100) not null);


CREATE TABLE Concursos (
    numero varchar(10) primary key not null,
    tipo varchar(50) not null);


CREATE TABLE ConcursoPublico (
 numero_Concursos varchar(10)not null,
 estado varchar(50) not null,
 primary key (numero_Concursos),
 foreign key (numero_Concursos) references Concursos(numero));


CREATE TABLE ConcursoParticular (
    numero_Concursos varchar(10) not null,
    data_Inicio date not null,
    primary key (numero_Concursos),
    foreign key (numero_Concursos) references Concursos(numero));


CREATE TABLE CandidatosConcursos (
    cpf_Candidatos varchar(11) not null,
    numero_Concursos varchar(10) not null,
    data_inicio date not null,
    hora time not null,
    primary key (cpf_Candidatos, numero_Concursos),
    foreign key (cpf_Candidatos)references Candidatos(cpf),
    foreign key (numero_Concursos)references Concursos(numero));


CREATE TABLE Provas (
    codigo varchar(10) primary key not null,
    valor decimal(10, 2),
    tipo varchar(50));


CREATE TABLE Provas_Concursos (
    codigo_Prova varchar(10)not null,
    numero_Concurso varchar(10) not null,
    autor varchar(100),
    primary key (codigo_Prova, numero_Concurso),
    foreign key (codigo_Prova) references Provas(codigo),
    foreign key (numero_Concurso) references Concursos(numero));
































  

