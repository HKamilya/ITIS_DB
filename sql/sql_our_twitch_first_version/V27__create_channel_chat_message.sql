CREATE TABLE IF NOT EXISTS `channel_chat_message` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(45) NULL DEFAULT NULL,
  `date` DATETIME NULL DEFAULT NULL,
  `channel_chat_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_channel_chat_message_channel_chat1_idx` (`channel_chat_id` ASC) VISIBLE,
  CONSTRAINT `fk_channel_chat_message_channel_chat1`
    FOREIGN KEY (`channel_chat_id`)
    REFERENCES `channel_chat` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;