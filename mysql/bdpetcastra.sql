-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Tempo de geração: 09-Set-2022 às 12:05
-- Versão do servidor: 8.0.30
-- versão do PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `pmfr_castracao`
--
CREATE DATABASE  IF NOT EXISTS `pmfr_castracao` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `pmfr_castracao`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 191.240.150.114    Database: pmfr_castracao
-- ------------------------------------------------------
-- Server version	5.7.33-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal` (
  `idanimal` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `idraca` int(11) NOT NULL,
  `aninome` varchar(50) NOT NULL,
  `especie` tinyint(4) NOT NULL COMMENT '0 para Canina e 1 para Felina',
  `sexo` tinyint(4) NOT NULL COMMENT '0 para Fêmea; 1 para Macho',
  `cor` varchar(30) NOT NULL,
  `pelagem` tinyint(4) NOT NULL COMMENT '0 pra curta; 1 média; 2 pra alta;',
  `porte` tinyint(4) NOT NULL COMMENT '0 pra pequeno; 1 pra médio; 2 pra grande;',
  `idade` tinyint(4) NOT NULL,
  `comunitario` tinyint(4) NOT NULL COMMENT '0 pra não; 1 pra sim;',
  `foto` varchar(50) DEFAULT NULL,
  `codchip` char(15) DEFAULT NULL,
  PRIMARY KEY (`idanimal`),
  KEY `idusuario` (`idusuario`),
  KEY `idraca` (`idraca`),
  CONSTRAINT `fkidraca` FOREIGN KEY (`idraca`) REFERENCES `raca` (`idraca`),
  CONSTRAINT `fkidusuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `castracao`
--

