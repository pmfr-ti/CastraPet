-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Tempo de geração: 01-Nov-2022 às 12:04
-- Versão do servidor: 8.0.30
-- versão do PHP: 8.0.19
SET
  SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET
  time_zone = "+00:00";

--
-- Banco de dados: `pmfr_castracao`
--

CREATE DATABASE IF NOT EXISTS `pmfr_castracao`;

USE `pmfr_castracao`;

-- --------------------------------------------------------
--
-- Estrutura da tabela `animal`
--
CREATE TABLE `animal` (
  `idanimal` int NOT NULL,
  `idusuario` int NOT NULL,
  `idraca` int NOT NULL,
  `aninome` varchar(50) NOT NULL,
  `especie` tinyint NOT NULL COMMENT '0 para Canina e 1 para Felina',
  `sexo` tinyint NOT NULL COMMENT '0 para Fêmea; 1 para Macho',
  `cor` varchar(30) NOT NULL,
  `pelagem` tinyint NOT NULL COMMENT '0 pra curta; 1 média; 2 pra alta;',
  `porte` tinyint NOT NULL COMMENT '0 pra pequeno; 1 pra médio; 2 pra grande;',
  `idade` tinyint NOT NULL,
  `comunitario` tinyint NOT NULL COMMENT '0 pra não; 1 pra sim;',
  `foto` varchar(50) DEFAULT NULL,
  `codchip` char(15) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- --------------------------------------------------------
--
-- Estrutura da tabela `castracao`
--
CREATE TABLE `castracao` (
  `idcastracao` int NOT NULL,
  `idanimal` int NOT NULL,
  `idclinica` int DEFAULT NULL,
  `horario` datetime DEFAULT NULL,
  `status` tinyint NOT NULL COMMENT '0 - Solicitação em análise; 1 - Solicitação aprovada; 2 - Animal Castrado; 3 - Solicitação Reprovada; 4 - Tutor não compareceu; 5 - Solicitação Cancelada; 6 - Solicitação Reagendada; 7 - Animal foi a óbito',
  `observacao` text,
  `obsclinica` text,
  `msgrecusa` text
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- --------------------------------------------------------
--
-- Estrutura da tabela `clinica`
--
CREATE TABLE `clinica` (
  `idclinica` int NOT NULL,
  `idlogin` int NOT NULL,
  `cnpj` varchar(14) NOT NULL,
  `clitelefone` varchar(11) NOT NULL,
  `vagas` int NOT NULL,
  `clirua` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `clibairro` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `clinumero` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `clicep` varchar(8) NOT NULL,
  `ativo` tinyint NOT NULL COMMENT '0 - Clínica não ativa; 1 - Clínica ativa'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- --------------------------------------------------------
--
-- Estrutura da tabela `login`
--
CREATE TABLE `login` (
  `idlogin` int NOT NULL,
  `nome` varchar(70) NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `senha` varchar(60) NOT NULL,
  `nivelacesso` tinyint NOT NULL COMMENT '0 pra Usuário; 1 pra clínica; 2 pra adm;',
  `codsenha` char(6) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- --------------------------------------------------------
--
-- Estrutura da tabela `raca`
--
CREATE TABLE `raca` (
  `idraca` int NOT NULL,
  `raca` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipoespecie` tinyint NOT NULL COMMENT '0 pra cachorro; 1 pra gato; 2 para os dois'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- --------------------------------------------------------
--
-- Estrutura da tabela `usuario`
--
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL,
  `idlogin` int NOT NULL,
  `rg` char(9) NOT NULL,
  `cpf` char(11) NOT NULL,
  `beneficio` tinyint NOT NULL COMMENT '0 - Sem benefício; 1 - Benefício Soical; 2 - Protetor de Animais; 3 - Em análise',
  `telefone` varchar(10) DEFAULT NULL,
  `celular` varchar(11) NOT NULL,
  `whatsapp` tinyint NOT NULL COMMENT '0 - Celular não é whatsapp; 1 - Celular é whatsapp',
  `punicao` tinyint NOT NULL,
  `usurua` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `usubairro` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `usunumero` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `usucep` varchar(8) NOT NULL,
  `nis` char(11) DEFAULT NULL,
  `doccomprovante` varchar(255) DEFAULT NULL,
  `quantcastracoes` tinyint NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

--
-- Índices para tabelas despejadas
--
--
-- Índices para tabela `animal`
--
ALTER TABLE
  `animal`
ADD
  PRIMARY KEY (`idanimal`),
ADD
  KEY `idusuario` (`idusuario`),
ADD
  KEY `idraca` (`idraca`);

--
-- Índices para tabela `castracao`
--
ALTER TABLE
  `castracao`
ADD
  PRIMARY KEY (`idcastracao`),
ADD
  UNIQUE KEY `idanimal_2` (`idanimal`),
ADD
  UNIQUE KEY `horario` (`horario`),
ADD
  KEY `fkidclinica_castracao` (`idclinica`),
ADD
  KEY `idanimal` (`idanimal`, `idclinica`) USING BTREE;

--
-- Índices para tabela `clinica`
--
ALTER TABLE
  `clinica`
ADD
  PRIMARY KEY (`idclinica`),
ADD
  UNIQUE KEY `cnpj` (`cnpj`),
ADD
  KEY `idlogin` (`idlogin`);

--
-- Índices para tabela `login`
--
ALTER TABLE
  `login`
ADD
  PRIMARY KEY (`idlogin`),
ADD
  UNIQUE KEY `email` (`email`);

--
-- Índices para tabela `raca`
--
ALTER TABLE
  `raca`
ADD
  PRIMARY KEY (`idraca`),
ADD
  UNIQUE KEY `Raca` (`raca`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE
  `usuario`
ADD
  PRIMARY KEY (`idusuario`),
ADD
  UNIQUE KEY `cpf` (`cpf`),
ADD
  UNIQUE KEY `nis` (`nis`),
ADD
  KEY `idlogin` (`idlogin`);

--
-- AUTO_INCREMENT de tabelas despejadas
--
--
-- AUTO_INCREMENT de tabela `animal`
--
ALTER TABLE
  `animal`
MODIFY
  `idanimal` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `castracao`
--
ALTER TABLE
  `castracao`
MODIFY
  `idcastracao` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `clinica`
--
ALTER TABLE
  `clinica`
MODIFY
  `idclinica` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `login`
--
ALTER TABLE
  `login`
MODIFY
  `idlogin` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `raca`
--
ALTER TABLE
  `raca`
MODIFY
  `idraca` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 299;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE
  `usuario`
MODIFY
  `idusuario` int NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--
--
-- Limitadores para a tabela `animal`
--
ALTER TABLE
  `animal`
ADD
  CONSTRAINT `fkidraca` FOREIGN KEY (`idraca`) REFERENCES `raca` (`idraca`),
ADD
  CONSTRAINT `fkidusuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Limitadores para a tabela `castracao`
--
ALTER TABLE
  `castracao`
ADD
  CONSTRAINT `fkidanimal_castracao` FOREIGN KEY (`idanimal`) REFERENCES `animal` (`idanimal`) ON DELETE CASCADE,
ADD
  CONSTRAINT `fkidclinica_castracao` FOREIGN KEY (`idclinica`) REFERENCES `clinica` (`idclinica`);

--
-- Limitadores para a tabela `clinica`
--
ALTER TABLE
  `clinica`
ADD
  CONSTRAINT `fkidlogin_clinica` FOREIGN KEY (`idlogin`) REFERENCES `login` (`idlogin`);

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE
  `usuario`
ADD
  CONSTRAINT `fkidlogin_usuario` FOREIGN KEY (`idlogin`) REFERENCES `login` (`idlogin`);

COMMIT;

START TRANSACTION;

--
-- Dumping data for table `login`
--
INSERT INTO
  `login`
VALUES
  (
    1,
    'ADMIN TI',
    'kelvin.menegasse@francodarocha.sp.gov.br',
    '$2y$10$8uC6cs4BcsK2r2LX4E06heX2UXeoRD/G/yHcxewfZkBK2TRolIkKi',
    2,
    NULL
  ),
  (
    2,
    'CLINICA 1',
    'kelvin.silva@francodarocha.sp.gov.br',
    '$2y$10$s/GZAlJ7RRCV4SuMZK.zH.jMncBa8doGqrgegGpKhpxdKiAIq3g82',
    1,
    NULL
  ),
  (
    3,
    'CLINICA 2',
    'thiago.arcanjo@francodarocha.sp.gov.br',
    '$2y$10$adKaV5KEA752q73Blo83je2lLW/SBXXrjNfcYOdp2V5a4/metbQA.',
    1,
    NULL
  );

--
-- Dumping data for table `clinica`
--
INSERT INTO
  `clinica`
VALUES
  (
    9,
    2,
    '14218824000147',
    '1144436704',
    7,
    'Rua Professor Carvalho Pinto',
    'Companhia Fazenda Belém',
    '247',
    '07803100',
    1
  ),
  (
    10,
    3,
    '24873307000165',
    '1148197114',
    10,
    'Avenida São Paulo',
    'Parque Paulista',
    '1250 ',
    '07844200',
    1
  );

INSERT INTO
  `usuario`
VALUES
  (
    1,
    1,
    '00000000',
    '98765432100',
    0,
    '1148001710',
    '1148001709',
    1,
    0,
    'Avenida Liberdade',
    'Centro',
    '250',
    '07850325',
    NULL,
    '',
    0
  );
  --
  -- Dumping data for table `raca`
  --
INSERT INTO
  `raca`
VALUES
  (1, 'Pastor Alemão', 0),
  (2, 'Buldogue Francês', 0),
  (4, 'Siamês', 1),
  (5, 'Persa e Himalaia', 1),
  (6, 'Sphynx', 1),
  (7, '-- S.R.D - Sem Raça Definida --', 2),
  (8, 'Chow-chow', 0),
  (9, 'Munchkin', 1),
  (197, 'Afegão Hound', 0),
  (198, 'Affenpinscher', 0),
  (199, 'Airedale Terrier', 0),
  (200, 'Akita', 0),
  (201, 'American Staffordshire Terrier', 0),
  (202, 'Basenji', 0),
  (203, 'Basset Hound', 0),
  (204, 'Beagle', 0),
  (205, 'Beagle Harrier', 0),
  (206, 'Bearded Collie', 0),
  (207, 'Bedlington Terrier', 0),
  (208, 'Bichon Frisé', 0),
  (209, 'Bloodhound', 0),
  (210, 'Bobtail', 0),
  (211, 'Boiadeiro Australiano', 0),
  (212, 'Boiadeiro Bernês', 0),
  (213, 'Border Collie', 0),
  (214, 'Border Terrier', 0),
  (215, 'Borzoi', 0),
  (216, 'Boston Terrier', 0),
  (217, 'Boxer', 0),
  (218, 'Buldogue Inglês', 0),
  (219, 'Bull Terrier', 0),
  (220, 'Bulmastife', 0),
  (221, 'Cairn Terrier', 0),
  (222, 'Cane Corso', 0),
  (223, 'Cão de Água Português', 0),
  (224, 'Cão de Crista Chinês', 0),
  (225, 'Cavalier King Charles Spaniel', 0),
  (226, 'Chesapeake Bay Retriever', 0),
  (227, 'Chihuahua', 0),
  (228, 'Cocker Spaniel Americano', 0),
  (229, 'Cocker Spaniel Inglês', 0),
  (230, 'Collie', 0),
  (231, 'Coton de Tuléar', 0),
  (232, 'Dachshund', 0),
  (233, 'Dálmata', 0),
  (234, 'Dandie Dinmont Terrier', 0),
  (235, 'Dobermann', 0),
  (236, 'Dogo Argentino', 0),
  (237, 'Dogue Alemão', 0),
  (238, 'Fila Brasileiro', 0),
  (239, 'Fox Terrier (Pelo Duro e Pelo Liso)', 0),
  (240, 'Foxhound Inglês', 0),
  (241, 'Galgo Escocês', 0),
  (242, 'Galgo Irlandês', 0),
  (243, 'Golden Retriever', 0),
  (244, 'Grande Boiadeiro Suiço', 0),
  (245, 'Greyhound', 0),
  (246, 'Grifo da Bélgica', 0),
  (247, 'Husky Siberiano', 0),
  (248, 'Jack Russell Terrier', 0),
  (249, 'King Charles', 0),
  (250, 'Komondor', 0),
  (251, 'Labradoodle', 0),
  (252, 'Labrador Retriever', 0),
  (253, 'Lakeland Terrier', 0),
  (254, 'Leonberger', 0),
  (255, 'Lhasa Apso', 0),
  (256, 'Lulu da Pomerânia', 0),
  (257, 'Malamute do Alasca', 0),
  (258, 'Maltês', 0),
  (259, 'Mastife', 0),
  (260, 'Mastim Napolitano', 0),
  (261, 'Mastim Tibetano', 0),
  (262, 'Norfolk Terrier', 0),
  (263, 'Norwich Terrier', 0),
  (264, 'Papillon', 0),
  (265, 'Pastor Australiano', 0),
  (266, 'Pinscher Miniatura', 0),
  (267, 'Poodle', 0),
  (268, 'Pug', 0),
  (269, 'Rottweiler', 0),
  (271, 'ShihTzu', 0),
  (272, 'Silky Terrier', 0),
  (273, 'Skye Terrier', 0),
  (274, 'Staffordshire Bull Terrier', 0),
  (275, 'Terra Nova', 0),
  (276, 'Terrier Escocês', 0),
  (277, 'Tosa', 0),
  (278, 'Weimaraner', 0),
  (279, 'Welsh Corgi (Cardigan)', 0),
  (280, 'Welsh Corgi (Pembroke)', 0),
  (281, 'West Highland White Terrier', 0),
  (282, 'Whippet', 0),
  (283, 'Xoloitzcuintli', 0),
  (284, 'Yorkshire Terrier', 0),
  (285, 'Maine Coon', 1),
  (286, 'Ragdoll', 1),
  (287, 'Ashera', 1),
  (288, 'American Shorthair', 1),
  (289, 'Exótico', 1),
  (291, 'Azul Russo', 1),
  (292, 'Angorá Turco', 1),
  (293, 'Pelo curto brasileiro', 1),
  (294, 'Pelo curto americano', 1),
  (295, 'Snowshoe', 1);

COMMIT;