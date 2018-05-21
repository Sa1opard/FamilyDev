CREATE TABLE IF NOT EXISTS `shops` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `item` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Extraindo dados da tabela `shops`
--

INSERT INTO `shops` (`id`, `name`, `item`, `price`) VALUES
(1, 'TwentyFourSeven', 'bread', 30),
(2, 'TwentyFourSeven', 'water', 15),
(3, 'RobsLiquor', 'bread', 30),
(4, 'RobsLiquor', 'water', 15),
(5, 'LTDgasoline', 'bread', 30),
(6, 'LTDgasoline', 'water', 15),
(7, 'Bar', 'wine', 50),
(8, 'Bar', 'beer', 50),
(9, 'Bar', 'vodka', 50),
(10, 'TwentyFourSeven', 'chocolate', 20),
(11, 'RobsLiquor', 'chocolate', 20),
(12, 'LTDgasoline', 'chocolate', 20),
(13, 'TwentyFourSeven', 'sandwich', 30),
(14, 'RobsLiquor', 'sandwich', 30),
(15, 'LTDgasoline', 'sandwich', 30),
(16, 'TwentyFourSeven', 'hamburger', 30),
(17, 'RobsLiquor', 'hamburger', 30),
(18, 'LTDgasoline', 'hamburger', 30),
(19, 'Bar', 'tequila', 40),
(20, 'Bar', 'whisky', 40),
(21, 'TwentyFourSeven', 'cupcake', 15),
(22, 'RobsLiquor', 'cupcake', 15),
(23, 'LTDgasoline', 'cupcake', 15),
(24, 'TwentyFourSeven', 'cocacola', 25),
(25, 'RobsLiquor', 'cocacola', 25),
(26, 'LTDgasoline', 'cocacola', 25),
(27, 'TwentyFourSeven', 'icetea', 20),
(28, 'RobsLiquor', 'icetea', 20),
(29, 'LTDgasoline', 'icetea', 20),
(30, 'TwentyFourSeven', 'redbull', 30),
(31, 'RobsLiquor', 'redbull', 30),
(32, 'LTDgasoline', 'redbull', 30),
(33, 'TwentyFourSeven', 'milk', 35),
(34, 'RobsLiquor', 'milk', 35),
(35, 'LTDgasoline', 'milk', 35),
(48, 'TwentyFourSeven', 'cigarett', 10),
(49, 'RobsLiquor', 'cigarett', 10),
(50, 'LTDgasoline', 'cigarett', 10),
(51, 'TwentyFourSeven', 'lighter', 5),
(52, 'RobsLiquor', 'lighter', 5),
(53, 'LTDgasoline', 'lighter', 5),
(54, 'Bar', 'cigarett', 15),
(55, 'Bar', 'lighter', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=62;