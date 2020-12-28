CREATE TABLE IF NOT EXISTS `report` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `reason` ENUM('sexual content', 'racism') NOT NULL,
  `description` TINYTEXT NULL DEFAULT NULL,
  `date` DATETIME NULL DEFAULT NULL,
  `stream_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_report_stream1_idx` (`stream_id` ASC) VISIBLE,
  CONSTRAINT `fk_report_stream1`
    FOREIGN KEY (`stream_id`)
    REFERENCES `stream` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;