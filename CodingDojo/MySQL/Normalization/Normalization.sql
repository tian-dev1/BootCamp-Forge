-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema normalization_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema normalization_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `normalization_db` DEFAULT CHARACTER SET utf8mb4 ;
USE `normalization_db` ;

-- -----------------------------------------------------
-- Table `normalization_db`.`cities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `normalization_db`.`cities` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `normalization_db`.`addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `normalization_db`.`addresses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(255) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  `cities_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_addresses_cities1_idx` (`cities_id` ASC) VISIBLE,
  CONSTRAINT `fk_addresses_cities1`
    FOREIGN KEY (`cities_id`)
    REFERENCES `normalization_db`.`cities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `normalization_db`.`dojos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `normalization_db`.`dojos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  `addresses_id` INT NOT NULL,
  PRIMARY KEY (`id`, `addresses_id`),
  INDEX `fk_dojos_addresses1_idx` (`addresses_id` ASC) VISIBLE,
  CONSTRAINT `fk_dojos_addresses1`
    FOREIGN KEY (`addresses_id`)
    REFERENCES `normalization_db`.`addresses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `normalization_db`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `normalization_db`.`students` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  `dojos_id` INT NOT NULL,
  `addresses_id` INT NOT NULL,
  PRIMARY KEY (`id`, `dojos_id`, `addresses_id`),
  INDEX `fk_students_dojos1_idx` (`dojos_id` ASC) VISIBLE,
  INDEX `fk_students_addresses1_idx` (`addresses_id` ASC) VISIBLE,
  CONSTRAINT `fk_students_dojos1`
    FOREIGN KEY (`dojos_id`)
    REFERENCES `normalization_db`.`dojos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_students_addresses1`
    FOREIGN KEY (`addresses_id`)
    REFERENCES `normalization_db`.`addresses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `normalization_db`.`interests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `normalization_db`.`interests` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `normalization_db`.`students_has_interests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `normalization_db`.`students_has_interests` (
  `students_id` INT NOT NULL,
  `interests_id` INT NOT NULL,
  `created_at` VARCHAR(255) NOT NULL,
  `updated_at` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`students_id`, `interests_id`),
  INDEX `fk_students_has_interests_interests1_idx` (`interests_id` ASC) VISIBLE,
  INDEX `fk_students_has_interests_students_idx` (`students_id` ASC) VISIBLE,
  CONSTRAINT `fk_students_has_interests_students`
    FOREIGN KEY (`students_id`)
    REFERENCES `normalization_db`.`students` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_students_has_interests_interests1`
    FOREIGN KEY (`interests_id`)
    REFERENCES `normalization_db`.`interests` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
