-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema blogs_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema blogs_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blogs_db` DEFAULT CHARACTER SET utf8 ;
USE `blogs_db` ;

-- -----------------------------------------------------
-- Table `blogs_db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blogs_db`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NULL,
  `created_at` DATETIME NULL,
  `update_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blogs_db`.`blogs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blogs_db`.`blogs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blogs_db`.`page_views`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blogs_db`.`page_views` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ip_address` VARCHAR(45) NOT NULL,
  `view_length` DECIMAL NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `users_id` INT NOT NULL,
  `blogs_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_page_views_users_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_page_views_blogs1_idx` (`blogs_id` ASC) VISIBLE,
  CONSTRAINT `fk_page_views_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `blogs_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_page_views_blogs1`
    FOREIGN KEY (`blogs_id`)
    REFERENCES `blogs_db`.`blogs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blogs_db`.`admins`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blogs_db`.`admins` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  `users_id` INT NOT NULL,
  `blogs_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_admins_users1_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_admins_blogs1_idx` (`blogs_id` ASC) VISIBLE,
  CONSTRAINT `fk_admins_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `blogs_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_admins_blogs1`
    FOREIGN KEY (`blogs_id`)
    REFERENCES `blogs_db`.`blogs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blogs_db`.`posts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blogs_db`.`posts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `content` TEXT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `update_at` DATETIME NOT NULL,
  `admins_id` INT NOT NULL,
  `blogs_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_posts_admins1_idx` (`admins_id` ASC) VISIBLE,
  INDEX `fk_posts_blogs1_idx` (`blogs_id` ASC) VISIBLE,
  CONSTRAINT `fk_posts_admins1`
    FOREIGN KEY (`admins_id`)
    REFERENCES `blogs_db`.`admins` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_posts_blogs1`
    FOREIGN KEY (`blogs_id`)
    REFERENCES `blogs_db`.`blogs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blogs_db`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blogs_db`.`comments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `content` TEXT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `update_at` DATETIME NOT NULL,
  `posts_id` INT NOT NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comments_posts1_idx` (`posts_id` ASC) VISIBLE,
  INDEX `fk_comments_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_comments_posts1`
    FOREIGN KEY (`posts_id`)
    REFERENCES `blogs_db`.`posts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `blogs_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blogs_db`.`files`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blogs_db`.`files` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `file_path` VARCHAR(255) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `update_at` DATETIME NOT NULL,
  `admins_id` INT NOT NULL,
  `posts_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_files_admins1_idx` (`admins_id` ASC) VISIBLE,
  INDEX `fk_files_posts1_idx` (`posts_id` ASC) VISIBLE,
  CONSTRAINT `fk_files_admins1`
    FOREIGN KEY (`admins_id`)
    REFERENCES `blogs_db`.`admins` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_files_posts1`
    FOREIGN KEY (`posts_id`)
    REFERENCES `blogs_db`.`posts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
