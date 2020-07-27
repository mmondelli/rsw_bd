--Arquivo .sql com os comandos DQL:			
--Pelo menos 2 com algum tipo de junção
--Pelo menos 1 com usando count() e group by()
--1 SQL para construção de nota fiscal

-- Qual produdo os cliente estão comprando
select c.nome as Cliente,
       prod.nome as Produto 
FROM cliente c, pedido p, carrinho car, produto prod 
where c.cod_cliente = p.cod_cliente
and p.cod_pedido = car.cod_pedido 
and car.cod_produto = prod.cod_produto  

-- Produtos cadastrados pelos funcionarios
SELECT f.nome as Funcionario,
       prod.nome as Produto
FROM funcionario f, produto prod
where f.cod_funcionario = prod.cod_funcionario 

-- A quantidade de produtos registrados
SELECT COUNT(quant_estoque)
from produto

-- Produtos e categorias agrupados pelo codigo da categoria 
select categ.cod_categoria, 
	   categ.nome as Categoria,
	   prod.nome as Produto	   
FROM categoria categ, produto prod
where categ.cod_categoria = prod.cod_categoria 
group by categ.cod_categoria 

-- Nota Fiscal
select p.data_realizada,
       c.nome as Cliente,
       prod.nome as Produto,
       car.quant_item,
       prod.valor_unitario,
       (car.quant_item * prod.valor_unitario) as Total
FROM cliente c, pedido p, carrinho car, produto prod 
where c.cod_cliente = p.cod_cliente
and p.cod_pedido = car.cod_pedido 
and car.cod_produto = prod.cod_produto  



	   