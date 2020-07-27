create table endereco (
    codigo_endereco integer primary key autoincrement,
    estado text not null,
    CEP varchar (8) not null,
    cidade text not null,
    bairro text not null,
    rua text not null,
    numero text not null,
    complemento text
);


create table cliente(
    codigo_cliente integer primary key AUTOINCREMENT,
    nome_completo text not null,
    nome_usuario text not null,
    email text not null,
    senha text not null,
    CPF varchar (11) not null,
    nascimento date not null,
    telefone text not null    
);

create table endereco_cliente(
    fk_endereco integer, 
    fk_cliente integer,
    FOREIGN KEY (fk_endereco) REFERENCES endereco (codigo_endereco),
    FOREIGN KEY (fk_cliente) REFERENCES cliente (codigo_cliente)
);

create table pedido (
    codigo_pedido integer primary key AUTOINCREMENT not null,
    'data' date not null,
    fk_cliente integer,
    valor_total numeric,
    FOREIGN KEY (fk_cliente) REFERENCES cliente (codigo_cliente)    
);

create table pedido_produto(
    itens_pedidos integer not null,
    fk_pedido integer,
    fk_produto integer,
    FOREIGN KEY (fk_pedido) REFERENCES pedido (codigo_pedido),
    FOREIGN KEY (fk_produto) REFERENCES produto (codigo_produto)
);

create table produto(
    codigo_produto integer primary key AUTOINCREMENT not null,
    nome text not null,
    descricao text ,
    quantidade_estoque integer not null,
    data_fabricacao date not null,
    valor_unidade integer,
    fk_categoria integer,
    fk_funcionario integer,
    FOREIGN KEY (fk_categoria) REFERENCES categoria (codigo_categoria),
    FOREIGN KEY (fk_funcionario) REFERENCES funcionario (codigo_funcionario)    
);

create table funcionario(
    codigo_funcionario integer primary key AUTOINCREMENT not null,
    nome text not null,
    CPF varchar (11)    
);

create table categoria(
    codigo_categoria integer primary key AUTOINCREMENT not null,
    nome text not null,
    descricao text
);