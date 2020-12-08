-- MySQL Workbench Synchronization
-- Generated: 2020-12-08 20:05
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: gipot

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `our_twitch`.`ban` 
DROP FOREIGN KEY `twitch_moderator_id`,
DROP FOREIGN KEY `fk_ban_chanel1`;

ALTER TABLE `our_twitch`.`channel` 
DROP FOREIGN KEY `fk_user_id`;

ALTER TABLE `our_twitch`.`channel_chat` 
DROP FOREIGN KEY `fk_channel_chat_channel1`;

ALTER TABLE `our_twitch`.`channel_chat_message` 
DROP FOREIGN KEY `fk_channel_chat_message_participant1`;

ALTER TABLE `our_twitch`.`clip` 
DROP FOREIGN KEY `fk_clip_participant1`;

ALTER TABLE `our_twitch`.`moderator` 
DROP FOREIGN KEY `fk_moderator_participant1`;

ALTER TABLE `our_twitch`.`spectator` 
DROP FOREIGN KEY `fk_spectator_follow1`,
DROP FOREIGN KEY `fk_spectator_participant1`;

ALTER TABLE `our_twitch`.`subscription` 
DROP FOREIGN KEY `fk_subscription_spectator1`;

ALTER TABLE `our_twitch`.`user_limitation` 
DROP FOREIGN KEY `spectator_id`;

ALTER TABLE `our_twitch`.`video` 
DROP FOREIGN KEY `fk_video_clip1`,
DROP FOREIGN KEY `fk_video_broadcast_recording1`;

ALTER TABLE `our_twitch`.`ban` 
CHANGE COLUMN `date_from` `date_from` TIMESTAMP NOT NULL ,
CHANGE COLUMN `date_to` `date_to` TIMESTAMP NOT NULL ,
CHANGE COLUMN `twitch_moderator_id` `twitch_moderator_id` INT(11) NOT NULL ,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`id`),
ADD INDEX `fk_ban_channel1_idx` (`channel_id` ASC) VISIBLE,
DROP INDEX `fk_ban_chanel1_idx` ;
;

ALTER TABLE `our_twitch`.`broadcast_recording` 
ADD COLUMN `video_id` INT(11) NOT NULL AFTER `date`,
ADD INDEX `fk_broadcast_recording_video1_idx` (`video_id` ASC) VISIBLE;
;

ALTER TABLE `our_twitch`.`channel` 
ADD COLUMN `title` VARCHAR(45) NOT NULL AFTER `description`,
CHANGE COLUMN `user_id` `user_id` INT(11) NOT NULL ;

ALTER TABLE `our_twitch`.`channel_chat` 
ADD INDEX `fk_channel_chat_channel1_idx` (`channel_id` ASC) VISIBLE,
DROP INDEX `fk_channel_chat_channel1_idx` ;
;

ALTER TABLE `our_twitch`.`channel_chat_message` 
DROP COLUMN `participant_id`,
ADD COLUMN `spectator_id` INT(11) NOT NULL AFTER `channel_chat_id`,
CHANGE COLUMN `text` `text` MEDIUMTEXT NULL DEFAULT NULL ,
ADD INDEX `fk_channel_chat_message_spectator1_idx` (`spectator_id` ASC) VISIBLE,
DROP INDEX `fk_channel_chat_message_participant1_idx` ;
;

ALTER TABLE `our_twitch`.`clip` 
ADD COLUMN `video_id` INT(11) NOT NULL AFTER `participant_id`,
ADD COLUMN `broadcast_recording_id` INT(11) NOT NULL AFTER `video_id`,
ADD INDEX `fk_clip_video1_idx` (`video_id` ASC) VISIBLE,
ADD INDEX `fk_clip_broadcast_recording1_idx` (`broadcast_recording_id` ASC) VISIBLE,
DROP INDEX `fk_clip_participant1_idx` ;
;

ALTER TABLE `our_twitch`.`donate` 
CHANGE COLUMN `user_id` `user_id` INT(11) NOT NULL AFTER `stream_id`,
ADD INDEX `fk_donate_donate_content1_idx` (`donate_content_id` ASC) VISIBLE,
DROP INDEX `fk_donate_donate_content1_idx` ;
;

