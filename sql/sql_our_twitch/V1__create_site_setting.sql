CREATE TABLE `site_setting` (
  `id` int NOT NULL,
  `theme` varchar(45) NOT NULL DEFAULT '1',
  `language` varchar(25) DEFAULT 'English',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
