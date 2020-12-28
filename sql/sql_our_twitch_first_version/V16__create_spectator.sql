CREATE TABLE `spectator` (
  `id` int NOT NULL,
  `follow_id` int NOT NULL,
  `participant_id` int NOT NULL,
  PRIMARY KEY (`id`,`follow_id`,`participant_id`),
  KEY `fk_spectator_follow1_idx` (`follow_id`),
  KEY `fk_spectator_participant1_idx` (`participant_id`),
  CONSTRAINT `fk_spectator_follow1` FOREIGN KEY (`follow_id`) REFERENCES `follow` (`id`),
  CONSTRAINT `fk_spectator_participant1` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;