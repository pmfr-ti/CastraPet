-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 11-Out-2022 às 13:39
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdpetcastra`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `animal`
--

CREATE TABLE `animal` (
  `idanimal` int(11) NOT NULL,
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
  `codchip` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `animal`
--

INSERT INTO `animal` (`idanimal`, `idusuario`, `idraca`, `aninome`, `especie`, `sexo`, `cor`, `pelagem`, `porte`, `idade`, `comunitario`, `foto`, `codchip`) VALUES
(32, 24, 7, 'Roger', 0, 1, 'Branco', 1, 1, 2, 1, '6e33a132f63ae84fc6c197471d94d9e3.jpg', NULL),
(33, 25, 7, 'Cadu', 0, 1, 'branco', 2, 1, 2, 0, '3ac52dbb1ab458fd3ad53ac6bfe96a97.jpg', '165464861113216'),
(35, 26, 7, 'fred', 0, 1, 'Branco', 1, 1, 3, 1, '8ad083793b1141cbd0084129b75fd218.jpg', '515151615151'),
(36, 26, 7, 'roger', 0, 1, 'Marrom', 1, 1, 5, 1, '712356345e7494b41d361fc8bef5f6c8.jpg', '51151515151515'),
(37, 26, 4, 'lux', 1, 0, 'Marrom', 0, 0, 4, 0, '7bc32a262fa76ce628cad42a0808d653.jpg', '12121151515'),
(39, 26, 7, 'eren', 1, 1, 'Marrom', 1, 1, 1, 1, '821d5b05d27968a26abfdac990856d4b.jpg', '131313131313'),
(41, 25, 4, 'lux', 1, 0, 'Marrom', 0, 0, 2, 1, 'fb93f930933de0206d6ae23a4f000c89.jpg', '1212121212121'),
(42, 25, 7, 'mufasa', 0, 1, 'caramelo', 0, 0, 2, 0, 'd21df72f3444238bfd2de11509815597.jpg', '989898989898'),
(43, 25, 2, 'roger', 0, 1, 'branco', 0, 0, 4, 0, 'f48977888680cb6c0cc3c3b0b3d5a532.jpg', '656565655665565'),
(44, 25, 1, 'francisco', 0, 1, 'Marrom', 0, 1, 2, 1, 'd61122e366e5d7a1c5d0800ba7eb56a0.jpg', '42342342342342'),
(45, 25, 7, 'garfild', 1, 1, 'caramelo', 0, 0, 2, 0, '0449ffd6b6bce24f35a868c2762935d0.jpg', '545454545454545'),
(46, 25, 2, 'robertinho', 0, 1, 'caramelo', 0, 0, 2, 0, 'd8ac632d1db424d2f79004d190d4ce46.jpg', '454554545454545'),
(47, 25, 2, 'Mel', 0, 0, 'Branco', 1, 0, 3, 0, '84e53acdfe3b3871fc645d16d37f7e13.jpg', '898998898998988'),
(48, 25, 7, 'xuxu', 1, 0, 'branco', 1, 1, 4, 0, '5c79962c59c8d1636c900db39b5b6c08.jpg', '123456789987984'),
(49, 25, 7, 'pucca', 0, 0, 'caramelo', 0, 1, 4, 1, 'cadadfb65611781b41271dcc70915f79.jpg', NULL),
(50, 25, 7, 'puminho', 1, 1, 'Branco', 0, 0, 4, 0, '32c77765e4026eb6e7b085f90ca74cb1.jpg', '454545454545454'),
(51, 25, 1, 'graci', 0, 0, 'Branco', 0, 0, 5, 0, '26c8b2ce0eab2729f0f10edd2b3cf913.jpg', '4545454568678'),
(52, 25, 4, 'Juju', 1, 0, 'Marrom', 0, 0, 3, 0, '2739bd4130cec5dec36523bfb708043b.jpg', '787878787878'),
(53, 25, 1, 'fernando', 0, 1, 'Marrom', 0, 0, 2, 0, 'db31e3dcb2d22fa610df034d64d67f89.jpg', '484848484848'),
(54, 25, 8, 'RomÃ©rio', 0, 1, 'caramelo', 0, 0, 4, 0, '52723bdf5be7a9c374cf3099857114ec.jpg', NULL),
(55, 25, 7, 'bob marley', 0, 1, 'Marrom', 0, 0, 4, 0, '9626c46ac52419597e7a61be92e70234.jpg', '666363636666'),
(56, 25, 4, 'sun', 1, 0, 'Branco', 0, 0, 4, 0, '47ecc9ed23e5e0dc5b6465734c4d63cf.jpg', '787887878787'),
(57, 25, 2, 'goiaba', 0, 1, 'Branco', 0, 0, 2, 0, '6a4e64666913e76c3a92782fe7ef68bd.jpg', '411411414144141'),
(58, 25, 4, 'Luna', 1, 0, 'Marrom', 0, 0, 2, 0, 'a740904bc49b77a13aa5d1ddba9d6ad2.jpg', NULL),
(59, 25, 1, 'vagner', 0, 1, 'Branco', 0, 0, 2, 0, '352ccc1212016603e2cbce1142cbeeca.jpg', '4242424242424'),
(60, 25, 1, 'bonnie', 0, 1, 'Marrom', 0, 0, 4, 0, '1881664e22d9308d91d0932687e64849.jpg', '566556656656'),
(61, 25, 1, 'bruno', 0, 1, 'branco', 0, 0, 7, 0, 'd751759bee36a9c8d908a50ed645ea2c.jpg', '2232323233223'),
(62, 25, 4, 'moon', 1, 0, 'Marrom', 0, 0, 2, 0, 'c882624e1f2735074c90736de950aa0f.jpg', '77777777777'),
(63, 25, 1, 'booob', 0, 1, 'branca', 0, 0, 5, 0, '0c386476bed682116b2d5c104ba15425.jpg', '156546514564545'),
(64, 25, 1, 'hiago', 0, 1, 'branca', 0, 0, 4, 0, '673ad4ff72e8976911087df0a1f0872a.jpg', '656656665665'),
(65, 25, 4, 'rogerinho', 1, 1, 'branca', 0, 0, 2, 0, '8d10edb4aa6a3fdf9671ad79b5fad686.jpg', '99999999999'),
(66, 25, 1, 'Pantera', 0, 0, 'preto', 0, 0, 5, 0, '270a6698355d5c3b4cbe520903661dea.jpg', '8888888888'),
(69, 23, 9, 'Molho 2', 1, 0, 'Branco', 0, 0, 5, 0, '129b7ac53f9a2970d8a0355813a177ac.jpg', NULL),
(72, 28, 4, 'Gita    ', 1, 0, 'Cinza', 0, 0, 10, 0, 'e2852aab7318b368f97566a3d2f027c9.jpg', NULL),
(73, 29, 7, 'Gita', 1, 0, 'Cinza', 1, 0, 9, 0, '50f19a1ba29655ab155bb07d43a119c5.jpeg', '12345678921'),
(74, 29, 4, 'Gita 2', 1, 0, 'Cinza', 1, 0, 10, 1, '0d2ae54938e7e5ab072b0c01f950ea12.jpg', '123215467899'),
(75, 29, 7, 'Gita 3', 1, 0, 'Cinza', 0, 0, 10, 0, '42153854e71064cbae3d212103b790f2.jpg', '12345678'),
(76, 26, 7, 'Lion', 1, 1, 'Amarelo', 2, 0, 2, 0, 'd6f72d66e9c08ae8c87a812bbd105c76.jpeg', NULL),
(77, 26, 7, 'Aladim', 0, 0, 'Preto e Branco', 0, 0, 5, 0, NULL, NULL),
(78, 29, 4, 'Milu', 1, 0, 'Cinza', 0, 0, 1, 0, '292bea950fc28cd4ce67aada9d442099.jpg', NULL),
(79, 29, 4, 'Thiago Arcanjo De Oliveira', 1, 0, 'Amarelo', 0, 0, 1, 0, '8946a49a1cf995f15b5336a280cf9d08.jpg', NULL),
(80, 30, 9, 'Gita', 1, 0, 'Cinza', 1, 0, 5, 0, '9f49536f0c31c18f817c328126aa9e43.jpg', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `castracao`
--

CREATE TABLE `castracao` (
  `idcastracao` int(11) NOT NULL,
  `idanimal` int(11) NOT NULL,
  `idclinica` int(11) DEFAULT NULL,
  `horario` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0 - Solicitação em análise; 1 - Solicitação aprovada; 2 - Animal Castrado; 3 - Solicitação Reprovada; 4 - Tutor não compareceu; 5 - Solicitação Cancelada; 6 - Solicitação Reagendada; 7 - Animal foi a óbito; 8 - Para solicitação enviada a clinica',
  `observacao` varchar(100) DEFAULT NULL,
  `obsclinica` varchar(100) DEFAULT NULL,
  `msgrecusa` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `castracao`
--

INSERT INTO `castracao` (`idcastracao`, `idanimal`, `idclinica`, `horario`, `status`, `observacao`, `obsclinica`, `msgrecusa`) VALUES
(14, 33, 5, '2022-06-30 17:00:00', 2, '', NULL, ''),
(16, 35, 5, '2022-06-30 20:20:00', 2, 'dipirona', NULL, ''),
(17, 36, 5, '2022-06-28 18:26:00', 2, 'alergia a dipirona ', NULL, ''),
(18, 37, 5, '2022-06-29 17:35:00', 2, 'alergia a dipirona', NULL, ''),
(20, 39, 5, '2022-06-26 19:48:00', 2, 'dores na pata dianteira', NULL, ''),
(22, 41, 5, '2022-06-22 09:25:00', 2, '', NULL, ''),
(23, 42, 5, '2022-06-28 20:17:00', 2, '', NULL, ''),
(24, 43, 5, '2022-06-29 12:41:00', 2, '', NULL, ''),
(25, 44, 5, '2022-06-28 14:00:00', 2, '', NULL, ''),
(26, 45, 5, '2022-06-28 14:42:00', 2, 'dores na pata traseira', NULL, ''),
(27, 46, 5, '2022-06-29 12:44:00', 2, '', NULL, ''),
(28, 47, 5, '2022-06-28 21:50:00', 2, '', NULL, ''),
(29, 48, 5, '2022-06-22 17:00:00', 2, 'alergia a dipirona', NULL, ''),
(30, 49, 5, '2022-07-01 18:01:00', 7, 'alergia a dipirona e dor nas patas esquerdas', NULL, ''),
(31, 50, 5, '2022-06-29 13:54:00', 2, '', NULL, ''),
(32, 51, 5, '2022-06-30 16:00:00', 2, '', NULL, ''),
(33, 52, 5, '2022-06-23 00:08:00', 2, '', NULL, ''),
(34, 53, 5, '2022-06-29 16:20:00', 2, '', NULL, ''),
(35, 54, 5, '2022-06-28 15:31:00', 1, 'dor na pata traseira', NULL, ''),
(36, 55, 5, '2022-06-28 14:48:00', 2, '', '', ''),
(37, 56, 5, '2022-06-30 22:45:00', 2, '', NULL, ''),
(38, 57, 5, '2022-06-21 22:52:00', 2, '', NULL, ''),
(39, 58, 5, '2022-06-28 15:00:00', 1, '', NULL, ''),
(40, 59, 5, '2022-06-22 17:05:00', 2, '', NULL, ''),
(41, 60, 5, '2022-06-28 15:15:00', 2, '', NULL, ''),
(42, 61, 5, '2022-06-28 17:26:00', 2, '', NULL, ''),
(43, 62, 5, '2022-06-27 09:30:00', 2, '', NULL, ''),
(44, 63, 5, '2022-06-24 22:36:00', 2, 'alergia a dipirona', NULL, ''),
(45, 64, 5, '2022-06-21 15:48:00', 2, '', NULL, ''),
(46, 65, 5, '2022-06-27 12:00:00', 2, '', NULL, ''),
(47, 66, 5, '2022-06-28 16:10:00', 2, '', NULL, ''),
(74, 74, 5, '2022-10-05 00:00:00', 2, '', 'Animal Castrado com sucesso', NULL),
(76, 73, 5, '2022-10-05 10:00:00', 2, '', 'Anaimal castrado com sucesso', NULL),
(121, 75, 5, '2022-10-06 05:00:00', 2, '', 'Teste', NULL),
(126, 78, 5, '2022-10-06 15:00:00', 1, '5', NULL, NULL),
(131, 80, 5, NULL, 8, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `clinica`
--

CREATE TABLE `clinica` (
  `idclinica` int(11) NOT NULL,
  `idlogin` int(11) NOT NULL,
  `cnpj` varchar(14) NOT NULL,
  `clitelefone` varchar(11) NOT NULL,
  `vagas` int(11) NOT NULL,
  `clirua` varchar(50) NOT NULL,
  `clibairro` varchar(50) NOT NULL,
  `clinumero` varchar(5) NOT NULL,
  `clicep` varchar(8) NOT NULL,
  `ativo` tinyint(4) NOT NULL COMMENT '0 - Clínica não ativa; 1 - Clínica ativa'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `clinica`
--

INSERT INTO `clinica` (`idclinica`, `idlogin`, `cnpj`, `clitelefone`, `vagas`, `clirua`, `clibairro`, `clinumero`, `clicep`, `ativo`) VALUES
(5, 35, '46549846468846', '1148192332', 115, 'Rua Estação Franco da Rocha', 'Portal da Estação', '300', '07868010', 1),
(6, 39, '46549846156460', '1148192332', 200, 'Rua Estação Botujuru', 'Portal da Estação', '28', '07868050', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `login`
--

CREATE TABLE `login` (
  `idlogin` int(11) NOT NULL,
  `nome` varchar(70) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(60) NOT NULL,
  `nivelacesso` tinyint(4) NOT NULL COMMENT '0 pra Usuário; 1 pra clínica; 2 pra adm;',
  `codsenha` char(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `login`
--

INSERT INTO `login` (`idlogin`, `nome`, `email`, `senha`, `nivelacesso`, `codsenha`) VALUES
(1, 'Administrador', 'kelvin.menegasse@francodarocha.sp.gov.br', '$2a$08$m1u8/Sq9GmPmaFLKd.gJQuPeh/woAfPLbEenmDpgfEohvFSlnKb5G', 2, NULL),
(34, 'Miguel Henrique Guerreiro Silva', 'miguelhenriquegs369@gmail.com', '$2y$10$cH.SZPPbF13l6o3c4lrVfeJZBvexOXK5pzlj1wdBH24cWPgSS9bXy', 0, NULL),
(35, 'Clinica Teste', 'clinica.teste@gmail.com', '$2a$12$rOTfp6ttAPSVXtYXP1lPlO.IMEx6ZPJczoi1iLwvS8Kz38z1yGA/.', 1, NULL),
(36, 'Matheus Pereira', 'matheus12@gmail.com', '$2y$10$pE/KSJ6CaN0EQYp4QGTKrO3IQhGFYoDPNi0tAx3PdEVfvkbcWrN0i', 0, NULL),
(37, 'Usuario', 'barbosaticyanne1@gmail.com', '$2y$10$fK7FN67teiaVxBeeHD28p.hsIa3DZlGoLpTFAlC34WBZ5.bZzjPKy', 0, NULL),
(38, 'Ketlyn', 'kelvin.menegasse@gmail.com', '$2a$12$Z1sUPQaOxzZDlP/u3xX.9ui.kAi/pHJxpwSZBTjuDD9dXHgXhYTFS', 0, NULL),
(39, 'clinica 2', 'barbosa.sticyanne@gmail.com', '$2y$10$kBAep9IujM1k0HJjvzs2Eez8Unzz986wLRu5rUHrAMCfS.ZD3vAWW', 1, NULL),
(40, 'teste', 'teste@teste.com', '$2y$10$Otgv2HUANuByaaUQIzFtluAtrhbwgw/FWkNmvpvGPVzm5uX7Q4QsC', 0, NULL),
(41, 'Thiago Arcanjo De Oliveira', 'thigocdz.arcanjo@gmail.com', '$2y$10$e2puOe.87CVOK4nIErW.ZuOY67GH8QWZFDhlhyCl9iN6EvFuhHLvy', 0, '120886'),
(42, 'João Dos santos', 'thiagokaii.arcanjo@gmail.com', '$2y$10$XtNTJiWCXvsCsbit3Z0exuXsaDa8mskLBb9ylEH/6rsL4rw22hON2', 0, NULL),
(43, 'Thiago Arcanjo', 'thiago.arcanjo@francodarocha.sp.gov.br', '$2y$10$og18TOpt0ow.vXAUzG7rk.Eg/PZFd.4DavGLM5cm1d0/CWxqXCbkO', 0, NULL),
(44, 'Thiago Arcanjo de Oiveira sem CPF', NULL, '$2y$10$t7Jt5CPnTXKL.cTOHg.szufo4Y3QzMotwKeEAFU0nvjGf92F2iiUG', 0, NULL),
(45, 'Thiago Arcanjo de Oiveira sem CPF', 'kelvin@franco.sp.gov.br', '$2y$10$m.ltaIwzhNhWtwzZmAT33OAgfMVare4jnpOgF.o/ZH.ZvkTzTIjpC', 0, NULL),
(46, 'João Sergio', 'joao.sergio@gmail.com', '$2y$10$WEmMknmAPqjkTdY/FVGqTu5q65gYhRIxJ3qYDV5NJO7zQ3OCNl4ue', 0, NULL),
(47, 'Agata Cristina', 'agata@gmail.com', '$2y$10$9U1R3HDN2tSJyzVkzZRgGOAij/eCw43tvb0uAzRHGC/zUDSDIeb4y', 0, NULL),
(48, 'Agata Cristina', 'ag@gmail.com', '$2y$10$PSmsONUszWpgqq6b2Xmgc.iX81SLQEHT63vzjc0clKaNemFm07qaO', 0, NULL),
(49, 'Eziquiel Oliveira', 'eziquiel@gmail.com', '$2y$10$fM3ZCKziD.dLDOsfru4CsOn3WKsabXWT0YazhNDGiavyAhQ3IZRQ2', 0, NULL),
(50, 'Eziquiel Souza', 'eziquiel.souza@gmail.com', '$2y$10$Q4uuykESdWWwwzMgUXyeb.66dHNa25sey8cOkC9QEMbD56IJB4sjm', 0, NULL),
(51, 'Gita  teste', 'gita@gmail.com', '$2y$10$xOU6kvP10iQDf/kfm7OuyeWHX1Jfbw1txWWhp6fdS/nx7z19HsJVe', 0, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `raca`
--

CREATE TABLE `raca` (
  `idraca` int(11) NOT NULL,
  `raca` varchar(30) CHARACTER SET latin1 NOT NULL,
  `tipoespecie` tinyint(4) NOT NULL COMMENT '0 pra cachorro; 1 pra gato; 2 para os dois'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `raca`
--

INSERT INTO `raca` (`idraca`, `raca`, `tipoespecie`) VALUES
(1, 'Pastor Alemão', 0),
(2, 'Buldogue Francês', 0),
(4, 'Siamês', 1),
(5, 'Persa', 1),
(6, 'Sphynx', 1),
(7, 'S.R.D - Sem Raça Definida', 2),
(8, 'Chow-chow', 0),
(9, 'Munchkin', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `idlogin` int(11) NOT NULL,
  `rg` char(9) NOT NULL,
  `cpf` char(11) NOT NULL,
  `beneficio` tinyint(4) NOT NULL COMMENT '0 - Sem benefício; 1 - Benefício Soical; 2 - Protetor de Animais; 3 - Em análise',
  `telefone` varchar(10) DEFAULT NULL,
  `celular` varchar(11) NOT NULL,
  `whatsapp` tinyint(4) NOT NULL COMMENT '0 - Celular não é whatsapp; 1 - Celular é whatsapp',
  `punicao` tinyint(4) NOT NULL,
  `usurua` varchar(50) NOT NULL,
  `usubairro` varchar(50) NOT NULL,
  `usunumero` varchar(5) NOT NULL,
  `usucep` varchar(8) NOT NULL,
  `nis` char(11) DEFAULT NULL,
  `doccomprovante` varchar(255) DEFAULT NULL,
  `quantcastracoes` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idusuario`, `idlogin`, `rg`, `cpf`, `beneficio`, `telefone`, `celular`, `whatsapp`, `punicao`, `usurua`, `usubairro`, `usunumero`, `usucep`, `nis`, `doccomprovante`, `quantcastracoes`) VALUES
