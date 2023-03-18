-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18-Mar-2023 às 20:12
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `devsbook`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `postcomments`
--

CREATE TABLE `postcomments` (
  `id` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `body` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `postcomments`
--

INSERT INTO `postcomments` (`id`, `id_post`, `id_user`, `created_at`, `body`) VALUES
(1, 5, 1, '2023-03-16 19:09:30', 'Teste de comentário em um post'),
(2, 7, 1, '2023-03-17 00:12:39', 'comentario'),
(3, 7, 1, '2023-03-17 00:13:10', 'opa'),
(4, 6, 1, '2023-03-17 00:14:23', 'testando'),
(5, 6, 1, '2023-03-17 00:14:45', 'teste de comentário');

-- --------------------------------------------------------

--
-- Estrutura da tabela `postlikes`
--

CREATE TABLE `postlikes` (
  `id` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `postlikes`
--

INSERT INTO `postlikes` (`id`, `id_post`, `id_user`, `created_at`) VALUES
(1, 6, 1, '2023-03-14 18:58:34'),
(2, 6, 3, '2023-03-14 18:58:34'),
(3, 6, 2, '2023-03-14 19:00:45'),
(5, 7, 1, '2023-03-14 23:46:05'),
(6, 5, 1, '2023-03-14 23:46:09'),
(7, 4, 1, '2023-03-14 23:46:10'),
(9, 3, 1, '2023-03-14 23:46:14');

-- --------------------------------------------------------

--
-- Estrutura da tabela `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `body` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `posts`
--

INSERT INTO `posts` (`id`, `id_user`, `type`, `created_at`, `body`) VALUES
(1, 1, 'text', '2023-02-16 00:10:14', 'Meu primeiro post de teste'),
(2, 1, 'text', '2023-02-16 00:10:59', 'Poste teste\r\nde múltipla\r\nlinha'),
(3, 1, 'photo', '2023-02-16 00:14:59', '1.jpg'),
(4, 1, 'text', '2023-02-24 22:51:51', 'mais uma postagem'),
(5, 1, 'text', '2023-02-24 22:51:58', 'testando'),
(6, 2, 'text', '2023-03-02 22:58:32', 'Teste de postagem do João da Silva'),
(7, 2, 'text', '2023-03-02 22:58:58', 'teste 2 de postagem do joão da silva\r\nmultiplas \r\nlinmhas');

-- --------------------------------------------------------

--
-- Estrutura da tabela `userrelations`
--

CREATE TABLE `userrelations` (
  `id` int(11) NOT NULL,
  `user_from` int(11) NOT NULL,
  `user_to` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `userrelations`
--

INSERT INTO `userrelations` (`id`, `user_from`, `user_to`) VALUES
(2, 1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `name` varchar(100) NOT NULL,
  `birthdate` date NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `work` varchar(100) DEFAULT NULL,
  `avatar` varchar(100) NOT NULL,
  `cover` varchar(100) NOT NULL,
  `token` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `birthdate`, `city`, `work`, `avatar`, `cover`, `token`) VALUES
(1, 'contato@helenaldo.com.br', '$2y$10$yjCA0NeiSqh2sxVOBUnNP.oubhuqfzRarY/FkQD8/4HEZeLh.Edcq', 'Helenaldo Carvalho', '1978-05-21', 'Teresina', 'Contador', 'default.jpg', 'cover.jpg', 'e23d6fa15929d1c74d7eec25608076aa'),
(2, 'contato@gconte.com.br', '$2y$10$yUINCsvU98IR.y2Zb6hH0uh4ImErIU5EF7j6xH.M46PcuKTjEyvhu', 'Joao da Silva', '1970-05-20', NULL, NULL, 'default.jpg', 'cover.jpg', 'a9a797570842bcb948ee51aabdd81630'),
(3, 'contato@gconte123.com.br', '$2y$10$5woYBKQhi24pjRlHcjEMNO4jZFVBvqs41VdDIHRt/I4AAqSlDARLi', 'TESTADOR', '1970-05-20', NULL, NULL, 'default.jpg', 'cover.jpg', '923088f68cf17fd1cbc3e01fd7895993'),
(4, 'glauciane@rochaerocha.com.br', '$2y$10$3LN4DPomGk5XOWJ25Ix/c.lIzO32S/Lhvi.ImXEOuwBTO.ZTY5ZBu', 'Diogo da Silva', '1970-05-20', NULL, NULL, 'default.jpg', 'cover.jpg', '7cfe23b2b5e98c289d77dae5fd807ea5'),
(5, 'contato1@gconte.com.br', '$2y$10$euuevsCY73rJQ4xN0CgHxer6RPTPycxcFc9JayEJEix1PNJc2ygau', 'TESTADOR 2', '1978-05-21', NULL, NULL, 'default.jpg', 'cover.jpg', '940dd27177e0d003a3588eb27f08b181');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `postcomments`
--
ALTER TABLE `postcomments`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `postlikes`
--
ALTER TABLE `postlikes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `userrelations`
--
ALTER TABLE `userrelations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `postcomments`
--
ALTER TABLE `postcomments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `postlikes`
--
ALTER TABLE `postlikes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `userrelations`
--
ALTER TABLE `userrelations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
