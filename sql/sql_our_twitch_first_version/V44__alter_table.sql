ALTER TABLE `our_twitch`.`participant` 
ADD COLUMN `channel_id` INT NULL AFTER `type_id`,
ADD INDEX `channel_id_idx` (`channel_id` ASC) VISIBLE;
;
ALTER TABLE `our_twitch`.`participant` 
ADD CONSTRAINT `channel_id`
  FOREIGN KEY (`channel_id`)
  REFERENCES `our_twitch`.`channel` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;