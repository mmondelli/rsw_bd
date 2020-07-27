insert into categoria (nome, descricao)
values ('Decoracao','Produtos para a decoracao do ambiente'),
       ('Informatica', 'Produtos de informatica'),
       ('Moveis', 'Moveis em geral'),
       ('Eletrodomesticos', 'Eletrodomesticos em geral'),
       ('Telefonia', 'Aparelhos celulares e fixos')
       
INSERT INTO cliente(nome, user_nome, email, cpf, data_nascimento, cep, rua, numero, complemento, cidade, bairro, uf) VALUES
('Umbelina Neves', 'Abelinha', 'umbelina_neves@usa.net', 19283746551, '01/04/1992', 21852222, 'Travessa Niteroi', 20, 'nao tem', 'Rio de Janeiro', 'Bangu', 'RJ');
INSERT INTO cliente(nome, user_nome, email, cpf, data_nascimento, cep, rua, numero, complemento, cidade, bairro, uf) VALUES
('Ricardo Garcés', 'Riquinho', 'ricardo_garces@discovery.channel.com', 85637507912, '09/12/1888', 24752510, 'Alameda Niteroi', 110, 'Bloco A', 'Sao Goncalo', 'Rio do Ouro', 'RJ');
INSERT INTO cliente(nome, user_nome, email, cpf, data_nascimento, cep, rua, numero, complemento, cidade, bairro, uf) VALUES
('Zenaide Peçanha','Ze.Marimbondo','zenaide_pecanha@vaildochaves.com.mx', 52479784588, '21/03/1972', 09151000, 'Estrada Campo Grande', 0, 'nao tem', 'Santo Andre', 'Regiao de Campo Grande', 'SP'),
('Sabrina SantAnna','SabSan','sabrina_santanna@vaildochaves.com.mx', 65748392545, '15/11/2000', 44002224, 'Praca Bernadino Bahia', 70, 'nao tem', 'Feira de Santana', 'Centro', 'BA'),
('Ítalo Caires', 'Italico', 'italo_caires@linux.com', 34365978560, '05/07/1964', 35502751, 'Rua Antonio Lopes', 100, 'Bloco H', 'Divinopolis', 'Nova Suica', 'MG');     

INSERT into funcionario (nome, cpf)
values ('Arthur', 13542713220),
	   ('Jessica', 54836597422),
	   ('Douglas', 78965432191),
	   ('João', 15975365480),
	   ('Andre', 14785236932)
	   
insert into pedido (data_realizada, cod_cliente)
values ('12/05/2018', 2), ('15/10/2018', 3), ('30/10/2018', 4), ('25/08/2018', 5), ('12/03/2018', 1)


INSERT INTO produto (nome, descricao, data_fabricacao, valor_unitario, quant_estoque, cod_categoria, cod_funcionario) VALUES
('Samsung Galaxy S20+', '128GB Cosmic Black 8GB RAM, Tela 6,7" Cam Quadrupla com Selfie', '23/01/2019', 5099.99, 65, 5, 3);
INSERT INTO produto(nome, descricao, data_fabricacao, valor_unitario, quant_estoque, cod_categoria, cod_funcionario) VALUES
('Azus Zenfone 6', '128GB, 48MP, Tela 6.4, Preto', '06/03/2020', 4821.70, 20, 5, 2),
('Lavadoura de Roupas Brastemp', 'BWK12AB, 12KG, cesto inox com 12 programas de lavagem', '31/05/2019', 1679.00, 10, 4, 4),
('Tapete Sanitizante', 'Preto 060x040 Kapazi', '04/09/2018', 54.00, 100, 1, 1),
('Computador ALL in ONE DELL', 'Tela 21.5" FULL HD, Intel Dual Core 4GB RAM e 500GB HD', '20/06/2020', 2289.98, 30, 2, 2),
('Guarda roupa casal branco', 'Espelho, 3 portas e 2 gavetas Istambul Espresso', '29/10/2018', 529.90, 3, 3, 1);

INSERT into carrinho (quant_item, cod_pedido, cod_produto)
values (2, 3, 3), (1, 4, 2), (3, 4, 1), (1, 1, 4), (4, 5, 5), (4, 2, 1)

update pedido  set data_realizada = '31/10/2018' where data_realizada = '30/10/2018'

DELETE from cliente where complemento = 'nao tem'

INSERT INTO cliente(nome, user_nome, email, cpf, data_nascimento, cep, rua, numero, complemento, cidade, bairro, uf) VALUES
('Umbelina Neves', 'Abelinha', 'umbelina_neves@usa.net', 19283746551, '01/04/1992', 21852222, 'Travessa Niteroi', 20, ' ', 'Rio de Janeiro', 'Bangu', 'RJ'),
('Zenaide Peçanha','Ze.Marimbondo','zenaide_pecanha@vaildochaves.com.mx', 52479784588, '21/03/1972', 09151000, 'Estrada Campo Grande', 0, ' ', 'Santo Andre', 'Regiao de Campo Grande', 'SP'),
('Sabrina SantAnna','SabSan','sabrina_santanna@vaildochaves.com.mx', 65748392545, '15/11/2000', 44002224, 'Praca Bernadino Bahia', 70, ' ', 'Feira de Santana', 'Centro', 'BA')
	   
delete from carrinho where cod_carrinho = 4