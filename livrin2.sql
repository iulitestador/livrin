-- MySQL Script generated by MySQL Workbench
-- Seg 11 Jul 2016 16:22:36 BRT
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema livrin2
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `livrin2` ;

-- -----------------------------------------------------
-- Schema livrin2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `livrin2` DEFAULT CHARACTER SET utf8 ;
USE `livrin2` ;

-- -----------------------------------------------------
-- Table `livrin2`.`autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livrin2`.`autor` (
  `idautor` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nomeautor` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idautor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `livrin2`.`editora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livrin2`.`editora` (
  `ideditora` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nomeeditora` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ideditora`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `livrin2`.`dono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livrin2`.`dono` (
  `iddono` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nomedono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`iddono`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `livrin2`.`livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livrin2`.`livro` (
  `idlivro` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(255) NOT NULL,
  `autor_idautor` INT UNSIGNED NOT NULL,
  `editora_ideditora` INT UNSIGNED NULL,
  `anopublicacao` DATE NULL,
  `dono_iddono` INT UNSIGNED NULL,
  PRIMARY KEY (`idlivro`),
  INDEX `fk_livro_autor_idx` (`autor_idautor` ASC),
  INDEX `fk_livro_editora1_idx` (`editora_ideditora` ASC),
  INDEX `fk_livro_dono1_idx` (`dono_iddono` ASC),
  CONSTRAINT `fk_livro_autor`
    FOREIGN KEY (`autor_idautor`)
    REFERENCES `livrin2`.`autor` (`idautor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_livro_editora1`
    FOREIGN KEY (`editora_ideditora`)
    REFERENCES `livrin2`.`editora` (`ideditora`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_livro_dono1`
    FOREIGN KEY (`dono_iddono`)
    REFERENCES `livrin2`.`dono` (`iddono`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
