-- MySQL Script generated by MySQL Workbench
-- Fri Apr 14 07:55:54 2023
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
-- Table `mydb`.`Camioneros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Camioneros` (
  `cedula` INT NOT NULL,
  `Nombre` VARCHAR(255) NOT NULL,
  `Telefono` INT NOT NULL,
  `Direccion` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `Salario` INT NULL,
  `Ciudad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cedula`));


-- -----------------------------------------------------
-- Table `mydb`.`Camiones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Camiones` (
  `Placa` INT NOT NULL,
  `Modelo` INT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Potencia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Placa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Paquetes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Paquetes` (
  `Codigo_p` INT NOT NULL,
  `Descripcion` VARCHAR(255) NOT NULL,
  `Destinatorio` VARCHAR(255) NOT NULL,
  `Direccion_D` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Codigo_p`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ciudad` (
  `Codigo_postal` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Codigo_postal`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Asignacion_Camion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Asignacion_Camion` (
  `Camioneros_cedula` INT NOT NULL,
  `Camiones_Placa` INT NOT NULL,
  PRIMARY KEY (`Camioneros_cedula`, `Camiones_Placa`),
  INDEX `fk_Camioneros_has_Camiones_Camiones1_idx` (`Camiones_Placa` ASC) VISIBLE,
  INDEX `fk_Camioneros_has_Camiones_Camioneros_idx` (`Camioneros_cedula` ASC) VISIBLE,
  CONSTRAINT `fk_Camioneros_has_Camiones_Camioneros`
    FOREIGN KEY (`Camioneros_cedula`)
    REFERENCES `mydb`.`Camioneros` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Camioneros_has_Camiones_Camiones1`
    FOREIGN KEY (`Camiones_Placa`)
    REFERENCES `mydb`.`Camiones` (`Placa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Asignacion_paquete`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Asignacion_paquete` (
  `Camioneros_cedula` INT NOT NULL,
  `Paquetes_Codigo_p` INT NOT NULL,
  PRIMARY KEY (`Camioneros_cedula`, `Paquetes_Codigo_p`),
  INDEX `fk_Camioneros_has_Paquetes_Paquetes1_idx` (`Paquetes_Codigo_p` ASC) VISIBLE,
  INDEX `fk_Camioneros_has_Paquetes_Camioneros1_idx` (`Camioneros_cedula` ASC) VISIBLE,
  CONSTRAINT `fk_Camioneros_has_Paquetes_Camioneros1`
    FOREIGN KEY (`Camioneros_cedula`)
    REFERENCES `mydb`.`Camioneros` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Camioneros_has_Paquetes_Paquetes1`
    FOREIGN KEY (`Paquetes_Codigo_p`)
    REFERENCES `mydb`.`Paquetes` (`Codigo_p`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Paquete_Ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Paquete_Ciudad` (
  `Paquetes_Codigo_p` INT NOT NULL,
  `Ciudad_Codigo_postal` INT NOT NULL,
  PRIMARY KEY (`Paquetes_Codigo_p`, `Ciudad_Codigo_postal`),
  INDEX `fk_Paquetes_has_Ciudad_Ciudad1_idx` (`Ciudad_Codigo_postal` ASC) VISIBLE,
  INDEX `fk_Paquetes_has_Ciudad_Paquetes1_idx` (`Paquetes_Codigo_p` ASC) VISIBLE,
  CONSTRAINT `fk_Paquetes_has_Ciudad_Paquetes1`
    FOREIGN KEY (`Paquetes_Codigo_p`)
    REFERENCES `mydb`.`Paquetes` (`Codigo_p`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paquetes_has_Ciudad_Ciudad1`
    FOREIGN KEY (`Ciudad_Codigo_postal`)
    REFERENCES `mydb`.`Ciudad` (`Codigo_postal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
