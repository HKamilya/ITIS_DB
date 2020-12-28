-- MySQL Script generated by MySQL Workbench
-- Mon Dec 28 15:29:51 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema our_twitch
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `our_twitch` ;

-- -----------------------------------------------------
-- Schema our_twitch
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `our_twitch` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `our_twitch`.`site_setting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`site_setting` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`site_setting` (
  `id` INT NOT NULL,
  `theme` ENUM('bright', 'dark') NOT NULL DEFAULT 'bright',
  `language` ENUM('Russian', 'English', 'German') NOT NULL DEFAULT 'English',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `our_twitch`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`user` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`user` (
  `id` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `info` VARCHAR(45) NULL DEFAULT NULL,
  `birthday` DATE NOT NULL,
  `status` ENUM('в сети', 'невидимый', 'не беспокоить') NOT NULL DEFAULT 'в сети',
  `share` TINYINT NOT NULL DEFAULT '1',
  `image` VARCHAR(255) NOT NULL DEFAULT 'default_image.jpg',
  `banner` VARCHAR(255) NULL DEFAULT 'default_banner.jpg',
  `site_setting_id` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  INDEX `fk_user_site_setting_idx` (`site_setting_id` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  CONSTRAINT `fk_user_site_setting`
    FOREIGN KEY (`site_setting_id`)
    REFERENCES `our_twitch`.`site_setting` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `our_twitch`.`channel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`channel` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`channel` (
  `id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  `title` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `our_twitch`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `our_twitch`.`channel_chat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`channel_chat` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`channel_chat` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` ENUM('followers', 'subscribers') NOT NULL,
  `delay_between_messages` INT NULL DEFAULT '0',
  `channel_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_channel_chat_channel1_idx` (`channel_id` ASC) VISIBLE,
  CONSTRAINT `fk_channel_chat_channel1`
    FOREIGN KEY (`channel_id`)
    REFERENCES `our_twitch`.`channel` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `our_twitch`.`follow`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`follow` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`follow` (
  `id` INT NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `our_twitch`.`spectator`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`spectator` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`spectator` (
  `id` INT NOT NULL,
  `channel_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `follow_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_spectator_channel1_idx` (`channel_id` ASC) VISIBLE,
  INDEX `fk_spectator_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_spectator_follow1_idx` (`follow_id` ASC) VISIBLE,
  CONSTRAINT `fk_spectator_channel1`
    FOREIGN KEY (`channel_id`)
    REFERENCES `our_twitch`.`channel` (`id`),
  CONSTRAINT `fk_spectator_follow1`
    FOREIGN KEY (`follow_id`)
    REFERENCES `our_twitch`.`follow` (`id`),
  CONSTRAINT `fk_spectator_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `our_twitch`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `our_twitch`.`channel_chat_message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`channel_chat_message` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`channel_chat_message` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `text` MEDIUMTEXT NULL DEFAULT NULL,
  `date` DATETIME NULL DEFAULT NULL,
  `channel_chat_id` INT NOT NULL,
  `spectator_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_channel_chat_message_channel_chat1_idx` (`channel_chat_id` ASC) VISIBLE,
  INDEX `fk_channel_chat_message_spectator1_idx` (`spectator_id` ASC) VISIBLE,
  CONSTRAINT `fk_channel_chat_message_channel_chat1`
    FOREIGN KEY (`channel_chat_id`)
    REFERENCES `our_twitch`.`channel_chat` (`id`),
  CONSTRAINT `fk_channel_chat_message_spectator1`
    FOREIGN KEY (`spectator_id`)
    REFERENCES `our_twitch`.`spectator` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `our_twitch`.`subscription`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`subscription` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`subscription` (
  `id` INT NOT NULL,
  `spectator_id` INT NOT NULL,
  `date_from` DATETIME NOT NULL,
  `date_to` DATETIME NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `author_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_subscription_spectator1_idx` (`spectator_id` ASC) VISIBLE,
  INDEX `fk_author_id_idx` (`author_id` ASC) VISIBLE,
  CONSTRAINT `fk_author_id`
    FOREIGN KEY (`author_id`)
    REFERENCES `our_twitch`.`spectator` (`id`),
  CONSTRAINT `fk_subscription_spectator1`
    FOREIGN KEY (`spectator_id`)
    REFERENCES `our_twitch`.`spectator` (`id`),
  CONSTRAINT `fk_subscription_subscription1`
    FOREIGN KEY (`author_id`)
    REFERENCES `our_twitch`.`subscription` (`author_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_author_id`
    FOREIGN KEY (`author_id`)
    REFERENCES `our_twitch`.`spectator` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `our_twitch`.`channel_emoticon`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`channel_emoticon` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`channel_emoticon` (
  `id` INT NOT NULL,
  `picture` MEDIUMBLOB NOT NULL,
  `subscription_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_emoticon_subscription1_idx` (`subscription_id` ASC) VISIBLE,
  CONSTRAINT `fk_emoticon_subscription1`
    FOREIGN KEY (`subscription_id`)
    REFERENCES `our_twitch`.`subscription` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`channel_chat_message_emoticon`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`channel_chat_message_emoticon` ;

CREATE TABLE IF NOT EXISTS `mydb`.`channel_chat_message_emoticon` (
  `channel_chat_message_id` INT NOT NULL,
  `emoticon_id` INT NOT NULL,
  INDEX `fk_channel_chat_message_emoticon_channel_chat_message_idx` (`channel_chat_message_id` ASC) VISIBLE,
  INDEX `fk_channel_chat_message_emoticon_emoticon1_idx` (`emoticon_id` ASC) VISIBLE,
  CONSTRAINT `fk_channel_chat_message_emoticon_channel_chat_message`
    FOREIGN KEY (`channel_chat_message_id`)
    REFERENCES `our_twitch`.`channel_chat_message` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_channel_chat_message_emoticon_emoticon1`
    FOREIGN KEY (`emoticon_id`)
    REFERENCES `our_twitch`.`channel_emoticon` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`twitch_emoticon`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`twitch_emoticon` ;

CREATE TABLE IF NOT EXISTS `mydb`.`twitch_emoticon` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `picture` MEDIUMBLOB NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `our_twitch`.`support`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`support` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`support` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_support_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_support_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `our_twitch`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `our_twitch`.`support_chat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`support_chat` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`support_chat` (
  `id` INT NOT NULL,
  `support_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_chat_support_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_chat_support_support1_idx` (`support_id` ASC) VISIBLE,
  CONSTRAINT `fk_chat_support_support1`
    FOREIGN KEY (`support_id`)
    REFERENCES `our_twitch`.`support` (`id`),
  CONSTRAINT `fk_chat_support_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `our_twitch`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `our_twitch`.`user_chat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`user_chat` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`user_chat` (
  `id` INT NOT NULL,
  `user_from_id` INT NOT NULL,
  `user_to_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_chat_user_user1_idx` (`user_from_id` ASC) VISIBLE,
  INDEX `fk_chat_user_user2_idx` (`user_to_id` ASC) VISIBLE,
  CONSTRAINT `fk_chat_user_user1`
    FOREIGN KEY (`user_from_id`)
    REFERENCES `our_twitch`.`user` (`id`),
  CONSTRAINT `fk_chat_user_user2`
    FOREIGN KEY (`user_to_id`)
    REFERENCES `our_twitch`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `our_twitch`.`user_chat_message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`user_chat_message` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`user_chat_message` (
  `id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `content` VARCHAR(255) NOT NULL,
  `date` DATETIME NOT NULL,
  `chat_type` INT NOT NULL,
  `chat_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_message_user_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_message_user_chat_user1_idx` (`chat_id` ASC) VISIBLE,
  CONSTRAINT `fk_message_user_chat_support1`
    FOREIGN KEY (`chat_id`)
    REFERENCES `our_twitch`.`support_chat` (`id`),
  CONSTRAINT `fk_message_user_chat_user1`
    FOREIGN KEY (`chat_id`)
    REFERENCES `our_twitch`.`user_chat` (`id`),
  CONSTRAINT `fk_message_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `our_twitch`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`user_chat_message_emoticon`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`user_chat_message_emoticon` ;

CREATE TABLE IF NOT EXISTS `mydb`.`user_chat_message_emoticon` (
  `user_chat_message_id` INT NOT NULL,
  `twitch_emoticon_id` INT NOT NULL,
  INDEX `fk_user_chat_message_emoticon_user_chat_message1_idx` (`user_chat_message_id` ASC) VISIBLE,
  INDEX `fk_user_chat_message_emoticon_twitch_emoticon1_idx` (`twitch_emoticon_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_chat_message_emoticon_user_chat_message1`
    FOREIGN KEY (`user_chat_message_id`)
    REFERENCES `our_twitch`.`user_chat_message` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_chat_message_emoticon_twitch_emoticon1`
    FOREIGN KEY (`twitch_emoticon_id`)
    REFERENCES `mydb`.`twitch_emoticon` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `our_twitch`.`support_chat_message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`support_chat_message` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`support_chat_message` (
  `id` INT NOT NULL,
  `support_id` INT NOT NULL,
  `content` VARCHAR(255) NOT NULL,
  `date` DATETIME NULL DEFAULT NULL,
  `chat_type` INT NOT NULL,
  `chat_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_message_support_support1_idx` (`support_id` ASC) VISIBLE,
  INDEX `fk_message_support_chat_support1_idx` (`chat_id` ASC) VISIBLE,
  CONSTRAINT `fk_message_support_chat_support1`
    FOREIGN KEY (`chat_id`)
    REFERENCES `our_twitch`.`support_chat` (`id`),
  CONSTRAINT `fk_message_support_support1`
    FOREIGN KEY (`support_id`)
    REFERENCES `our_twitch`.`support` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`support_chat_message_emoticon`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`support_chat_message_emoticon` ;

CREATE TABLE IF NOT EXISTS `mydb`.`support_chat_message_emoticon` (
  `support_chat_message_id` INT NOT NULL,
  `twitch_emoticon_id` INT NOT NULL,
  INDEX `fk_support_chat_message_emoticon_support_chat_message1_idx` (`support_chat_message_id` ASC) VISIBLE,
  INDEX `fk_support_chat_message_emoticon_twitch_emoticon1_idx` (`twitch_emoticon_id` ASC) VISIBLE,
  CONSTRAINT `fk_support_chat_message_emoticon_support_chat_message1`
    FOREIGN KEY (`support_chat_message_id`)
    REFERENCES `our_twitch`.`support_chat_message` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_support_chat_message_emoticon_twitch_emoticon1`
    FOREIGN KEY (`twitch_emoticon_id`)
    REFERENCES `mydb`.`twitch_emoticon` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `our_twitch` ;

-- -----------------------------------------------------
-- Table `our_twitch`.`twitch_moderator`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`twitch_moderator` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`twitch_moderator` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `our_twitch`.`ban`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`ban` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`ban` (
  `id` INT NOT NULL,
  `date_from` TIMESTAMP NOT NULL,
  `date_to` TIMESTAMP NOT NULL,
  `twitch_moderator_id` INT NOT NULL,
  `channel_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `twitch_moderator_id_idx` (`twitch_moderator_id` ASC) VISIBLE,
  INDEX `fk_ban_channel1_idx` (`channel_id` ASC) VISIBLE,
  CONSTRAINT `fk_ban_channel1`
    FOREIGN KEY (`channel_id`)
    REFERENCES `our_twitch`.`channel` (`id`),
  CONSTRAINT `twitch_moderator_id`
    FOREIGN KEY (`twitch_moderator_id`)
    REFERENCES `our_twitch`.`twitch_moderator` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `our_twitch`.`bot`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`bot` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`bot` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `functions` TINYTEXT NULL DEFAULT NULL,
  `channel_chat_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_bot_channel_chat1_idx` (`channel_chat_id` ASC) VISIBLE,
  CONSTRAINT `fk_bot_channel_chat1`
    FOREIGN KEY (`channel_chat_id`)
    REFERENCES `our_twitch`.`channel_chat` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `our_twitch`.`video`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`video` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`video` (
  `id` INT NOT NULL,
  `type` INT NOT NULL,
  `channel_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_video_channel1_idx` (`channel_id` ASC) VISIBLE,
  CONSTRAINT `fk_video_channel1`
    FOREIGN KEY (`channel_id`)
    REFERENCES `our_twitch`.`channel` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `our_twitch`.`broadcast_recording`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`broadcast_recording` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`broadcast_recording` (
  `id` INT NOT NULL,
  `content` VARCHAR(255) NOT NULL,
  `title` VARCHAR(20) NOT NULL,
  `view_number` INT NOT NULL DEFAULT '0',
  `date` DATETIME NOT NULL,
  `video_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_broadcast_recording_video1_idx` (`video_id` ASC) VISIBLE,
  CONSTRAINT `fk_broadcast_recording_video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `our_twitch`.`video` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `our_twitch`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`category` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` ENUM('Counter-Strike', 'dota2', 'Among us') NOT NULL,
  `image` MEDIUMBLOB NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `our_twitch`.`channel_chat_message_emoticon`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`channel_chat_message_emoticon` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`channel_chat_message_emoticon` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `channel_chat_message_id` INT(11) NOT NULL,
  `emoticon_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_channel_chat_message_emoticon_channel_chat_message_idx` (`channel_chat_message_id` ASC) VISIBLE,
  INDEX `fk_channel_chat_message_emoticon_emoticon1_idx` (`emoticon_id` ASC) VISIBLE,
  CONSTRAINT `fk_channel_chat_message_emoticon_channel_chat_message`
    FOREIGN KEY (`channel_chat_message_id`)
    REFERENCES `our_twitch`.`channel_chat_message` (`id`),
  CONSTRAINT `fk_channel_chat_message_emoticon_emoticon1`
    FOREIGN KEY (`emoticon_id`)
    REFERENCES `our_twitch`.`emoticon` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `our_twitch`.`channel_moderator`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`channel_moderator` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`channel_moderator` (
  `id` INT NOT NULL,
  `channel_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_moderator_channel1_idx` (`channel_id` ASC) VISIBLE,
  INDEX `fk_channel_moderator_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_channel_moderator_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `our_twitch`.`user` (`id`),
  CONSTRAINT `fk_moderator_channel1`
    FOREIGN KEY (`channel_id`)
    REFERENCES `our_twitch`.`channel` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `our_twitch`.`stream_configuration`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`stream_configuration` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`stream_configuration` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `max_quality` ENUM('360', '480', '720', '1080', '1440', 'ultraHD', '4K') NOT NULL DEFAULT '720',
  `delay` INT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `our_twitch`.`stream`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`stream` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`stream` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `description` TINYTEXT NULL DEFAULT NULL,
  `stream_configuration_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  `date_from` DATETIME NOT NULL,
  `date_to` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_stream_stream_configuration_idx` (`stream_configuration_id` ASC) VISIBLE,
  INDEX `fk_stream_category1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_stream_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `our_twitch`.`category` (`id`),
  CONSTRAINT `fk_stream_stream_configuration`
    FOREIGN KEY (`stream_configuration_id`)
    REFERENCES `our_twitch`.`stream_configuration` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `our_twitch`.`channel_stream`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`channel_stream` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`channel_stream` (
  `id` INT NOT NULL,
  `stream_id` INT NOT NULL,
  `channel_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_channel_stream_stream1_idx` (`stream_id` ASC) VISIBLE,
  INDEX `fk_channel_stream_channel1_idx` (`channel_id` ASC) VISIBLE,
  CONSTRAINT `fk_channel_stream_channel1`
    FOREIGN KEY (`channel_id`)
    REFERENCES `our_twitch`.`channel` (`id`),
  CONSTRAINT `fk_channel_stream_stream1`
    FOREIGN KEY (`stream_id`)
    REFERENCES `our_twitch`.`stream` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `our_twitch`.`clip`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`clip` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`clip` (
  `id` INT NOT NULL,
  `content` VARCHAR(255) NOT NULL,
  `title` VARCHAR(20) NOT NULL,
  `views_number` INT NOT NULL DEFAULT '0',
  `date` DATETIME NOT NULL,
  `video_id` INT NOT NULL,
  `broadcast_recording_id` INT NOT NULL,
  `spectator_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_clip_video1_idx` (`video_id` ASC) VISIBLE,
  INDEX `fk_clip_broadcast_recording1_idx` (`broadcast_recording_id` ASC) VISIBLE,
  INDEX `fk_clip_spectator1_idx` (`spectator_id` ASC) VISIBLE,
  CONSTRAINT `fk_clip_broadcast_recording1`
    FOREIGN KEY (`broadcast_recording_id`)
    REFERENCES `our_twitch`.`broadcast_recording` (`id`),
  CONSTRAINT `fk_clip_video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `our_twitch`.`video` (`id`),
  CONSTRAINT `fk_clip_spectator1`
    FOREIGN KEY (`spectator_id`)
    REFERENCES `our_twitch`.`spectator` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `our_twitch`.`donate_content`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`donate_content` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`donate_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `music` MEDIUMBLOB NULL DEFAULT NULL,
  `animation` MEDIUMBLOB NULL DEFAULT NULL,
  `channel_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_donate_content_channel1_idx` (`channel_id` ASC) VISIBLE,
  CONSTRAINT `fk_donate_content_channel1`
    FOREIGN KEY (`channel_id`)
    REFERENCES `our_twitch`.`channel` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `our_twitch`.`donate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`donate` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`donate` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sum` DECIMAL(10,2) NULL DEFAULT NULL,
  `date` DATETIME NULL DEFAULT NULL,
  `text` TINYTEXT NULL DEFAULT NULL,
  `stream_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `donate_content_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_donate_stream1_idx` (`stream_id` ASC) VISIBLE,
  INDEX `fk_donate_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_donate_donate_content1_idx` (`donate_content_id` ASC) VISIBLE,
  CONSTRAINT `fk_donate_donate_content1`
    FOREIGN KEY (`donate_content_id`)
    REFERENCES `our_twitch`.`donate_content` (`id`),
  CONSTRAINT `fk_donate_stream1`
    FOREIGN KEY (`stream_id`)
    REFERENCES `our_twitch`.`stream` (`id`),
  CONSTRAINT `fk_donate_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `our_twitch`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `our_twitch`.`flyway_schema_history`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`flyway_schema_history` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`flyway_schema_history` (
  `installed_rank` INT NOT NULL,
  `version` VARCHAR(50) NULL DEFAULT NULL,
  `description` VARCHAR(200) NOT NULL,
  `type` VARCHAR(20) NOT NULL,
  `script` VARCHAR(1000) NOT NULL,
  `checksum` INT NULL DEFAULT NULL,
  `installed_by` VARCHAR(100) NOT NULL,
  `installed_on` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` INT NOT NULL,
  `success` TINYINT(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  INDEX `flyway_schema_history_s_idx` (`success` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `our_twitch`.`friend`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`friend` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`friend` (
  `id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `user_friend_id` INT NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_friend_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_friend_user2_idx` (`user_friend_id` ASC) VISIBLE,
  CONSTRAINT `fk_friend_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `our_twitch`.`user` (`id`),
  CONSTRAINT `fk_friend_user2`
    FOREIGN KEY (`user_friend_id`)
    REFERENCES `our_twitch`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `our_twitch`.`participant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`participant` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`participant` (
  `id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  `type_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `our_twitch`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `our_twitch`.`moderator`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`moderator` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`moderator` (
  `id` INT(11) NOT NULL,
  `participant_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `participant_id`),
  INDEX `fk_moderator_participant1_idx` (`participant_id` ASC) VISIBLE,
  CONSTRAINT `fk_moderator_participant1`
    FOREIGN KEY (`participant_id`)
    REFERENCES `our_twitch`.`participant` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `our_twitch`.`voting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`voting` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`voting` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NULL DEFAULT NULL,
  `status` ENUM('open', 'completed') NOT NULL,
  `channel_chat_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_voting_channel_chat1_idx` (`channel_chat_id` ASC) VISIBLE,
  CONSTRAINT `fk_voting_channel_chat1`
    FOREIGN KEY (`channel_chat_id`)
    REFERENCES `our_twitch`.`channel_chat` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `our_twitch`.`option`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`option` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`option` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `voters_number` INT NULL DEFAULT NULL,
  `voting_id` INT NOT NULL,
  `win` ENUM('yes', 'no') NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_option_voting1_idx` (`voting_id` ASC) VISIBLE,
  CONSTRAINT `fk_option_voting1`
    FOREIGN KEY (`voting_id`)
    REFERENCES `our_twitch`.`voting` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `our_twitch`.`report`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`report` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`report` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `reason` ENUM('sexual content', 'racism') NOT NULL,
  `description` TINYTEXT NULL DEFAULT NULL,
  `date` DATETIME NULL DEFAULT NULL,
  `stream_id` INT NULL,
  `video_id` INT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_report_stream1_idx` (`stream_id` ASC) VISIBLE,
  INDEX `fk_report_video1_idx` (`video_id` ASC) VISIBLE,
  INDEX `fk_report_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_report_stream1`
    FOREIGN KEY (`stream_id`)
    REFERENCES `our_twitch`.`stream` (`id`),
  CONSTRAINT `fk_report_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `our_twitch`.`user` (`id`),
  CONSTRAINT `fk_report_video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `our_twitch`.`video` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `our_twitch`.`subscription_emoticon`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`subscription_emoticon` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`subscription_emoticon` (
  `subscription_id` INT(11) NOT NULL,
  `emoticon_id` INT(11) NOT NULL,
  INDEX `subcription_id_idx` (`subscription_id` ASC) VISIBLE,
  INDEX `emoticon_id_idx` (`emoticon_id` ASC) VISIBLE,
  CONSTRAINT `emoticon_id`
    FOREIGN KEY (`emoticon_id`)
    REFERENCES `our_twitch`.`emoticon` (`id`),
  CONSTRAINT `subcription_id`
    FOREIGN KEY (`subscription_id`)
    REFERENCES `our_twitch`.`subscription` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `our_twitch`.`type_of_limitation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`type_of_limitation` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`type_of_limitation` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `our_twitch`.`user_limitation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `our_twitch`.`user_limitation` ;

CREATE TABLE IF NOT EXISTS `our_twitch`.`user_limitation` (
  `type_id` INT NOT NULL,
  `id` INT NOT NULL,
  `date_from` TIMESTAMP NOT NULL,
  `date_to` TIMESTAMP NOT NULL,
  `spectator_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `type_id_idx` (`type_id` ASC) VISIBLE,
  INDEX `fk_user_limitation_spectator1_idx` (`spectator_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_limitation_spectator1`
    FOREIGN KEY (`spectator_id`)
    REFERENCES `our_twitch`.`spectator` (`id`),
  CONSTRAINT `type_id`
    FOREIGN KEY (`type_id`)
    REFERENCES `our_twitch`.`type_of_limitation` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;