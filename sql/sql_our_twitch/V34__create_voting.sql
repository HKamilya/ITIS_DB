CREATE TABLE IF NOT EXISTS `voting` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `winning_option_id` INT(11) NULL DEFAULT NULL,
  `date` DATETIME NULL DEFAULT NULL,
  `status` ENUM('open', 'completed') NOT NULL,
  `channel_chat_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_voting_channel_chat1_idx` (`channel_chat_id` ASC) VISIBLE,
  CONSTRAINT `fk_voting_channel_chat1`
    FOREIGN KEY (`channel_chat_id`)
    REFERENCES `channel_chat` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;