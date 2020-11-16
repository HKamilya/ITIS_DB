CREATE TABLE `clip` (
`id` int NOT NULL,
`content` varchar(255) NOT NULL,
`title` varchar(20) NOT NULL,
`views_number` int NOT NULL DEFAULT '0',
`date` datetime NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
