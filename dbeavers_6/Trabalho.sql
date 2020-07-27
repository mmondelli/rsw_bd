-- DDL do Banco de dados
-- Criação da Tabela
create table categoria(
id integer primary key autoincrement not null,
nome text unique not null,
descricao text);

create table endereco(
id integer primary key autoincrement not null,
rua text,
numero integer,
complemento text,
bairro text,
cidade text,
cep integer,
estado text);

create table usuario(
id integer primary key autoincrement not null,
nome text not null,
cpf integer UNIQUE not null,
usuario text UNIQUE not null,
email text UNIQUE not null,
data_nascimento date not null,
telefone integer,
celular integer UNIQUE not null,
endereco_id integer references endereco(id));

create table produtos(
id integer primary key autoincrement not null,
nome text,
descricao text,
quantidade_estoque integer,
data_fabricacao date,
valor integer,
categoria_id integer references categoria(id),
usuario_vendedor_id integer references usuario(id));

create table pedidos(
id integer primary key autoincrement not null,
data_pedido date,
usuario_comprador_id integer references usuario(id));

alter table pedidos ADD valor_total integer;

create table pedido_produtos(
id integer primary key autoincrement not null,
quantidade integer,
id_pedido integer references pedidos(id),
id_produto integer references produtos(id));

-- DML para inserção dos dados no BD (pelo menos 5 registros em cada tabela)
-- Inserção do Dados

insert into categoria (nome, descricao) values 
('Imoveis','Compra e venda de imoveis'),
('Automoveis','Compra e venda de automoveis'), 
('Eletronicos','Compra e venda de video-game, celulares, TVs, computadores, etc '),
('Musica','Compra e venda de instumentos musicais e cursos'),
('Esportes','Compra e venda de artigos esportivos'),
('Infantis','Compra e venda de brinquedos e artigos infantis');
update categoria set descricao = 'Compra e venda de instrumentos musicais e cursos' where nome = 'Musica';

insert into endereco (rua, numero, bairro, cidade, cep, estado) values 
('Rua do Imperador', 485, 'Centro', 'Petrópolis', 25620001,'Rio de Janeiro'),
('Rua da imperatriz', 523, 'Ibiapuera', 'São Paulo', 21052333, 'São Paulo'),
('Avenida da Imperatriz', 235, 'Jardim Botânico', 'Macéio', 25635888, 'Alagoas');

insert into usuario (nome, cpf, usuario, email, data_nascimento, celular, endereco_id) values
('André', 15522388821,'Andre123','Andrepimentel@uol.com.br','1995-04-06',24996584232,1),
('Gustavo Leal', 18445348348, 'gustavin123', 'guga@gmail.com','1972-02-04',24581433873,1),
('Renata Ingrata', 00389256782, 'ingrata72', 'reingrata@msn.com', '1982-01-23',85998567123,2),
('Arthur', 59318348663,'arthuzinho05', 'arthuzin2000@outlook.com', '2000-02-29',42964845331,3),
('Ingrid Fernandes', 84343813853,'didizinha', 'didizinha02@zipmail.com', '1997-04-26', 96986335387,2);

insert into produtos (nome, descricao, quantidade_estoque, data_fabricacao, valor, categoria_id, usuario_vendedor_id) values 
('JetPack', 'Mochila foguete para transporte rapido', 1000, '2019',500,2,2),
('Notebook Asus', 'Notebook da Asus Processador Core i5 3 geração', 2, '2017', 150,3,1),
('Fogão', 'Fogão 5 bocas semi-novo',1,'2019',480,3,3),
('Berço', 'Berço infantil branco, quase não usado', 1,'2010',200,6,3),
('Canetas Coloridas', 'Canetas Coloridas fabercastle,', 600,'2019',2,6,1);

insert into pedidos (data_pedido,usuario_comprador_id) values
('2020-06-12',3),
('2020-07-22',5),
('2020-04-12',2),
('2020-03-15',4),
('2020-06-07',5);

insert into pedido_produtos (quantidade, id_pedido, id_produto) values
(10,2,1),
(1,2,3),
(1,1,2),
(20,3,5),
(1,4,4),
(50,5,1);

