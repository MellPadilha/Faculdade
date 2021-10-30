drop database if exists LeVinDuBebun;
create database LeVinDuBebun;
use LeVinDuBebun;

create table regiao (
	id_regiao smallint primary key not null,
	nome_regiao varchar(60) not null,
    descricao_regiao varchar(500)
);

create table vinicolas (
	id_vinicola smallint primary key not null,
    nome_vinicola varchar(60) not null,
    descricao_vinicola varchar(500),
    telefone bigint not null,
    email varchar(50),
    id_regiao smallint,
    foreign key (id_regiao) references regiao(id_regiao)
);

create table clientes (
    id_cliente smallint PRIMARY KEY NOT NULL,
    nome_cliente VARCHAR(255) NOT NULL,
    cpf bigint NOT NULL,
    telefone bigint NOT NULL,
    cep int NOT NULL,
    numero SMALLINT NOT NULL,          
    complemento VARCHAR(50)
);
   
create table precos (	
	id_preco mediumint primary key not null,
	preco decimal(8,2)
);

create table vinhos (
	id_vinhos mediumint primary key not null,
    nome_vinho varchar(30) not null,
    tipo varchar(30) not null,
    ano year not null,
    descricao_vinho varchar(500),
    id_vinicola smallint not null,
    id_preco mediumint not null,
    foreign key(id_vinicola) references vinicolas(id_vinicola),
    foreign key(id_preco) references precos(id_preco)
);

create table pedido (
	id_pedido mediumint PRIMARY KEY NOT NULL,
    quantidade TINYINT NOT NULL,
	id_cliente smallint,
    id_vinhos mediumint,
    foreign key (id_cliente) references clientes (id_cliente),
	FOREIGN KEY(id_vinhos) REFERENCES vinhos(id_vinhos)
    );

-- DADOS

insert into regiao values (1 , "Mato Grosso", 
	"Um grande estado no centro-oeste brasileiro, coberto na maioria pela floresta tropical amazónica");
insert into regiao values (2 , "Rio Grande do Sul",
	"Estado mais a sul do Brasil e faz fronteira com a Argentina e o Uruguai");
insert into regiao values (3 , "Tocantins", 
	"Tocantins é um estado no centro do Brasil,caracteriza-se pelo cerrado,rios vastos e plantações de soja");
insert into regiao values (4 , "Acre", 
	"É conhecido pela quantidade de árvores-da-borracha e castanhas-do-brasil.");
insert into regiao values (5 , "Paraná", 
	"Possue Cataratas do Iguaçu, com centenas de cascatas que se estendem ao longo da fronteira com a Argentina");


insert into vinicolas values (1, "Zuccardi Valle de Uco", 
	"Vinhos que expressam a identidade de cada terroir",
    6553215862, "zuccardi.contato@outlook.com", 1);
insert into vinicolas values (2, "Montes", 
	"Em 1987 que nossos dois sócios, realizaram seus sonhos de produzir vinhos de qualidade superior",
    5158944702, "montes.contato@outlook.com", 2);
insert into vinicolas values (3, "Marqués de Riscal", 
	"Uma empresa inovadora, pioneira e uma referência no setor vinícola em contínua transformação",
    6389645239, "riscal.contato@outlook.com", 3 );
insert into vinicolas values (4, "Quinta do Crasto",
	"400 anos de sabor e inovação",
    6883750248, "quintadocrasto.contato@outlook.com", 4);
insert into vinicolas values (5, "Ceretto", 
	"Os melhores sabores provem da terra certa",
    4425770089, "Caretto.contato@outlook.com", 5);


insert into clientes values(1, "João Mauricio",44584389075,6598437-7890,
 80060-070, 15, "Ap. 02");
insert into clientes values(2, "Marcia",83489014780,6398047-8703,
 10050-090, 201, "Ap. 501");
insert into clientes values(3, "Marcelo Carlos",590720008-65,2198014-6017,
 80800-807, 80, "Ap. 801");
insert into clientes values(4, "Bruna Maria",89012380771,6091234-0789,
 90010020, 163, "Ap. 602");
insert into clientes values(5, "Melissa Malagueta",50250480750,6598007-8090,
 80800060, 800, "Ap. 502");

insert into precos values (1 , 2000.90);
insert into precos values (2 , 100.50);
insert into precos values (3 , 3800.00);
insert into precos values (4 , 5000.00);
insert into precos values (5 , 9465.67);
insert into precos values (6 , 4098.32);
insert into precos values (7 , 599.99);

insert into vinhos values (1 ,"Cabernet Sauvignon", "Rosés", 2015,
    "Vinho amadeirado: o sabor da madeira domina os demais ", 1, 1 );
insert into vinhos values (2 ,"Cabernet Franc", "Rosés", 2006,
    "Vinho aromático: muitos aromas perfumados e frutados que aparecem logo na taça"
    , 2, 2);
insert into vinhos values (3 ,"Tannat", "Tinto", 1986,
    "Vinho doce: teor elevado de açúcar residual. A doçura é percebida na ponta da língua"
    , 3, 3);
insert into vinhos values (4 ,"Merlot", "Tinto", 1999, 
    "Vinho equilibrado: acidez, álcool, tanino e açúcar estão em harmonia "
    , 4, 4);
insert into vinhos values (5 ,"Pinot Noir", "Suave", 2005,
    "Vinho frutado: sabores de frutas estão mais pronunciados "
    ,5, 5);
insert into vinhos values (6 ,"Gem frances", "Suave", 2005,
    "Vinho frutado: sabores de frutas estão mais pronunciados "
    , 5, 6);
insert into vinhos values (7 ,"Casilleiro", "Suave", 2005,
    "Vinho frutado: sabores de frutas estão mais pronunciados "
    , 5, 7);

insert into pedido values(1, 2, 1, 1);
insert into pedido values(2, 1, 2, 2);
insert into pedido values(3, 1, 3, 3);
insert into pedido values(4, 1, 4, 4);
insert into pedido values(5, 3, 5, 5);

select * from regiao;
select * from vinicolas;
select * from precos;
select * from vinhos;
select * from pedido;

-- 5a. Listar o nome dos vinhos com o nome da região e da vinicola  
SELECT nome_vinho, nome_vinicola, nome_regiao
FROM vinhos VINHOS, vinicolas VINICOLAS, regiao REGIAO
WHERE  VINHOS.id_vinicola = VINICOLAS.id_vinicola AND VINICOLAS.id_regiao = REGIAO.id_regiao;


-- 5b. Listar média de preços por Região                              
SELECT AVG (preco), nome_vinicola, nome_regiao
FROM vinhos VINHOS, vinicolas VINICOLAS, regiao REGIAO
WHERE  VINHOS.id_vinicola = VINICOLAS.id_vinicola AND VINICOLAS.id_regiao = REGIAO.id_regiao
GROUP BY nome_vinicola, nome_regiao;


-- 5c. Listar valor gasto por cliente
SELECT c.nome_cliente,sum(pp.preco) as valor_total from pedido as p
left join clientes as c 
on c.id_cliente  = p.id_cliente
left join vinhos as v
on v.id_vinhos= p.id_vinhos
left join precos as pp
on v.id_preco = pp.id_preco
group by c.nome_cliente;

-- drop user client@"%";
create user client@"%" identified by "12345";
grant select on vinhos to client@"%";
grant select,update on clientes to client@"%";
