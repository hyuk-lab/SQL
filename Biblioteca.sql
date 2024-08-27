create database biblioteca;
use biblioteca;
create table aluno (
rm int primary key,
nomeA varchar(40) not null,
email varchar(40) unique not null
);
create table livro (
tombo int primary key,
titulo varchar(40) not null
);
create table funcionario (
cpf int primary key,
nomeF varchar(40) not null,
salario double not null);

create table empresta (
rmAluno int not null,
tomboLivro int not null,
cpfFuncionario int not null,
dataRetirada date not null,
dataDevolucao date not null,
primary key (rmAluno, tomboLivro, cpfFuncionario, dataRetirada),
foreign key (rmAluno) references aluno (rm),
foreign key (tomboLivro) references livro (tombo),
foreign key (cpfFuncionario) references funcionario (cpf));
show databases;
insert into aluno values (1,"Mario de Andrade","mario.andrade@gmail.com"), 
(2,"Beth Faria","beth.faria@gmail.com"), 
(3,"Roberto Carlos","roberto.carlos@gmail.com");
insert into livro values (1010,"E o vento levou"),(2020, "A vida é bela"),
(3030,"O pequeno príncipe"),(4040,"A era da tecnologia");
insert into funcionario values (1111,"Tomas Santos",2000), 
(2222,"Marta Moraes",3100),(1212,"João Louveira",2500);
insert into empresta values (1,2020,2222,"2024-10-10","2024-10-14"),
(3,1010,2222, "2024-10-11","2024-10-15"),(2,4040,1212,"2024-10-13","2024-10-17");

select nomeF, salario/2000 as QtdSalMinimo from funcionario;

select nomeF, salario+salario*10/100 as SalarioAumento from funcionario;

select nomeF, (salario+salario*25/100)+120 as novosalario from funcionario where salario < 2500;

SELECT dataDevolucao-dataRetirada as diasEmprestimo from empresta;

select dataRetirada, DATE_ADD(dataRetirada, interval 5 day) as DataDevolucao from empresta;


