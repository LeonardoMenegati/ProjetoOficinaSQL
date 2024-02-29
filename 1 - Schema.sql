-- Criação de Schema Projeto Oficina
-- drop database projetoOficina;

create database projetoOficina;
use projetoOficina;

create table tabela_clientes(
		idCliente int primary key auto_increment,
        Pnome varchar(20),
        Lnome varchar(20),
        Contato char(11)
);

create table tabela_mecanicos(
		idMecanicos int primary key auto_increment,
        Pname varchar(20),
        Lname varchar(20),
        endereco varchar(100),
        telefone char(11),
        especialidade varchar(100)
);

create table tabela_ordem(
		idOrdem int primary key auto_increment,
        tipoServico ENUM('Revisão','Concerto') default 'Concerto',
        valor float,
        autorizado bool,
        dataEmissao date,
        dataEntrega date,
        statusOrdem ENUM('Aguardando peça','Em concerto','Finalizado')
);

create table tabela_veiculos(
		idVcliente int,					/*chave estrangeira, herda valores das chaves primárias das tabelas em references*/
        idVordem int,					/*chave estrangeira, herda....*/
        veiculo varchar(20),
        primary key (idVcliente, idVordem),
        constraint fk_clientes_veiculos foreign key (idVcliente) references tabela_clientes (idCliente),
        constraint fk_ordem_veiculos foreign key (idVordem) references tabela_ordem (idOrdem)
);

create table tabela_equipes(
		idEmecanicos int,				/*chave estrangeira, herda....*/
        idEordem int,					/*chave estrangeira, herda....*/
        equipe ENUM('Alfa','Beta','Delta','Gama'),
        primary key (idEmecanicos, idEordem),
        constraint fk_mecanicos_equipes foreign key (idEmecanicos) references tabela_mecanicos (idMecanicos),
        constraint fk_ordem_equipes foreign key (idEordem) references tabela_ordem (idOrdem)
);
