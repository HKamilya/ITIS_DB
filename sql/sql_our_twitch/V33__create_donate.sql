CREATE TABLE IF NOT EXISTS `donate` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `sum` DECIMAL(10,2) NULL DEFAULT NULL,
  `date` DATETIME NULL DEFAULT NULL,
  `text` TINYTEXT NULL DEFAULT NULL,
  `stream_id` INT(11) NOT NULL,
  `donate_content_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_donate_stream1_idx` (`stream_id` ASC) VISIBLE,
  INDEX `fk_donate_donate_content1_idx` (`donate_content_id` ASC) VISIBLE,
  CONSTRAINT `fk_donate_donate_content1`
    FOREIGN KEY (`donate_content_id`)
    REFERENCES `twitch`.`donate_content` (`id`),
  CONSTRAINT `fk_donate_stream1`
    FOREIGN KEY (`stream_id`)
    REFERENCES `twitch`.`stream` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;