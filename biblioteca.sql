-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05-Jun-2022 às 11:56
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `emprestimos`
--

CREATE TABLE `emprestimos` (
  `Id` int(11) NOT NULL,
  `DataEmprestimo` datetime(6) NOT NULL,
  `DataDevolucao` datetime(6) NOT NULL,
  `NomeUsuario` longtext DEFAULT NULL,
  `Telefone` longtext DEFAULT NULL,
  `Devolvido` tinyint(1) NOT NULL,
  `LivroId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `emprestimos`
--

INSERT INTO `emprestimos` (`Id`, `DataEmprestimo`, `DataDevolucao`, `NomeUsuario`, `Telefone`, `Devolvido`, `LivroId`) VALUES
(1, '2022-05-19 00:00:00.000000', '2022-05-23 00:00:00.000000', 'Edinaldo', '3232-55', 0, 3),
(2, '2022-05-09 00:00:00.000000', '2022-05-20 00:00:00.000000', 'Socorro', '9898-7575', 0, 1),
(3, '2022-05-20 00:00:00.000000', '2022-05-31 00:00:00.000000', 'Bernadete', '8787-9854', 0, 5),
(4, '2022-04-20 00:00:00.000000', '2022-06-10 00:00:00.000000', 'EDINALDO', '+5584999244795', 0, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `livros`
--

CREATE TABLE `livros` (
  `Id` int(11) NOT NULL,
  `Titulo` longtext DEFAULT NULL,
  `Autor` longtext DEFAULT NULL,
  `Ano` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `livros`
--

INSERT INTO `livros` (`Id`, `Titulo`, `Autor`, `Ano`) VALUES
(1, 'Dama das Camélias', 'Fulano de Tal', 2015),
(2, 'Iracema, a Virgem dos Lábios de Mel', 'Jorge Amado', 2013),
(3, 'Coringa', 'Francisco de assis', 2019),
(4, 'Deu a Louca no Mundo', 'Ivonildo do Nordeste', 2021),
(5, 'Duro na Queda', 'Joaquim Barbosa', 2014),
(6, 'O Cara de Pau', 'Jacaré de Tanga', 2012),
(7, 'Quem falou', 'José da Silva', 2019),
(9, 'Viver Feliz', 'Maria Margareth', 2011),
(10, 'Offíce para iniciantes', 'Juca da Silva', 2018),
(11, 'Teste Livro 1', 'Joana', 2019);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `Id` int(11) NOT NULL,
  `Nome` longtext DEFAULT NULL,
  `Login` longtext DEFAULT NULL,
  `Senha` longtext DEFAULT NULL,
  `Tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`Id`, `Nome`, `Login`, `Senha`, `Tipo`) VALUES
(1, 'Administrador', 'admin', '202cb962ac59075b964b07152d234b70', 0),
(7, 'EDINALDO', 'edinaldo', '202cb962ac59075b964b07152d234b70', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `__efmigrationshistory`
--

CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(95) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `__efmigrationshistory`
--

INSERT INTO `__efmigrationshistory` (`MigrationId`, `ProductVersion`) VALUES
('20220520181244_Cria_bancoDados', '3.0.0'),
('20220520222709_CreateDatabase', '3.0.0'),
('20220604102637_CriaUsuario', '3.0.0');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Emprestimos_LivroId` (`LivroId`);

--
-- Índices para tabela `livros`
--
ALTER TABLE `livros`
  ADD PRIMARY KEY (`Id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Id`);

--
-- Índices para tabela `__efmigrationshistory`
--
ALTER TABLE `__efmigrationshistory`
  ADD PRIMARY KEY (`MigrationId`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `livros`
--
ALTER TABLE `livros`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD CONSTRAINT `FK_Emprestimos_Livros_LivroId` FOREIGN KEY (`LivroId`) REFERENCES `livros` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
