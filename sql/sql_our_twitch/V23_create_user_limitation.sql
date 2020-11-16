CREATE TABLE `user_limitation` (
  `type_id` int NOT NULL,
  `spectator_id` int DEFAULT NULL,
  `date_from` timestamp NULL DEFAULT NULL,
  `date_to` timestamp NULL DEFAULT NULL,
  KEY `spectator_id_idx` (`spectator_id`),
  KEY `type_id_idx` (`type_id`),
  CONSTRAINT `spectator_id` FOREIGN KEY (`spectator_id`) REFERENCES `spectator` (`id`),
  CONSTRAINT `type_id` FOREIGN KEY (`type_id`) REFERENCES `type_of_limitation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;