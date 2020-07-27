-- Gerando a nota fiscal
create view nota_fiscal as SELECT p2.codigo_pedido as "numero_nota", p2."data" as "Data do pedido", p2.valor_total,
	   p.nome, p.valor_unidade, pp.itens_pedidos, 
	   c.codigo_cliente, c.nome_completo, c.CPF, c.telefone,
	   e.rua, e.numero, e.complemento, e.bairro, e.cidade, e.estado, e.CEP 
FROM cliente c, endereco e, endereco_cliente ec, pedido p2, pedido_produto pp, produto p
WHERE e.codigo_endereco = ec.fk_endereco 
	AND	ec.fk_cliente = c.codigo_cliente
	AND p2.fk_cliente = c.codigo_cliente
	AND pp.fk_pedido = p2.codigo_pedido
	AND pp.fk_produto = p.codigo_produto;

SELECT * from nota_fiscal 
where numero_nota = 2;

-- Total de pedidos de um cliente (usando count e group by)
SELECT cliente.nome_usuario, COUNT(*) as total_pedido 
	from cliente
	join pedido p on p.fk_cliente = cliente.codigo_cliente
	where cliente.codigo_cliente = 1
GROUP by cliente.codigo_cliente 
HAVING COUNT(*) > 0;

-- Total de produtos por categoria.
select categoria.nome, count(*) as produtos_na_categoria
   from produto
join categoria on produto.fk_categoria = categoria.codigo_categoria
GROUP by categoria.codigo_categoria 
order by categoria.nome;

--Funcionario que mais cadastrou produtos.
select f.nome as Nome_Funcionario, count(p.codigo_produto) as produtos_cadastrados
from produto p
inner join funcionario f on f.codigo_funcionario = p.fk_funcionario
group by p.fk_funcionario
having count(p.codigo_produto) = (
    select max(t.Nome_funcionario)
    from (select count(p.codigo_produto) as Nome_funcionario
    from produto p
    group by p.fk_funcionario) as t
);

--Busca de pedidos pela data
SELECT DISTINCT (pedido.codigo_pedido), pedido."data" 
FROM cliente cliente, pedido pedido, pedido_produto pedido_produto, produto produto
WHERE 
	pedido.fk_cliente = cliente.codigo_cliente
	AND pedido_produto.fk_pedido = pedido.codigo_pedido
	AND pedido_produto.fk_produto = produto.codigo_produto
	AND pedido."data" = :data; 
