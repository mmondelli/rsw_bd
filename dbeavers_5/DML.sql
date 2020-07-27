insert into endereco (pais, estado,cidade,bairro,rua,numero,complemento) values
	('China','Hubei','Wuhan','Xing Tao','Xing Zao','19','Covid'),
	('Brasil','Rio de Janeiro','Petrópolis','Morin','Algusto Severo','411',null),
	('Brasil','Rio de Janeiro','Petrópolis','São Sebastião','Alfredo Alexandre Wendling','40','casa'),
	('Brasil','Rio de Janeiro','Petrópolis','Castrioto','Pedro Vogel Sobrinho','51','casa A'),
	('Brasil','Rio de Janeiro','Petrópolis','Duarte Silveira','João Xavier','51',null);
insert into usuario (login,senha,id_ende,telefone,nome,email,cpf,nascimento) values
	('covid19','sars-cov-02',1,'+86 27 7736547','Corona Vírus','covid19@baidu.com','15965554706','15/12/2019'),
	('f.Ramires','ramires123',2,'+55 024 99043956','Fernando Ramires','fer9ramires@yahoo.com.br','98732145602','15/10/1983'),
	('arthur.vinagre','paneraste.123',3,'+55 024 992745024','Arthur José Peres Vinagre','redfox.1480@gmail.com','16958845603','30/10/2000'),
	('lfrocha','vinagre123',4,'+55 024 993235738','Lucio Flavio Rocha','luciof@gmail.com','15624824901','12/10/1980'),
	('cloroquina','azeite123',5,'+55 024 981841249','Marcelo Barreto','cloroquina@hotmail.com','24865425803','19/09/1971');
insert into categoria (nome,descricao) values
	('Alimento','Produtos alimentícios em geral.'),
	('Eletrodoméstico','Produtos elétricos de uso doméstico.'),
	('Eletrônicos','Celular, computador, vídeo-game, TV etc'),
	('Esporte','Produtos relacionados a esporte.'),
	('Limpeza','Cosméticos e produtos de limpeza em geral.');
insert into produto (nome,descricao,estoque,data_fab,preco,id_user,id_categoria)values
	('arroz','tio joao tipo 1 5kg',50,'10/2020',20,1,1),
	('feijao','tio joao 1kg',80,'10/2020',7,2,1),
	('smartphone','samsungA30 ultima geracao',100,'07/2020',1000,2,3),
	('papel higienico','neve folha dupla 12 rolos',100,'05/2020',20,3,5),
	('taco de hoquei','thunderbird',10,'03/2020',150,4,4);
insert into pedido (id_user,data_compra)values
	(5,'23/07/2020'),
	(4,'23/07/2020'),
	(3,'23/07/2020'),
	(2,'23/07/2020'),
	(1,'23/07/2020');
INSERT into carrinho (id_pedido,id_produto,quantidade)values
	(1,3,10),
	(2,4,3),
	(2,2,5),
	(3,3,1),
	(2,3,1);

update pedido
set total_compra = (select sum(p.preco * c.quantidade)
                    from produto p
                    inner join carrinho c on p.id_produto = c.id_produto
                    where c.id_pedido = 1
                    group by c.id_pedido)
where id_pedido = 1;

update pedido
set total_compra = (select sum(p.preco * c.quantidade)
                    from produto p
                    inner join carrinho c on p.id_produto = c.id_produto
                    where c.id_pedido = 2
                    group by c.id_pedido)
where id_pedido = 2;

update pedido
set total_compra = (select sum(p.preco * c.quantidade)
                    from produto p
                    inner join carrinho c on p.id_produto = c.id_produto
                    where c.id_pedido = 3
                    group by c.id_pedido)
where id_pedido = 3;

update pedido
set total_compra = (select sum(p.preco * c.quantidade)
                    from produto p
                    inner join carrinho c on p.id_produto = c.id_produto
                    where c.id_pedido = 4
                    group by c.id_pedido)
where id_pedido = 4;

update pedido
set total_compra = (select sum(p.preco * c.quantidade)
                    from produto p
                    inner join carrinho c on p.id_produto = c.id_produto
                    where c.id_pedido = 5
                    group by c.id_pedido)
where id_pedido = 5;
	
	
	INSERT into categoria(nome, descricao)values
	("papelaria", "caneta");

	delete FROM categoria where nome LIKE "papelaria";
	