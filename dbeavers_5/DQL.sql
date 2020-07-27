SELECT COUNT (id_pedido)FROM pedido;
	
select DISTINCT pais FROM endereco;

select pais,complemento from endereco where complemento like 'c%'AND pais like 'brasil';

select produto.nome as produto, 
       categoria.nome as categoria 
	from produto,categoria 
	where categoria.id_categoria =produto.id_categoria ;

select produto.nome as produto, 
       usuario.nome as usuario 
	from produto,usuario 
	where produto.id_user =usuario.id_user;

select pedido.id_pedido,data_compra,usuario.nome as 'nome do usuario' ,produto.nome as 'nome produto' ,carrinho.quantidade,carrinho.quantidade*produto.preco as subtotal
	from pedido 
	inner join carrinho on carrinho.id_pedido = pedido.id_pedido 
	inner join produto on carrinho.id_produto = produto.id_produto 
	inner join usuario on usuario.id_user = pedido.id_user 
