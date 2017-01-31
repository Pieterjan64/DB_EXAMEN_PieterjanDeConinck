-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Mutations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mutations` (
  `idMutations` INT NOT NULL,
  `gene_name` VARCHAR(45) NULL,
  `mutation_start` INT NULL,
  `mutation_end` INT NULL,
  `chromosome` INT NULL,
  `gene_descr` VARCHAR(45) NULL,
  PRIMARY KEY (`idMutations`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Syndrome` (
  `idSyndrome` INT NOT NULL,
  `syndrome_name` VARCHAR(45) NULL,
  `syndrome_descr` VARCHAR(45) NULL,
  `mutation_id` INT NULL,
  PRIMARY KEY (`idSyndrome`),
  INDEX `fk_Syndrome_1_idx` (`mutation_id` ASC),
  CONSTRAINT `fk_Syndrome_1`
    FOREIGN KEY (`mutation_id`)
    REFERENCES `mydb`.`Mutations` (`idMutations`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `idPatient` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `sex` ENUM('M', 'F') NULL,
  `age` INT NULL,
  `syndrome_id` INT NULL,
  PRIMARY KEY (`idPatient`),
  INDEX `fk_Patient_1_idx` (`syndrome_id` ASC),
  CONSTRAINT `fk_Patient_1`
    FOREIGN KEY (`syndrome_id`)
    REFERENCES `mydb`.`Syndrome` (`idSyndrome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
