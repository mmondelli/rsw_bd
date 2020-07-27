create table categoria(
id_categoria integer primary key autoincrement not null,
nome varchar (20),
descricao varchar (100)
);
create table endereco(
id_ende integer primary key autoincrement not null,
pais text, 
estado text, 
cidade text,
bairro text,
rua text,
numero integer,
complemento text
);
CREATE table usuario (
id_user integer primary key autoincrement not null,
login varchar (20) not null,
senha varchar (20) not null,
id_ende integer,
telefone varchar (20) not null,
nome text not null,
email text not null,
cpf varchar (11) not null,
nascimento date not null,
FOREIGN KEY (id_ende) REFERENCES endereco(id_ende)
);
create table produto (
id_produto integer primary key autoincrement not null,
nome text not null,
descricao varchar (100),
estoque integer,
data_fab date not null,
preco integer not null,
id_user integer,
id_categoria integer,
FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria),
FOREIGN KEY (id_user) REFERENCES usuario(id_user)
);
create table pedido(
id_pedido integer primary key autoincrement not null,
id_user integer,
data_compra date,
total_compra integer,
FOREIGN KEY (id_user) REFERENCES usuario(id_user)
);
create table carrinho(
id_car integer primary key autoincrement not null,
quantidade integer,
id_produto integer,
id_pedido integer,
FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);