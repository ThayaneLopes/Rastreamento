-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 18-Nov-2016 às 02:49
-- Versão do servidor: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elsez`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `exposicao`
--

CREATE TABLE `exposicao` (
  `idExposicao` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `horaComentario` varchar(5) DEFAULT NULL,
  `dataComentario` date DEFAULT NULL,
  `comentario` varchar(200) NOT NULL,
  `idFoto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `exposicao`
--

INSERT INTO `exposicao` (`idExposicao`, `idUsuario`, `horaComentario`, `dataComentario`, `comentario`, `idFoto`) VALUES
(5, 1, '17:00', NULL, 'uma boxta', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `fotografo`
--

CREATE TABLE `fotografo` (
  `nome` varchar(40) NOT NULL,
  `senha` varchar(8) NOT NULL,
  `login` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fotos`
--

CREATE TABLE `fotos` (
  `dataFoto` date DEFAULT NULL,
  `id` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `local` varchar(30) NOT NULL,
  `foto` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `fotos`
--

INSERT INTO `fotos` (`dataFoto`, `id`, `tipo`, `local`, `foto`) VALUES
(NULL, 1, 'natureza', 'em algum lugar ae', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `publicacao`
--

CREATE TABLE `publicacao` (
  `idPublicacao` int(11) NOT NULL,
  `idFoto` int(11) NOT NULL,
  `dataPublicacao` date DEFAULT NULL,
  `comentarioFixo` varchar(200) DEFAULT NULL,
  `loginfotografo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tabela_imagens`
--

CREATE TABLE `tabela_imagens` (
  `codigo` int(10) NOT NULL,
  `evento` varchar(50) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `nome_imagem` varchar(25) NOT NULL,
  `tamanho_imagem` varchar(25) NOT NULL,
  `tipo_imagem` varchar(25) NOT NULL,
  `imagem` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `nome` varchar(40) NOT NULL,
  `email` varchar(50) NOT NULL,
  `login` varchar(50) NOT NULL,
  `senha` varchar(8) NOT NULL,
  `nascimento` date DEFAULT NULL,
  `id` int(11) NOT NULL,
  `logout` datetime NOT NULL,
  `entrada` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`nome`, `email`, `login`, `senha`, `nascimento`, `id`, `logout`, `entrada`) VALUES
('administrador', 'adm@root.com', 'adm', '@dmfoto', '1997-07-10', 1, '2016-11-17 22:34:53', '2016-11-17 22:34:50'),
('thayane', 'thayane@email.com', 'thayane', '123456', NULL, 2, '2016-11-17 22:36:00', '2016-11-17 22:35:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `exposicao`
--
ALTER TABLE `exposicao`
  ADD PRIMARY KEY (`idExposicao`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idFoto` (`idFoto`);

--
-- Indexes for table `fotografo`
--
ALTER TABLE `fotografo`
  ADD PRIMARY KEY (`login`);

--
-- Indexes for table `fotos`
--
ALTER TABLE `fotos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `publicacao`
--
ALTER TABLE `publicacao`
  ADD PRIMARY KEY (`idPublicacao`),
  ADD KEY `idFoto` (`idFoto`),
  ADD KEY `loginfotografo` (`loginfotografo`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `exposicao`
--
ALTER TABLE `exposicao`
  MODIFY `idExposicao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `fotos`
--
ALTER TABLE `fotos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `publicacao`
--
ALTER TABLE `publicacao`
  MODIFY `idPublicacao` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `exposicao`
--
ALTER TABLE `exposicao`
  ADD CONSTRAINT `exposicao_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `exposicao_ibfk_2` FOREIGN KEY (`idFoto`) REFERENCES `fotos` (`id`);

--
-- Limitadores para a tabela `publicacao`
--
ALTER TABLE `publicacao`
  ADD CONSTRAINT `publicacao_ibfk_1` FOREIGN KEY (`idFoto`) REFERENCES `fotos` (`id`),
  ADD CONSTRAINT `publicacao_ibfk_2` FOREIGN KEY (`loginfotografo`) REFERENCES `fotografo` (`login`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