(23, 34, '231365654', '51520752881', 0, '1196515224', '11965152246', 1, 0, 'Rua Estação Botujuru', 'Portal da Estação', '300', '07868050', NULL, '0e897fe74b7f50e23e505616bba96b3a.png', 1),
(24, 36, '231365654', '84264888972', 0, '1196515224', '11965152246', 1, 0, 'Rua Estação Botujuru', 'Portal da Estação', '300', '07868050', NULL, '7f67ae65396ea3e2987f42e483014d5a.jpg', 1),
(25, 37, '231365654', '68213324013', 0, NULL, '11965152246', 1, 0, 'Rua Estação Franco da Rocha', 'Portal da Estação', '365', '07868010', NULL, '15236294860067616103f82e5af888de.jpg', 1),
(26, 38, '231365654', '51560077832', 1, '1196515224', '11965152246', 1, 0, 'Rua Estação Botujuru', 'Portal da Estação', '300', '07868050', NULL, '572b91b9026dfddeb37655203e954a13.png', 0),
(27, 40, '329404155', '69418941058', 0, NULL, '11687984684', 0, 0, 'Rua Estação Botujuru', 'Portal da Estação', '6684', '07868050', NULL, 'fd8e2d74ce9018e6c33f24920837f8af.jpg', 1),
(28, 41, '820632260', '82063226040', 0, NULL, '11941666617', 0, 0, 'Rua Vilage Arco Iris', 'Chácaras Bom Tempo', '200', '07810550', NULL, 'bd3685aa7ac332605baef44e032e4fba.png', 1),
(29, 42, '156350233', '97901579080', 2, '1194166618', '11941666618', 0, 0, 'Rua Vilage Arco Iris', 'Chácaras Bom Tempo', '200', '07810550', NULL, 'f81465d0d469003c8a967abdb3d1b2e8.png', 5),
(30, 43, '127116163', '97103145059', 0, '1148001017', '11941666617', 0, 0, 'Rua Vilage Arco Iris', 'Chácaras Bom Tempo', '200', '07810550', NULL, '39bf9673fb8c4baa7d9601d343cb67e4.png', 0),
(31, 44, '386116325', '73234838089', 0, '1148001710', '11941666619', 0, 0, 'Rua Vilage Arco Iris', 'Chácaras Bom Tempo', '550', '07810550', NULL, '73665849228bbefdc8bfbfb42b3e2ed8.png', 1),
(32, 45, '133002410', '13300241090', 0, '1148001710', '11941666617', 0, 0, 'Rua Vilage Arco Iris', 'Chácaras Bom Tempo', '200', '07810550', NULL, '211af7685c9c4b293d804a09d56f2279.png', 1),
(33, 46, '210222505', '51352518040', 1, NULL, '15874830484', 0, 0, 'Rua Vilage Arco Iris', 'Chácaras Bom Tempo', '200', '07810550', '36404867678', 'd55e4e0365ffa35ead067a2bee13d6d9.png', 2),
(34, 47, '446551806', '84793290094', 1, NULL, '11941666617', 0, 0, 'Rua Vilage Arco Iris', 'Chácaras Bom Tempo', '550', '07810550', '03451866708', 'e45ffc9a9bff47ca521d683f98a719b8.png', 2),
(35, 48, '309243427', '42074908091', 1, NULL, '11941666617', 0, 0, 'Rua Vilage Arco Iris', 'Chácaras Bom Tempo', '200', '07810550', '53116376741', '4fbc10fe543510165cd145392b702f2c.png', 2),
(36, 49, '468813469', '46818988059', 1, NULL, '11941666617', 1, 0, 'Rua Vilage Arco Iris', 'Chácaras Bom Tempo', '200', '07810550', '85987109820', '0a832dc759cc2659035ee374a4d442c6.png', 2),
(37, 50, '444420800', '36578308040', 1, NULL, '11941666617', 0, 0, 'Rua Vilage Arco Iris', 'Chácaras Bom Tempo', '200', '07810550', '40100895203', '06d3b154eae89c80a7a29d591a2b353c.png', 2),
(38, 51, '410704623', '05284391039', 1, NULL, '11941666617', 1, 0, 'Rua Vilage Arco Iris', 'Chácaras Bom Tempo', '200', '07810550', '12192573261', '9499768610a07958aceaa64ff91e1c73.png', 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`idanimal`),
  ADD KEY `idusuario` (`idusuario`),
  ADD KEY `idraca` (`idraca`);

