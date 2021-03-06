DROP DATABASE IF EXISTS jeanne;
CREATE DATABASE jeanne
    DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_general_ci;
USE jeanne;

-- -----------------------------------------------------
-- Table `sujet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sujet` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `label` VARCHAR(255) NULL,
  PRIMARY KEY (`id`));

-- -----------------------------------------------------
-- Table `date`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `date` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `jour` INT NULL,
  `mois` INT NULL,
  `annee` INT NULL,
  PRIMARY KEY (`id`));

-- -----------------------------------------------------
-- Table `geo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `geo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `commune` VARCHAR(255) NULL,
  `coordonnee` VARCHAR(255) NULL,
  PRIMARY KEY (`id`));

-- -----------------------------------------------------
-- Table `description`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `description` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `label` VARCHAR(255) NULL,
  PRIMARY KEY (`id`));

-- -----------------------------------------------------
-- Table `photos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `photos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `serie` VARCHAR(255) NULL,
  `article` VARCHAR(255) NULL,
  `discriminant` VARCHAR(255) NULL,
  `notes` VARCHAR(255) NULL,
  `index_personnes` VARCHAR(255) NULL,
  `fichier_num` VARCHAR(255) NULL,
  `nb_cliche` VARCHAR(255) NULL,
  `support` VARCHAR(255) NULL,
  `chroma` VARCHAR(255) NULL,
  `remarques` VARCHAR(255) NULL,
  `id_date` INT NOT NULL,
  `id_geo` INT NOT NULL,
  `id_description` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_photo_date_idx` (`id_date` ASC),
  INDEX `fk_photo_geo2_idx` (`id_geo` ASC),
  INDEX `fk_photo_description1_idx` (`id_description` ASC),
  CONSTRAINT `fk_photo_date`
    FOREIGN KEY (`id_date`)
    REFERENCES `date` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_photo_geo2`
    FOREIGN KEY (`id_geo`)
    REFERENCES `geo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_photo_description1`
    FOREIGN KEY (`id_description`)
    REFERENCES `description` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `iconographie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `iconographie` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `label` VARCHAR(255) NULL,
  PRIMARY KEY (`id`));

-- -----------------------------------------------------
-- Table `taille`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taille` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `largeur` DOUBLE NULL,
  `hauteur` DOUBLE NULL,
  PRIMARY KEY (`id`));

-- -----------------------------------------------------
-- Table `sujets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sujets` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `photo_id` INT NOT NULL,
  `sujet_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_sujets_photo1_idx` (`photo_id` ASC),
  INDEX `fk_sujets_sujet1_idx` (`sujet_id` ASC),
  CONSTRAINT `fk_sujets_photo1`
    FOREIGN KEY (`photo_id`)
    REFERENCES `photos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sujets_sujet1`
    FOREIGN KEY (`sujet_id`)
    REFERENCES `sujet` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `iconographies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `iconographies` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `iconographie_id` INT NOT NULL,
  `photo_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_iconographies_iconographie1_idx` (`iconographie_id` ASC),
  INDEX `fk_iconographies_photo1_idx` (`photo_id` ASC),
  CONSTRAINT `fk_iconographies_iconographie1`
    FOREIGN KEY (`iconographie_id`)
    REFERENCES `iconographie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_iconographies_photo1`
    FOREIGN KEY (`photo_id`)
    REFERENCES `photos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `cindoc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cindoc` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `label` VARCHAR(255) NULL,
  `photo_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cindoc_photo1_idx` (`photo_id` ASC),
  CONSTRAINT `fk_cindoc_photo1`
    FOREIGN KEY (`photo_id`)
    REFERENCES `photos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `tailles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tailles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `photo_id` INT NOT NULL,
  `taille_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tailles_photo1_idx` (`photo_id` ASC),
  INDEX `fk_tailles_taille1_idx` (`taille_id` ASC),
  CONSTRAINT `fk_tailles_photo1`
    FOREIGN KEY (`photo_id`)
    REFERENCES `photos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tailles_taille1`
    FOREIGN KEY (`taille_id`)
    REFERENCES `taille` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