DROP TABLE IF EXISTS `castracao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `castracao` (
  `idcastracao` int(11) NOT NULL AUTO_INCREMENT,
  `idanimal` int(11) NOT NULL,
  `idclinica` int(11) DEFAULT NULL,
  `horario` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0 - Solicitação em análise; 1 - Solicitação aprovada; 2 - Animal Castrado; 3 - Solicitação Reprovada; 4 - Tutor não compareceu; 5 - Solicitação Cancelada; 6 - Solicitação Reagendada; 7 - Animal foi a óbito',
  `observacao` text,
  `obsclinica` text,
  `msgrecusa` text,
  PRIMARY KEY (`idcastracao`),
  UNIQUE KEY `idanimal_2` (`idanimal`),
  UNIQUE KEY `horario` (`horario`),
  KEY `fkidclinica_castracao` (`idclinica`),
  KEY `idanimal` (`idanimal`,`idclinica`) USING BTREE,
  CONSTRAINT `fkidanimal_castracao` FOREIGN KEY (`idanimal`) REFERENCES `animal` (`idanimal`) ON DELETE CASCADE,
  CONSTRAINT `fkidclinica_castracao` FOREIGN KEY (`idclinica`) REFERENCES `clinica` (`idclinica`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `clinica`
--

DROP TABLE IF EXISTS `clinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinica` (
  `idclinica` int(11) NOT NULL AUTO_INCREMENT,
  `idlogin` int(11) NOT NULL,
  `cnpj` varchar(14) NOT NULL,
  `clitelefone` varchar(11) NOT NULL,
  `vagas` int(11) NOT NULL,
  `clirua` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `clibairro` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `clinumero` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `clicep` varchar(8) NOT NULL,
  `ativo` tinyint(4) NOT NULL COMMENT '0 - Clínica não ativa; 1 - Clínica ativa',
  PRIMARY KEY (`idclinica`),
  UNIQUE KEY `cnpj` (`cnpj`),
  KEY `idlogin` (`idlogin`),
  CONSTRAINT `fkidlogin_clinica` FOREIGN KEY (`idlogin`) REFERENCES `login` (`idlogin`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `idlogin` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(70) NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `senha` varchar(60) NOT NULL,
  `nivelacesso` tinyint(4) NOT NULL COMMENT '0 pra Usuário; 1 pra clínica; 2 pra adm;',
  `codsenha` char(6) DEFAULT NULL,
  PRIMARY KEY (`idlogin`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `raca`
--

DROP TABLE IF EXISTS `raca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raca` (
  `idraca` int(11) NOT NULL AUTO_INCREMENT,
  `raca` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipoespecie` tinyint(4) NOT NULL COMMENT '0 pra cachorro; 1 pra gato; 2 para os dois',
  PRIMARY KEY (`idraca`),
  UNIQUE KEY `Raca` (`raca`)
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `idlogin` int(11) NOT NULL,
  `rg` char(9) NOT NULL,
  `cpf` char(11) NOT NULL,
  `beneficio` tinyint(4) NOT NULL COMMENT '0 - Sem benefício; 1 - Benefício Soical; 2 - Protetor de Animais; 3 - Em análise',
  `telefone` varchar(10) DEFAULT NULL,
  `celular` varchar(11) NOT NULL,
  `whatsapp` tinyint(4) NOT NULL COMMENT '0 - Celular não é whatsapp; 1 - Celular é whatsapp',
  `punicao` tinyint(4) NOT NULL,
  `usurua` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `usubairro` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `usunumero` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `usucep` varchar(8) NOT NULL,
  `nis` char(11) DEFAULT NULL,
  `doccomprovante` varchar(255) DEFAULT NULL,
  `quantcastracoes` tinyint(4) NOT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `nis` (`nis`),
  KEY `idlogin` (`idlogin`),
  CONSTRAINT `fkidlogin_usuario` FOREIGN KEY (`idlogin`) REFERENCES `login` (`idlogin`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,1,'00000000','98765432100',0,'1148001710','1148001709',1,0,'Avenida Liberdade','Centro','250','07850325',NULL,'',0),(2,4,'465707908','46570790854',0,'1148001710','11971824543',0,0,'Avenida São Paulo','Parque Paulista','520','07844200',NULL,'91a2bdd96b561fadb41f0304054a7f32.jpg',-1),(3,5,'405769143','42402196807',0,'1194166661','11941666617',1,0,'Rua Vilage Arco Iris','Chácaras Bom Tempo','200','07810550',NULL,'11d752ced457d716b83bd19a294de820.jpg',-1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `raca`
--

LOCK TABLES `raca` WRITE;
/*!40000 ALTER TABLE `raca` DISABLE KEYS */;
INSERT INTO `raca` VALUES (1,'Pastor Alemão',0),(2,'Buldogue Francês',0),(4,'Siamês',1),(5,'Persa e Himalaia',1),(6,'Sphynx',1),(7,'-- S.R.D - Sem Raça Definida --',2),(8,'Chow-chow',0),(9,'Munchkin',1),(197,'Afegão Hound',0),(198,'Affenpinscher',0),(199,'Airedale Terrier',0),(200,'Akita',0),(201,'American Staffordshire Terrier',0),(202,'Basenji',0),(203,'Basset Hound',0),(204,'Beagle',0),(205,'Beagle Harrier',0),(206,'Bearded Collie',0),(207,'Bedlington Terrier',0),(208,'Bichon Frisé',0),(209,'Bloodhound',0),(210,'Bobtail',0),(211,'Boiadeiro Australiano',0),(212,'Boiadeiro Bernês',0),(213,'Border Collie',0),(214,'Border Terrier',0),(215,'Borzoi',0),(216,'Boston Terrier',0),(217,'Boxer',0),(218,'Buldogue Inglês',0),(219,'Bull Terrier',0),(220,'Bulmastife',0),(221,'Cairn Terrier',0),(222,'Cane Corso',0),(223,'Cão de Água Português',0),(224,'Cão de Crista Chinês',0),(225,'Cavalier King Charles Spaniel',0),(226,'Chesapeake Bay Retriever',0),(227,'Chihuahua',0),(228,'Cocker Spaniel Americano',0),(229,'Cocker Spaniel Inglês',0),(230,'Collie',0),(231,'Coton de Tuléar',0),(232,'Dachshund',0),(233,'Dálmata',0),(234,'Dandie Dinmont Terrier',0),(235,'Dobermann',0),(236,'Dogo Argentino',0),(237,'Dogue Alemão',0),(238,'Fila Brasileiro',0),(239,'Fox Terrier (Pelo Duro e Pelo Liso)',0),(240,'Foxhound Inglês',0),(241,'Galgo Escocês',0),(242,'Galgo Irlandês',0),(243,'Golden Retriever',0),(244,'Grande Boiadeiro Suiço',0),(245,'Greyhound',0),(246,'Grifo da Bélgica',0),(247,'Husky Siberiano',0),(248,'Jack Russell Terrier',0),(249,'King Charles',0),(250,'Komondor',0),(251,'Labradoodle',0),(252,'Labrador Retriever',0),(253,'Lakeland Terrier',0),(254,'Leonberger',0),(255,'Lhasa Apso',0),(256,'Lulu da Pomerânia',0),(257,'Malamute do Alasca',0),(258,'Maltês',0),(259,'Mastife',0),(260,'Mastim Napolitano',0),(261,'Mastim Tibetano',0),(262,'Norfolk Terrier',0),(263,'Norwich Terrier',0),(264,'Papillon',0),(265,'Pastor Australiano',0),(266,'Pinscher Miniatura',0),(267,'Poodle',0),(268,'Pug',0),(269,'Rottweiler',0),(271,'ShihTzu',0),(272,'Silky Terrier',0),(273,'Skye Terrier',0),(274,'Staffordshire Bull Terrier',0),(275,'Terra Nova',0),(276,'Terrier Escocês',0),(277,'Tosa',0),(278,'Weimaraner',0),(279,'Welsh Corgi (Cardigan)',0),(280,'Welsh Corgi (Pembroke)',0),(281,'West Highland White Terrier',0),(282,'Whippet',0),(283,'Xoloitzcuintli',0),(284,'Yorkshire Terrier',0),(285,'Maine Coon',1),(286,'Ragdoll',1),(287,'Ashera',1),(288,'American Shorthair',1),(289,'Exótico',1),(291,'Azul Russo',1),(292,'Angorá Turco',1),(293,'Pelo curto brasileiro',1),(294,'Pelo curto americano',1),(295,'Snowshoe',1);
/*!40000 ALTER TABLE `raca` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'ADMIN TI','kelvin.menegasse@francodarocha.sp.gov.br','$2y$10$8uC6cs4BcsK2r2LX4E06heX2UXeoRD/G/yHcxewfZkBK2TRolIkKi',2,NULL),(2,'ASSOCIAÇÃO DE PROTEÇÃO ANIMAL DE FRANCO DA ROCHA - APA FRANCO','kelvin.silva@francodarocha.sp.gov.br','$2y$10$s/GZAlJ7RRCV4SuMZK.zH.jMncBa8doGqrgegGpKhpxdKiAIq3g82',1,NULL),(3,'CLÍNICA VETERINÁRIA SÃO LÁZARO','centroveterinariolazaro@hotmail.com','$2y$10$adKaV5KEA752q73Blo83je2lLW/SBXXrjNfcYOdp2V5a4/metbQA.',1,NULL),(4,'Kelvin Menegasse',NULL,'$2y$10$PMYpbnyrosqP6nlN1lVWuOH9FWvLgZp5Wuu.q8Yff75E4vjfUpM5a',0,NULL),(5,'Thiago Arcanjo de Oliveira ','thiago.arcanjo@francodarocha.sp.gov.br','$2y$10$fYn1j19URaab2DtankvMaeO5/pVjuV0FBvI5ojLTybjobmnPGkVWi',0,NULL);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `clinica`
--

LOCK TABLES `clinica` WRITE;
/*!40000 ALTER TABLE `clinica` DISABLE KEYS */;
INSERT INTO `clinica` VALUES (9,2,'14218824000147','1144436704',7,'Rua Professor Carvalho Pinto','Companhia Fazenda Belém','247','07803100',1),(10,3,'24873307000165','1148197114',10,'Avenida São Paulo','Parque Paulista','1250 ','07844200',1);
/*!40000 ALTER TABLE `clinica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `animal`
--

LOCK TABLES `animal` WRITE;
/*!40000 ALTER TABLE `animal` DISABLE KEYS */;
INSERT INTO `animal` VALUES (1,2,243,'freddie',0,1,'branco',2,2,5,0,'e1f678f5399569b3c8b7f65f77b62c6a.jpg',''),(2,3,7,'Tranquerinha',0,0,'Preto e Branco ',0,0,0,0,'38c12c86c1710214c16e1d57a4d9784f.jpg',NULL),(3,3,4,'Gita',1,0,'branco',0,1,1,0,'edd07a14730dd67ccf83532c843dbf1e.jpg',NULL);
/*!40000 ALTER TABLE `animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `castracao`
--

LOCK TABLES `castracao` WRITE;
/*!40000 ALTER TABLE `castracao` DISABLE KEYS */;
INSERT INTO `castracao` VALUES (1,1,9,'2022-09-09 12:00:00',2,'','',NULL),(2,2,9,NULL,1,'Cachorra muito nova a pobrezinha foi abandona.',NULL,NULL),(3,3,9,NULL,1,'',NULL,NULL);
/*!40000 ALTER TABLE `castracao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-09 10:33:57
