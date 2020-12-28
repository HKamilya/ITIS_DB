CREATE TABLE IF NOT EXISTS `stream_configuration` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `max_quality` ENUM('360', '480', '720', '1080', '1440', 'ultraHD', '4K') NOT NULL DEFAULT '720',
  `delay` INT(11) NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
