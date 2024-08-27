create database construbem;
use construbem;

create table cliente(
cod_cli int not null,
nome_cli varchar(40) not null,
endereco varchar(40) null,
cidade varchar(20) null,
cep varchar(08) null,
uf varchar(02) null,
primary key(cod_cli));

create table vendedor(
cod_vend int not null,
nome_vend varchar(40) not null,
sal_fixo decimal(9,2) not null,
faixa_comiss char(01) not null,
primary key(cod_vend));

create table produto(
cod_prod int not null,
unid_prod char(03) not null,
desc_prod varchar(20) not null,
val_unit decimal(9,2) not null,
primary key(cod_prod));

create table pedido(
num_ped int not null,
prazo_entr int not null,
cod_cli int not null,
cod_vend int not null,
primary key(num_ped),
foreign key(cod_cli) references cliente(cod_cli),
foreign key(cod_vend) references vendedor(cod_vend));

create table item_pedido(
num_ped int not null,
cod_prod int not null,
qtd_ped double not null,
foreign key(num_ped) references pedido(num_ped),
foreign key(cod_prod) references produto(cod_prod));


insert into cliente(cod_cli,nome_cli,endereco,cidade,cep,uf) values
(1000, "Supermercado Carrefour", "Av. das Americas","rio de janeiro", "20000001", "rj"),
(2000, "Supermercado Baratao", "Rua Rolando Lero","rio de janeiro", "20000002", "rj"),
(3000, "Supermercado Arariboia", "Rua Itaoca", "niteroi", "20000003", "rj"),
(4000, "UFF Cidade Universn","rua niteroi","niteroi", "20000004", "rj"),
(5000, "CSN Rua do Aco","rua das primaveras","volta redonda", "20000005", "rj"),
(6000, "Pegeout", "Rodovia Pres. Dutra","resende", "20000006","rj"),
(7000, "Ind. Quimicas Paulistas", "Rua Tuiuti", "sao paulo", "11000001", "sp"),
(8000, "Ford Caminhoes", "Rua Henry Ford", "sao paulo" ,"11000002", "sp"),
(9000, "Riocel Celulose", "Rua Gen. Arouca", "guaiba", "30000001", "rs"),
(10000, "Elevadores Sur", "Rua Planejada", "guaiba", "30000001", "rs");

insert into vendedor(cod_vend,nome_vend,sal_fixo,faixa_comiss) values
(11, "Paulo Alberto", 1500, "b"),
(12, "Ana Cristina", 2100, "a"),
(13, "Cassia Andrade", 900, "c"),
(14, "Armando Pinto", 2500, "a"),
(15, "Maria Paula", 900, "c");	


insert into produto(cod_prod,unid_prod,desc_prod,val_unit) values
(100, "kg", "Chapa de Aco", 2.5),
(200, "kg","Cimento", 4.5),
(300, "kg", "parafuso 3.0X10.5 mm",2),
(400, "m","Fio plastico" ,2),
(500, "l","Solvente PRW",5);


insert into pedido(num_ped,prazo_entr,cod_cli,cod_vend) values
(1111, 10, 1000, 11),
(1112, 5, 1000, 11),
(1113, 30, 1000, 15),
(2111, 15, 3000, 14),
(2112, 18, 3000, 15),
(2113, 3, 3000, 12),
(3111, 13, 4000, 12),
(3112, 7, 4000, 11),
(4111, 7, 6000, 11),
(4112, 7, 6000, 14),
(5111, 10, 8000, 14),
(6111, 30, 9000, 14),
(6112, 60, 9000, 12),
(7111, 20, 10000, 15);

insert into  item_pedido(num_ped,cod_prod,qtd_ped) values
(1111, 100, 100),
(1111, 200, 100),
(1111, 300, 200),
(1112, 400, 100),
(1112, 500, 1000),
(1113, 100, 300),
(2111, 100, 500),
(2111, 500, 400),
(2112, 200, 100),
(2112, 300, 200),
(2113, 500, 500),
(3111, 400, 300),
(3112, 100, 400),
(3112, 200, 600),
(4111, 300, 700),
(4112, 500, 1000),
(4112, 500, 500),
(5111, 200, 100),
(5111, 300, 500),
(6111, 400, 100),
(6112, 300, 400),
(6112, 400, 200),
(7111, 100, 500);

select * from vendedor;
select count(*) as contar_Maior_2000 from vendedor where sal_fixo > 2000;

select * from cliente;
select count(*) from cliente;
select avg(sal_fixo) as Media_Sal from vendedor;
select * from item_pedido;
select sum(qtd_ped) as somaPedidoCimento from item_pedido where cod_prod = 200;
select sum(qtd_ped) as somaQuantidade from item_pedido;
select max(sal_fixo) as MaiorSal, min(sal_fixo) as MenorSal from vendedor;
select min(val_unit) as PrecoMenor, max(val_unit) as PrecoMaior from produto;
select distinct cidade from cliente;
select count(distinct num_ped) from item_pedido;
select avg(distinct sal_fixo) as mediaSalario from vendedor;
select * from item_pedido;
select num_ped, count(*) as total_Itens from item_pedido group by num_ped;
select num_ped, count(*) as total_itens from item_pedido group by num_ped
having count(*) > 1;

-- Junções de tabelas

select c.cod_cli, c.nome_cli, p.num_ped from cliente c, pedido p where c.cod_cli = p.cod_cli;

select c.nome_cli, c.uf, p.num_ped, p.prazo_entr from cliente c, pedido p where c.cod_cli = p.cod_cli and uf in ('sp', 'rj') and prazo_entr>15;

select c.uf, p.prazo_entr from cliente c, pedido p where c.cod_cli = p.cod_cli;

select c.nome_cli, c.uf, p.num_ped, p.prazo_entr from cliente c, pedido p where c.cod_cli = p.cod_cli order by prazo_entr desc;

select v.nome_vend, p.prazo_entr from vendedor v, pedido p where v.cod_vend = p.cod_vend and v.sal_fixo>1000 and prazo_entr>15 order by nome_vend;

select c.nome_cli, pr.desc_prod, p.num_ped, p.prazo_entr 
from cliente c, produto pr, pedido p, item_pedido ip
where pr.cod_prod = ip.cod_prod
and p.num_ped = ip.num_ped
and c.cod_cli = p.cod_cli 
and pr.desc_prod = "Chapa de Aco" and p.prazo_entr>15
and c.uf = "rj" order by c.nome_cli;


