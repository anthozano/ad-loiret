-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema jeanne
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `jeanne` ;

-- -----------------------------------------------------
-- Schema jeanne
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `jeanne` DEFAULT CHARACTER SET utf8 ;
USE `jeanne` ;

-- -----------------------------------------------------
-- Table `date`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `date` ;

CREATE TABLE IF NOT EXISTS `date` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `jour` INT(11) NULL DEFAULT NULL,
  `mois` INT(11) NULL DEFAULT NULL,
  `annee` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `UC_date` ON `date` (`jour` ASC, `mois` ASC, `annee` ASC);


-- -----------------------------------------------------
-- Table `description`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `description` ;

CREATE TABLE IF NOT EXISTS `description` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `label` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `geo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `geo` ;

CREATE TABLE IF NOT EXISTS `geo` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `commune` VARCHAR(255) NULL DEFAULT NULL,
  `coordonnee` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `photo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `photo` ;

CREATE TABLE IF NOT EXISTS `photo` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `serie` VARCHAR(255) NULL DEFAULT NULL,
  `article` VARCHAR(255) NULL DEFAULT NULL,
  `discriminant` VARCHAR(255) NULL DEFAULT NULL,
  `notes` TEXT NULL DEFAULT NULL,
  `index_personnes` TEXT NULL DEFAULT NULL,
  `nb_cliche` VARCHAR(255) NULL DEFAULT NULL,
  `support` VARCHAR(255) NULL DEFAULT NULL,
  `chroma` VARCHAR(255) NULL DEFAULT NULL,
  `remarques` VARCHAR(255) NULL DEFAULT NULL,
  `date_id` INT(11) NOT NULL,
  `geo_id` INT(11) NOT NULL,
  `description_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_photo_date`
    FOREIGN KEY (`date_id`)
    REFERENCES `date` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_photo_description1`
    FOREIGN KEY (`description_id`)
    REFERENCES `description` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_photo_geo2`
    FOREIGN KEY (`geo_id`)
    REFERENCES `geo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_photo_date_idx` ON `photo` (`date_id` ASC);

CREATE INDEX `fk_photo_geo2_idx` ON `photo` (`geo_id` ASC);

CREATE INDEX `fk_photo_description1_idx` ON `photo` (`description_id` ASC);


-- -----------------------------------------------------
-- Table `cindoc`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cindoc` ;

CREATE TABLE IF NOT EXISTS `cindoc` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `label` VARCHAR(255) NULL DEFAULT NULL,
  `photo_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_cindoc_photo1`
    FOREIGN KEY (`photo_id`)
    REFERENCES `photo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_cindoc_photo1_idx` ON `cindoc` (`photo_id` ASC);


-- -----------------------------------------------------
-- Table `fichier`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fichier` ;

CREATE TABLE IF NOT EXISTS `fichier` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `label` VARCHAR(255) NULL DEFAULT NULL,
  `photo_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_fichier_photo1`
    FOREIGN KEY (`photo_id`)
    REFERENCES `photo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_fichier_photo1_idx` ON `fichier` (`photo_id` ASC);


-- -----------------------------------------------------
-- Table `iconographie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iconographie` ;

CREATE TABLE IF NOT EXISTS `iconographie` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `label` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `label` ON `iconographie` (`label` ASC);


-- -----------------------------------------------------
-- Table `iconographies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iconographies` ;

CREATE TABLE IF NOT EXISTS `iconographies` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `iconographie_id` INT(11) NOT NULL,
  `photo_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_iconographies_iconographie1`
    FOREIGN KEY (`iconographie_id`)
    REFERENCES `iconographie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_iconographies_photo1`
    FOREIGN KEY (`photo_id`)
    REFERENCES `photo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_iconographies_iconographie1_idx` ON `iconographies` (`iconographie_id` ASC);

CREATE INDEX `fk_iconographies_photo1_idx` ON `iconographies` (`photo_id` ASC);


-- -----------------------------------------------------
-- Table `sujet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sujet` ;

CREATE TABLE IF NOT EXISTS `sujet` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `label` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `label` ON `sujet` (`label` ASC);


-- -----------------------------------------------------
-- Table `sujets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sujets` ;

CREATE TABLE IF NOT EXISTS `sujets` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `photo_id` INT(11) NOT NULL,
  `sujet_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_sujets_photo1`
    FOREIGN KEY (`photo_id`)
    REFERENCES `photo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sujets_sujet1`
    FOREIGN KEY (`sujet_id`)
    REFERENCES `sujet` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_sujets_photo1_idx` ON `sujets` (`photo_id` ASC);

CREATE INDEX `fk_sujets_sujet1_idx` ON `sujets` (`sujet_id` ASC);


-- -----------------------------------------------------
-- Table `taille`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taille` ;

CREATE TABLE IF NOT EXISTS `taille` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `largeur` FLOAT NULL DEFAULT NULL,
  `hauteur` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `UC_taille` ON `taille` (`largeur` ASC, `hauteur` ASC);


-- -----------------------------------------------------
-- Table `tailles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tailles` ;

CREATE TABLE IF NOT EXISTS `tailles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `photo_id` INT(11) NOT NULL,
  `taille_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_tailles_photo1`
    FOREIGN KEY (`photo_id`)
    REFERENCES `photo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tailles_taille1`
    FOREIGN KEY (`taille_id`)
    REFERENCES `taille` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_tailles_photo1_idx` ON `tailles` (`photo_id` ASC);

CREATE INDEX `fk_tailles_taille1_idx` ON `tailles` (`taille_id` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
