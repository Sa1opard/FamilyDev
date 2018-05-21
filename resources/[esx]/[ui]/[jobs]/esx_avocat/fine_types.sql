CREATE TABLE `fine_types_avocat` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `fine_types_avocat` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Civil : simple visite', 250, 1),

INSERT INTO `addon_inventory` (`id`, `name`, `label`, `shared`) VALUES
(6, 'society_avocat', 'Avocat', 1);

ALTER TABLE `fine_types_avocat`
  ADD PRIMARY KEY (`id`);