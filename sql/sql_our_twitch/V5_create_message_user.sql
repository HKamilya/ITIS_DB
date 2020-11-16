CREATE TABLE `message_user` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `content` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `chat_type` int NOT NULL,
  `chat_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_message_user_user1_idx` (`user_id`),
  KEY `fk_message_user_chat_user1_idx` (`chat_id`),
  CONSTRAINT `fk_message_user_chat_support1` FOREIGN KEY (`chat_id`) REFERENCES `chat_support` (`id`),
  CONSTRAINT `fk_message_user_chat_user1` FOREIGN KEY (`chat_id`) REFERENCES `chat_user` (`id`),
  CONSTRAINT `fk_message_user_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

