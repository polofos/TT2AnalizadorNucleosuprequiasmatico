-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema tt1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tt1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tt1` DEFAULT CHARACTER SET utf8 ;
USE `tt1` ;

-- -----------------------------------------------------
-- Table `tt1`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tt1`.`Usuario` (
  `idUsuario` VARCHAR(45) NOT NULL,
  `pass` VARCHAR(45) NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tt1`.`Proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tt1`.`Proyecto` (
  `Usuario_idUsuario` VARCHAR(45) NOT NULL,
  `idProyecto` INT NOT NULL AUTO_INCREMENT,
  `nombreProyecto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProyecto`, `Usuario_idUsuario`),
  CONSTRAINT `fk_Proyecto_Usuario`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `tt1`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tt1`.`Reporte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tt1`.`Reporte` (
  `idReporte` INT NOT NULL,
  `Proyecto_idProyecto` INT NOT NULL,
  `Proyecto_Usuario_idUsuario` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NULL,
  `ruta` VARCHAR(45) NULL,
  PRIMARY KEY (`idReporte`, `Proyecto_idProyecto`, `Proyecto_Usuario_idUsuario`),
  INDEX `fk_Reporte_Proyecto1_idx` (`Proyecto_idProyecto` ASC, `Proyecto_Usuario_idUsuario` ASC),
  CONSTRAINT `fk_Reporte_Proyecto1`
    FOREIGN KEY (`Proyecto_idProyecto` , `Proyecto_Usuario_idUsuario`)
    REFERENCES `tt1`.`Proyecto` (`idProyecto` , `Usuario_idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tt1`.`Grupo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tt1`.`Grupo` (
  `idObjeto` INT NOT NULL AUTO_INCREMENT,
  `Proyecto_idProyecto` INT NOT NULL,
  `nombreGrupo` VARCHAR(45) NULL,
  `Proyecto_Usuario_idUsuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idObjeto`, `Proyecto_idProyecto`, `Proyecto_Usuario_idUsuario`),
  INDEX `fk_Grupo_Proyecto1_idx` (`Proyecto_idProyecto` ASC, `Proyecto_Usuario_idUsuario` ASC),
  CONSTRAINT `fk_Grupo_Proyecto1`
    FOREIGN KEY (`Proyecto_idProyecto` , `Proyecto_Usuario_idUsuario`)
    REFERENCES `tt1`.`Proyecto` (`idProyecto` , `Usuario_idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tt1`.`Objeto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tt1`.`Objeto` (
  `id_Objeto` INT NOT NULL AUTO_INCREMENT,
  `nombreObjeto` VARCHAR(45) NULL,
  `Grupo_idObjeto` INT NOT NULL,
  `Grupo_Proyecto_idProyecto` INT NOT NULL,
  `Grupo_Proyecto_Usuario_idUsuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Objeto`, `Grupo_idObjeto`, `Grupo_Proyecto_idProyecto`, `Grupo_Proyecto_Usuario_idUsuario`),
  CONSTRAINT `fk_table1_Grupo1`
    FOREIGN KEY (`Grupo_idObjeto` , `Grupo_Proyecto_idProyecto` , `Grupo_Proyecto_Usuario_idUsuario`)
    REFERENCES `tt1`.`Grupo` (`idObjeto` , `Proyecto_idProyecto` , `Proyecto_Usuario_idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tt1`.`Imagen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tt1`.`Imagen` (
  `idImagen` INT NOT NULL AUTO_INCREMENT,
  `Objeto_id_Objeto` INT NOT NULL,
  `Objeto_Grupo_idObjeto` INT NOT NULL,
  `Objeto_Grupo_Proyecto_idProyecto` INT NOT NULL,
  `Objeto_Grupo_Proyecto_Usuario_idUsuario` VARCHAR(45) NOT NULL,
  `ruta` VARCHAR(45) NOT NULL,
  `rutaScreenShot` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idImagen`, `Objeto_id_Objeto`, `Objeto_Grupo_idObjeto`, `Objeto_Grupo_Proyecto_idProyecto`, `Objeto_Grupo_Proyecto_Usuario_idUsuario`),
  INDEX `fk_Imagen_Objeto1_idx` (`Objeto_id_Objeto` ASC, `Objeto_Grupo_idObjeto` ASC, `Objeto_Grupo_Proyecto_idProyecto` ASC, `Objeto_Grupo_Proyecto_Usuario_idUsuario` ASC),
  CONSTRAINT `fk_Imagen_Objeto1`
    FOREIGN KEY (`Objeto_id_Objeto` , `Objeto_Grupo_idObjeto` , `Objeto_Grupo_Proyecto_idProyecto` , `Objeto_Grupo_Proyecto_Usuario_idUsuario`)
    REFERENCES `tt1`.`Objeto` (`id_Objeto` , `Grupo_idObjeto` , `Grupo_Proyecto_idProyecto` , `Grupo_Proyecto_Usuario_idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
