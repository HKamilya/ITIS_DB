CREATE TABLE `video` (
  `id` int NOT NULL,
  `type` int NOT NULL,
  `channel_id` int NOT NULL,
  `video_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_video_broadcast_recording1_idx` (`video_id`),
  CONSTRAINT `fk_video_broadcast_recording1` FOREIGN KEY (`video_id`) REFERENCES `broadcast_recording` (`id`),
  CONSTRAINT `fk_video_clip1` FOREIGN KEY (`video_id`) REFERENCES `clip` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
