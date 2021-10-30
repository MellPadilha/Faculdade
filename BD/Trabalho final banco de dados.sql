CREATE DATABASE `Lanchonete`;
USE `Lanchonete` ;

CREATE TABLE IF NOT EXISTS `Lanchonete`.`Sanduiche` (
  `codSanduiche` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `valor` FLOAT NULL,
  PRIMARY KEY (`codSanduiche`));


CREATE TABLE IF NOT EXISTS `Lanchonete`.`Cliente` (
  `codCliente` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(20) NOT NULL,
  `endereco` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`codCliente`));


CREATE TABLE IF NOT EXISTS `Lanchonete`.`Entregador` (
  `codEntregador` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`codEntregador`));


CREATE TABLE IF NOT EXISTS `Lanchonete`.`Pedido` (
  `codPedido` INT NOT NULL,
  `status` INT NOT NULL DEFAULT 0,
  `dataEmissao` TIMESTAMP NULL,
  `Cliente_codCliente` INT NOT NULL,
  `Entregador_codEntregador` INT NOT NULL,
  PRIMARY KEY (`codPedido`),
  FOREIGN KEY (`Cliente_codCliente`)
    REFERENCES `Lanchonete`.`Cliente` (`codCliente`),
  FOREIGN KEY (`Entregador_codEntregador`)
    REFERENCES `Lanchonete`.`Entregador` (`codEntregador`));


CREATE TABLE IF NOT EXISTS `Lanchonete`.`Pedido_Sanduiche` (
  `Pedido_codPedido` INT NOT NULL,
  `Sanduiche_codSanduiche` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`Pedido_codPedido`, `Sanduiche_codSanduiche`),
  FOREIGN KEY (`Pedido_codPedido`)
    REFERENCES `Lanchonete`.`Pedido` (`codPedido`),
  FOREIGN KEY (`Sanduiche_codSanduiche`)
    REFERENCES `Lanchonete`.`Sanduiche` (`codSanduiche`)
);
-- E insira alguns dados para realizar as consultas, como abaixo:
-- Inserir os dados:
INSERT INTO `Lanchonete`.`Cliente` (`codCliente`, `nome`, `telefone`, `endereco`) VALUES ('1', 'João', '41414141', 'R. da Paz 1325');
INSERT INTO `Lanchonete`.`Cliente` (`codCliente`, `nome`, `telefone`, `endereco`) VALUES ('2', 'Vinicius', '21333333', 'R dos bobos 0');
INSERT INTO `Lanchonete`.`Cliente` (`codCliente`, `nome`, `telefone`, `endereco`) VALUES ('3', 'John Snow', '55666666', 'The Wall');
INSERT INTO `Lanchonete`.`Cliente` (`codCliente`, `nome`, `telefone`, `endereco`) VALUES ('4', 'John Wick', '44444444', 'Continental');
INSERT INTO `Lanchonete`.`Cliente` (`codCliente`, `nome`, `telefone`, `endereco`) VALUES ('5', 'Sponge Bob', '3133333333', 'Fenda do Biquíni ');

INSERT INTO `Lanchonete`.`Entregador` (`codEntregador`, `nome`, `telefone`) VALUES ('1', 'Frank Martin', '4199888888');
INSERT INTO `Lanchonete`.`Entregador` (`codEntregador`, `nome`, `telefone`) VALUES ('2', 'Hamilton', '5199889988');
INSERT INTO `Lanchonete`.`Entregador` (`codEntregador`, `nome`, `telefone`) VALUES ('3', 'Senna', '1122332233');
INSERT INTO `Lanchonete`.`Entregador` (`codEntregador`, `nome`, `telefone`) VALUES ('4', 'Massa', '4199889988');
INSERT INTO `Lanchonete`.`Entregador` (`codEntregador`, `nome`, `telefone`) VALUES ('5', 'Piquet', '2144556677');

INSERT INTO `Lanchonete`.`Sanduiche` (`codSanduiche`, `nome`, `valor`) VALUES ('1', 'BigBão', '25');
INSERT INTO `Lanchonete`.`Sanduiche` (`codSanduiche`, `nome`, `valor`) VALUES ('2', 'HotDog', '10');
INSERT INTO `Lanchonete`.`Sanduiche` (`codSanduiche`, `nome`, `valor`) VALUES ('3', 'XTudo', '30');
INSERT INTO `Lanchonete`.`Sanduiche` (`codSanduiche`, `nome`, `valor`) VALUES ('4', 'XBacon', '20');
INSERT INTO `Lanchonete`.`Sanduiche` (`codSanduiche`, `nome`, `valor`) VALUES ('5', 'XBão', '15');

INSERT INTO `Lanchonete`.`Pedido` (`codPedido`, `status`, `dataEmissao`, `Cliente_codCliente`, `Entregador_codEntregador`) VALUES ('1', '2', '2021-06-09 12:00:00', '1', '1');
INSERT INTO `Lanchonete`.`Pedido` (`codPedido`, `status`, `dataEmissao`, `Cliente_codCliente`, `Entregador_codEntregador`) VALUES ('2', '2', '2021-06-10 20:20:00', '2', '3');
INSERT INTO `Lanchonete`.`Pedido` (`codPedido`, `status`, `dataEmissao`, `Cliente_codCliente`, `Entregador_codEntregador`) VALUES ('3', '1', '2021-06-11 21:02:00', '4', '5');
INSERT INTO `Lanchonete`.`Pedido` (`codPedido`, `status`, `dataEmissao`, `Cliente_codCliente`, `Entregador_codEntregador`) VALUES ('4', '1', '2021-06-10 20:23:00', '1', '2');
INSERT INTO `Lanchonete`.`Pedido` (`codPedido`, `status`, `dataEmissao`, `Cliente_codCliente`, `Entregador_codEntregador`) VALUES ('5', '0', '2021-06-10 23:20:00', '2', '3');

INSERT INTO `Lanchonete`.`Pedido_Sanduiche` (`Pedido_codPedido`, `Sanduiche_codSanduiche`, `quantidade`) VALUES ('1', '1', '1');
INSERT INTO `Lanchonete`.`Pedido_Sanduiche` (`Pedido_codPedido`, `Sanduiche_codSanduiche`, `quantidade`) VALUES ('1', '2', '3');
INSERT INTO `Lanchonete`.`Pedido_Sanduiche` (`Pedido_codPedido`, `Sanduiche_codSanduiche`, `quantidade`) VALUES ('2', '3', '2');
INSERT INTO `Lanchonete`.`Pedido_Sanduiche` (`Pedido_codPedido`, `Sanduiche_codSanduiche`, `quantidade`) VALUES ('3', '3', '4');
INSERT INTO `Lanchonete`.`Pedido_Sanduiche` (`Pedido_codPedido`, `Sanduiche_codSanduiche`, `quantidade`) VALUES ('3', '4', '1');
INSERT INTO `Lanchonete`.`Pedido_Sanduiche` (`Pedido_codPedido`, `Sanduiche_codSanduiche`, `quantidade`) VALUES ('4', '5', '2');
INSERT INTO `Lanchonete`.`Pedido_Sanduiche` (`Pedido_codPedido`, `Sanduiche_codSanduiche`, `quantidade`) VALUES ('4', '1', '2');
INSERT INTO `Lanchonete`.`Pedido_Sanduiche` (`Pedido_codPedido`, `Sanduiche_codSanduiche`, `quantidade`) VALUES ('4', '2', '2');
INSERT INTO `Lanchonete`.`Pedido_Sanduiche` (`Pedido_codPedido`, `Sanduiche_codSanduiche`, `quantidade`) VALUES ('5', '3','1');

