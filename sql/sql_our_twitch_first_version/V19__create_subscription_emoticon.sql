CREATE TABLE `subscription_emoticon` (
  `subscription_id` int NOT NULL,
  `emoticon_id` int NOT NULL,
  KEY `subcription_id_idx` (`subscription_id`),
  KEY `emoticon_id_idx` (`emoticon_id`),
  CONSTRAINT `emoticon_id` FOREIGN KEY (`emoticon_id`) REFERENCES `emoticon` (`id`),
  CONSTRAINT `subcription_id` FOREIGN KEY (`subscription_id`) REFERENCES `subscription` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;