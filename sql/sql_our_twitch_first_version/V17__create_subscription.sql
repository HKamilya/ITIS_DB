CREATE TABLE `subscription` (
  `id` int NOT NULL,
  `spectator_id` int NOT NULL,
  PRIMARY KEY (`id`,`spectator_id`),
  KEY `fk_subscription_spectator1_idx` (`spectator_id`),
  CONSTRAINT `fk_subscription_spectator1` FOREIGN KEY (`spectator_id`) REFERENCES `spectator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;