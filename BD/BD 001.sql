drop database if exists DogaoDuBao;
create database DogaoDuBao;
use DogaoDuBao;
create table DogaoDuBao.cardapio(
	idSanduiche int,
    NomeSanduiche varchar(50) not null,
    Preco decimal(8,2),
    primary key(idSanduiche) 
);
create table DogaoDuBao.cliente(
	idCliente int,
    Nome varchar(255) not null,
    Telefone varchar(11),
    EnderecoLogradouro varchar(100) not null,
    EnderecoNumero varchar(45) not null,
    EnderoComplemento varchar(45),
    primary key(idCliente)
);
create table DogaoDuBao.entregador (
	idEntregador mediumint not null,
    Nome varchar(150) not null,
    Celular varchar(11) not null,
    primary key(idEntregador)
);
create table DogaoDuBao.pedido (
	idPedido int not null,
    DataEmissao datetime,
    idCliente int,
    primary key (idPedido),
    foreign key (idCliente) references DogaoDuBao.cliente(idCliente),
    idStatus Tinyint
);
create table DogaoDuBao.status(
idStatus tinyint,
emPreparacao varchar(3),
emEntrega varchar(3),
Entregue varchar(3),
primary key (idStatus)
);
