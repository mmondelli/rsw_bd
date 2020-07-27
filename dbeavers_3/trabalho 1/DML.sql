insert into categoria(nome, descricao)
    values ('Camisa', 'Camisas nerdstore'),
           ('Decoração', 'Produtos de decoração com tematica nerd'),
           ('Livros', 'Livros NerdStore')
           ;

INSERT INTO produto
(nome, 
descricao, 
quantidade_estoque, 
data_fabricacao, 
valor_unidade, 
fk_categoria, 
fk_funcionario)
VALUES
     ('Camisa Camiseta Guerreiro Z',
      'O líder dos Guerreiros Z, com poder de mais de 8000, não existem desafios impossíveis,
   	   somente a sede por encontrar um adversário imbatível. Mostre todo seu lado nerd com as referências dessa linda camiseta.',
   	   66, '21/01/2020', 59.25, 1, 1),
	 ( 'Camiseta Spartan Skull', 'Por muito tempo, o fantasma de Esparta espalhou o caos em sua jornada.
	    Ele deixou um rastro de sangue por onde passou, buscando sua vingança aos deuses do Olimpo. 
		Agora está de volta, mas não está mais em busca de vingança, 
		ele está sendo forçado a controlar sua fúria e seu passado em segundo plano para treinar um novo guerreiro.',
		50, '21/01/2020', 69.90, 1, 1),
	 ( 'Placa Decorativa de Metal Batman Logo – Dc Comics', 'Tan Nan Nan Nan Nan Nan Nan… BATMAN!
		Para os colecionadores de plantão, 
		a Placa Decorativa de Metal Batman Logo é um item indispensável e que vai ser destaque na decoração da sua casa.',
		50, '30/02/2020', 69.90, 2, 2),
	 ( 'Capacho Criativo Anatomy Park – Rick and Morty', 'Parque da Anatomia foi um local que foi destaque no terceiro episódio da primeira temporada de Rick e Morty. 
	 	Foi revelado para ser um parque de diversões que foi encontrado no homem sem-teto chamado Ruben. Os dois criadores do Parque da Anatomia foram Rick e Dr. Xenon Bloom. 
	    Foi revelado que as principais atrações no Parque da Anatomia eram as doenças monstruosas.
	    O parque foi destruído quando Rick levou Ruben para o espaço e o explodiu.',
		50, '21/01/2010', 74.90, 2, 2),
     (  'Livro Mitologia Nórdica',
    	'Livro Livro Mitologia Nórdica do autor Neil Gaimann,
    	 Fascinado por essa mitologia desde a infância, o autor compôs uma coletânea de quinze contos',
     	47, '01/09/2019', 34.90, 3, 3);
	 
INSERT into funcionario (nome, CPF) values 
    ('Thiago', '66834118918'),
    ('Paulo', '17362236743'),
    ('Luis', '92838437542'),
    ('Leticia', '76446756712'),
    ('Joï¿½o', '44565868857'),
    ('Robert Cook', '28469652346'),
    ('Kauan Ferreira', '56077846902'),
    ('Alex Fernandes', '98723573074');

INSERT INTO cliente (
    nome_completo,
    nome_usuario,
    email,
    cpf,
    nascimento,
    telefone,
    senha
) VALUES
    ('Joï¿½o Felipe Braganï¿½a', 'Brjoaof', 'brjoaof@gmail.com', '12055366490', '08/03/1991', '(24)99307-2049','admin'),
    ('Luis Filippe Ullmann', 'Filippe', 'filippemkt@gmail.com', '18992894812', '01/01/1988', '(21)98899-0633','admin'),
    ('Leticia Eugï¿½nio Da Silva dos Prazeres', 'Leticia', 'leticiaeugenio13@gmail.com', '18528948122', '04/02/1996', '(22)98137-9363','admin'),
    ('Carlos Eduardo dos Santos Galvï¿½o Bueno', 'Galvï¿½o Bueno', 'galvaobueno@gmail.com', '16528949362', '21/06/1950', '(21)96660-0612','admin'),
    ('Michael Joseph Jackson', 'Michael Jackson', 'mjackson@gmail.com', '00523945122', '29/08/1958', '(24)2222-0000','admin'),
    ('Madeleine Moorehead', 'Aleirt', 'madeleineomoorehead@rhyta.com', '54304917702', '13/11/1982', '541-341-4712','mae0Boh7ua'),
    ('Antï¿½nio Cunha', 'Youncle', 'antoniosantoscunha@cuvox.de', '92743522801', '21/02/1934', '(44) 6619-6801','oje7Ohgoo');

