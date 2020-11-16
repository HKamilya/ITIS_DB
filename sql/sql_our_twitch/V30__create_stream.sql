CREATE TABLE IF NOT EXISTS `stream` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `description` TINYTEXT NULL DEFAULT NULL,
  `stream_configuration_id` INT(11) NOT NULL,
  `category_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_stream_stream_configuration_idx` (`stream_configuration_id` ASC) VISIBLE,
  INDEX `fk_stream_category1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_stream_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `twitch`.`category` (`id`),
  CONSTRAINT `fk_stream_stream_configuration`
    FOREIGN KEY (`stream_configuration_id`)
    REFERENCES `twitch`.`stream_configuration` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;