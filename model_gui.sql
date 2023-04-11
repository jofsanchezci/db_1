-- MySQL Script generated by MySQL Workbench
-- Tue Apr 11 07:09:33 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Tipo_Documento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipo_Documento` (
  `id` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Abreviatura` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`estudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`estudiante` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NULL,
  `numero` VARCHAR(45) NOT NULL,
  `estudiantecol` VARCHAR(45) NULL,
  `tipo_documento_Id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `tipo_documento_idx` (`tipo_documento_Id` ASC) VISIBLE,
  CONSTRAINT `tipo_documento`
    FOREIGN KEY (`tipo_documento_Id`)
    REFERENCES `mydb`.`Tipo_Documento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Asignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Asignatura` (
  `codigo` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Inscripcion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Inscripcion` (
  `id` INT NOT NULL,
  `Estudiante_id` INT NULL,
  `Asignatura_codigo` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `Estudiante_id_idx` (`Estudiante_id` ASC) VISIBLE,
  INDEX `Asignatura_codigo_idx` (`Asignatura_codigo` ASC) VISIBLE,
  CONSTRAINT `Estudiante_id`
    FOREIGN KEY (`Estudiante_id`)
    REFERENCES `mydb`.`estudiante` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Asignatura_codigo`
    FOREIGN KEY (`Asignatura_codigo`)
    REFERENCES `mydb`.`Asignatura` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tema` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `Asignatura_codigo` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `Asignatura_codigo_idx` (`Asignatura_codigo` ASC) VISIBLE,
  CONSTRAINT `Asignatura_codigo`
    FOREIGN KEY (`Asignatura_codigo`)
    REFERENCES `mydb`.`Asignatura` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
