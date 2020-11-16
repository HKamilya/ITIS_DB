CREATE TABLE `moderator` (
  `id` int NOT NULL,
  `participant_id` int NOT NULL,
  PRIMARY KEY (`id`,`participant_id`),
  KEY `fk_moderator_participant1_idx` (`participant_id`),
  CONSTRAINT `fk_moderator_participant1` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;