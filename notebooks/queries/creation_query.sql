-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema madrid
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema madrid
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `madrid` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `madrid` ;

-- -----------------------------------------------------
-- Table `madrid`.`casas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `madrid`.`casas` (
  `Distrito` TEXT NOT NULL,
  `CP` INT NULL DEFAULT NULL,
  `Latitud` DOUBLE NULL DEFAULT NULL,
  `Longitud` DOUBLE NULL DEFAULT NULL,
  `Precio` INT NULL DEFAULT NULL,
  `Fecha` TEXT NULL DEFAULT NULL,
  `Habitaciones` INT NULL DEFAULT NULL,
  `BaÃ±os` INT NULL DEFAULT NULL,
  `Superficie(m2)` INT NULL DEFAULT NULL,
  `Piso` INT NULL DEFAULT NULL,
  `Ascensor` INT NULL DEFAULT NULL,
  `AAC` INT NULL DEFAULT NULL,
  `Calefaccion` INT NULL DEFAULT NULL,
  `Aparcamiento` INT NULL DEFAULT NULL,
  `Balcon` INT NULL DEFAULT NULL,
  `Terraza` INT NULL DEFAULT NULL,
  `Piscina` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Distrito`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `madrid`.`rentas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `madrid`.`rentas` (
  `Distrito` TEXT NOT NULL,
  `Periodo` INT NULL DEFAULT NULL,
  `Renta media p/p (neto)` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Distrito`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `madrid`.`poblacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `madrid`.`poblacion` (
  `Numero` INT NULL DEFAULT NULL,
  `Distrito` TEXT NOT NULL,
  `Superficie (ha)` DOUBLE NULL DEFAULT NULL,
  `Poblacion` TEXT NULL DEFAULT NULL,
  `Densidad (Hab./ha)` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`Distrito`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `madrid`.`precio_suelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `madrid`.`precio_suelo` (
  `Distrito` TEXT NOT NULL,
  `Precio medio/m2` BIGINT NULL DEFAULT NULL,
  `Valor medio de compra` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`Distrito`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `madrid`.`distritos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `madrid`.`distritos` (
  `Codigo` INT NULL DEFAULT NULL,
  `Distrito` TEXT NOT NULL,
  `rentas_Distrito` TEXT NOT NULL,
  `poblacion_Distrito` TEXT NOT NULL,
  `casas_Distrito` TEXT NOT NULL,
  `precio_suelo_Distrito` TEXT NOT NULL,
  PRIMARY KEY (`Distrito`),
  INDEX `fk_distritos_rentas_idx` (`rentas_Distrito` ASC) VISIBLE,
  INDEX `fk_distritos_poblacion1_idx` (`poblacion_Distrito` ASC) VISIBLE,
  INDEX `fk_distritos_casas1_idx` (`casas_Distrito` ASC) VISIBLE,
  INDEX `fk_distritos_precio_suelo1_idx` (`precio_suelo_Distrito` ASC) VISIBLE,
  CONSTRAINT `fk_distritos_rentas`
    FOREIGN KEY (`rentas_Distrito`)
    REFERENCES `madrid`.`rentas` (`Distrito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_distritos_poblacion1`
    FOREIGN KEY (`poblacion_Distrito`)
    REFERENCES `madrid`.`poblacion` (`Distrito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_distritos_casas1`
    FOREIGN KEY (`casas_Distrito`)
    REFERENCES `madrid`.`casas` (`Distrito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_distritos_precio_suelo1`
    FOREIGN KEY (`precio_suelo_Distrito`)
    REFERENCES `madrid`.`precio_suelo` (`Distrito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