-- DML para atualização de pelo menos um registro em alguma tabela 
-- Update do Valor total de cada pedido.
update pedidos
set valor_total = (select sum(p.valor * pp.quantidade)
from produtos p
inner join pedido_produtos pp on p.id = pp.id_produto
where pp.id_pedido = 1
group by pp.id_pedido)
where id = 1

update pedidos
set valor_total = (select sum(p.valor * pp.quantidade)
from produtos p
inner join pedido_produtos pp on p.id = pp.id_produto
where pp.id_pedido = 2
group by pp.id_pedido)
where id = 2

update pedidos
set valor_total = (select sum(p.valor * pp.quantidade)
from produtos p
inner join pedido_produtos pp on p.id = pp.id_produto
where pp.id_pedido = 3
group by pp.id_pedido)
where id = 3

update pedidos
set valor_total = (select sum(p.valor * pp.quantidade)
from produtos p
inner join pedido_produtos pp on p.id = pp.id_produto
where pp.id_pedido = 4
group by pp.id_pedido)
where id = 4

update pedidos
set valor_total = (select sum(p.valor * pp.quantidade)
from produtos p
inner join pedido_produtos pp on p.id = pp.id_produto
where pp.id_pedido = 5
group by pp.id_pedido)
where id = 5

-- DML para exclusão de pelo menos um registro em alguma tabela
-- Remoção de uma Categoria
DELETE from categoria where nome = 'Imoveis';

-- DQL para consultas
-- 1 SQL para construção de nota fiscal
-- Pesquisa Nota Fiscall, id do pedido,cpf vendedor,endereço,cpf comprador,endereço, data do pedido, 
-- produtos comprados,quantidade, valor unitario, valor total do pedido.
select (SELECT (pe.id || '-- ' || u.cpf  || ' -- ' || e.cep  || ' -- ' || e.numero)
from pedidos pe 
inner join pedido_produtos pp on pe.id = pp.id_pedido 
inner join usuario u on pe.usuario_comprador_id = u.id 
inner join endereco e on u.endereco_id = e.id 
where pe.id = 1) As ' ID do pedido -- CPF Comprador -- CEP Comprador -- Número do Comprador',
u.cpf as 'CPF Vendedor', 
e.cep as 'CEP Vendedor', 
e.numero as 'Numero Vendedor', 
pe.data_pedido as 'Data', 
pr.nome as 'Nome do Produto', 
pp.quantidade as 'Quantidade', 
pr.valor as 'Valor unitario', 
pe.valor_total as 'Valor Total'
from pedidos pe 
inner join pedido_produtos pp on pe.id = pp.id_pedido 
inner join produtos pr on pp.id_produto = pr.id 
inner join usuario u on pr.usuario_vendedor_id = u.id 
inner join endereco e on u.endereco_id = e.id 
where pe.id = 1

-- Pelo menos 1 com usando count() e group by(
-- Pesquisa Usando Group By para olhar a quantidade de produtos vendidos, para posteriormente atualizar o estoque
select pr.nome As 'Nome do Produto',
sum(pp.quantidade) As 'Quantidade de Produtos Vendidos'
from produtos pr
inner join pedido_produtos pp on pr.id = pp.id_produto
group by pr.nome;

-- Pesquisa usando COUNT para verificar a quantidade de pedidos de um determinado usuário
select u.nome As 'Nome do Usuário',
COUNT(pe.id) As 'Numero Total de pedidos'
from usuario u
inner join pedidos pe on u.id = pe.usuario_comprador_id
where u.id = 5

-- Pelo menos 2 com algum tipo de junção
-- Pesquisa para identificar qual produto e em qual quantidade um determinado usuário vende
select u.nome As 'Nome do Vendedor',
pr.nome As 'Nome do Produto Vendido',
pr.quantidadE_estoque as 'Quantidade em Estoque'
from usuario u
inner join produtos pr on u.id = pr.usuario_vendedor_id
where u.id = 1

-- Pesquisa para determinar o CEP/Número de um usuário
select u.nome As 'Nome do Usuário',
e.CEP as 'CEP do Usuário',
e.Numero as 'Número'
from usuario u
inner join endereco e on u.endereco_id = e.id
where u.id = 1