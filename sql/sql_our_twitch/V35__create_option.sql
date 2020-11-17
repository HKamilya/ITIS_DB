CREATE TABLE IF NOT EXISTS `option` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `voters_number` INT(11) NULL DEFAULT NULL,
  `voting_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_option_voting1_idx` (`voting_id` ASC) VISIBLE,
  CONSTRAINT `fk_option_voting1`
    FOREIGN KEY (`voting_id`)
    REFERENCES `voting` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;