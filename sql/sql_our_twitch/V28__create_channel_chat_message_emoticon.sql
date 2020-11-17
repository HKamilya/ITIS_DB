CREATE TABLE IF NOT EXISTS `channel_chat_message_emoticon` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `channel_chat_message_id` INT(11) NOT NULL,
  `emoticon_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_channel_chat_message_emoticon_channel_chat_message_idx` (`channel_chat_message_id` ASC) VISIBLE,
  INDEX `fk_channel_chat_message_emoticon_emoticon1_idx` (`emoticon_id` ASC) VISIBLE,
  CONSTRAINT `fk_channel_chat_message_emoticon_channel_chat_message`
    FOREIGN KEY (`channel_chat_message_id`)
    REFERENCES `our_twitch`.`channel_chat_message` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_channel_chat_message_emoticon_emoticon1`
    FOREIGN KEY (`emoticon_id`)
    REFERENCES `our_twitch`.`emoticon` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `our_twitch` ;