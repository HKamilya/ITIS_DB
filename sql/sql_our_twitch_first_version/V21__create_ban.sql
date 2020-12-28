CREATE TABLE `ban` (
  `id` int NOT NULL,
  `date_from` timestamp NULL DEFAULT NULL,
  `date_to` timestamp NULL DEFAULT NULL,
  `twitch_moderator_id` int DEFAULT NULL,
  `channel_id` int NOT NULL,
  PRIMARY KEY (`id`,`channel_id`),
  KEY `twitch_moderator_id_idx` (`twitch_moderator_id`),
  KEY `fk_ban_chanel1_idx` (`channel_id`),
  CONSTRAINT `fk_ban_chanel1` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`id`),
  CONSTRAINT `twitch_moderator_id` FOREIGN KEY (`twitch_moderator_id`) REFERENCES `twitch_moderator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;