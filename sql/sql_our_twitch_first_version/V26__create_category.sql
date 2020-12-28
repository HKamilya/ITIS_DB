CREATE TABLE IF NOT EXISTS `category` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` ENUM('Counter-Strike', 'dota2', 'Among us') NOT NULL,
  `image` MEDIUMBLOB NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;