ALTER TABLE `our_twitch`.`emoticon` 
ADD COLUMN `subscription_id` INT(11) NOT NULL AFTER `picture`,
ADD INDEX `fk_emoticon_subscription1_idx` (`subscription_id` ASC) VISIBLE;
;

ALTER TABLE `our_twitch`.`follow` 
ADD COLUMN `date` DATE NOT NULL AFTER `id`;

ALTER TABLE `our_twitch`.`moderator` 
DROP COLUMN `participant_id`,
ADD COLUMN `channel_id` INT(11) NOT NULL AFTER `id`,
ADD COLUMN `user_id` INT(11) NOT NULL AFTER `channel_id`,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`id`),
ADD INDEX `fk_moderator_channel1_idx` (`channel_id` ASC) VISIBLE,
ADD INDEX `fk_channel_moderator_user1_idx` (`user_id` ASC) VISIBLE,
DROP INDEX `fk_moderator_participant1_idx` ;
, RENAME TO  `our_twitch`.`channel_moderator` ;

ALTER TABLE `our_twitch`.`option` 
ADD COLUMN `win` ENUM('yes', 'no') NULL DEFAULT NULL AFTER `voting_id`;

ALTER TABLE `our_twitch`.`site_setting` 
CHANGE COLUMN `theme` `theme` ENUM('bright', 'dark') NOT NULL DEFAULT 'bright' ,
CHANGE COLUMN `language` `language` ENUM('Russian', 'English', 'German') NOT NULL DEFAULT 'English' ;

ALTER TABLE `our_twitch`.`spectator` 
DROP COLUMN `participant_id`,
ADD COLUMN `channel_id` INT(11) NOT NULL AFTER `id`,
ADD COLUMN `user_id` INT(11) NOT NULL AFTER `channel_id`,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`id`),
ADD INDEX `fk_spectator_channel1_idx` (`channel_id` ASC) VISIBLE,
ADD INDEX `fk_spectator_user1_idx` (`user_id` ASC) VISIBLE,
ADD INDEX `fk_spectator_follow1_idx` (`follow_id` ASC) VISIBLE,
DROP INDEX `fk_spectator_participant1_idx` ,
DROP INDEX `fk_spectator_follow1_idx` ;
;

ALTER TABLE `our_twitch`.`subscription` 
DROP COLUMN `spectator_id`,
ADD COLUMN `spectator_id` INT(11) NOT NULL AFTER `id`,
ADD COLUMN `date_from` DATETIME NOT NULL AFTER `spectator_id`,
ADD COLUMN `date_to` DATETIME NOT NULL AFTER `date_from`,
ADD COLUMN `price` DECIMAL(10,2) NOT NULL AFTER `date_to`,
ADD COLUMN `author_id` INT(11) NULL DEFAULT NULL AFTER `price`,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`id`),
ADD INDEX `fk_subscription_spectator1_idx` (`spectator_id` ASC) VISIBLE,
ADD INDEX `fk_author_id_idx` (`author_id` ASC) VISIBLE,
DROP INDEX `fk_subscription_spectator1_idx` ;
;

ALTER TABLE `our_twitch`.`twitch_moderator` 
CHANGE COLUMN `name` `name` VARCHAR(45) NOT NULL ;

ALTER TABLE `our_twitch`.`user` 
ADD COLUMN `email` VARCHAR(45) NOT NULL AFTER `site_setting_id`,
CHANGE COLUMN `birthday` `birthday` DATE NOT NULL ,
CHANGE COLUMN `status` `status` ENUM('в сети', 'невидимый', 'не беспокоить') NOT NULL DEFAULT 'в сети' ,
CHANGE COLUMN `share` `share` TINYINT(4) NOT NULL DEFAULT '1' ,
CHANGE COLUMN `banner` `banner` VARCHAR(255) NOT NULL DEFAULT 'default_banner.jpg' ,
ADD UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE;
;

ALTER TABLE `our_twitch`.`user_limitation` 
ADD COLUMN `id` INT(11) NOT NULL AFTER `spectator_id`,
CHANGE COLUMN `spectator_id` `spectator_id` INT(11) NOT NULL AFTER `date_to`,
ADD INDEX `fk_user_limitation_spectator1_idx` (`spectator_id` ASC) VISIBLE,
ADD PRIMARY KEY (`id`),
DROP INDEX `spectator_id_idx` ;
;

