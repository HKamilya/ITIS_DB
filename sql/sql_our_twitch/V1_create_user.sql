CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `info` varchar(45) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `status` enum('в сети','невидимый','Не беспокоить') DEFAULT 'в сети',
  `share` tinyint DEFAULT '1',
  `image` varchar(255) NOT NULL DEFAULT 'default_image.jpg',
  `banner` varchar(255) DEFAULT 'default_banner.jpg',
  `site_setting_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `fk_user_site_setting_idx` (`site_setting_id`),
  CONSTRAINT `fk_user_site_setting` FOREIGN KEY (`site_setting_id`) REFERENCES `site_setting` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
