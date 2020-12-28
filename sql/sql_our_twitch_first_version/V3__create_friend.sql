CREATE TABLE `friend` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `user_friend_id` int NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_friend_user1_idx` (`user_id`),
  KEY `fk_friend_user2_idx` (`user_friend_id`),
  CONSTRAINT `fk_friend_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_friend_user2` FOREIGN KEY (`user_friend_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
