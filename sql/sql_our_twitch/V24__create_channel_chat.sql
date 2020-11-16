CREATE TABLE IF NOT EXISTS `channel_chat` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `type` ENUM('followers', 'subscribers') NOT NULL,
  `delay_between_messages` INT(11) NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;