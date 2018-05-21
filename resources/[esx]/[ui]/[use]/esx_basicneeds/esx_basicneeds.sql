CREATE TABLE IF NOT EXISTS `items` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `limit` int(11) NOT NULL DEFAULT -1,
  `rare` int(11) NOT NULL DEFAULT 0,
  `can_remove` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Extraindo dados da tabela `items`
--

INSERT INTO `items` (`id`, `name`, `label`, `limit`, `rare`, `can_remove`) VALUES
(NULL, 'bread', 'Pao', -1, 0, 1),
(NULL, 'water', 'Agua', -1, 0, 1),
(NULL, 'wine', 'Vinho', -1, 0, 1),
(NULL, 'beer', 'Cerveja', -1, 0, 1),
(NULL, 'vodka', 'Vodka', -1, 0, 1),
(NULL, 'chocolate', 'Chocolate', -1, 0, 1),
(NULL, 'sandwich', 'Sandwich', -1, 0, 1),
(NULL, 'hamburger', 'Hamburger', -1, 0, 1),
(NULL, 'tequila', 'Tequila', -1, 0, 1),
(NULL, 'whisky', 'Whisky', -1, 0, 1),
(NULL, 'cupcake', 'Bolinho', -1, 0, 1),
(NULL, 'cocacola', 'Coca-Cola', -1, 0, 1),
(NULL, 'icetea', 'Ice-Tea', -1, 0, 1),
(NULL, 'redbull', 'Café', -1, 0, 1),
(NULL, 'lighter', 'Isqueiro', 1, 0, 1),
(NULL, 'cigarett', 'Cigarros', -1, 0, 1),
(NULL, 'milk', 'Leite', -1, 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `items`
--
ALTER TABLE `items`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=57;