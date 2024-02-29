-- insert
use projetoOficina;


-- TABELA CLIENTE (amarela no diagrama)
/*tabela PAI. o idCliente está com auto_incremente, portanto não o citamos entre os ( ), pois o próprio SGBD definirá os números*/
insert into tabela_clientes (Pnome, Lnome, Contato) values
		('Alisson', 'Torres', 11912345678),
        ('Bianca', 'Rosa', 11937263526),
        ('Cesar', 'Andrade', 11983645263),
        ('Dandara', 'Ramos', 11946274634),
        ('Eduardo', 'Costa', 11936474737),
        ('Fernanda', 'Menezes', 11954725342),
        ('Gabriel', 'Vasconcelos', 11943235274),
        ('Helena', 'Holanda', 11936253624),
        ('Iago', 'Damasco', 11963524193),
        ('Júlia', 'Bandeira', 11934264868),
        ('Kaun','Cruz', 11925364243);

select * from tabela_clientes;


-- TABELA MECÂNICOS (amarela no diagrama)
/*tabela PAI. o idMecanicos está com auto_incremente, portanto não o citamos entre os ( ), pois o próprio SGBD definirá os números*/
insert into tabela_mecanicos (Pname, Lname, endereco, telefone, especialidade) values
		('Leticia', 'Diniz', 'Rua das Margaridas 70, Centro - São Paulo', 11953625463, 'Geral'),
        ('Marcelo', 'Neves', 'Rua Treze de Maio 200, República - São Paulo', 11942586546, 'Suspensão e direção'),
        ('Naiara', 'Trindade', 'Rua José Benedito Camargo 68, Jardim Amélia - São Paulo', 11953896857, 'Sistema elétrico e eletrônico'),
        ('Otávio', 'Odírio', 'Rua Breno de Souza 19, Santana - Santo André', 11953728472, 'Ar-condicionado automotivo'),
        ('Paula', 'Gurgel', 'Rua das Esperança 09, Centro - Santo André', 11974635442, 'Motor e transmissão'),
        ('Quirino', 'Fernandes', 'Rua Oitenta e Oito 376, Asa Sul - São Paulo', 11964836242, 'Geral'),
        ('Rita', 'Mendes', 'Rua da Maça 43, Jardim Treze - São Paulo', 1198472837, 'Sistema elétrico e eletrônico'),
        ('Samuel', 'Espides', 'Travessa da Batata 01 Cereja - Barueri', 11984625164, 'Ar-condicionado automotivo'),
        ('Tamires', 'Diniz', 'Rua Branca 67, Centro - Osasco', 11962439583, 'Motor e transmissão'),
        ('Ulisses', 'Oliveria', 'Travessa da Terça 99, Amizade - Barueri', 11945263519, 'Suspensão e direção'),
        ('Eduardo', 'Costa', 'Rua Bizantino 03, Jardim Kennedy - São Paulo', 11936474737, 'Sistema elétrico e eletrônico'),
        ('Julia', 'Bandeira', 'Rua Tatu 88, Serenata - Barueri', 11934264868, 'Ar-condicionado automotivo');

select * from tabela_mecanicos;


-- TABELA ORDEM (amarela no diagrama)
/*tabela PAI. o idOrdem está com auto_incremente, portanto não o citamos entre os ( ), pois o próprio SGBD definirá os números*/
insert into tabela_ordem (tipoServico, valor, autorizado, dataEmissao, dataEntrega, statusOrdem) values
		('Concerto', 1245.98, true, '2024-02-01', null, 'Aguardando peça'),
        ('Revisão', 762.03, false, '2024-02-19', null, null),
        ('Concerto', 379.23, true, '2024-12-01', '2024-02-19', 'Finalizado'),
        ('Concerto', 7077.87, true, '2024-09-01', null, 'Em concerto'),
        ('Concerto', 758.00, false, '2024-09-02', null, null),
        ('Revisão', 135.98, false, null, null, null),
        ('Revisão', 647.24, true, '2024-02-18', '2024-02-20', 'Finalizado'),
        ('Concerto', 1245.98, true, '2024-08-01', null, 'Finalizado'),
        ('Concerto', 8675.86, true, '2024-01-25', null, 'Em concerto'),
        ('Concerto', 7647.07, true, '2024-07-01', null, 'Em concerto');

select * from tabela_ordem;


-- TABELA VEÍCULOS (vermelha no diagrama)
/*tabela FILHO. aqui precisamos colocar entre ( ) os números dos IDs gerados dentro das duas tabelas pais: clientes e ordem*/
/*OBS: idVcliente, idVordem são duas chaves estrangeiras que herdam valores das chaves primárias das tabelas pais*/
insert into tabela_veiculos (idVcliente, idVordem, veiculo) values
		(1, 5, 'Fox'),
        (2, 2, 'HB20'),
        (3, 7, 'Gol'),
        (4, 1, 'Fit'),
        (1, 9, 'Fit'),
        (5, 3, 'Jetta'),
        (6, 10, 'S10'),
        (7, 4, 'Fox'),
        (8, 8, 'Ecosport'),
        (9, 6, 'Uno');


select * from tabela_veiculos;

-- TABELA EQUIPES (vermelha no diagrama)
/*tabela FILHO. aqui precisamos colocar entre ( ) os números dos IDs gerados dentro das duas tabelas pais: mecanicos e ordem*/
/*OBS: idEmecanicos, idEordem são duas chaves estrangeiras que herdam valores das chaves primárias das tabelas pais*/
insert into tabela_equipes (idEmecanicos, idEordem, equipe) values
		(1, 4, 'Alfa'),
        (2, 6, 'Beta'),
        (4, 2, 'Delta'),
        (5, 5, 'Gama'),
        (6, 1, 'Gama'),
        (7, 6, 'Gama'),
        (8, 10, 'Beta'),
        (9, 3, 'Alfa'),
        (10, 7, 'Delta'),
        (2, 9, 'Alfa'),
        (7, 8, 'Gama'),
        (10, 10, 'Beta');


select * from tabela_equipes;