insert into cliente(cod_cli,nome_cli,endereco,cidade,cep,uf) values
(1,'Eloa Gomes','Rua Dahora legal','Mogi Mirim','13800564','SP'),
(2,'Gabriel Misael','Rua prefeito','Mogi Mirim','13800400','SP'),
(3,'Pompom','Rua Santo Prado','Mogi Mirim','13800156','SP');

select*from cliente;

insert into vendedor values(10,'Guilherme Dahora',3500.90,'A'),
(20,'Michele Legal',5500.50,'E'),
(30,'Pedro Amigo',4000.90,'B');

select*from vendedor;

insert into produto values(100,'pç','Caneta bic',3.6),
(200,'gr','cola branca',2.99),
(300,'ur','Caderno',10.80),
(400,'lt','Alcool etilico',9.00),
(500,'pç','borracha',1.30);

select*from produto;

insert into pedido values
(1,10,02,20),
(2,15,03,20),
(3,10,02,10),
(4,30,01,30),
(5,15,02,10);

select*from pedido;

insert into item_pedido values
(1,200,2),
(1,500,3),
(2,500,1),
(3,100,2),
(3,300,5),
(3,400,3),
(4,200,2),
(4,300,5),
(5,100,10),
(5,200,7);

select*from item_pedido;





