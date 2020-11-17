ALTER TABLE `our_twitch`.`channel_chat_message_smile` 
ADD COLUMN `emoticon_id` INT(11) NOT NULL AFTER `channel_chat_message_id`,
ADD INDEX `fk_channel_chat_message_emoticon_emoticon1_idx` (`emoticon_id` ASC) VISIBLE;
, RENAME TO  `our_twitch`.`channel_chat_message_emoticon` ;

ALTER TABLE `our_twitch`.`channel_chat_message_smile` 
ADD CONSTRAINT `fk_channel_chat_message_emoticon_emoticon1`
  FOREIGN KEY (`emoticon_id`)
  REFERENCES `our_twitch`.`emoticon` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
