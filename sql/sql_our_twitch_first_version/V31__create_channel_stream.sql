CREATE TABLE IF NOT EXISTS `channel_stream` (
  `id` INT(11) NOT NULL,
  `stream_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_channel_stream_stream1_idx` (`stream_id` ASC) VISIBLE,
  CONSTRAINT `fk_channel_stream_stream1`
    FOREIGN KEY (`stream_id`)
    REFERENCES `stream` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;