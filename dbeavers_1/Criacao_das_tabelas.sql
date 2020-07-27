CREATE table categoria(
	cod_categoria integer primary key autoincrement not null,
	nome text,
	descricao text
)

create table funcionario(
	cod_funcionario integer primary key autoincrement not null,
	nome text,
	cpf integer
)

create table cliente( 
	cod_cliente integer primary key autoincrement not null,
	nome text,
	user_nome text,
	email text,
	cpf integer,
	data_nascimento date,
	cep integer,
	rua text,
	numero integer,
	complemento text,
	cidade text,
	bairro text,
	UF text
)

create table pedido(
	cod_pedido integer primary key autoincrement not null,
	data_realizada date,
	cod_cliente integer,
	foreign key (cod_cliente) references cliente(cod_cliente)
)

create table produto(
	cod_produto integer primary key autoincrement not null,
	nome text,
	descricao text,
	data_fabricacao date,
	valor_unitario real,
	quant_estoque integer,
	cod_categoria integer,
	cod_funcionario integer,
	foreign key (cod_categoria) references categoria(cod_categoria),
	foreign key (cod_funcionario) references funcionario(cod_funcionario)
)

create table carrinho(
	cod_carrinho integer primary key autoincrement not null,
	quant_item integer,
	cod_pedido integer,
	cod_produto integer,
	foreign key (cod_pedido) references pedido(cod_pedido),
	foreign key (cod_produto) references produto(cod_produto)
)

