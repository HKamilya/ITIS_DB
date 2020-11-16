CREATE TABLE `message_support` (
  `id` int NOT NULL,
  `support_id` int NOT NULL,
  `content` varchar(255) NOT NULL,
  `date` datetime DEFAULT NULL,
  `chat_type` int NOT NULL,
  `chat_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_message_support_support1_idx` (`support_id`),
  KEY `fk_message_support_chat_support1_idx` (`chat_id`),
  CONSTRAINT `fk_message_support_chat_support1` FOREIGN KEY (`chat_id`) REFERENCES `chat_support` (`id`),
  CONSTRAINT `fk_message_support_support1` FOREIGN KEY (`support_id`) REFERENCES `support` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