ALTER TABLE `our_twitch`.`video` 
DROP COLUMN `video_id`,
DROP INDEX `fk_video_clip1_idx` ;
;

ALTER TABLE `our_twitch`.`voting` 
DROP COLUMN `winning_option_id`;

DROP TABLE IF EXISTS `our_twitch`.`subscription_emoticon` ;

DROP TABLE IF EXISTS `our_twitch`.`participant` ;

DROP TABLE IF EXISTS `our_twitch`.`channel_chat_message_emoticon` ;

ALTER TABLE `our_twitch`.`ban` 
ADD CONSTRAINT `twitch_moderator_id`
  FOREIGN KEY (`twitch_moderator_id`)
  REFERENCES `our_twitch`.`twitch_moderator` (`id`),
ADD CONSTRAINT `fk_ban_channel1`
  FOREIGN KEY (`channel_id`)
  REFERENCES `our_twitch`.`channel` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `our_twitch`.`broadcast_recording` 
ADD CONSTRAINT `fk_broadcast_recording_video1`
  FOREIGN KEY (`video_id`)
  REFERENCES `our_twitch`.`video` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `our_twitch`.`channel` 
ADD CONSTRAINT `fk_user_id`
  FOREIGN KEY (`user_id`)
  REFERENCES `our_twitch`.`user` (`id`);

ALTER TABLE `our_twitch`.`channel_chat` 
ADD CONSTRAINT `fk_channel_chat_channel1`
  FOREIGN KEY (`channel_id`)
  REFERENCES `our_twitch`.`channel` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `our_twitch`.`channel_chat_message` 
ADD CONSTRAINT `fk_channel_chat_message_spectator1`
  FOREIGN KEY (`spectator_id`)
  REFERENCES `our_twitch`.`spectator` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `our_twitch`.`clip` 
ADD CONSTRAINT `fk_clip_video1`
  FOREIGN KEY (`video_id`)
  REFERENCES `our_twitch`.`video` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_clip_broadcast_recording1`
  FOREIGN KEY (`broadcast_recording_id`)
  REFERENCES `our_twitch`.`broadcast_recording` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `our_twitch`.`donate` 
DROP FOREIGN KEY `fk_donate_donate_content1`;

ALTER TABLE `our_twitch`.`donate` ADD CONSTRAINT `fk_donate_donate_content1`
  FOREIGN KEY (`donate_content_id`)
  REFERENCES `our_twitch`.`donate_content` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `our_twitch`.`emoticon` 
ADD CONSTRAINT `fk_emoticon_subscription1`
  FOREIGN KEY (`subscription_id`)
  REFERENCES `our_twitch`.`subscription` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `our_twitch`.`moderator` 
ADD CONSTRAINT `fk_moderator_channel1`
  FOREIGN KEY (`channel_id`)
  REFERENCES `our_twitch`.`channel` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_channel_moderator_user1`
  FOREIGN KEY (`user_id`)
  REFERENCES `our_twitch`.`user` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `our_twitch`.`spectator` 
ADD CONSTRAINT `fk_spectator_channel1`
  FOREIGN KEY (`channel_id`)
  REFERENCES `our_twitch`.`channel` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_spectator_user1`
  FOREIGN KEY (`user_id`)
  REFERENCES `our_twitch`.`user` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_spectator_follow1`
  FOREIGN KEY (`follow_id`)
  REFERENCES `our_twitch`.`follow` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `our_twitch`.`subscription` 
ADD CONSTRAINT `fk_subscription_spectator1`
  FOREIGN KEY (`spectator_id`)
  REFERENCES `our_twitch`.`spectator` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_author_id`
  FOREIGN KEY (`author_id`)
  REFERENCES `our_twitch`.`spectator` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `our_twitch`.`user_limitation` 
ADD CONSTRAINT `fk_user_limitation_spectator1`
  FOREIGN KEY (`spectator_id`)
  REFERENCES `our_twitch`.`spectator` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
