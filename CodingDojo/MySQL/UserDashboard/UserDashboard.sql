-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema userdashboard_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema userdashboard_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `userdashboard_db` DEFAULT CHARACTER SET utf8 ;
USE `userdashboard_db` ;

-- -----------------------------------------------------
-- Table `userdashboard_db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `userdashboard_db`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `user_level` INT NOT NULL,
  `description` TEXT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `update_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `userdashboard_db`.`messages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `userdashboard_db`.`messages` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `message` TEXT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `update_at` DATETIME NOT NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_messages_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_messages_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `userdashboard_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `userdashboard_db`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `userdashboard_db`.`comments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment` TEXT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `update_at` DATETIME NOT NULL,
  `users_id` INT NOT NULL,
  `messages_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comments_users_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_comments_messages1_idx` (`messages_id` ASC) VISIBLE,
  CONSTRAINT `fk_comments_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `userdashboard_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_messages1`
    FOREIGN KEY (`messages_id`)
    REFERENCES `userdashboard_db`.`messages` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