--
-- Índices para tabela `castracao`
--
ALTER TABLE `castracao`
  ADD PRIMARY KEY (`idcastracao`),
  ADD UNIQUE KEY `idanimal_2` (`idanimal`),
  ADD UNIQUE KEY `horario` (`horario`),
  ADD KEY `fkidclinica_castracao` (`idclinica`),
  ADD KEY `idanimal` (`idanimal`,`idclinica`) USING BTREE;

--
-- Índices para tabela `clinica`
--
ALTER TABLE `clinica`
  ADD PRIMARY KEY (`idclinica`),
  ADD UNIQUE KEY `cnpj` (`cnpj`),
  ADD KEY `idlogin` (`idlogin`);

--
-- Índices para tabela `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`idlogin`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices para tabela `raca`
--
ALTER TABLE `raca`
  ADD PRIMARY KEY (`idraca`),
  ADD UNIQUE KEY `Raca` (`raca`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `nis` (`nis`),
  ADD KEY `idlogin` (`idlogin`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `animal`
--
ALTER TABLE `animal`
  MODIFY `idanimal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT de tabela `castracao`
--
ALTER TABLE `castracao`
  MODIFY `idcastracao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT de tabela `clinica`
--
ALTER TABLE `clinica`
  MODIFY `idclinica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `login`
--
ALTER TABLE `login`
  MODIFY `idlogin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de tabela `raca`
--
ALTER TABLE `raca`
  MODIFY `idraca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `fkidraca` FOREIGN KEY (`idraca`) REFERENCES `raca` (`idraca`),
  ADD CONSTRAINT `fkidusuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Limitadores para a tabela `castracao`
--
ALTER TABLE `castracao`
  ADD CONSTRAINT `fkidanimal_castracao` FOREIGN KEY (`idanimal`) REFERENCES `animal` (`idanimal`) ON DELETE CASCADE,
  ADD CONSTRAINT `fkidclinica_castracao` FOREIGN KEY (`idclinica`) REFERENCES `clinica` (`idclinica`);

--
-- Limitadores para a tabela `clinica`
--
ALTER TABLE `clinica`
  ADD CONSTRAINT `fkidlogin_clinica` FOREIGN KEY (`idlogin`) REFERENCES `login` (`idlogin`);

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fkidlogin_usuario` FOREIGN KEY (`idlogin`) REFERENCES `login` (`idlogin`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
