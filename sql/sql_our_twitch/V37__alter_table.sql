ALTER TABLE `our_twitch`.`channel_chat` 
ADD COLUMN `channel_id` INT(11) NOT NULL AFTER `delay_between_messages`,
ADD INDEX `fk_channel_chat_channel1_idx` (`channel_id` ASC) VISIBLE;
;

ALTER TABLE `our_twitch`.`channel_chat_message` 
ADD COLUMN `participant_id` INT(11) NOT NULL AFTER `channel_chat_id`,
ADD INDEX `fk_channel_chat_message_participant1_idx` (`participant_id` ASC) VISIBLE;
;

ALTER TABLE `our_twitch`.`channel_stream` 
ADD COLUMN `channel_id` INT(11) NOT NULL AFTER `stream_id`,
ADD INDEX `fk_channel_stream_channel1_idx` (`channel_id` ASC) VISIBLE;
;

ALTER TABLE `our_twitch`.`clip` 
ADD COLUMN `participant_id` INT(11) NOT NULL AFTER `date`,
ADD INDEX `fk_clip_participant1_idx` (`participant_id` ASC) VISIBLE;
;

ALTER TABLE `our_twitch`.`donate` 
ADD COLUMN `user_id` INT(11) NOT NULL AFTER `donate_content_id`,
ADD INDEX `fk_donate_user1_idx` (`user_id` ASC) VISIBLE;
;

ALTER TABLE `our_twitch`.`donate_content` 
ADD COLUMN `channel_id` INT(11) NOT NULL AFTER `animation`,
ADD INDEX `fk_donate_content_channel1_idx` (`channel_id` ASC) VISIBLE;
;

ALTER TABLE `our_twitch`.`report` 
ADD COLUMN `video_id` INT(11) NOT NULL AFTER `stream_id`,
ADD COLUMN `user_id` INT(11) NULL DEFAULT NULL AFTER `video_id`,
ADD INDEX `fk_report_video1_idx` (`video_id` ASC) VISIBLE,
ADD INDEX `fk_report_user1_idx` (`user_id` ASC) VISIBLE;
;

ALTER TABLE `our_twitch`.`video` 
ADD COLUMN `channel_id` INT(11) NOT NULL AFTER `video_id`,
ADD INDEX `fk_video_channel1_idx` (`channel_id` ASC) VISIBLE;
;

ALTER TABLE `our_twitch`.`channel_chat` 
ADD CONSTRAINT `fk_channel_chat_channel1`
  FOREIGN KEY (`channel_id`)
  REFERENCES `our_twitch`.`channel` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `our_twitch`.`channel_chat_message` 
ADD CONSTRAINT `fk_channel_chat_message_participant1`
  FOREIGN KEY (`participant_id`)
  REFERENCES `our_twitch`.`participant` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `our_twitch`.`channel_stream` 
ADD CONSTRAINT `fk_channel_stream_channel1`
  FOREIGN KEY (`channel_id`)
  REFERENCES `our_twitch`.`channel` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `our_twitch`.`clip` 
ADD CONSTRAINT `fk_clip_participant1`
  FOREIGN KEY (`participant_id`)
  REFERENCES `our_twitch`.`participant` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `our_twitch`.`donate` 
ADD CONSTRAINT `fk_donate_user1`
  FOREIGN KEY (`user_id`)
  REFERENCES `our_twitch`.`user` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `our_twitch`.`donate_content` 
ADD CONSTRAINT `fk_donate_content_channel1`
  FOREIGN KEY (`channel_id`)
  REFERENCES `our_twitch`.`channel` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `our_twitch`.`report` 
ADD CONSTRAINT `fk_report_video1`
  FOREIGN KEY (`video_id`)
  REFERENCES `our_twitch`.`video` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_report_user1`
  FOREIGN KEY (`user_id`)
  REFERENCES `our_twitch`.`user` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `our_twitch`.`video` 
ADD CONSTRAINT `fk_video_channel1`
  FOREIGN KEY (`channel_id`)
  REFERENCES `our_twitch`.`channel` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;