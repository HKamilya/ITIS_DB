CREATE TABLE `chat_support` (
  `id` int NOT NULL,
  `support_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_chat_support_user1_idx` (`user_id`),
  KEY `fk_chat_support_support1_idx` (`support_id`),
  CONSTRAINT `fk_chat_support_support1` FOREIGN KEY (`support_id`) REFERENCES `support` (`id`),
  CONSTRAINT `fk_chat_support_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
