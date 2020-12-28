CREATE TABLE `chat_user` (
  `id` int NOT NULL,
  `user_from_id` int NOT NULL,
  `user_to_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_chat_user_user1_idx` (`user_from_id`),
  KEY `fk_chat_user_user2_idx` (`user_to_id`),
  CONSTRAINT `fk_chat_user_user1` FOREIGN KEY (`user_from_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_chat_user_user2` FOREIGN KEY (`user_to_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