INSERT INTO ENDERECO (
    estado,
    CEP,
    cidade,
    bairro,
    rua,
    numero,
    complemento
   
) VALUES
   ('SP', '08382686', 'Sao Paulo', 'Recanto', 'Rua dos Santos', '12','Apto 137'),
   ('RJ', '25680195', 'Petropolis', 'Centro', 'Dr Nelson de Sa Earp', '15', 'Apto 405'),
   ('SP', '04843040', 'Sao Paulo', 'Itaimbibi', 'Av. Grande', '411', 'Bloco 2'),
   ('MG', '37553052', 'Pouso Alegre', 'Custodio', 'Rua Lima', '13' ,'Apto 1507'),
   ('PR', '87053375', 'Maringï¿½', 'Custodio', 'Rua Olivar Freitas Paiva', '1665' ,''),
   ('ES', '29395000', 'Ibatiba', 'Centro', 'Av. Moreira Salles', '771', 'Sala 3');
 
INSERT INTO endereco_cliente(
    fk_endereco,
    fk_cliente
) VALUES
 (1,1),
 (2,2),
 (3,3),
 (4,4),
 (5,5),
 (5,6),
 (6,7);
 
INSERT into pedido ("data", fk_cliente) values
    ('30/03/2020', 1),
    ('35/01/2020', 2),
    ('17/07/2020', 3),
    ('06/11/2021', 4),
    ('30/06/2022', 5);
   
INSERT into pedido_produto (fk_pedido, fk_produto, itens_pedidos) values
    (1, 1, 1),--incluindo produtos no pedido 1
    (1, 2, 1),--incluindo produtos no pedido 1
    (1, 3, 1),--incluindo produtos no pedido 1
    (2, 4, 2),--incluindo produtos no pedido 2
    (2, 5, 1),--incluindo produtos no pedido 2
    (3, 1, 1),--incluindo produtos no pedido 3
    (4, 1, 1),--incluindo produtos no pedido 4
    (5, 1, 1);--incluindo produtos no pedido 5
    
 INSERT into cliente (
 	nome_completo,
    nome_usuario,
    email,
    cpf,
    nascimento,
    telefone,
    senha
 ) VALUES (
 	'Fausto Corrï¿½a da Silva',
 	'Faustï¿½o',
 	'fastao@globo.com',
 	'10453265678',
 	'02/05/1950',
 	'(21)992357684',
 	'admin'
 );

-- Exclusï¿½o do Cliente
DELETE from cliente where cliente.nome_completo = 'Fausto Corrï¿½a da Silva';

--Atualizando data errada pedido 2
update pedido set 'data' = '27/07/2020' where codigo_pedido = 2;

--Atualizando Valor total dos pedidos:
update pedido 
set valor_total = (	select sum(p.valor_unidade * pp.itens_pedidos)
					from produto p
				  	inner join pedido_produto pp on p.codigo_produto = pp.fk_produto
				    where pp.fk_pedido = 1
				    group by pp.fk_pedido
		          )
where codigo_pedido = 1;

update pedido 
set valor_total = (	select sum(p.valor_unidade * pp.itens_pedidos)
					from produto p
				    inner join pedido_produto pp on p.codigo_produto = pp.fk_produto
				    where pp.fk_pedido = 2
				    group by pp.fk_pedido
	    		  )
where codigo_pedido = 2;

update pedido
set valor_total = (	select sum(p.valor_unidade * pp.itens_pedidos)
					from produto p
				    inner join pedido_produto pp on p.codigo_produto = pp.fk_produto
				    where pp.fk_pedido = 3
				    group by pp.fk_pedido
		    	  )
where codigo_pedido = 3;

update pedido
set valor_total = (	select sum(p.valor_unidade * pp.itens_pedidos)
					from produto p
				    inner join pedido_produto pp on p.codigo_produto = pp.fk_produto
				    where pp.fk_pedido = 4
				    group by pp.fk_pedido
			      )
where codigo_pedido = 4;

update pedido
set valor_total = (	select sum(p.valor_unidade * pp.itens_pedidos)
					from produto p
				    inner join pedido_produto pp on p.codigo_produto = pp.fk_produto
				    where pp.fk_pedido = 5
				    group by pp.fk_pedido
    			  )
where codigo_pedido = 5;