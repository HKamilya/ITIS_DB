CREATE TABLE IF NOT EXISTS `channel_chat_message_smile` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `channel_chat_message_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_channel_chat_message_smile_channel_chat_message1_idx` (`channel_chat_message_id` ASC) VISIBLE,
  CONSTRAINT `fk_channel_chat_message_smile_channel_chat_message1`
    FOREIGN KEY (`channel_chat_message_id`)
    REFERENCES `twitch`.`channel_chat_message` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;