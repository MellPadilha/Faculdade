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


insert into vinhos values (1 ,"Cabernet Sauvignon", "Rosés", 2015,
    "Vinho amadeirado: o sabor da madeira domina os demais ", 1 );
insert into vinhos values (2 ,"Cabernet Franc", "Rosés", 2006,
    "Vinho aromático: muitos aromas perfumados e frutados que aparecem logo na taça"
    , 2);
insert into vinhos values (3 ,"Tannat", "Tinto", 1986,
    "Vinho doce: teor elevado de açúcar residual. A doçura é percebida na ponta da língua"
    , 3);
insert into vinhos values (4 ,"Merlot", "Tinto", 1999, 
    "Vinho equilibrado: acidez, álcool, tanino e açúcar estão em harmonia "
    , 4);
insert into vinhos values (5 ,"Pinot Noir", "Suave", 2005,
    "Vinho frutado: sabores de frutas estão mais pronunciados "
    ,5);
insert into vinhos values (6 ,"Pinot Noir", "Suave", 2005,
    "Vinho frutado: sabores de frutas estão mais pronunciados "
    , 6);
    insert into vinhos values (7 ,"Pinot Noir", "Suave", 2005,
    "Vinho frutado: sabores de frutas estão mais pronunciados "
    , 7);

insert into precos values (1 ,1, 2000.90);
insert into precos values (2 , 2,  100.50);
insert into precos values (3 , 3, 3800.00);
insert into precos values (4 , 4, 5000.00);
insert into precos values (5 , 5, 9465.67);
insert into precos values (6 , 6, 4098.32);
insert into precos values (7 , 7, 599.99);


insert into cliente values(1, "João Mauricio",44584389075,6598437-7890,
 80060-070, 15, "Ap. 02");
insert into cliente values(2, "Marcia",83489014780,6398047-8703,
 10050-090, 201, "Ap. 501");
insert into cliente values(3, "Marcelo Carlos",590720008-65,2198014-6017,
 80800-807, 80, "Ap. 801");
insert into cliente values(4, "Bruna Maria",89012380771,6091234-0789,
 90010020, 163, "Ap. 602");
insert into cliente values(5, "Melissa Malagueta",50250480750,6598007-8090,
 80800060, 800, "Ap. 502");

insert into pedido values(1, 2, 1);
insert into pedido values(2, 1, 2);
insert into pedido values(3, 1, 3);
insert into pedido values(4, 1, 4);
insert into pedido values(5, 3, 5);

select * from regiao;
select * from vinicola;
select * from vinhos;
select * from cliente;
select * from pedido;