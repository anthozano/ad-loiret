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
-- Table `photo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `photo` (
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
    REFERENCES `photo` (`id`)
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
    REFERENCES `photo` (`id`)
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
    REFERENCES `photo` (`id`)
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
    REFERENCES `photo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tailles_taille1`
    FOREIGN KEY (`taille_id`)
    REFERENCES `taille` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO date(id, jour, annee, mois)
VALUES (0, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (0, "Bord de loire depuis le sud");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (0, "Orléans", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (0, "CLVUE", "1", "NULL", "NULL", "NULL", "FRAD045_CLVUE000001_H", "3", "négatif", "nb", "NULL",
  0, 0, 0
);
        
INSERT INTO sujet(label)
VALUES ("vue générale");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Bord de loire depuis le sud");
        
INSERT INTO cindoc(label, photo_id)
VALUES (﻿50785, 0);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (0, 0);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (0, 0);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (0, 0);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (1, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (1, "Bord de loire depuis le sud");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (1, "Orléans", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (1, "CLVUE", "2", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  1, 1, 1
);
        
INSERT INTO sujet(label)
VALUES ("église Notre-Dame-de-Recouvrance");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Bord de loire depuis le sud");
        
INSERT INTO cindoc(label, photo_id)
VALUES (52124, 1);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (1, 1);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (1, 1);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (1, 1);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (2, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (2, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (2, "Orléans", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (2, "CLVUE", "3", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  2, 2, 2
);
        
INSERT INTO sujet(label)
VALUES ("cathédrale Sainte-Croix");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50375, 2);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (2, 2);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (2, 2);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (2, 2);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (3, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (3, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (3, "Orléans", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (3, "CLVUE", "4", "NULL", "NULL", "NULL", "NULL", "4", "négatif", "nb", "NULL",
  3, 3, 3
);
        
INSERT INTO sujet(label)
VALUES ("Salle des Thèses");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50735, 3);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (3, 3);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (3, 3);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (3, 3);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (4, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (4, "rue sur l'eau et hôtel de ville");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (4, "Montargis", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (4, "CLVUE", "5", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", " 1 duplicata 4,5 x 6 nb",
  4, 4, 4
);
        
INSERT INTO sujet(label)
VALUES ("Loing (riv.)");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("rue sur l'eau et hôtel de ville");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50048, 4);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (4, 4);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (4, 4);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (4, 4);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (5, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (5, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (5, "NULL", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (5, "CLVUE", "6", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  5, 5, 5
);
        
INSERT INTO sujet(label)
VALUES ("NULL");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (NULL, 5);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (5, 5);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (5, 5);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (5, 5);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (6, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (6, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (6, "Cortrat", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (6, "CLVUE", "7", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", " 1 duplicata 4,5 x 6 nb",
  6, 6, 6
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48651, 6);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (6, 6);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (6, 6);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (6, 6);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (7, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (7, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (7, "Olivet", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (7, "CLVUE", "8", "(+bis ds fichier date)", "NULL", "NULL", "NULL", "2", "négatif", "nb", "NULL",
  7, 7, 7
);
        
INSERT INTO sujet(label)
VALUES ("église, pierre tombale");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50308, 7);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (7, 7);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (7, 7);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (7, 7);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (8, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (8, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (8, "Olivet", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (8, "CLVUE", "9", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  8, 8, 8
);
        
INSERT INTO sujet(label)
VALUES ("église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50307, 8);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (8, 8);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (8, 8);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (8, 8);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (9, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (9, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (9, "Olivet", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (9, "CLVUE", "10", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  9, 9, 9
);
        
INSERT INTO sujet(label)
VALUES ("église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50307, 9);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (9, 9);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (9, 9);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (9, 9);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (10, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (10, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (10, "Olivet", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (10, "CLVUE", "11", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "NULL",
  10, 10, 10
);
        
INSERT INTO sujet(label)
VALUES ("église, tableau");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50311, 10);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (10, 10);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (10, 10);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (10, 10);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (11, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (11, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (11, "Olivet", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (11, "CLVUE", "12", "NULL", "NULL", "NULL", "NULL", "3", "négatif", "nb", "NULL",
  11, 11, 11
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50310, 11);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (11, 11);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (11, 11);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (11, 11);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (12, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (12, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (12, "Olivet,  Olivet", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (12, "CLVUE", "13", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  12, 12, 12
);
        
INSERT INTO sujet(label)
VALUES ("église, statue , église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50310 | 50307, 12);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (12, 12);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (12, 12);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (12, 12);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (13, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (13, "Vierge, bois");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (13, "La Selle-sur-le-Bied", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (13, "CLVUE", "14", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  13, 13, 13
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Vierge, bois");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49550, 13);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (13, 13);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (13, 13);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (13, 13);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (14, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (14, "Peinture murale");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (14, "La Selle-sur-le-Bied", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (14, "CLVUE", "15", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  14, 14, 14
);
        
INSERT INTO sujet(label)
VALUES ("église, tableau");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Peinture murale");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49551, 14);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (14, 14);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (14, 14);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (14, 14);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (15, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (15, "Vue du village");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (15, "La Selle-sur-le-Bied", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (15, "CLVUE", "16", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  15, 15, 15
);
        
INSERT INTO sujet(label)
VALUES ("vue générale");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Vue du village");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49559, 15);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (15, 15);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (15, 15);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (15, 15);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (16, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (16, "Vierge, bois galychromie (classée)");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (16, "Thorailles", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (16, "CLVUE", "17", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  16, 16, 16
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Vierge, bois galychromie (classée)");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51803, 16);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (16, 16);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (16, 16);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (16, 16);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (17, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (17, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (17, "Malesherbes,  Malesherbes,  Malesherbes", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (17, "CLVUE", "18", "NULL", "NULL", "NULL", "NULL", "3", "négatif", "nb", "NULL",
  17, 17, 17
);
        
INSERT INTO sujet(label)
VALUES ("église , église, statue, château de Rouville, chapelle");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49835 | 49840, 17);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (17, 17);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (17, 17);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (17, 17);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (18, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (18, "Statue, bois");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (18, "Ondreville-sur-Essonne", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (18, "CLVUE", "19", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  18, 18, 18
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Statue, bois");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50325, 18);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (18, 18);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (18, 18);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (18, 18);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (19, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (19, "Statue");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (19, "Cléry-Saint-André", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (19, "CLVUE", "20", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  19, 19, 19
);
        
INSERT INTO sujet(label)
VALUES ("NULL");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Statue");
        
INSERT INTO cindoc(label, photo_id)
VALUES (NULL, 19);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (19, 19);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (19, 19);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (19, 19);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (20, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (20, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (20, "Pithiviers", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (20, "CLVUE", "21", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  20, 20, 20
);
        
INSERT INTO sujet(label)
VALUES ("vue générale");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51009, 20);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (20, 20);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (20, 20);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (20, 20);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (21, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (21, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (21, "Bondaroy", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (21, "CLVUE", "22", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  21, 21, 21
);
        
INSERT INTO sujet(label)
VALUES ("église Saint-Aignan");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47931, 21);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (21, 21);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (21, 21);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (21, 21);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (22, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (22, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (22, "Chantecoq,  Chantecoq", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (22, "CLVUE", "23", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  22, 22, 22
);
        
INSERT INTO sujet(label)
VALUES ("vue générale , église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48307 | 48310, 22);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (22, 22);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (22, 22);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (22, 22);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (23, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (23, "Clocher de l'église");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (23, "Mézières-en-Gâtinais", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (23, "CLVUE", "24", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "NULL",
  23, 23, 23
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Clocher de l'église");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49993, 23);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (23, 23);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (23, 23);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (23, 23);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (24, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (24, "Chénevières et canal");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (24, "Montbouy", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (24, "CLVUE", "25", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  24, 24, 24
);
        
INSERT INTO sujet(label)
VALUES ("amphithéâtre");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Chénevières et canal");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50069, 24);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (24, 24);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (24, 24);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (24, 24);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (25, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (25, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (25, "Montbouy,  Montbouy,  Montbouy", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (25, "CLVUE", "26", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  25, 25, 25
);
        
INSERT INTO sujet(label)
VALUES ("canal de Briare, écluse, maison éclusière");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50070, 25);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (25, 25);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (25, 25);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (25, 25);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (26, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (26, "Tapisserie hôtel Cabu");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (26, "Orléans,  Orléans,  Yèvre-la-Ville", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (26, "CLVUE", "27", "(+bis ds fichier date)", "NULL", "NULL", "NULL", "3", "négatif", "nb", "NULL",
  26, 26, 26
);
        
INSERT INTO sujet(label)
VALUES ("hôtel Cabu , tapisserie , château");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Tapisserie hôtel Cabu");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50527 | 50747 | 52100, 26);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (26, 26);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (26, 26);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (26, 26);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (27, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (27, "Eglise Saint-Lubin");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (27, "Yèvre-la-Ville", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (27, "CLVUE", "28", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  27, 27, 27
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise Saint-Lubin");
        
INSERT INTO cindoc(label, photo_id)
VALUES (52106, 27);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (27, 27);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (27, 27);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (27, 27);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (28, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (28, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (28, "Châtillon-Coligny,  Châtillon-Coligny,  Châtillon-Coligny,  Châtillon-Coligny,  Châtillon-Coligny, Châtillon-Coligny", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (28, "CLVUE", "29", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "NULL",
  28, 28, 28
);
        
INSERT INTO sujet(label)
VALUES ("château, puits , château, château, donjon, château, puits, château, tombe de Gaspard de Coligny, château, tableau");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48410 | 48411, 28);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (28, 28);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (28, 28);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (28, 28);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (29, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (29, "Château, puits");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (29, "Châtillon-Coligny,  Châtillon-Coligny", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (29, "CLVUE", "30", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  29, 29, 29
);
        
INSERT INTO sujet(label)
VALUES ("rue, église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Château, puits");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48433, 29);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (29, 29);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (29, 29);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (29, 29);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (30, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (30, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (30, "Saint-Maurice-sur-Aveyron", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (30, "CLVUE", "31", "NULL", "NULL", "NULL", "NULL", "3", "négatif", "nb", "1cliché avec tache centrale",
  30, 30, 30
);
        
INSERT INTO sujet(label)
VALUES ("abbaye de Fontaine-Jean");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51478, 30);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (30, 30);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (30, 30);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (30, 30);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (31, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (31, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (31, "Aulnay-la-Rivière", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (31, "CLVUE", "32", "NULL", "NULL", "NULL", "NULL", "4", "négatif", "nb", "voile dichroïque",
  31, 31, 31
);
        
INSERT INTO sujet(label)
VALUES ("cours d'eau");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47590, 31);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (31, 31);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (31, 31);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (31, 31);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (32, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (32, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (32, "Triguères", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (32, "CLVUE", "33", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  32, 32, 32
);
        
INSERT INTO sujet(label)
VALUES ("puits de pétrole");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51892, 32);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (32, 32);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (32, 32);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (32, 32);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (33, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (33, "Maître autel");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (33, "Triguères,  Triguères,  Triguères", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (33, "CLVUE", "34", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "NULL",
  33, 33, 33
);
        
INSERT INTO sujet(label)
VALUES ("église , église, mobilier religieux, église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Maître autel");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51883 | 51884, 33);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (33, 33);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (33, 33);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (33, 33);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (34, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (34, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (34, "Douchy", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (34, "CLVUE", "35", "NULL", "NULL", "NULL", "NULL", "4", "négatif", "nb", "NULL",
  34, 34, 34
);
        
INSERT INTO sujet(label)
VALUES ("château de la Brûlerie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48885, 34);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (34, 34);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (34, 34);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (34, 34);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (35, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (35, "Château, la nuit");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (35, "Sully-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (35, "CLVUE", "36", "NULL", "NULL", "NULL", "NULL", "5", "négatif", "nb", "NULL",
  35, 35, 35
);
        
INSERT INTO sujet(label)
VALUES ("château");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Château, la nuit");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51706, 35);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (35, 35);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (35, 35);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (35, 35);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (36, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (36, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (36, "Saint-Benoît-sur-Loire,  Saint-Benoît-sur-Loire,  Saint-Benoît-sur-Loire,  Saint-Benoît-sur-Loire,  Saint-Benoît-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (36, "CLVUE", "37", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "NULL",
  36, 36, 36
);
        
INSERT INTO sujet(label)
VALUES ("abbaye, porche, abbaye, portail, abbaye, chapiteau, abbaye, colonne, abbaye");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51197, 36);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (36, 36);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (36, 36);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (36, 36);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (37, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (37, "Locaux");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (37, "Orléans", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (37, "CLVUE", "38", "NULL", "NULL", "NULL", "NULL", "5", "négatif", "nb", "NULL",
  37, 37, 37
);
        
INSERT INTO sujet(label)
VALUES ("archives départementales");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Locaux");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50346, 37);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (37, 37);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (37, 37);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (37, 37);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (38, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (38, "Sculpture sur maison");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (38, "Paris", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (38, "CLVUE", "39", "NULL", "NULL", "NULL", "NULL", "4", "négatif", "nb", "même vue expo différente",
  38, 38, 38
);
        
INSERT INTO sujet(label)
VALUES ("Notre-Dame, bas-relief");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Sculpture sur maison");
        
INSERT INTO cindoc(label, photo_id)
VALUES (52125, 38);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (38, 38);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (38, 38);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (38, 38);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (39, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (39, "Entrée d'édifice religieux");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (39, "Paris", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (39, "CLVUE", "40", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  39, 39, 39
);
        
INSERT INTO sujet(label)
VALUES ("Notre-Dame, portail");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Entrée d'édifice religieux");
        
INSERT INTO cindoc(label, photo_id)
VALUES (52126, 39);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (39, 39);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (39, 39);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (39, 39);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (40, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (40, "Scène gravée sur pierre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (40, "Orléans", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (40, "CLVUE", "41", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "NULL",
  40, 40, 40
);
        
INSERT INTO sujet(label)
VALUES ("institut d'arts visuels");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Scène gravée sur pierre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (52127, 40);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (40, 40);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (40, 40);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (40, 40);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (41, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (41, "Cave ancienne école de la rue de l'Université");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (41, "Orléans", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (41, "CLVUE", "42", "NULL", "NULL", "NULL", "NULL", "4", "négatif", "nb", "même vue expo différente",
  41, 41, 41
);
        
INSERT INTO sujet(label)
VALUES ("cave");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Cave ancienne école de la rue de l'Université");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50393, 41);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (41, 41);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (41, 41);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (41, 41);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (42, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (42, "Chaire, fonts baptismaux");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (42, "Jargeau", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (42, "CLVUE", "43", "NULL", "NULL", "NULL", "NULL", "4", "négatif", "nb", "même vue expo différente",
  42, 42, 42
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Chaire, fonts baptismaux");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49375, 42);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (42, 42);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (42, 42);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (42, 42);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (43, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (43, "Chaire, fonts baptismaux");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (43, "Jargeau", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (43, "CLVUE", "44", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "même vue expo différente",
  43, 43, 43
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Chaire, fonts baptismaux");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49375, 43);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (43, 43);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (43, 43);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (43, 43);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (44, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (44, "Christ en croix, statues");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (44, "Nibelle", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (44, "CLVUE", "45", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  44, 44, 44
);
        
INSERT INTO sujet(label)
VALUES ("église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Christ en croix, statues");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50252, 44);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (44, 44);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (44, 44);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (44, 44);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (45, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (45, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (45, "Nibelle", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (45, "CLVUE", "46", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  45, 45, 45
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50254, 45);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (45, 45);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (45, 45);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (45, 45);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (46, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (46, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (46, "Nibelle", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (46, "CLVUE", "47", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  46, 46, 46
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50254, 46);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (46, 46);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (46, 46);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (46, 46);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (47, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (47, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (47, "Nibelle", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (47, "CLVUE", "48", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  47, 47, 47
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50254, 47);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (47, 47);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (47, 47);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (47, 47);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (48, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (48, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (48, "Nibelle", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (48, "CLVUE", "49", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  48, 48, 48
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50254, 48);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (48, 48);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (48, 48);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (48, 48);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (49, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (49, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (49, "Nibelle", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (49, "CLVUE", "50", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "même vue expo différente",
  49, 49, 49
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50254, 49);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (49, 49);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (49, 49);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (49, 49);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (50, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (50, "Ruine ancienne église Saint-Paul avant démolition");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (50, "Orléans,  Orléans", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (50, "CLVUE", "51", "NULL", "NULL", "NULL", "NULL", "1", "verre négatif", "nb", "retouche à la sanguine sur le bas de l'image",
  50, 50, 50
);
        
INSERT INTO sujet(label)
VALUES ("église Saint-Paul, tour Saint-Paul");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Ruine ancienne église Saint-Paul avant démolition");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50473, 50);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (50, 50);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (50, 50);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (50, 50);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (51, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (51, "Ruine ancienne église Saint-Paul avant démolition");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (51, "Orléans,  Orléans", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (51, "CLVUE", "52", "NULL", "NULL", "NULL", "NULL", "1", "verre négatif", "nb", "NULL",
  51, 51, 51
);
        
INSERT INTO sujet(label)
VALUES ("église Saint-Paul, tour Saint-Paul");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Ruine ancienne église Saint-Paul avant démolition");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50473, 51);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (51, 51);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (51, 51);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (51, 51);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (52, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (52, "Ruine ancienne église Saint-Paul avant démolition");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (52, "Orléans,  Orléans", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (52, "CLVUE", "53", "NULL", "NULL", "NULL", "NULL", "1", "verre négatif", "nb", "NULL",
  52, 52, 52
);
        
INSERT INTO sujet(label)
VALUES ("église Saint-Paul, tour Saint-Paul");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Ruine ancienne église Saint-Paul avant démolition");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50473, 52);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (52, 52);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (52, 52);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (52, 52);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (53, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (53, "Vue générale et église");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (53, "Ouzouer-sur-Trézée,  Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (53, "CLVUE", "54", "NULL", "NULL", "NULL", "NULL", "4", "négatif", "nb", "NULL",
  53, 53, 53
);
        
INSERT INTO sujet(label)
VALUES ("église , vue générale");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Vue générale et église");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50886 | 50899, 53);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (53, 53);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (53, 53);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (53, 53);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (54, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (54, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (54, "Briare (canal),  Briare,  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (54, "CLVUE", "55", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "NULL",
  54, 54, 54
);
        
INSERT INTO sujet(label)
VALUES ("pont, pont-canal, canal latéral, pont-canal");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48077, 54);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (54, 54);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (54, 54);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (54, 54);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (55, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (55, "Intérieur église");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (55, "Ouzouer-sur-Trézée,  Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (55, "CLVUE", "56", "NULL", "NULL", "NULL", "NULL", "3", "négatif", "nb", "NULL",
  55, 55, 55
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux, église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Intérieur église");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50888, 55);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (55, 55);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (55, 55);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (55, 55);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (56, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (56, "Intérieur église");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (56, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (56, "CLVUE", "57", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  56, 56, 56
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Intérieur église");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50886, 56);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (56, 56);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (56, 56);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (56, 56);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (57, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (57, "Intérieur église");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (57, "Ouzouer-sur-Trézée,  Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (57, "CLVUE", "58", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "NULL",
  57, 57, 57
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux, église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Intérieur église");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50888, 57);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (57, 57);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (57, 57);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (57, 57);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (58, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (58, "Intérieur église");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (58, "Ouzouer-sur-Trézée,  Ouzouer-sur-Trézée,  Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (58, "CLVUE", "59", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  58, 58, 58
);
        
INSERT INTO sujet(label)
VALUES ("église, statue , église, mobilier religieux, église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Intérieur église");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50891 | 50888, 58);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (58, 58);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (58, 58);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (58, 58);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (59, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (59, "Intérieur église");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (59, "Ouzouer-sur-Trézée,  Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (59, "CLVUE", "60", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  59, 59, 59
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux, église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Intérieur église");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50888, 59);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (59, 59);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (59, 59);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (59, 59);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (60, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (60, "Intérieur église");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (60, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (60, "CLVUE", "61", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "1cliché avec tache centrale",
  60, 60, 60
);
        
INSERT INTO sujet(label)
VALUES ("église, tableau");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Intérieur église");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50892, 60);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (60, 60);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (60, 60);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (60, 60);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (61, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (61, "Intérieur église");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (61, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (61, "CLVUE", "62", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  61, 61, 61
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Intérieur église");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50887, 61);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (61, 61);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (61, 61);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (61, 61);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (62, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (62, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (62, "Bellegarde", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (62, "CLVUE", "63", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "NULL",
  62, 62, 62
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47838, 62);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (62, 62);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (62, 62);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (62, 62);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (63, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (63, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (63, "Bellegarde", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (63, "CLVUE", "64", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "NULL",
  63, 63, 63
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47837, 63);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (63, 63);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (63, 63);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (63, 63);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (64, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (64, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (64, "Courtenay", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (64, "CLVUE", "65", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "même vue expo différente",
  64, 64, 64
);
        
INSERT INTO sujet(label)
VALUES ("église, tableau");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48744, 64);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (64, 64);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (64, 64);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (64, 64);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (65, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (65, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (65, "Courtenay", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (65, "CLVUE", "66", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  65, 65, 65
);
        
INSERT INTO sujet(label)
VALUES ("église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48741, 65);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (65, 65);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (65, 65);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (65, 65);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (66, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (66, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (66, "Courtenay", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (66, "CLVUE", "67", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  66, 66, 66
);
        
INSERT INTO sujet(label)
VALUES ("église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48742, 66);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (66, 66);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (66, 66);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (66, 66);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (67, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (67, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (67, "Courtenay", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (67, "CLVUE", "68", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", " 1 duplicata 4,5 x 6 nb",
  67, 67, 67
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48740, 67);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (67, 67);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (67, 67);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (67, 67);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (68, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (68, "Pyxide");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (68, "Puiseaux", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (68, "CLVUE", "69", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  68, 68, 68
);
        
INSERT INTO sujet(label)
VALUES ("église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Pyxide");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51073, 68);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (68, 68);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (68, 68);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (68, 68);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (69, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (69, "Pharmacie de l'ancien hôtel Dieu");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (69, "Pithiviers,  Pithiviers", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (69, "CLVUE", "70", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  69, 69, 69
);
        
INSERT INTO sujet(label)
VALUES ("hôpital, hôpital, pharmacie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Pharmacie de l'ancien hôtel Dieu");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50998, 69);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (69, 69);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (69, 69);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (69, 69);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (70, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (70, "Pharmacie de l'ancien hôtel Dieu");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (70, "Pithiviers,  Pithiviers", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (70, "CLVUE", "71", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "NULL",
  70, 70, 70
);
        
INSERT INTO sujet(label)
VALUES ("hôpital, hôpital, pharmacie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Pharmacie de l'ancien hôtel Dieu");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50998, 70);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (70, 70);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (70, 70);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (70, 70);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (71, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (71, "Pharmacie de l'ancien hôtel Dieu");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (71, "Pithiviers,  Pithiviers", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (71, "CLVUE", "72", "NULL", "NULL", "NULL", "NULL", "4", "négatif", "nb", "NULL",
  71, 71, 71
);
        
INSERT INTO sujet(label)
VALUES ("hôpital, hôpital, pharmacie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Pharmacie de l'ancien hôtel Dieu");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50998, 71);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (71, 71);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (71, 71);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (71, 71);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (72, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (72, "Intérieur église");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (72, "Ingré", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (72, "CLVUE", "73", "NULL", "NULL", "NULL", "NULL", "3", "négatif", "nb", "NULL",
  72, 72, 72
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Intérieur église");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49326, 72);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (72, 72);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (72, 72);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (72, 72);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (73, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (73, "Intérieur église");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (73, "Ingré", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (73, "CLVUE", "74", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "NULL",
  73, 73, 73
);
        
INSERT INTO sujet(label)
VALUES ("église, vêtement religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Intérieur église");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49330, 73);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (73, 73);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (73, 73);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (73, 73);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (74, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (74, "Intérieur église");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (74, "Ingré", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (74, "CLVUE", "75", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  74, 74, 74
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Intérieur église");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49327, 74);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (74, 74);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (74, 74);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (74, 74);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (75, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (75, "Intérieur église");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (75, "Ingré", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (75, "CLVUE", "76", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  75, 75, 75
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Intérieur église");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49327, 75);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (75, 75);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (75, 75);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (75, 75);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (76, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (76, "Eglise Notre-Dame");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (76, "Beaugency", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (76, "CLVUE", "77", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  76, 76, 76
);
        
INSERT INTO sujet(label)
VALUES ("église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise Notre-Dame");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47769, 76);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (76, 76);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (76, 76);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (76, 76);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (77, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (77, "Eglise Notre-Dame");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (77, "Beaugency", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (77, "CLVUE", "78", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  77, 77, 77
);
        
INSERT INTO sujet(label)
VALUES ("église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise Notre-Dame");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47769, 77);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (77, 77);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (77, 77);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (77, 77);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (78, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (78, "Eglise Notre-Dame");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (78, "Beaugency,  Boigny-sur-Bionne", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (78, "CLVUE", "79", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  78, 78, 78
);
        
INSERT INTO sujet(label)
VALUES ("église, objet du culte , église, tableau");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise Notre-Dame");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47769 | 47870, 78);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (78, 78);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (78, 78);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (78, 78);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (79, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (79, "Eglise Notre-Dame");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (79, "Beaugency", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (79, "CLVUE", "80", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  79, 79, 79
);
        
INSERT INTO sujet(label)
VALUES ("église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise Notre-Dame");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47769, 79);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (79, 79);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (79, 79);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (79, 79);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (80, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (80, "Chasuble");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (80, "Tavers", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (80, "CLVUE", "81", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  80, 80, 80
);
        
INSERT INTO sujet(label)
VALUES ("église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Chasuble");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51746, 80);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (80, 80);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (80, 80);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (80, 80);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (81, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (81, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (81, "Bricy", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (81, "CLVUE", "82", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  81, 81, 81
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48118, 81);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (81, 81);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (81, 81);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (81, 81);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (82, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (82, "Statue saint Blaise, bois");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (82, "Ondreville-sur-Essonne", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (82, "CLVUE", "83", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  82, 82, 82
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Statue saint Blaise, bois");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50325, 82);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (82, 82);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (82, 82);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (82, 82);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (83, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (83, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (83, "Aulnay-la-Rivière", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (83, "CLVUE", "84", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  83, 83, 83
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47593, 83);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (83, 83);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (83, 83);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (83, 83);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (84, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (84, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (84, "Châtillon-sur-Loire,  Châtillon-sur-Loire - Mantelot", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (84, "CLVUE", "85", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", " 1 duplicata 4,5 x 6 nb",
  84, 84, 84
);
        
INSERT INTO sujet(label)
VALUES ("canal latéral à la Loire, écluse");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48443, 84);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (84, 84);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (84, 84);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (84, 84);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (85, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (85, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (85, "Châtillon-sur-Loire,  Châtillon-sur-Loire - Mantelot", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (85, "CLVUE", "86", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  85, 85, 85
);
        
INSERT INTO sujet(label)
VALUES ("canal latéral à la Loire, écluse");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48443, 85);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (85, 85);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (85, 85);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (85, 85);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (86, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (86, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (86, "Châtillon-sur-Loire,  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (86, "CLVUE", "87", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  86, 86, 86
);
        
INSERT INTO sujet(label)
VALUES (", ");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48458, 86);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (86, 86);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (86, 86);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (86, 86);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (87, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (87, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (87, "Beaulieu-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (87, "CLVUE", "88", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  87, 87, 87
);
        
INSERT INTO sujet(label)
VALUES ("château d'Assay");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47793, 87);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (87, 87);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (87, 87);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (87, 87);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (88, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (88, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (88, "Beaulieu-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (88, "CLVUE", "89", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", " 1 duplicata 4,5 x 6 nb",
  88, 88, 88
);
        
INSERT INTO sujet(label)
VALUES ("château d'Assay");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47793, 88);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (88, 88);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (88, 88);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (88, 88);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (89, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (89, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (89, "Beaulieu-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (89, "CLVUE", "90", "NULL", "NULL", "NULL", "NULL", "1, 2", "négatif, négatif", "nb, nb", "NULL",
  89, 89, 89
);
        
INSERT INTO sujet(label)
VALUES ("château d'Assay");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47793, 89);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (89, 89);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (89, 89);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (89, 89);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (90, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (90, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (90, "NULL", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (90, "CLVUE", "91", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  90, 90, 90
);
        
INSERT INTO sujet(label)
VALUES ("NULL");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (NULL, 90);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (90, 90);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (90, 90);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (90, 90);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (91, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (91, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (91, "Beaulieu-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (91, "CLVUE", "92", "NULL", "NULL", "NULL", "NULL", "3", "négatif", "nb", "NULL",
  91, 91, 91
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47796, 91);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (91, 91);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (91, 91);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (91, 91);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (92, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (92, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (92, "Beaulieu-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (92, "CLVUE", "93", "NULL", "NULL", "NULL", "NULL", "1, 2", "négatif, négatif", "nb, nb", "NULL",
  92, 92, 92
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47795, 92);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (92, 92);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (92, 92);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (92, 92);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (93, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (93, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (93, "Beaulieu-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (93, "CLVUE", "94", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  93, 93, 93
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47798, 93);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (93, 93);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (93, 93);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (93, 93);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (94, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (94, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (94, "Beaulieu-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (94, "CLVUE", "95", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  94, 94, 94
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47796, 94);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (94, 94);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (94, 94);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (94, 94);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (95, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (95, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (95, "Bellegarde,  Bellegarde -- château", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (95, "CLVUE", "96", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  95, 95, 95
);
        
INSERT INTO sujet(label)
VALUES (", ");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47836, 95);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (95, 95);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (95, 95);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (95, 95);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (96, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (96, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (96, "Bellegarde,  Bellegarde -- château", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (96, "CLVUE", "97", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  96, 96, 96
);
        
INSERT INTO sujet(label)
VALUES (", ");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47836, 96);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (96, 96);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (96, 96);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (96, 96);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (97, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (97, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (97, "Bellegarde,  Bellegarde -- château", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (97, "CLVUE", "98", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  97, 97, 97
);
        
INSERT INTO sujet(label)
VALUES (", ");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47836, 97);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (97, 97);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (97, 97);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (97, 97);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (98, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (98, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (98, "Bellegarde,  Bellegarde -- château", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (98, "CLVUE", "99", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  98, 98, 98
);
        
INSERT INTO sujet(label)
VALUES (", ");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47836, 98);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (98, 98);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (98, 98);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (98, 98);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (99, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (99, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (99, "Bellegarde,  Bellegarde -- château", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (99, "CLVUE", "100", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  99, 99, 99
);
        
INSERT INTO sujet(label)
VALUES (", ");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47836, 99);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (99, 99);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (99, 99);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (99, 99);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (100, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (100, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (100, "Bellegarde,  Bellegarde -- château", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (100, "CLVUE", "101", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  100, 100, 100
);
        
INSERT INTO sujet(label)
VALUES (", ");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47836, 100);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (100, 100);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (100, 100);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (100, 100);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (101, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (101, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (101, "Bellegarde,  Bellegarde -- château", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (101, "CLVUE", "102", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  101, 101, 101
);
        
INSERT INTO sujet(label)
VALUES (", ");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47836, 101);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (101, 101);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (101, 101);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (101, 101);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (102, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (102, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (102, "Bellegarde", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (102, "CLVUE", "103", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  102, 102, 102
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47837, 102);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (102, 102);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (102, 102);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (102, 102);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (103, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (103, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (103, "Bellegarde", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (103, "CLVUE", "104", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  103, 103, 103
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47837, 103);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (103, 103);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (103, 103);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (103, 103);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (104, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (104, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (104, "Bellegarde", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (104, "CLVUE", "105", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  104, 104, 104
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47837, 104);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (104, 104);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (104, 104);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (104, 104);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (105, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (105, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (105, "Bellegarde", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (105, "CLVUE", "106", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  105, 105, 105
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47837, 105);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (105, 105);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (105, 105);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (105, 105);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (106, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (106, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (106, "Bellegarde,  Bellegarde -- château", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (106, "CLVUE", "107", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  106, 106, 106
);
        
INSERT INTO sujet(label)
VALUES (", ");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47836, 106);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (106, 106);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (106, 106);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (106, 106);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (107, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (107, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (107, "Bellegarde,  Bellegarde -- château", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (107, "CLVUE", "108", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  107, 107, 107
);
        
INSERT INTO sujet(label)
VALUES (", ");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47836, 107);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (107, 107);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (107, 107);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (107, 107);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (108, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (108, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (108, "Bellegarde", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (108, "CLVUE", "109", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  108, 108, 108
);
        
INSERT INTO sujet(label)
VALUES ("pierre tombale");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47846, 108);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (108, 108);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (108, 108);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (108, 108);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (109, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (109, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (109, "Bellegarde", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (109, "CLVUE", "110", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  109, 109, 109
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47840, 109);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (109, 109);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (109, 109);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (109, 109);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (110, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (110, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (110, "Fréville-en-Gâtinais", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (110, "CLVUE", "111", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  110, 110, 110
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49108, 110);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (110, 110);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (110, 110);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (110, 110);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (111, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (111, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (111, "NULL", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (111, "CLVUE", "112", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  111, 111, 111
);
        
INSERT INTO sujet(label)
VALUES ("NULL");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (NULL, 111);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (111, 111);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (111, 111);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (111, 111);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (112, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (112, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (112, "Fréville-en-Gâtinais", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (112, "CLVUE", "113", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  112, 112, 112
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49110, 112);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (112, 112);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (112, 112);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (112, 112);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (113, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (113, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (113, "Fréville-en-Gâtinais", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (113, "CLVUE", "114", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  113, 113, 113
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49110, 113);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (113, 113);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (113, 113);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (113, 113);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (114, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (114, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (114, "Beaugency", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (114, "CLVUE", "115", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  114, 114, 114
);
        
INSERT INTO sujet(label)
VALUES ("église Notre-Dame");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47765, 114);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (114, 114);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (114, 114);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (114, 114);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (115, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (115, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (115, "Beaugency", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (115, "CLVUE", "116", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  115, 115, 115
);
        
INSERT INTO sujet(label)
VALUES ("église Saint-Firmin");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47767, 115);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (115, 115);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (115, 115);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (115, 115);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (116, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (116, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (116, "Beaugency", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (116, "CLVUE", "117", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  116, 116, 116
);
        
INSERT INTO sujet(label)
VALUES ("pont");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47782, 116);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (116, 116);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (116, 116);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (116, 116);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (117, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (117, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (117, "Beaugency", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (117, "CLVUE", "118", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  117, 117, 117
);
        
INSERT INTO sujet(label)
VALUES ("pont");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47782, 117);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (117, 117);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (117, 117);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (117, 117);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (118, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (118, "Eglise, extérieur");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (118, "Préfontaines", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (118, "CLVUE", "119", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  118, 118, 118
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise, extérieur");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51038, 118);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (118, 118);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (118, 118);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (118, 118);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (119, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (119, "Eglise, extérieur");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (119, "Préfontaines", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (119, "CLVUE", "120", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", " 1 duplicata 4,5 x 6 nb",
  119, 119, 119
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise, extérieur");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51038, 119);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (119, 119);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (119, 119);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (119, 119);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (120, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (120, "Eglise, extérieur");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (120, "Préfontaines", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (120, "CLVUE", "121", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", " 1 duplicata 4,5 x 6 nb",
  120, 120, 120
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise, extérieur");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51038, 120);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (120, 120);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (120, 120);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (120, 120);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (121, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (121, "Eglise, extérieur");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (121, "Préfontaines", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (121, "CLVUE", "122", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", " 1 duplicata 4,5 x 6 nb",
  121, 121, 121
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise, extérieur");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51038, 121);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (121, 121);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (121, 121);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (121, 121);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (122, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (122, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (122, "Ferrières-en-Gâtinais", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (122, "CLVUE", "123", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  122, 122, 122
);
        
INSERT INTO sujet(label)
VALUES ("église Saint-Pierre");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49056, 122);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (122, 122);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (122, 122);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (122, 122);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (123, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (123, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (123, "Ferrières-en-Gâtinais", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (123, "CLVUE", "124", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  123, 123, 123
);
        
INSERT INTO sujet(label)
VALUES ("église Saint-Pierre");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49056, 123);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (123, 123);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (123, 123);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (123, 123);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (124, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (124, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (124, "Ferrières-en-Gâtinais", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (124, "CLVUE", "125", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  124, 124, 124
);
        
INSERT INTO sujet(label)
VALUES ("église Saint-Pierre");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49056, 124);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (124, 124);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (124, 124);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (124, 124);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (125, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (125, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (125, "Ferrières-en-Gâtinais", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (125, "CLVUE", "126", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  125, 125, 125
);
        
INSERT INTO sujet(label)
VALUES ("église Saint-Pierre");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49056, 125);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (125, 125);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (125, 125);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (125, 125);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (126, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (126, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (126, "Ferrières-en-Gâtinais", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (126, "CLVUE", "127", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  126, 126, 126
);
        
INSERT INTO sujet(label)
VALUES ("église Saint-Pierre");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49056, 126);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (126, 126);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (126, 126);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (126, 126);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (127, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (127, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (127, "Ferrières-en-Gâtinais", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (127, "CLVUE", "128", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  127, 127, 127
);
        
INSERT INTO sujet(label)
VALUES ("église Saint-Pierre");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49056, 127);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (127, 127);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (127, 127);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (127, 127);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (128, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (128, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (128, "Ferrières-en-Gâtinais", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (128, "CLVUE", "129", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  128, 128, 128
);
        
INSERT INTO sujet(label)
VALUES ("église Saint-Pierre");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49056, 128);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (128, 128);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (128, 128);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (128, 128);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (129, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (129, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (129, "Ferrières-en-Gâtinais", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (129, "CLVUE", "130", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  129, 129, 129
);
        
INSERT INTO sujet(label)
VALUES ("église Saint-Pierre");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49056, 129);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (129, 129);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (129, 129);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (129, 129);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (130, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (130, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (130, "Ferrières-en-Gâtinais", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (130, "CLVUE", "131", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  130, 130, 130
);
        
INSERT INTO sujet(label)
VALUES ("église Saint-Pierre");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49056, 130);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (130, 130);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (130, 130);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (130, 130);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (131, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (131, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (131, "Ferrières-en-Gâtinais", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (131, "CLVUE", "132", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  131, 131, 131
);
        
INSERT INTO sujet(label)
VALUES ("église Saint-Pierre, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49058, 131);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (131, 131);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (131, 131);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (131, 131);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (132, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (132, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (132, "Ferrières-en-Gâtinais,  Ferrières-en-Gâtinais", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (132, "CLVUE", "133", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  132, 132, 132
);
        
INSERT INTO sujet(label)
VALUES ("église Saint-Pierre, mobilier religieux, église Saint-Pierre, armoiries, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49057, 132);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (132, 132);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (132, 132);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (132, 132);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (133, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (133, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (133, "Ferrières-en-Gâtinais,  Ferrières-en-Gâtinais", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (133, "CLVUE", "134", "NULL", "NULL", "SAINT PIERRE, statue/ SAINT PAUL, statue", "NULL", "1", "négatif", "nb", "NULL",
  133, 133, 133
);
        
INSERT INTO sujet(label)
VALUES ("église Notre-Dame-de-Bethléem, statue, église Saint-Pierre, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49054, 133);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (133, 133);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (133, 133);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (133, 133);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (134, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (134, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (134, "Ferrières-en-Gâtinais,  Ferrières-en-Gâtinais", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (134, "CLVUE", "135", "NULL", "NULL", "SAINT PIERRE, statue/ SAINT PAUL, statue", "NULL", "1", "négatif", "nb", "NULL",
  134, 134, 134
);
        
INSERT INTO sujet(label)
VALUES ("église Notre-Dame-de-Bethléem, statue, église Saint-Pierre, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49054, 134);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (134, 134);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (134, 134);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (134, 134);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (135, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (135, "Tympan de l'église");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (135, "Girolles", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (135, "CLVUE", "136", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  135, 135, 135
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Tympan de l'église");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49173, 135);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (135, 135);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (135, 135);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (135, 135);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (136, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (136, "Eglise statue");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (136, "Saint-Florent-le-Jeune", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (136, "CLVUE", "137", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  136, 136, 136
);
        
INSERT INTO sujet(label)
VALUES ("église, plaque commémorative");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise statue");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51313, 136);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (136, 136);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (136, 136);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (136, 136);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (137, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (137, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (137, "Viglain", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (137, "CLVUE", "138", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  137, 137, 137
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51974, 137);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (137, 137);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (137, 137);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (137, 137);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (138, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (138, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (138, "Viglain", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (138, "CLVUE", "139", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  138, 138, 138
);
        
INSERT INTO sujet(label)
VALUES ("église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51971, 138);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (138, 138);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (138, 138);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (138, 138);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (139, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (139, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (139, "Viglain", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (139, "CLVUE", "140", "NULL", "NULL", "NULL", "NULL", "1, 1", "négatif, négatif", "nb, nb", "NULL",
  139, 139, 139
);
        
INSERT INTO sujet(label)
VALUES ("église, pierre tombale");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51972, 139);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (139, 139);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (139, 139);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (139, 139);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (140, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (140, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (140, "Viglain", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (140, "CLVUE", "141", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  140, 140, 140
);
        
INSERT INTO sujet(label)
VALUES ("église, pierre tombale");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51972, 140);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (140, 140);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (140, 140);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (140, 140);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (141, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (141, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (141, "Viglain", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (141, "CLVUE", "142", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  141, 141, 141
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51974, 141);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (141, 141);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (141, 141);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (141, 141);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (142, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (142, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (142, "Cerdon", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (142, "CLVUE", "143", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "NULL",
  142, 142, 142
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48180, 142);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (142, 142);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (142, 142);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (142, 142);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (143, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (143, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (143, "Cerdon", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (143, "CLVUE", "144", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  143, 143, 143
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48180, 143);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (143, 143);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (143, 143);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (143, 143);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (144, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (144, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (144, "Cerdon,  Cerdon", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (144, "CLVUE", "145", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  144, 144, 144
);
        
INSERT INTO sujet(label)
VALUES ("église, statue, église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48182, 144);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (144, 144);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (144, 144);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (144, 144);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (145, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (145, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (145, "Cerdon,  Cerdon", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (145, "CLVUE", "146", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  145, 145, 145
);
        
INSERT INTO sujet(label)
VALUES ("église, statue, église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48182, 145);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (145, 145);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (145, 145);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (145, 145);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (146, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (146, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (146, "Cerdon,  Cerdon", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (146, "CLVUE", "147", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  146, 146, 146
);
        
INSERT INTO sujet(label)
VALUES ("église, statue, église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48182, 146);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (146, 146);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (146, 146);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (146, 146);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (147, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (147, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (147, "Cerdon", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (147, "CLVUE", "148", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "même vue expo différente",
  147, 147, 147
);
        
INSERT INTO sujet(label)
VALUES ("église, tableau");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48183, 147);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (147, 147);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (147, 147);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (147, 147);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (148, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (148, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (148, "Cerdon", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (148, "CLVUE", "149", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  148, 148, 148
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48180, 148);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (148, 148);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (148, 148);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (148, 148);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (149, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (149, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (149, "Cerdon", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (149, "CLVUE", "150", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  149, 149, 149
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48181, 149);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (149, 149);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (149, 149);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (149, 149);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (150, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (150, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (150, "Cerdon,  Cerdon", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (150, "CLVUE", "151", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  150, 150, 150
);
        
INSERT INTO sujet(label)
VALUES ("église, statue, église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48182, 150);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (150, 150);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (150, 150);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (150, 150);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (151, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (151, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (151, "Cerdon,  Cerdon,  Cerdon", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (151, "CLVUE", "152", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "même vue expo différente/ taches",
  151, 151, 151
);
        
INSERT INTO sujet(label)
VALUES ("église, statue, église, mobilier religieux , église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48182 | 48181, 151);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (151, 151);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (151, 151);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (151, 151);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (152, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (152, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (152, "Escrennes", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (152, "CLVUE", "153", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  152, 152, 152
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48976, 152);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (152, 152);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (152, 152);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (152, 152);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (153, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (153, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (153, "Escrennes,  Escrennes,  Escrennes", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (153, "CLVUE", "154", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  153, 153, 153
);
        
INSERT INTO sujet(label)
VALUES ("château, grille, château, orangerie, château");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48975, 153);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (153, 153);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (153, 153);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (153, 153);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (154, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (154, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (154, "Escrennes,  Escrennes,  Escrennes", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (154, "CLVUE", "155", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  154, 154, 154
);
        
INSERT INTO sujet(label)
VALUES ("château, grille, château, orangerie, château");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48975, 154);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (154, 154);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (154, 154);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (154, 154);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (155, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (155, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (155, "Escrennes,  Escrennes,  Escrennes", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (155, "CLVUE", "156", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  155, 155, 155
);
        
INSERT INTO sujet(label)
VALUES ("château, grille, château, orangerie, château");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48975, 155);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (155, 155);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (155, 155);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (155, 155);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (156, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (156, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (156, "Escrennes,  Escrennes,  Escrennes", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (156, "CLVUE", "157", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  156, 156, 156
);
        
INSERT INTO sujet(label)
VALUES ("château, grille, château, orangerie, château");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48975, 156);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (156, 156);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (156, 156);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (156, 156);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (157, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (157, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (157, "Escrennes,  Escrennes,  Escrennes", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (157, "CLVUE", "158", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  157, 157, 157
);
        
INSERT INTO sujet(label)
VALUES ("château, grille, château, orangerie, château");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48975, 157);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (157, 157);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (157, 157);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (157, 157);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (158, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (158, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (158, "Escrennes", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (158, "CLVUE", "159", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  158, 158, 158
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48977, 158);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (158, 158);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (158, 158);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (158, 158);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (159, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (159, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (159, "Escrennes", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (159, "CLVUE", "160", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "même vue expo différente/ taches",
  159, 159, 159
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48979, 159);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (159, 159);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (159, 159);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (159, 159);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (160, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (160, "Moulin à vent");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (160, "Rebréchien", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (160, "CLVUE", "161", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  160, 160, 160
);
        
INSERT INTO sujet(label)
VALUES ("moulin");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Moulin à vent");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51116, 160);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (160, 160);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (160, 160);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (160, 160);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (161, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (161, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (161, "Rebréchien", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (161, "CLVUE", "162", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  161, 161, 161
);
        
INSERT INTO sujet(label)
VALUES ("moulin");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51116, 161);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (161, 161);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (161, 161);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (161, 161);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (162, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (162, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (162, "Rebréchien", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (162, "CLVUE", "163", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  162, 162, 162
);
        
INSERT INTO sujet(label)
VALUES ("moulin");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51116, 162);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (162, 162);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (162, 162);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (162, 162);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (163, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (163, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (163, "Santeau", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (163, "CLVUE", "164", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  163, 163, 163
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51587, 163);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (163, 163);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (163, 163);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (163, 163);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (164, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (164, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (164, "Chilleurs-aux-Bois - Gallerand,  Chilleurs-aux-Bois", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (164, "CLVUE", "165", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  164, 164, 164
);
        
INSERT INTO sujet(label)
VALUES ("église, église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48540, 164);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (164, 164);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (164, 164);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (164, 164);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (165, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (165, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (165, "Chilleurs-aux-Bois - Gallerand,  Chilleurs-aux-Bois", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (165, "CLVUE", "166", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  165, 165, 165
);
        
INSERT INTO sujet(label)
VALUES ("église, église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48540, 165);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (165, 165);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (165, 165);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (165, 165);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (166, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (166, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (166, "Chilleurs-aux-Bois,  Chilleurs-aux-Bois,  Chilleurs-aux-Bois", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (166, "CLVUE", "167", "NULL", "NULL", "NULL", "FRAD045_CLVUE000167_2", "1", "négatif", "nb", "NULL",
  166, 166, 166
);
        
INSERT INTO sujet(label)
VALUES ("château de Chamerolles, château de Chamerolles, puits, vue aérienne");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48543, 166);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (166, 166);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (166, 166);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (166, 166);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (167, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (167, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (167, "Chilleurs-aux-Bois,  Chilleurs-aux-Bois,  Chilleurs-aux-Bois", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (167, "CLVUE", "168", "NULL", "NULL", "NULL", "FRAD045_CLVUE000167_2", "1", "négatif", "nb", "NULL",
  167, 167, 167
);
        
INSERT INTO sujet(label)
VALUES ("château de Chamerolles, château de Chamerolles, puits, vue aérienne");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48543, 167);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (167, 167);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (167, 167);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (167, 167);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (168, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (168, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (168, "Chilleurs-aux-Bois - Gallerand,  Chilleurs-aux-Bois", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (168, "CLVUE", "169", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  168, 168, 168
);
        
INSERT INTO sujet(label)
VALUES ("église, église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48540, 168);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (168, 168);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (168, 168);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (168, 168);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (169, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (169, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (169, "Chilleurs-aux-Bois", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (169, "CLVUE", "170", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "même vue expo différente",
  169, 169, 169
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48545, 169);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (169, 169);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (169, 169);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (169, 169);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (170, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (170, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (170, "Mareau-aux-Bois", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (170, "CLVUE", "171", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  170, 170, 170
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49879, 170);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (170, 170);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (170, 170);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (170, 170);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (171, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (171, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (171, "Mareau-aux-Bois", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (171, "CLVUE", "172", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  171, 171, 171
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49879, 171);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (171, 171);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (171, 171);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (171, 171);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (172, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (172, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (172, "Mareau-aux-Bois", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (172, "CLVUE", "173", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  172, 172, 172
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49879, 172);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (172, 172);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (172, 172);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (172, 172);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (173, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (173, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (173, "Mareau-aux-Bois", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (173, "CLVUE", "174", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "même vue expo différente",
  173, 173, 173
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49879, 173);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (173, 173);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (173, 173);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (173, 173);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (174, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (174, "Etang du Bruel");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (174, "Marcilly-en-Villette", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (174, "CLVUE", "175", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  174, 174, 174
);
        
INSERT INTO sujet(label)
VALUES ("château le Bruel");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Etang du Bruel");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49859, 174);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (174, 174);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (174, 174);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (174, 174);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (175, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (175, "Etang du Bruel");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (175, "Marcilly-en-Villette", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (175, "CLVUE", "176", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  175, 175, 175
);
        
INSERT INTO sujet(label)
VALUES ("château le Bruel");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Etang du Bruel");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49859, 175);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (175, 175);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (175, 175);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (175, 175);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (176, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (176, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (176, "Ingrannes", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (176, "CLVUE", "177", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "même vue expo différente",
  176, 176, 176
);
        
INSERT INTO sujet(label)
VALUES ("abbaye de la Cour-Dieu");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49310, 176);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (176, 176);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (176, 176);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (176, 176);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (177, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (177, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (177, "Ingrannes", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (177, "CLVUE", "178", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  177, 177, 177
);
        
INSERT INTO sujet(label)
VALUES ("abbaye de la Cour-Dieu");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49310, 177);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (177, 177);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (177, 177);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (177, 177);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (178, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (178, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (178, "Ingrannes", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (178, "CLVUE", "179", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  178, 178, 178
);
        
INSERT INTO sujet(label)
VALUES ("abbaye de la Cour-Dieu");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49310, 178);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (178, 178);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (178, 178);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (178, 178);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (179, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (179, "Chénevières et église");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (179, "Montbouy", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (179, "CLVUE", "180", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  179, 179, 179
);
        
INSERT INTO sujet(label)
VALUES ("amphithéâtre");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Chénevières et église");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50069, 179);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (179, 179);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (179, 179);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (179, 179);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (180, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (180, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (180, "Montbouy", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (180, "CLVUE", "181", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  180, 180, 180
);
        
INSERT INTO sujet(label)
VALUES ("amphithéâtre");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50069, 180);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (180, 180);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (180, 180);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (180, 180);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (181, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (181, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (181, "Montbouy", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (181, "CLVUE", "182", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  181, 181, 181
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50068, 181);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (181, 181);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (181, 181);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (181, 181);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (182, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (182, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (182, "Montbouy", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (182, "CLVUE", "183", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  182, 182, 182
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50068, 182);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (182, 182);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (182, 182);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (182, 182);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (183, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (183, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (183, "Montbouy", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (183, "CLVUE", "184", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  183, 183, 183
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50068, 183);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (183, 183);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (183, 183);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (183, 183);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (184, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (184, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (184, "Montbouy", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (184, "CLVUE", "185", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  184, 184, 184
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50068, 184);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (184, 184);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (184, 184);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (184, 184);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (185, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (185, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (185, "Montbouy", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (185, "CLVUE", "186", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  185, 185, 185
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50068, 185);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (185, 185);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (185, 185);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (185, 185);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (186, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (186, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (186, "Montbouy", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (186, "CLVUE", "187", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  186, 186, 186
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50076, 186);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (186, 186);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (186, 186);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (186, 186);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (187, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (187, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (187, "Montbouy", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (187, "CLVUE", "188", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  187, 187, 187
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50076, 187);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (187, 187);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (187, 187);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (187, 187);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (188, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (188, "Eglise");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (188, "Saint-Maurice-sur-Aveyron", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (188, "CLVUE", "189", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  188, 188, 188
);
        
INSERT INTO sujet(label)
VALUES ("abbaye de Fontaine-Jean");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51478, 188);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (188, 188);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (188, 188);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (188, 188);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (189, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (189, "Eglise");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (189, "Saint-Maurice-sur-Aveyron", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (189, "CLVUE", "190", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  189, 189, 189
);
        
INSERT INTO sujet(label)
VALUES ("abbaye de Fontaine-Jean");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51478, 189);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (189, 189);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (189, 189);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (189, 189);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (190, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (190, "Eglise");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (190, "Saint-Maurice-sur-Aveyron", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (190, "CLVUE", "191", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  190, 190, 190
);
        
INSERT INTO sujet(label)
VALUES ("abbaye de Fontaine-Jean");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51478, 190);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (190, 190);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (190, 190);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (190, 190);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (191, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (191, "Eglise");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (191, "Saint-Maurice-sur-Aveyron", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (191, "CLVUE", "192", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  191, 191, 191
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51483, 191);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (191, 191);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (191, 191);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (191, 191);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (192, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (192, "Eglise");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (192, "Saint-Maurice-sur-Aveyron,  Saint-Maurice-sur-Aveyron", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (192, "CLVUE", "193", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  192, 192, 192
);
        
INSERT INTO sujet(label)
VALUES ("église , calvaire monumental");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51483 | 51480, 192);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (192, 192);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (192, 192);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (192, 192);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (193, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (193, "Eglise");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (193, "Saint-Maurice-sur-Aveyron", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (193, "CLVUE", "194", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  193, 193, 193
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51483, 193);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (193, 193);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (193, 193);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (193, 193);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (194, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (194, "Eglise");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (194, "Saint-Maurice-sur-Aveyron", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (194, "CLVUE", "195", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  194, 194, 194
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51483, 194);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (194, 194);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (194, 194);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (194, 194);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (195, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (195, "Eglise, porche");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (195, "La Chapelle-sur-Aveyron", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (195, "CLVUE", "196", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  195, 195, 195
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise, porche");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49478, 195);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (195, 195);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (195, 195);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (195, 195);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (196, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (196, "Eglise, porche");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (196, "Montcresson", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (196, "CLVUE", "197", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  196, 196, 196
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise, porche");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50097, 196);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (196, 196);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (196, 196);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (196, 196);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (197, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (197, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (197, "Montcresson", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (197, "CLVUE", "198", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  197, 197, 197
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50097, 197);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (197, 197);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (197, 197);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (197, 197);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (198, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (198, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (198, "Lombreuil", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (198, "CLVUE", "199", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  198, 198, 198
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49747, 198);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (198, 198);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (198, 198);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (198, 198);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (199, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (199, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (199, "Lombreuil,  Lombreuil", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (199, "CLVUE", "200", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  199, 199, 199
);
        
INSERT INTO sujet(label)
VALUES ("église, objet du culte, église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49748, 199);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (199, 199);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (199, 199);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (199, 199);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (200, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (200, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (200, "Vimory", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (200, "CLVUE", "201", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  200, 200, 200
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (52062, 200);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (200, 200);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (200, 200);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (200, 200);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (201, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (201, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (201, "Vimory,  Vimory", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (201, "CLVUE", "202", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  201, 201, 201
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux , église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (52063, 201);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (201, 201);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (201, 201);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (201, 201);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (202, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (202, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (202, "Vimory,  Vimory", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (202, "CLVUE", "203", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  202, 202, 202
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux , église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (52063, 202);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (202, 202);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (202, 202);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (202, 202);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (203, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (203, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (203, "Vimory", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (203, "CLVUE", "204", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  203, 203, 203
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (52062, 203);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (203, 203);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (203, 203);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (203, 203);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (204, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (204, "Christ de l'autel");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (204, "Thimory,  Thimory,  Vimory,  Vimory", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (204, "CLVUE", "205", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  204, 204, 204
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux, église, objet du culte , église, mobilier religieux , église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Christ de l'autel");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51790 | 52063, 204);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (204, 204);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (204, 204);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (204, 204);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (205, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (205, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (205, "Thimory,  Thimory,  Vimory,  Vimory", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (205, "CLVUE", "206", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  205, 205, 205
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux, église, objet du culte , église, mobilier religieux , église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51790 | 52063, 205);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (205, 205);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (205, 205);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (205, 205);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (206, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (206, "Statues");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (206, "La Cour-Marigny", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (206, "CLVUE", "207", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "même vue expo différente",
  206, 206, 206
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Statues");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49491, 206);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (206, 206);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (206, 206);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (206, 206);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (207, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (207, "Statues");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (207, "NULL", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (207, "CLVUE", "208", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  207, 207, 207
);
        
INSERT INTO sujet(label)
VALUES ("NULL");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Statues");
        
INSERT INTO cindoc(label, photo_id)
VALUES (NULL, 207);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (207, 207);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (207, 207);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (207, 207);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (208, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (208, "Statues");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (208, "La Cour-Marigny", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (208, "CLVUE", "209", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  208, 208, 208
);
        
INSERT INTO sujet(label)
VALUES ("église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Statues");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49492, 208);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (208, 208);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (208, 208);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (208, 208);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (209, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (209, "Statues");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (209, "La Cour-Marigny", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (209, "CLVUE", "210", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  209, 209, 209
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Statues");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49494, 209);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (209, 209);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (209, 209);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (209, 209);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (210, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (210, "Statues");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (210, "La Cour-Marigny", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (210, "CLVUE", "211", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  210, 210, 210
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Statues");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49494, 210);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (210, 210);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (210, 210);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (210, 210);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (211, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (211, "Statues");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (211, "La Cour-Marigny", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (211, "CLVUE", "212", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  211, 211, 211
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Statues");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49494, 211);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (211, 211);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (211, 211);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (211, 211);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (212, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (212, "Statues et pierre tombale murale");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (212, "Oussoy-en-Gâtinais,  Vimory", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (212, "CLVUE", "213", "NULL", "en dépôt dans l'église de Vimory | appartient à Oussoy-en-Gâtinais", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  212, 212, 212
);
        
INSERT INTO sujet(label)
VALUES ("église, statue , église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Statues et pierre tombale murale");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50835 | 52064, 212);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (212, 212);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (212, 212);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (212, 212);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (213, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (213, "Statues et pierre tombale murale");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (213, "Oussoy-en-Gâtinais", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (213, "CLVUE", "214", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  213, 213, 213
);
        
INSERT INTO sujet(label)
VALUES ("église, pierre tombale");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Statues et pierre tombale murale");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50834, 213);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (213, 213);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (213, 213);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (213, 213);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (214, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (214, "L'autel et Angelot bois");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (214, "Thimory,  Thimory", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (214, "CLVUE", "215", "NULL", "NULL", "NULL", "NULL", "1, 1", "négatif, négatif", "nb, nb", "NULL",
  214, 214, 214
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux, église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("L'autel et Angelot bois");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51790, 214);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (214, 214);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (214, 214);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (214, 214);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (215, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (215, "L'autel et Angelot bois");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (215, "Thimory", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (215, "CLVUE", "216", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  215, 215, 215
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("L'autel et Angelot bois");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51792, 215);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (215, 215);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (215, 215);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (215, 215);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (216, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (216, "Epitaphe et statue");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (216, "Izy", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (216, "CLVUE", "217", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  216, 216, 216
);
        
INSERT INTO sujet(label)
VALUES ("église, plaque commémorative");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Epitaphe et statue");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49365, 216);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (216, 216);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (216, 216);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (216, 216);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (217, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (217, "Epitaphe et statue");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (217, "Izy", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (217, "CLVUE", "218", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  217, 217, 217
);
        
INSERT INTO sujet(label)
VALUES ("église, plaque commémorative");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Epitaphe et statue");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49365, 217);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (217, 217);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (217, 217);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (217, 217);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (218, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (218, "Epitaphe et statue");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (218, "Izy", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (218, "CLVUE", "219", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  218, 218, 218
);
        
INSERT INTO sujet(label)
VALUES ("église, plaque commémorative");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Epitaphe et statue");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49365, 218);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (218, 218);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (218, 218);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (218, 218);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (219, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (219, "Epitaphe et statue");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (219, "Izy", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (219, "CLVUE", "220", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  219, 219, 219
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Epitaphe et statue");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49366, 219);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (219, 219);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (219, 219);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (219, 219);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (220, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (220, "Epitaphe et statue");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (220, "Izy", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (220, "CLVUE", "221", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  220, 220, 220
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Epitaphe et statue");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49366, 220);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (220, 220);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (220, 220);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (220, 220);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (221, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (221, "Eglise, intérieur et boiseries");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (221, "Attray", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (221, "CLVUE", "222", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "même vue expo différente",
  221, 221, 221
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise, intérieur et boiseries");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47554, 221);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (221, 221);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (221, 221);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (221, 221);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (222, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (222, "Eglise, intérieur et boiseries");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (222, "Attray", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (222, "CLVUE", "223", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "NULL",
  222, 222, 222
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise, intérieur et boiseries");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47554, 222);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (222, 222);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (222, 222);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (222, 222);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (223, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (223, "Eglise, intérieur et boiseries");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (223, "Attray", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (223, "CLVUE", "224", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  223, 223, 223
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise, intérieur et boiseries");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47555, 223);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (223, 223);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (223, 223);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (223, 223);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (224, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (224, "Eglise, intérieur et boiseries");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (224, "Attray", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (224, "CLVUE", "225", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  224, 224, 224
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise, intérieur et boiseries");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47555, 224);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (224, 224);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (224, 224);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (224, 224);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (225, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (225, "Bas relief statue");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (225, "Jouy-en-Pithiverais", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (225, "CLVUE", "226", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "même vue expo différente",
  225, 225, 225
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Bas relief statue");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49388, 225);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (225, 225);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (225, 225);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (225, 225);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (226, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (226, "Bas relief statue");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (226, "Jouy-en-Pithiverais", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (226, "CLVUE", "227", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  226, 226, 226
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Bas relief statue");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49388, 226);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (226, 226);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (226, 226);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (226, 226);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (227, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (227, "Bas relief statue");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (227, "Jouy-en-Pithiverais", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (227, "CLVUE", "228", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  227, 227, 227
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Bas relief statue");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49389, 227);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (227, 227);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (227, 227);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (227, 227);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (228, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (228, "Banc d'œuvre, statue");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (228, "Montigny,  Montigny", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (228, "CLVUE", "229", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  228, 228, 228
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux , église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Banc d'œuvre, statue");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50120, 228);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (228, 228);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (228, 228);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (228, 228);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (229, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (229, "Banc d'œuvre, statue");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (229, "Montigny,  Montigny", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (229, "CLVUE", "230", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  229, 229, 229
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux , église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Banc d'œuvre, statue");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50120, 229);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (229, 229);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (229, 229);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (229, 229);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (230, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (230, "Banc d'œuvre, statue");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (230, "Montigny", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (230, "CLVUE", "231", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  230, 230, 230
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Banc d'œuvre, statue");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50121, 230);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (230, 230);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (230, 230);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (230, 230);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (231, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (231, "Eglise et crypte, chemin de croix , tableaux, statues, Christ en bois");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (231, "Beaune-la-Rolande", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (231, "CLVUE", "232", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  231, 231, 231
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise et crypte, chemin de croix , tableaux, statues, Christ en bois");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47813, 231);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (231, 231);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (231, 231);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (231, 231);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (232, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (232, "Eglise et crypte, chemin de croix , tableaux, statues, Christ en bois");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (232, "Beaune-la-Rolande", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (232, "CLVUE", "233", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  232, 232, 232
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise et crypte, chemin de croix , tableaux, statues, Christ en bois");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47813, 232);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (232, 232);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (232, 232);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (232, 232);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (233, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (233, "Eglise et crypte, chemin de croix , tableaux, statues, Christ en bois");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (233, "Beaune-la-Rolande", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (233, "CLVUE", "234", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  233, 233, 233
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise et crypte, chemin de croix , tableaux, statues, Christ en bois");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47814, 233);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (233, 233);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (233, 233);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (233, 233);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (234, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (234, "Eglise et crypte, chemin de croix , tableaux, statues, Christ en bois");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (234, "Beaune-la-Rolande", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (234, "CLVUE", "235", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  234, 234, 234
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise et crypte, chemin de croix , tableaux, statues, Christ en bois");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47813, 234);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (234, 234);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (234, 234);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (234, 234);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (235, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (235, "Eglise et crypte, chemin de croix , tableaux, statues, Christ en bois");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (235, "NULL", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (235, "CLVUE", "236", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  235, 235, 235
);
        
INSERT INTO sujet(label)
VALUES ("NULL");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise et crypte, chemin de croix , tableaux, statues, Christ en bois");
        
INSERT INTO cindoc(label, photo_id)
VALUES (NULL, 235);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (235, 235);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (235, 235);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (235, 235);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (236, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (236, "Eglise et crypte, chemin de croix , tableaux, statues, Christ en bois");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (236, "NULL", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (236, "CLVUE", "237", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  236, 236, 236
);
        
INSERT INTO sujet(label)
VALUES ("NULL");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise et crypte, chemin de croix , tableaux, statues, Christ en bois");
        
INSERT INTO cindoc(label, photo_id)
VALUES (NULL, 236);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (236, 236);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (236, 236);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (236, 236);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (237, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (237, "Eglise et crypte, chemin de croix , tableaux, statues, Christ en bois");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (237, "NULL", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (237, "CLVUE", "238", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  237, 237, 237
);
        
INSERT INTO sujet(label)
VALUES ("NULL");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise et crypte, chemin de croix , tableaux, statues, Christ en bois");
        
INSERT INTO cindoc(label, photo_id)
VALUES (NULL, 237);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (237, 237);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (237, 237);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (237, 237);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (238, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (238, "Eglise et crypte, chemin de croix , tableaux, statues, Christ en bois");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (238, "Beaune-la-Rolande", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (238, "CLVUE", "239", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  238, 238, 238
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise et crypte, chemin de croix , tableaux, statues, Christ en bois");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47816, 238);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (238, 238);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (238, 238);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (238, 238);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (239, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (239, "Eglise et crypte, chemin de croix , tableaux, statues, Christ en bois");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (239, "Beaune-la-Rolande", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (239, "CLVUE", "240", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  239, 239, 239
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise et crypte, chemin de croix , tableaux, statues, Christ en bois");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47814, 239);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (239, 239);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (239, 239);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (239, 239);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (240, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (240, "Eglise et crypte, chemin de croix , tableaux, statues, Christ en bois");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (240, "Beaune-la-Rolande,  Beaune-la-Rolande", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (240, "CLVUE", "241", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  240, 240, 240
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux , église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise et crypte, chemin de croix , tableaux, statues, Christ en bois");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47814 | 47816, 240);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (240, 240);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (240, 240);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (240, 240);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (241, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (241, "Eglise, fonts baptismaux, pierres tombales");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (241, "Saint-Loup-des-Vignes,  Saint-Loup-des-Vignes", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (241, "CLVUE", "242", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  241, 241, 241
);
        
INSERT INTO sujet(label)
VALUES ("église, objet du culte, église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise, fonts baptismaux, pierres tombales");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51430, 241);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (241, 241);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (241, 241);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (241, 241);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (242, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (242, "Eglise, fonts baptismaux, pierres tombales");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (242, "Saint-Loup-des-Vignes,  Saint-Loup-des-Vignes", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (242, "CLVUE", "243", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  242, 242, 242
);
        
INSERT INTO sujet(label)
VALUES ("église, objet du culte, église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise, fonts baptismaux, pierres tombales");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51430, 242);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (242, 242);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (242, 242);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (242, 242);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (243, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (243, "Eglise, fonts baptismaux, pierres tombales");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (243, "Saint-Loup-des-Vignes", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (243, "CLVUE", "244", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  243, 243, 243
);
        
INSERT INTO sujet(label)
VALUES ("église, pierre tombale");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise, fonts baptismaux, pierres tombales");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51431, 243);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (243, 243);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (243, 243);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (243, 243);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (244, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (244, "Eglise, fonts baptismaux, pierres tombales");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (244, "Saint-Loup-des-Vignes", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (244, "CLVUE", "245", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  244, 244, 244
);
        
INSERT INTO sujet(label)
VALUES ("église, pierre tombale");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise, fonts baptismaux, pierres tombales");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51431, 244);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (244, 244);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (244, 244);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (244, 244);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (245, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (245, "Eglise, fonts baptismaux, pierres tombales");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (245, "Saint-Loup-des-Vignes", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (245, "CLVUE", "246", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  245, 245, 245
);
        
INSERT INTO sujet(label)
VALUES ("église, pierre tombale");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise, fonts baptismaux, pierres tombales");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51431, 245);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (245, 245);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (245, 245);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (245, 245);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (246, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (246, "Eglise, intérieur et extérieur");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (246, "Montbarrois", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (246, "CLVUE", "247", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  246, 246, 246
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise, intérieur et extérieur");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50062, 246);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (246, 246);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (246, 246);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (246, 246);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (247, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (247, "Eglise, intérieur et extérieur");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (247, "Montbarrois", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (247, "CLVUE", "248", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  247, 247, 247
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise, intérieur et extérieur");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50062, 247);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (247, 247);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (247, 247);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (247, 247);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (248, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (248, "Eglise, intérieur et extérieur");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (248, "Montbarrois", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (248, "CLVUE", "249", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  248, 248, 248
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise, intérieur et extérieur");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50062, 248);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (248, 248);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (248, 248);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (248, 248);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (249, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (249, "Intérieur de l'église");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (249, "Juranville", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (249, "CLVUE", "250", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  249, 249, 249
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Intérieur de l'église");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49411, 249);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (249, 249);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (249, 249);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (249, 249);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (250, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (250, "Intérieur de l'église");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (250, "Juranville,  Juranville", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (250, "CLVUE", "251", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  250, 250, 250
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux , église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Intérieur de l'église");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49411 | 49413, 250);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (250, 250);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (250, 250);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (250, 250);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (251, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (251, "Intérieur de l'église");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (251, "Juranville", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (251, "CLVUE", "252", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  251, 251, 251
);
        
INSERT INTO sujet(label)
VALUES ("église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Intérieur de l'église");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49412, 251);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (251, 251);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (251, 251);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (251, 251);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (252, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (252, "Intérieur de l'église");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (252, "Juranville", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (252, "CLVUE", "253", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  252, 252, 252
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Intérieur de l'église");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49413, 252);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (252, 252);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (252, 252);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (252, 252);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (253, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (253, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (253, "Bonny-sur-Loire,  Cheuille (riv.),  Bonny-sur-Loire,  Bonny-sur-Loire,  Bonny-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (253, "CLVUE", "254", "NULL", "NULL", "NULL", "FRAD045_CLVUE000254_2/FRAD045_CLVUE000255_2/FRAD045_CLVUE000256_2 | FRAD045_CLVUE000254_2", "1", "négatif", "nb", "NULL",
  253, 253, 253
);
        
INSERT INTO sujet(label)
VALUES ("Cheuille (riv.), vue , église , fortification , pont");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47951 | 47953 | 47957 | 47964, 253);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (253, 253);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (253, 253);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (253, 253);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (254, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (254, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (254, "Bonny-sur-Loire,  Cheuille (riv.),  Bonny-sur-Loire,  Bonny-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (254, "CLVUE", "255", "NULL", "NULL", "NULL", "FRAD045_CLVUE000254_2/FRAD045_CLVUE000255_2/FRAD045_CLVUE000256_2", "1", "négatif", "nb", "NULL",
  254, 254, 254
);
        
INSERT INTO sujet(label)
VALUES ("Cheuille (riv.), vue , fortification , pont");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47951 | 47957 | 47964, 254);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (254, 254);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (254, 254);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (254, 254);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (255, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (255, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (255, "Bonny-sur-Loire,  Cheuille (riv.),  Bonny-sur-Loire,  Bonny-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (255, "CLVUE", "256", "NULL", "NULL", "NULL", "FRAD045_CLVUE000254_2/FRAD045_CLVUE000255_2/FRAD045_CLVUE000256_2", "1", "négatif", "nb", "NULL",
  255, 255, 255
);
        
INSERT INTO sujet(label)
VALUES ("Cheuille (riv.), vue , fortification , pont");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47951 | 47957 | 47964, 255);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (255, 255);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (255, 255);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (255, 255);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (256, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (256, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (256, "Loury", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (256, "CLVUE", "257", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  256, 256, 256
);
        
INSERT INTO sujet(label)
VALUES ("église, tableau");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49789, 256);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (256, 256);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (256, 256);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (256, 256);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (257, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (257, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (257, "Bonny-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (257, "CLVUE", "258", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  257, 257, 257
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47953, 257);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (257, 257);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (257, 257);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (257, 257);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (258, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (258, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (258, "Bonny-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (258, "CLVUE", "259", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  258, 258, 258
);
        
INSERT INTO sujet(label)
VALUES ("église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47955, 258);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (258, 258);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (258, 258);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (258, 258);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (259, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (259, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (259, "Bonny-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (259, "CLVUE", "260", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  259, 259, 259
);
        
INSERT INTO sujet(label)
VALUES ("église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47955, 259);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (259, 259);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (259, 259);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (259, 259);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (260, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (260, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (260, "Bonny-sur-Loire,  Bonny-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (260, "CLVUE", "261", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  260, 260, 260
);
        
INSERT INTO sujet(label)
VALUES ("église, objet du culte , église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47955 | 47956, 260);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (260, 260);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (260, 260);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (260, 260);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (261, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (261, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (261, "Bonny-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (261, "CLVUE", "262", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  261, 261, 261
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47956, 261);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (261, 261);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (261, 261);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (261, 261);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (262, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (262, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (262, "Bonny-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (262, "CLVUE", "263", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  262, 262, 262
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47956, 262);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (262, 262);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (262, 262);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (262, 262);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (263, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (263, "Porche église");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (263, "Jouy-le-Potier", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (263, "CLVUE", "264", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  263, 263, 263
);
        
INSERT INTO sujet(label)
VALUES ("château du Lude");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Porche église");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49396, 263);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (263, 263);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (263, 263);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (263, 263);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (264, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (264, "Porche église");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (264, "Jouy-le-Potier", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (264, "CLVUE", "265", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  264, 264, 264
);
        
INSERT INTO sujet(label)
VALUES ("château du Lude");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Porche église");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49396, 264);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (264, 264);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (264, 264);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (264, 264);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (265, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (265, "Porche église");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (265, "Jouy-le-Potier", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (265, "CLVUE", "266", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  265, 265, 265
);
        
INSERT INTO sujet(label)
VALUES ("château du Lude");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Porche église");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49396, 265);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (265, 265);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (265, 265);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (265, 265);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (266, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (266, "Porche église");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (266, "Jouy-le-Potier", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (266, "CLVUE", "267", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  266, 266, 266
);
        
INSERT INTO sujet(label)
VALUES ("château du Lude");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Porche église");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49396, 266);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (266, 266);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (266, 266);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (266, 266);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (267, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (267, "Porche église");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (267, "Jouy-le-Potier", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (267, "CLVUE", "268", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  267, 267, 267
);
        
INSERT INTO sujet(label)
VALUES ("château du Lude");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Porche église");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49396, 267);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (267, 267);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (267, 267);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (267, 267);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (268, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (268, "Porche église");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (268, "Jouy-le-Potier", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (268, "CLVUE", "269", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  268, 268, 268
);
        
INSERT INTO sujet(label)
VALUES ("château du Lude");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Porche église");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49396, 268);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (268, 268);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (268, 268);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (268, 268);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (269, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (269, "Porche église");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (269, "Jouy-le-Potier", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (269, "CLVUE", "270", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  269, 269, 269
);
        
INSERT INTO sujet(label)
VALUES ("château du Lude");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Porche église");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49396, 269);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (269, 269);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (269, 269);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (269, 269);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (270, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (270, "Porche église");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (270, "Jouy-le-Potier", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (270, "CLVUE", "271", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  270, 270, 270
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Porche église");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49397, 270);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (270, 270);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (270, 270);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (270, 270);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (271, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (271, "Intérieur de l'église, statues");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (271, "Coullons", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (271, "CLVUE", "272", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  271, 271, 271
);
        
INSERT INTO sujet(label)
VALUES ("vue générale");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Intérieur de l'église, statues");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48689, 271);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (271, 271);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (271, 271);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (271, 271);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (272, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (272, "Intérieur de l'église, statues");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (272, "Coullons", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (272, "CLVUE", "273", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  272, 272, 272
);
        
INSERT INTO sujet(label)
VALUES ("vue générale");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Intérieur de l'église, statues");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48689, 272);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (272, 272);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (272, 272);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (272, 272);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (273, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (273, "Intérieur de l'église, statues");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (273, "Coullons", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (273, "CLVUE", "274", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  273, 273, 273
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Intérieur de l'église, statues");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48679, 273);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (273, 273);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (273, 273);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (273, 273);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (274, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (274, "Intérieur de l'église, statues");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (274, "Coullons", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (274, "CLVUE", "275", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  274, 274, 274
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Intérieur de l'église, statues");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48679, 274);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (274, 274);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (274, 274);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (274, 274);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (275, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (275, "Intérieur de l'église, statues");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (275, "Coullons", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (275, "CLVUE", "276", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  275, 275, 275
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Intérieur de l'église, statues");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48680, 275);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (275, 275);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (275, 275);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (275, 275);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (276, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (276, "Intérieur de l'église, statues");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (276, "Coullons", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (276, "CLVUE", "277", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  276, 276, 276
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Intérieur de l'église, statues");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48680, 276);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (276, 276);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (276, 276);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (276, 276);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (277, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (277, "Intérieur de l'église, statues");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (277, "Coullons", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (277, "CLVUE", "278", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  277, 277, 277
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Intérieur de l'église, statues");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48681, 277);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (277, 277);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (277, 277);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (277, 277);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (278, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (278, "Intérieur de l'église, statues");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (278, "Coullons", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (278, "CLVUE", "279", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "même vue expo différente",
  278, 278, 278
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Intérieur de l'église, statues");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48681, 278);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (278, 278);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (278, 278);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (278, 278);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (279, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (279, "Intérieur de l'église, statues");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (279, "Coullons", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (279, "CLVUE", "280", "NULL", "NULL", "NULL", "NULL", "1", "verre négatif", "nb", "NULL",
  279, 279, 279
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Intérieur de l'église, statues");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48680, 279);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (279, 279);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (279, 279);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (279, 279);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (280, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (280, "Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (280, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (280, "CLVUE", "281", "NULL", "NULL", "NULL", "FRAD045_CLVUE_281", "1", "négatif", "nb", "NULL",
  280, 280, 280
);
        
INSERT INTO sujet(label)
VALUES ("archéologie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50882, 280);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (280, 280);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (280, 280);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (280, 280);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (281, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (281, "Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (281, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (281, "CLVUE", "282", "NULL", "NULL", "NULL", "FRAD045_CLVUE_281", "1", "négatif", "nb", "NULL",
  281, 281, 281
);
        
INSERT INTO sujet(label)
VALUES ("archéologie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50882, 281);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (281, 281);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (281, 281);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (281, 281);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (282, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (282, "Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (282, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (282, "CLVUE", "283", "NULL", "NULL", "NULL", "FRAD045_CLVUE_281", "1", "négatif", "nb", "NULL",
  282, 282, 282
);
        
INSERT INTO sujet(label)
VALUES ("archéologie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50882, 282);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (282, 282);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (282, 282);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (282, 282);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (283, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (283, "Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (283, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (283, "CLVUE", "284", "NULL", "NULL", "NULL", "FRAD045_CLVUE_281", "1", "négatif", "nb", "NULL",
  283, 283, 283
);
        
INSERT INTO sujet(label)
VALUES ("archéologie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50882, 283);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (283, 283);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (283, 283);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (283, 283);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (284, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (284, "Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (284, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (284, "CLVUE", "285", "NULL", "NULL", "NULL", "FRAD045_CLVUE_281", "1", "négatif", "nb", "NULL",
  284, 284, 284
);
        
INSERT INTO sujet(label)
VALUES ("archéologie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50882, 284);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (284, 284);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (284, 284);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (284, 284);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (285, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (285, "Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (285, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (285, "CLVUE", "286", "NULL", "NULL", "NULL", "FRAD045_CLVUE_281", "1", "négatif", "nb", "NULL",
  285, 285, 285
);
        
INSERT INTO sujet(label)
VALUES ("archéologie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50882, 285);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (285, 285);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (285, 285);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (285, 285);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (286, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (286, "Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (286, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (286, "CLVUE", "287", "NULL", "NULL", "NULL", "FRAD045_CLVUE_281", "1", "négatif", "nb", "NULL",
  286, 286, 286
);
        
INSERT INTO sujet(label)
VALUES ("archéologie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50882, 286);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (286, 286);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (286, 286);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (286, 286);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (287, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (287, "Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (287, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (287, "CLVUE", "288", "NULL", "NULL", "NULL", "FRAD045_CLVUE_281", "1", "négatif", "nb", "NULL",
  287, 287, 287
);
        
INSERT INTO sujet(label)
VALUES ("archéologie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50882, 287);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (287, 287);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (287, 287);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (287, 287);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (288, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (288, "Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (288, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (288, "CLVUE", "289", "NULL", "NULL", "NULL", "FRAD045_CLVUE_281", "1", "négatif", "nb", "NULL",
  288, 288, 288
);
        
INSERT INTO sujet(label)
VALUES ("archéologie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50882, 288);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (288, 288);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (288, 288);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (288, 288);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (289, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (289, "Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (289, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (289, "CLVUE", "290", "NULL", "NULL", "NULL", "FRAD045_CLVUE_281", "1", "négatif", "nb", "NULL",
  289, 289, 289
);
        
INSERT INTO sujet(label)
VALUES ("archéologie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50882, 289);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (289, 289);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (289, 289);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (289, 289);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (290, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (290, "Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (290, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (290, "CLVUE", "291", "NULL", "NULL", "NULL", "FRAD045_CLVUE_281", "1", "négatif", "nb", "NULL",
  290, 290, 290
);
        
INSERT INTO sujet(label)
VALUES ("archéologie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50882, 290);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (290, 290);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (290, 290);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (290, 290);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (291, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (291, "Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (291, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (291, "CLVUE", "292", "NULL", "NULL", "NULL", "FRAD045_CLVUE_281", "1", "négatif", "nb", "NULL",
  291, 291, 291
);
        
INSERT INTO sujet(label)
VALUES ("archéologie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50882, 291);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (291, 291);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (291, 291);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (291, 291);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (292, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (292, "Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (292, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (292, "CLVUE", "293", "NULL", "NULL", "NULL", "FRAD045_CLVUE_281", "1", "négatif", "nb", "NULL",
  292, 292, 292
);
        
INSERT INTO sujet(label)
VALUES ("archéologie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50882, 292);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (292, 292);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (292, 292);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (292, 292);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (293, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (293, "Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (293, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (293, "CLVUE", "294", "NULL", "NULL", "NULL", "FRAD045_CLVUE_281", "1", "négatif", "nb", "NULL",
  293, 293, 293
);
        
INSERT INTO sujet(label)
VALUES ("archéologie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50882, 293);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (293, 293);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (293, 293);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (293, 293);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (294, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (294, "Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (294, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (294, "CLVUE", "295", "NULL", "NULL", "NULL", "FRAD045_CLVUE_281", "1", "négatif", "nb", "NULL",
  294, 294, 294
);
        
INSERT INTO sujet(label)
VALUES ("archéologie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50882, 294);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (294, 294);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (294, 294);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (294, 294);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (295, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (295, "Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (295, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (295, "CLVUE", "296", "NULL", "NULL", "NULL", "FRAD045_CLVUE_281", "1", "négatif", "nb", "NULL",
  295, 295, 295
);
        
INSERT INTO sujet(label)
VALUES ("archéologie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50882, 295);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (295, 295);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (295, 295);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (295, 295);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (296, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (296, "Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (296, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (296, "CLVUE", "297", "NULL", "NULL", "NULL", "FRAD045_CLVUE_281", "1", "négatif", "nb", "NULL",
  296, 296, 296
);
        
INSERT INTO sujet(label)
VALUES ("archéologie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50882, 296);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (296, 296);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (296, 296);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (296, 296);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (297, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (297, "Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (297, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (297, "CLVUE", "298", "NULL", "NULL", "NULL", "FRAD045_CLVUE_281", "1", "négatif", "nb", "NULL",
  297, 297, 297
);
        
INSERT INTO sujet(label)
VALUES ("archéologie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50882, 297);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (297, 297);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (297, 297);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (297, 297);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (298, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (298, "Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (298, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (298, "CLVUE", "299", "NULL", "NULL", "NULL", "FRAD045_CLVUE_281", "1", "négatif", "nb", "NULL",
  298, 298, 298
);
        
INSERT INTO sujet(label)
VALUES ("archéologie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50882, 298);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (298, 298);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (298, 298);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (298, 298);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (299, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (299, "Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (299, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (299, "CLVUE", "300", "NULL", "NULL", "NULL", "FRAD045_CLVUE_281", "1", "négatif", "nb", "NULL",
  299, 299, 299
);
        
INSERT INTO sujet(label)
VALUES ("archéologie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50882, 299);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (299, 299);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (299, 299);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (299, 299);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (300, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (300, "Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (300, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (300, "CLVUE", "301", "NULL", "NULL", "NULL", "FRAD045_CLVUE_281", "1", "négatif", "nb", "NULL",
  300, 300, 300
);
        
INSERT INTO sujet(label)
VALUES ("archéologie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50882, 300);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (300, 300);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (300, 300);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (300, 300);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (301, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (301, "Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (301, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (301, "CLVUE", "302", "NULL", "NULL", "NULL", "FRAD045_CLVUE_281", "1", "négatif", "nb", "NULL",
  301, 301, 301
);
        
INSERT INTO sujet(label)
VALUES ("archéologie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50882, 301);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (301, 301);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (301, 301);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (301, 301);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (302, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (302, "Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (302, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (302, "CLVUE", "303", "NULL", "NULL", "NULL", "FRAD045_CLVUE_281", "1", "négatif", "nb", "NULL",
  302, 302, 302
);
        
INSERT INTO sujet(label)
VALUES ("archéologie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50882, 302);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (302, 302);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (302, 302);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (302, 302);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (303, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (303, "Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (303, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (303, "CLVUE", "304", "NULL", "NULL", "NULL", "FRAD045_CLVUE_281", "1", "négatif", "nb", "NULL",
  303, 303, 303
);
        
INSERT INTO sujet(label)
VALUES ("archéologie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50882, 303);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (303, 303);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (303, 303);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (303, 303);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (304, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (304, "Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (304, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (304, "CLVUE", "305", "NULL", "NULL", "NULL", "FRAD045_CLVUE_281", "1", "négatif", "nb", "NULL",
  304, 304, 304
);
        
INSERT INTO sujet(label)
VALUES ("archéologie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50882, 304);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (304, 304);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (304, 304);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (304, 304);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (305, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (305, "Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (305, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (305, "CLVUE", "306", "NULL", "NULL", "NULL", "FRAD045_CLVUE_281", "1", "négatif", "nb", "NULL",
  305, 305, 305
);
        
INSERT INTO sujet(label)
VALUES ("archéologie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50882, 305);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (305, 305);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (305, 305);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (305, 305);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (306, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (306, "Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (306, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (306, "CLVUE", "307", "NULL", "NULL", "NULL", "FRAD045_CLVUE_281", "1", "négatif", "nb", "NULL",
  306, 306, 306
);
        
INSERT INTO sujet(label)
VALUES ("archéologie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50882, 306);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (306, 306);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (306, 306);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (306, 306);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (307, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (307, "Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (307, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (307, "CLVUE", "308", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  307, 307, 307
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50886, 307);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (307, 307);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (307, 307);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (307, 307);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (308, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (308, "Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (308, "Ouzouer-sur-Trézée", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (308, "CLVUE", "309", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  308, 308, 308
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Fouilles de Pontchevron et église combles et banc d'œuvre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (NULL, 308);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (308, 308);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (308, 308);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (308, 308);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (309, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (309, "Musée des Beaux Arts,  pièces gallo-romaine en bronze");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (309, "Orléans,  Orléans,  Orléans", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (309, "CLVUE", "310", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  309, 309, 309
);
        
INSERT INTO sujet(label)
VALUES ("archéologie , musée , hôtel Cabu");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Musée des Beaux Arts,  pièces gallo-romaine en bronze");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50342 | 50562 | 50527, 309);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (309, 309);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (309, 309);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (309, 309);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (310, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (310, "Musée des Beaux Arts,  pièces gallo-romaine en bronze");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (310, "Orléans,  Orléans,  Orléans", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (310, "CLVUE", "311", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "détourage à la sanguine",
  310, 310, 310
);
        
INSERT INTO sujet(label)
VALUES ("archéologie , musée , hôtel Cabu");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Musée des Beaux Arts,  pièces gallo-romaine en bronze");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50342 | 50562 | 50527, 310);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (310, 310);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (310, 310);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (310, 310);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (311, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (311, "Musée des Beaux Arts,  pièces gallo-romaine en bronze");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (311, "Orléans,  Orléans,  Orléans", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (311, "CLVUE", "312", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  311, 311, 311
);
        
INSERT INTO sujet(label)
VALUES ("archéologie , musée , hôtel Cabu");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Musée des Beaux Arts,  pièces gallo-romaine en bronze");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50342 | 50562 | 50527, 311);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (311, 311);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (311, 311);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (311, 311);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (312, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (312, "Musée des Beaux Arts,  pièces gallo-romaine en bronze");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (312, "Orléans,  Orléans,  Orléans,  Autruy-sur-Juine", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (312, "CLVUE", "313", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  312, 312, 312
);
        
INSERT INTO sujet(label)
VALUES ("archéologie , musée , hôtel Cabu , pierre tombale");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Musée des Beaux Arts,  pièces gallo-romaine en bronze");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50342 | 50562 | 50527 | 47610, 312);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (312, 312);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (312, 312);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (312, 312);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (313, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (313, "Musée des Beaux Arts,  pièces gallo-romaine en bronze");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (313, "Orléans,  Orléans,  Orléans", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (313, "CLVUE", "314", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  313, 313, 313
);
        
INSERT INTO sujet(label)
VALUES ("archéologie , musée , hôtel Cabu");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Musée des Beaux Arts,  pièces gallo-romaine en bronze");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50342 | 50562 | 50527, 313);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (313, 313);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (313, 313);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (313, 313);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (314, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (314, "Musée des Beaux Arts,  pièces gallo-romaine en bronze");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (314, "Orléans,  Orléans,  Orléans", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (314, "CLVUE", "315", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  314, 314, 314
);
        
INSERT INTO sujet(label)
VALUES ("archéologie , musée , hôtel Cabu");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Musée des Beaux Arts,  pièces gallo-romaine en bronze");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50342 | 50562 | 50527, 314);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (314, 314);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (314, 314);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (314, 314);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (315, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (315, "Musée des Beaux Arts,  pièces gallo-romaine en bronze");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (315, "Orléans,  Orléans,  Orléans", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (315, "CLVUE", "316", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  315, 315, 315
);
        
INSERT INTO sujet(label)
VALUES ("archéologie , musée , hôtel Cabu");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Musée des Beaux Arts,  pièces gallo-romaine en bronze");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50342 | 50562 | 50527, 315);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (315, 315);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (315, 315);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (315, 315);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (316, NULL, NULL, 1961);
        
INSERT INTO description(id, label)
VALUES (316, "Musée des Beaux Arts,  pièces gallo-romaine en bronze");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (316, "Orléans,  Orléans,  Orléans", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (316, "CLVUE", "317", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  316, 316, 316
);
        
INSERT INTO sujet(label)
VALUES ("archéologie , musée , hôtel Cabu");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Musée des Beaux Arts,  pièces gallo-romaine en bronze");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50342 | 50562 | 50527, 316);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (316, 316);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (316, 316);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (316, 316);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (317, NULL, NULL, 1966);
        
INSERT INTO description(id, label)
VALUES (317, "Christ appartenant à Mgr Brun archiprêtre de la cathédrale");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (317, "Orléans,  Orléans", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (317, "CLVUE", "318", "NULL", "NULL", "NULL", "NULL", "6", "négatif", "nb", "3 vues , expo différente",
  317, 317, 317
);
        
INSERT INTO sujet(label)
VALUES ("cathédrale Sainte-Croix, mobilier religieux, cathédrale Sainte-Croix, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Christ appartenant à Mgr Brun archiprêtre de la cathédrale");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50384, 317);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (317, 317);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (317, 317);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (317, 317);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (318, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (318, "Médaillons");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (318, "Ruan", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (318, "CLVUE", "319", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  318, 318, 318
);
        
INSERT INTO sujet(label)
VALUES ("église, tableau");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Médaillons");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51150, 318);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (318, 318);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (318, 318);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (318, 318);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (319, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (319, "Médaillons");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (319, "Ruan", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (319, "CLVUE", "320", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  319, 319, 319
);
        
INSERT INTO sujet(label)
VALUES ("église, tableau");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Médaillons");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51150, 319);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (319, 319);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (319, 319);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (319, 319);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (320, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (320, "Bord de Loire début d'embâcle");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (320, "Beaugency,  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (320, "CLVUE", "321", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  320, 320, 320
);
        
INSERT INTO sujet(label)
VALUES ("Loire (fleuve), vue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Bord de Loire début d'embâcle");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47775, 320);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (320, 320);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (320, 320);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (320, 320);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (321, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (321, "Bord de Loire début d'embâcle");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (321, "Beaugency,  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (321, "CLVUE", "322", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  321, 321, 321
);
        
INSERT INTO sujet(label)
VALUES ("Loire (fleuve), vue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Bord de Loire début d'embâcle");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47775, 321);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (321, 321);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (321, 321);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (321, 321);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (322, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (322, "Bord de Loire début d'embâcle");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (322, "Beaugency,  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (322, "CLVUE", "323", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  322, 322, 322
);
        
INSERT INTO sujet(label)
VALUES ("Loire (fleuve), vue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Bord de Loire début d'embâcle");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47775, 322);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (322, 322);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (322, 322);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (322, 322);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (323, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (323, "Bord de Loire début d'embâcle");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (323, "Beaugency,  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (323, "CLVUE", "324", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  323, 323, 323
);
        
INSERT INTO sujet(label)
VALUES ("Loire (fleuve), vue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Bord de Loire début d'embâcle");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47775, 323);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (323, 323);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (323, 323);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (323, 323);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (324, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (324, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (324, "Sandillon,  Sandillon,  Loire (fleuve),  Loire (fleuve),  Loire (fleuve),  Sandillon", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (324, "CLVUE", "325", "NULL", "NULL", "BERNEAU (pêcheur de saumons en Loire)", "NULL", "1", "négatif", "nb", "NULL",
  324, 324, 324
);
        
INSERT INTO sujet(label)
VALUES ("Loire (riv.), embâcle de Loire, embâcle, pêche, vue, pêche aux saumons");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51581, 324);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (324, 324);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (324, 324);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (324, 324);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (325, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (325, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (325, "Saint-Denis-de-l'Hôtel,  Saint-Denis-de-l'Hôtel,  Saint-Denis-de-l'Hôtel,  Saint-Denis-de-l'Hôtel,  Loire (fleuve),  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (325, "CLVUE", "326", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  325, 325, 325
);
        
INSERT INTO sujet(label)
VALUES ("embâcle de Loire, pont, vue générale, Les Vernelles, embâcle, vue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51236, 325);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (325, 325);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (325, 325);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (325, 325);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (326, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (326, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (326, "Saint-Denis-de-l'Hôtel,  Saint-Denis-de-l'Hôtel,  Saint-Denis-de-l'Hôtel,  Saint-Denis-de-l'Hôtel,  Loire (fleuve),  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (326, "CLVUE", "327", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  326, 326, 326
);
        
INSERT INTO sujet(label)
VALUES ("embâcle de Loire, pont, vue générale, Les Vernelles, embâcle, vue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51236, 326);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (326, 326);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (326, 326);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (326, 326);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (327, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (327, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (327, "Saint-Denis-de-l'Hôtel,  Saint-Denis-de-l'Hôtel,  Saint-Denis-de-l'Hôtel,  Saint-Denis-de-l'Hôtel,  Loire (fleuve),  Loire (fleuve),  Sandillon,  Sandillon,  Loire (fleuve),  Loire (fleuve),  Loire (fleuve),  Sandillon", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (327, "CLVUE", "328", "NULL", "NULL", "BERNEAU (pêcheur de saumons en Loire)", "NULL", "1", "négatif", "nb", "NULL",
  327, 327, 327
);
        
INSERT INTO sujet(label)
VALUES ("embâcle de Loire, pont, vue générale, Les Vernelles, embâcle, vue , Loire (riv.), embâcle de Loire, embâcle, pêche, vue, pêche aux saumons");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51236 | 51581, 327);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (327, 327);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (327, 327);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (327, 327);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (328, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (328, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (328, "Saint-Denis-de-l'Hôtel,  Saint-Denis-de-l'Hôtel,  Saint-Denis-de-l'Hôtel,  Saint-Denis-de-l'Hôtel,  Loire (fleuve),  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (328, "CLVUE", "329", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  328, 328, 328
);
        
INSERT INTO sujet(label)
VALUES ("embâcle de Loire, pont, vue générale, Les Vernelles, embâcle, vue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51236, 328);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (328, 328);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (328, 328);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (328, 328);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (329, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (329, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (329, "Saint-Denis-de-l'Hôtel,  Saint-Denis-de-l'Hôtel,  Saint-Denis-de-l'Hôtel,  Saint-Denis-de-l'Hôtel,  Loire (fleuve),  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (329, "CLVUE", "330", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  329, 329, 329
);
        
INSERT INTO sujet(label)
VALUES ("embâcle de Loire, pont, vue générale, Les Vernelles, embâcle, vue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51236, 329);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (329, 329);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (329, 329);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (329, 329);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (330, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (330, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (330, "Sandillon,  Sandillon,  Loire (fleuve),  Loire (fleuve),  Loire (fleuve),  Sandillon", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (330, "CLVUE", "331", "NULL", "NULL", "BERNEAU (pêcheur de saumons en Loire)", "NULL", "1", "négatif", "nb", "NULL",
  330, 330, 330
);
        
INSERT INTO sujet(label)
VALUES ("Loire (riv.), embâcle de Loire, embâcle, pêche, vue, pêche aux saumons");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51581, 330);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (330, 330);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (330, 330);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (330, 330);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (331, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (331, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (331, "Guilly,  Loire (fleuve),  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (331, "CLVUE", "332", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  331, 331, 331
);
        
INSERT INTO sujet(label)
VALUES ("Loire (riv.), embâcle, vue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49272, 331);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (331, 331);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (331, 331);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (331, 331);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (332, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (332, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (332, "Saint-Benoît-sur-Loire,  Saint-Benoît-sur-Loire,  Loire (fleuve),  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (332, "CLVUE", "333", "NULL", "NULL", "NULL", "FRAD045_CLVUE000335_2", "1", "négatif", "nb", "NULL",
  332, 332, 332
);
        
INSERT INTO sujet(label)
VALUES ("bords de Loire, embâcle de Loire, embâcle, vue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51202, 332);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (332, 332);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (332, 332);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (332, 332);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (333, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (333, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (333, "Saint-Benoît-sur-Loire,  Saint-Benoît-sur-Loire,  Loire (fleuve),  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (333, "CLVUE", "334", "NULL", "NULL", "NULL", "FRAD045_CLVUE000335_2", "1", "négatif", "nb", "NULL",
  333, 333, 333
);
        
INSERT INTO sujet(label)
VALUES ("bords de Loire, embâcle de Loire, embâcle, vue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51202, 333);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (333, 333);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (333, 333);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (333, 333);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (334, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (334, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (334, "Saint-Benoît-sur-Loire,  Saint-Benoît-sur-Loire,  Loire (fleuve),  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (334, "CLVUE", "335", "NULL", "NULL", "NULL", "FRAD045_CLVUE000335_2", "1", "négatif", "nb", "NULL",
  334, 334, 334
);
        
INSERT INTO sujet(label)
VALUES ("bords de Loire, embâcle de Loire, embâcle, vue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51202, 334);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (334, 334);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (334, 334);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (334, 334);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (335, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (335, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (335, "Saint-Benoît-sur-Loire,  Saint-Benoît-sur-Loire,  Loire (fleuve),  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (335, "CLVUE", "336", "NULL", "NULL", "NULL", "FRAD045_CLVUE000335_2", "1", "négatif", "nb", "NULL",
  335, 335, 335
);
        
INSERT INTO sujet(label)
VALUES ("bords de Loire, embâcle de Loire, embâcle, vue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51202, 335);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (335, 335);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (335, 335);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (335, 335);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (336, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (336, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (336, "Sandillon,  Sandillon,  Loire (fleuve),  Loire (fleuve),  Loire (fleuve),  Sandillon", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (336, "CLVUE", "337", "NULL", "NULL", "BERNEAU (pêcheur de saumons en Loire)", "NULL", "1", "négatif", "nb", "NULL",
  336, 336, 336
);
        
INSERT INTO sujet(label)
VALUES ("Loire (riv.), embâcle de Loire, embâcle, pêche, vue, pêche aux saumons");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51581, 336);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (336, 336);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (336, 336);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (336, 336);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (337, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (337, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (337, "Sandillon,  Sandillon,  Loire (fleuve),  Loire (fleuve),  Loire (fleuve),  Sandillon", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (337, "CLVUE", "338", "NULL", "NULL", "BERNEAU (pêcheur de saumons en Loire)", "NULL", "1", "négatif", "nb", "NULL",
  337, 337, 337
);
        
INSERT INTO sujet(label)
VALUES ("Loire (riv.), embâcle de Loire, embâcle, pêche, vue, pêche aux saumons");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51581, 337);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (337, 337);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (337, 337);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (337, 337);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (338, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (338, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (338, "Olivet,  Olivet,  Olivet", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (338, "CLVUE", "339", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  338, 338, 338
);
        
INSERT INTO sujet(label)
VALUES ("château du Barreau , église, plaque commémorativeOlivet, église, monument commémoratif, château du Barreau, plaque commémorative");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50299 | 50309, 338);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (338, 338);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (338, 338);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (338, 338);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (339, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (339, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (339, "Combleux,  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (339, "CLVUE", "340", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  339, 339, 339
);
        
INSERT INTO sujet(label)
VALUES ("embâcle de Loire, embâcle");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48599, 339);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (339, 339);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (339, 339);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (339, 339);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (340, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (340, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (340, "Loire (fleuve),  Orléans,  Orléans,  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (340, "CLVUE", "341", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  340, 340, 340
);
        
INSERT INTO sujet(label)
VALUES ("vue, la Loire , embâcle de Loire, embâcle");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49741 | 50489, 340);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (340, 340);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (340, 340);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (340, 340);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (341, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (341, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (341, "Loire (fleuve),  Orléans,  Orléans,  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (341, "CLVUE", "342", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  341, 341, 341
);
        
INSERT INTO sujet(label)
VALUES ("vue, la Loire , embâcle de Loire, embâcle");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49741 | 50489, 341);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (341, 341);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (341, 341);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (341, 341);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (342, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (342, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (342, "Loire (fleuve),  Orléans,  Orléans,  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (342, "CLVUE", "343", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  342, 342, 342
);
        
INSERT INTO sujet(label)
VALUES ("vue, la Loire , embâcle de Loire, embâcle");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49741 | 50489, 342);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (342, 342);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (342, 342);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (342, 342);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (343, NULL, NULL, 1962);
        
INSERT INTO description(id, label)
VALUES (343, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (343, "Combleux,  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (343, "CLVUE", "344", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", " 1 duplicata 4,5 x 6 nb",
  343, 343, 343
);
        
INSERT INTO sujet(label)
VALUES ("embâcle de Loire, embâcle");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48599, 343);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (343, 343);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (343, 343);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (343, 343);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (344, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (344, "Canal du Berry");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (344, "Pouilly-sur-Loire (Nièvre),  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (344, "CLVUE", "345", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  344, 344, 344
);
        
INSERT INTO sujet(label)
VALUES ("la Loire (riv.), vue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Canal du Berry");
        
INSERT INTO cindoc(label, photo_id)
VALUES (52128, 344);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (344, 344);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (344, 344);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (344, 344);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (345, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (345, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (345, "Marseilles-lès-Aubigny (Cher),  Berry (canal)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (345, "CLVUE", "346", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  345, 345, 345
);
        
INSERT INTO sujet(label)
VALUES ("canal du Berry, port");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (52129, 345);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (345, 345);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (345, 345);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (345, 345);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (346, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (346, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (346, "Marseilles-lès-Aubigny (Cher),  Berry (canal)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (346, "CLVUE", "347", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  346, 346, 346
);
        
INSERT INTO sujet(label)
VALUES ("canal du Berry, port");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (52129, 346);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (346, 346);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (346, 346);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (346, 346);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (347, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (347, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (347, "Marseilles-lès-Aubigny (Cher),  Berry (canal)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (347, "CLVUE", "348", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  347, 347, 347
);
        
INSERT INTO sujet(label)
VALUES ("canal du Berry, port");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (52129, 347);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (347, 347);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (347, 347);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (347, 347);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (348, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (348, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (348, "Marseilles-lès-Aubigny (Cher),  Berry (canal)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (348, "CLVUE", "349", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  348, 348, 348
);
        
INSERT INTO sujet(label)
VALUES ("canal du Berry, port");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (52129, 348);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (348, 348);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (348, 348);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (348, 348);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (349, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (349, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (349, "Beffes (Cher),  Berry (canal), Beffes (Cher)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (349, "CLVUE", "350", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  349, 349, 349
);
        
INSERT INTO sujet(label)
VALUES ("canal du Berry, port, usine Piolet et Chausson");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (52130, 349);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (349, 349);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (349, 349);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (349, 349);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (350, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (350, "7, 9 et 11 rue de la veille monnaie");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (350, "Orléans", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (350, "CLVUE", "351", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  350, 350, 350
);
        
INSERT INTO sujet(label)
VALUES ("rue de la Vieille Monnaie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("7, 9 et 11 rue de la veille monnaie");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50681, 350);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (350, 350);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (350, 350);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (350, 350);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (351, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (351, "7, 9 et 11 rue de la veille monnaie");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (351, "Orléans", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (351, "CLVUE", "352", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  351, 351, 351
);
        
INSERT INTO sujet(label)
VALUES ("rue de la Vieille Monnaie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("7, 9 et 11 rue de la veille monnaie");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50681, 351);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (351, 351);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (351, 351);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (351, 351);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (352, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (352, "7, 9 et 11 rue de la veille monnaie");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (352, "Orléans", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (352, "CLVUE", "353", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  352, 352, 352
);
        
INSERT INTO sujet(label)
VALUES ("rue de la Vieille Monnaie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("7, 9 et 11 rue de la veille monnaie");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50681, 352);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (352, 352);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (352, 352);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (352, 352);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (353, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (353, "7, 9 et 11 rue de la veille monnaie");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (353, "Orléans", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (353, "CLVUE", "354", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  353, 353, 353
);
        
INSERT INTO sujet(label)
VALUES ("rue de la Vieille Monnaie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("7, 9 et 11 rue de la veille monnaie");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50681, 353);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (353, 353);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (353, 353);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (353, 353);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (354, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (354, "7, 9 et 11 rue de la veille monnaie");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (354, "Orléans", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (354, "CLVUE", "355", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  354, 354, 354
);
        
INSERT INTO sujet(label)
VALUES ("rue de la Vieille Monnaie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("7, 9 et 11 rue de la veille monnaie");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50681, 354);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (354, 354);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (354, 354);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (354, 354);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (355, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (355, "7, 9 et 11 rue de la veille monnaie");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (355, "Orléans", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (355, "CLVUE", "356", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  355, 355, 355
);
        
INSERT INTO sujet(label)
VALUES ("rue de la Vieille Monnaie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("7, 9 et 11 rue de la veille monnaie");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50681, 355);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (355, 355);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (355, 355);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (355, 355);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (356, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (356, "7, 9 et 11 rue de la veille monnaie");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (356, "Orléans", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (356, "CLVUE", "357", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  356, 356, 356
);
        
INSERT INTO sujet(label)
VALUES ("rue de la Vieille Monnaie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("7, 9 et 11 rue de la veille monnaie");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50681, 356);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (356, 356);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (356, 356);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (356, 356);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (357, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (357, "7, 9 et 11 rue de la veille monnaie");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (357, "Orléans", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (357, "CLVUE", "358", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  357, 357, 357
);
        
INSERT INTO sujet(label)
VALUES ("rue de la Vieille Monnaie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("7, 9 et 11 rue de la veille monnaie");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50681, 357);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (357, 357);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (357, 357);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (357, 357);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (358, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (358, "7, 9 et 11 rue de la veille monnaie");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (358, "Orléans", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (358, "CLVUE", "359", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  358, 358, 358
);
        
INSERT INTO sujet(label)
VALUES ("rue de la Vieille Monnaie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("7, 9 et 11 rue de la veille monnaie");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50681, 358);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (358, 358);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (358, 358);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (358, 358);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (359, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (359, "7, 9 et 11 rue de la veille monnaie");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (359, "Orléans", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (359, "CLVUE", "360", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  359, 359, 359
);
        
INSERT INTO sujet(label)
VALUES ("rue de la Vieille Monnaie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("7, 9 et 11 rue de la veille monnaie");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50681, 359);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (359, 359);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (359, 359);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (359, 359);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (360, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (360, "7, 9 et 11 rue de la veille monnaie");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (360, "Orléans", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (360, "CLVUE", "361", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  360, 360, 360
);
        
INSERT INTO sujet(label)
VALUES ("rue de la Vieille Monnaie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("7, 9 et 11 rue de la veille monnaie");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50681, 360);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (360, 360);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (360, 360);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (360, 360);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (361, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (361, "7, 9 et 11 rue de la veille monnaie");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (361, "Orléans", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (361, "CLVUE", "362", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  361, 361, 361
);
        
INSERT INTO sujet(label)
VALUES ("rue de la Vieille Monnaie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("7, 9 et 11 rue de la veille monnaie");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50681, 361);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (361, 361);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (361, 361);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (361, 361);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (362, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (362, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (362, "Erceville", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (362, "CLVUE", "363", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  362, 362, 362
);
        
INSERT INTO sujet(label)
VALUES ("pigeonnier");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48962, 362);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (362, 362);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (362, 362);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (362, 362);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (363, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (363, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (363, "Erceville", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (363, "CLVUE", "364", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  363, 363, 363
);
        
INSERT INTO sujet(label)
VALUES ("pigeonnier");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48962, 363);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (363, 363);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (363, 363);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (363, 363);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (364, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (364, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (364, "Erceville", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (364, "CLVUE", "365", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  364, 364, 364
);
        
INSERT INTO sujet(label)
VALUES ("pigeonnier");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48962, 364);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (364, 364);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (364, 364);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (364, 364);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (365, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (365, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (365, "Erceville", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (365, "CLVUE", "366", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  365, 365, 365
);
        
INSERT INTO sujet(label)
VALUES ("pigeonnier");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48962, 365);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (365, 365);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (365, 365);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (365, 365);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (366, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (366, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (366, "Erceville", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (366, "CLVUE", "367", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  366, 366, 366
);
        
INSERT INTO sujet(label)
VALUES ("pigeonnier");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48962, 366);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (366, 366);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (366, 366);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (366, 366);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (367, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (367, "Panneau sculté");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (367, "Gidy", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (367, "CLVUE", "368", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  367, 367, 367
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Panneau sculté");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49137, 367);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (367, 367);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (367, 367);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (367, 367);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (368, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (368, "Vierge");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (368, "Gidy", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (368, "CLVUE", "369", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  368, 368, 368
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Vierge");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49138, 368);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (368, 368);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (368, 368);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (368, 368);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (369, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (369, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (369, "Gidy", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (369, "CLVUE", "370", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  369, 369, 369
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49138, 369);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (369, 369);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (369, 369);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (369, 369);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (370, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (370, "Christ");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (370, "Orveau-Bellesauve,  Orveau-Bellesauve,  Orveau-Bellesauve-Gollainville", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (370, "CLVUE", "371", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  370, 370, 370
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux, église, objet du culte, église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Christ");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50793, 370);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (370, 370);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (370, 370);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (370, 370);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (371, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (371, "Cul de lampe");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (371, "Orveau-Bellesauve", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (371, "CLVUE", "372", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  371, 371, 371
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Cul de lampe");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50792, 371);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (371, 371);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (371, 371);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (371, 371);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (372, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (372, "Bénitier");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (372, "Orveau-Bellesauve,  Orveau-Bellesauve,  Orveau-Bellesauve-Gollainville", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (372, "CLVUE", "373", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  372, 372, 372
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux, église, objet du culte, église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Bénitier");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50793, 372);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (372, 372);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (372, 372);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (372, 372);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (373, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (373, "Saint Denis");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (373, "Orveau-Bellesauve,  Orveau-Bellesauve-Gollainville", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (373, "CLVUE", "374", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "tache",
  373, 373, 373
);
        
INSERT INTO sujet(label)
VALUES ("église, statue , église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Saint Denis");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50795, 373);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (373, 373);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (373, 373);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (373, 373);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (374, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (374, "Saint Denis");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (374, "Orveau-Bellesauve,  Orveau-Bellesauve-Gollainville", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (374, "CLVUE", "375", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "tache",
  374, 374, 374
);
        
INSERT INTO sujet(label)
VALUES ("église, statue , église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Saint Denis");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50795, 374);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (374, 374);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (374, 374);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (374, 374);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (375, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (375, "Bénitier");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (375, "Orveau-Bellesauve-Gollainville,  Orveau-Bellesauve,  Orveau-Bellesauve,  Orveau-Bellesauve-Gollainville", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (375, "CLVUE", "376", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  375, 375, 375
);
        
INSERT INTO sujet(label)
VALUES ("église , église, mobilier religieux, église, objet du culte, église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Bénitier");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50802 | 50793, 375);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (375, 375);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (375, 375);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (375, 375);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (376, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (376, "Statue");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (376, "Orveau-Bellesauve-Gollainville,  Orveau-Bellesauve,  Orveau-Bellesauve-Gollainville", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (376, "CLVUE", "377", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  376, 376, 376
);
        
INSERT INTO sujet(label)
VALUES ("église , église, statue , église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Statue");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50802 | 50795, 376);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (376, 376);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (376, 376);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (376, 376);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (377, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (377, "Statue");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (377, "Orveau-Bellesauve-Gollainville,  Orveau-Bellesauve,  Orveau-Bellesauve-Gollainville", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (377, "CLVUE", "378", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  377, 377, 377
);
        
INSERT INTO sujet(label)
VALUES ("église , église, statue , église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Statue");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50802 | 50795, 377);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (377, 377);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (377, 377);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (377, 377);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (378, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (378, "Vierge");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (378, "Bricy", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (378, "CLVUE", "379", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  378, 378, 378
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Vierge");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48118, 378);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (378, 378);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (378, 378);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (378, 378);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (379, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (379, "Vierge");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (379, "Bricy", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (379, "CLVUE", "380", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  379, 379, 379
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Vierge");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48118, 379);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (379, 379);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (379, 379);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (379, 379);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (380, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (380, "Evêque");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (380, "Bricy", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (380, "CLVUE", "381", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  380, 380, 380
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Evêque");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48118, 380);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (380, 380);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (380, 380);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (380, 380);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (381, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (381, "Crucifixion");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (381, "Bricy,  Bricy", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (381, "CLVUE", "382", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  381, 381, 381
);
        
INSERT INTO sujet(label)
VALUES ("église, statue , église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Crucifixion");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48118 | 48117, 381);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (381, 381);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (381, 381);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (381, 381);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (382, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (382, "Crucifixion");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (382, "Bricy,  Bricy", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (382, "CLVUE", "383", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  382, 382, 382
);
        
INSERT INTO sujet(label)
VALUES ("église, statue , église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Crucifixion");
        
INSERT INTO cindoc(label, photo_id)
VALUES (NULL, 382);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (382, 382);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (382, 382);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (382, 382);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (383, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (383, "Christ");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (383, "Malesherbes,  Malesherbes", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (383, "CLVUE", "384", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  383, 383, 383
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux, église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Christ");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49836, 383);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (383, 383);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (383, 383);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (383, 383);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (384, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (384, "Christ");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (384, "Malesherbes,  Malesherbes", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (384, "CLVUE", "385", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  384, 384, 384
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux, église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Christ");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49836, 384);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (384, 384);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (384, 384);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (384, 384);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (385, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (385, "Christ");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (385, "Malesherbes,  Malesherbes", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (385, "CLVUE", "386", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  385, 385, 385
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux, église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Christ");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49836, 385);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (385, 385);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (385, 385);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (385, 385);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (386, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (386, "Tableau");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (386, "Malesherbes,  Malesherbes", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (386, "CLVUE", "387", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "même vue expo différente",
  386, 386, 386
);
        
INSERT INTO sujet(label)
VALUES ("tableau, château de Rouville, tableau");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Tableau");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49844, 386);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (386, 386);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (386, 386);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (386, 386);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (387, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (387, "Saint Sébastien");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (387, "Malesherbes,  Malesherbes", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (387, "CLVUE", "388", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  387, 387, 387
);
        
INSERT INTO sujet(label)
VALUES ("église, statue, château de Rouville, chapelle");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Saint Sébastien");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49840, 387);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (387, 387);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (387, 387);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (387, 387);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (388, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (388, "Saint Sébastien");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (388, "Malesherbes,  Malesherbes", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (388, "CLVUE", "389", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  388, 388, 388
);
        
INSERT INTO sujet(label)
VALUES ("église, statue, château de Rouville, chapelle");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Saint Sébastien");
        
INSERT INTO cindoc(label, photo_id)
VALUES (NULL, 388);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (388, 388);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (388, 388);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (388, 388);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (389, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (389, "Lutrin");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (389, "Augerville-la-Rivière", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (389, "CLVUE", "390", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "même vue expo différente",
  389, 389, 389
);
        
INSERT INTO sujet(label)
VALUES ("église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Lutrin");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47576, 389);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (389, 389);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (389, 389);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (389, 389);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (390, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (390, "2 statues bois");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (390, "Augerville-la-Rivière", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (390, "CLVUE", "391", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  390, 390, 390
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("2 statues bois");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47577, 390);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (390, 390);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (390, 390);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (390, 390);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (391, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (391, "Porte sacristie");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (391, "Augerville-la-Rivière", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (391, "CLVUE", "392", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  391, 391, 391
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Porte sacristie");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47574, 391);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (391, 391);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (391, 391);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (391, 391);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (392, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (392, "Retable");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (392, "Dimancheville,  Dimancheville", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (392, "CLVUE", "393", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  392, 392, 392
);
        
INSERT INTO sujet(label)
VALUES ("église , église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Retable");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48846 | 48847, 392);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (392, 392);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (392, 392);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (392, 392);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (393, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (393, "Retable");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (393, "Dimancheville", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (393, "CLVUE", "394", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  393, 393, 393
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Retable");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48847, 393);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (393, 393);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (393, 393);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (393, 393);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (394, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (394, "Christ ivoire");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (394, "Dimancheville", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (394, "CLVUE", "395", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  394, 394, 394
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Christ ivoire");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48847, 394);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (394, 394);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (394, 394);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (394, 394);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (395, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (395, "Fonts baptismaux");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (395, "Dimancheville", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (395, "CLVUE", "396", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  395, 395, 395
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Fonts baptismaux");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48847, 395);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (395, 395);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (395, 395);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (395, 395);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (396, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (396, "Saint Fiacre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (396, "Dimancheville", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (396, "CLVUE", "397", "NULL", "NULL", "SAINT FIACRE, statue", "NULL", "1", "négatif", "nb", "NULL",
  396, 396, 396
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Saint Fiacre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48848, 396);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (396, 396);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (396, 396);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (396, 396);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (397, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (397, "Vierge à l'enfant");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (397, "Dimancheville", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (397, "CLVUE", "398", "NULL", "NULL", "SAINT FIACRE, statue", "NULL", "1", "négatif", "nb", "NULL",
  397, 397, 397
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Vierge à l'enfant");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48848, 397);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (397, 397);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (397, 397);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (397, 397);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (398, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (398, "Cartouche");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (398, "Boismorand", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (398, "CLVUE", "399", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "même vue expo différente",
  398, 398, 398
);
        
INSERT INTO sujet(label)
VALUES ("pierre tombale");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Cartouche");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47912, 398);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (398, 398);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (398, 398);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (398, 398);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (399, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (399, "Cartouche");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (399, "Boismorand", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (399, "CLVUE", "400", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  399, 399, 399
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Cartouche");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47906, 399);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (399, 399);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (399, 399);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (399, 399);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (400, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (400, "Reliquaire");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (400, "Boismorand", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (400, "CLVUE", "401", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  400, 400, 400
);
        
INSERT INTO sujet(label)
VALUES ("église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Reliquaire");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47907, 400);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (400, 400);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (400, 400);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (400, 400);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (401, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (401, "Reliquaire");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (401, "Boismorand", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (401, "CLVUE", "402", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  401, 401, 401
);
        
INSERT INTO sujet(label)
VALUES ("église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Reliquaire");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47907, 401);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (401, 401);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (401, 401);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (401, 401);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (402, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (402, "L'étang");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (402, "Langesse,  Langesse", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (402, "CLVUE", "403", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  402, 402, 402
);
        
INSERT INTO sujet(label)
VALUES ("église , plan d'eau");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("L'étang");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49615 | 49620, 402);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (402, 402);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (402, 402);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (402, 402);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (403, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (403, "L'étang");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (403, "Langesse,  Langesse", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (403, "CLVUE", "404", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  403, 403, 403
);
        
INSERT INTO sujet(label)
VALUES ("église , plan d'eau");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("L'étang");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49615 | 49620, 403);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (403, 403);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (403, 403);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (403, 403);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (404, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (404, "Devant l'autel");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (404, "Langesse", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (404, "CLVUE", "405", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  404, 404, 404
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Devant l'autel");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49615, 404);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (404, 404);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (404, 404);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (404, 404);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (405, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (405, "Vierge à l'enfant");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (405, "Langesse", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (405, "CLVUE", "406", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  405, 405, 405
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Vierge à l'enfant");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49617, 405);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (405, 405);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (405, 405);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (405, 405);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (406, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (406, "Moulin de Lignerolles");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (406, "Coinces", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (406, "CLVUE", "407", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  406, 406, 406
);
        
INSERT INTO sujet(label)
VALUES ("moulin");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Moulin de Lignerolles");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48592, 406);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (406, 406);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (406, 406);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (406, 406);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (407, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (407, "Moulin de Lignerolles");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (407, "Coinces", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (407, "CLVUE", "408", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  407, 407, 407
);
        
INSERT INTO sujet(label)
VALUES ("moulin");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Moulin de Lignerolles");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48592, 407);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (407, 407);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (407, 407);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (407, 407);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (408, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (408, "Moulin de Lignerolles");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (408, "Coinces", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (408, "CLVUE", "409", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  408, 408, 408
);
        
INSERT INTO sujet(label)
VALUES ("moulin");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Moulin de Lignerolles");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48592, 408);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (408, 408);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (408, 408);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (408, 408);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (409, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (409, "Eglise");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (409, "Les Bordes", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (409, "CLVUE", "410", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  409, 409, 409
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49675, 409);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (409, 409);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (409, 409);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (409, 409);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (410, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (410, "Saint Faur");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (410, "Les Bordes", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (410, "CLVUE", "411", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  410, 410, 410
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Saint Faur");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49676, 410);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (410, 410);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (410, 410);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (410, 410);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (411, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (411, "Saint Martin");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (411, "Les Bordes", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (411, "CLVUE", "412", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  411, 411, 411
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Saint Martin");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49676, 411);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (411, 411);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (411, 411);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (411, 411);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (412, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (412, "Croix fer forgé (cimetière)");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (412, "Les Bordes", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (412, "CLVUE", "413", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  412, 412, 412
);
        
INSERT INTO sujet(label)
VALUES ("cimetière");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Croix fer forgé (cimetière)");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49672, 412);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (412, 412);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (412, 412);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (412, 412);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (413, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (413, "Croix fer forgé (cimetière)");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (413, "Les Bordes", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (413, "CLVUE", "414", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  413, 413, 413
);
        
INSERT INTO sujet(label)
VALUES ("cimetière");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Croix fer forgé (cimetière)");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49672, 413);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (413, 413);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (413, 413);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (413, 413);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (414, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (414, "Croix fer forgé (cimetière)");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (414, "Les Bordes", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (414, "CLVUE", "415", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  414, 414, 414
);
        
INSERT INTO sujet(label)
VALUES ("cimetière");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Croix fer forgé (cimetière)");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49672, 414);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (414, 414);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (414, 414);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (414, 414);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (415, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (415, "Piéta (bois)");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (415, "Mardié", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (415, "CLVUE", "416", "NULL", "NULL", "NULL", "NULL", "3", "négatif", "nb", "même vue expo différente",
  415, 415, 415
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Piéta (bois)");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49672 | 49870, 415);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (415, 415);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (415, 415);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (415, 415);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (416, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (416, "Support de statue");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (416, "Mardié,  Mardié", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (416, "CLVUE", "416", "bis", "NULL", "NULL", "NULL", "3", "négatif", "nb", "même vue expo différente",
  416, 416, 416
);
        
INSERT INTO sujet(label)
VALUES ("église, statue , église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Support de statue");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49872 | 49870, 416);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (416, 416);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (416, 416);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (416, 416);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (417, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (417, "Statue de sainte");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (417, "Mardié", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (417, "CLVUE", "417", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "même vue expo différente",
  417, 417, 417
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Statue de sainte");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49872, 417);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (417, 417);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (417, 417);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (417, 417);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (418, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (418, "Vierge à l'enfant");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (418, "Mardié", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (418, "CLVUE", "418", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  418, 418, 418
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Vierge à l'enfant");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49872, 418);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (418, 418);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (418, 418);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (418, 418);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (419, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (419, "Saint Jean Baptiste");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (419, "Mardié", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (419, "CLVUE", "419", "NULL", "NULL", "NULL", "NULL", "3", "négatif", "nb", "même vue expo différente/tache",
  419, 419, 419
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Saint Jean Baptiste");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49872, 419);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (419, 419);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (419, 419);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (419, 419);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (420, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (420, "Panneau de banc d'œuvre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (420, "Mardié", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (420, "CLVUE", "420", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "même vue expo différente",
  420, 420, 420
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Panneau de banc d'œuvre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49870, 420);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (420, 420);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (420, 420);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (420, 420);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (421, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (421, "Cul de lampe");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (421, "Mardié", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (421, "CLVUE", "421", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  421, 421, 421
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Cul de lampe");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49870, 421);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (421, 421);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (421, 421);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (421, 421);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (422, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (422, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (422, "Sully-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (422, "CLVUE", "422", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  422, 422, 422
);
        
INSERT INTO sujet(label)
VALUES ("château");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51706, 422);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (422, 422);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (422, 422);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (422, 422);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (423, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (423, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (423, "Sully-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (423, "CLVUE", "423", "NULL", "NULL", "NULL", "NULL", "1, 1", "négatif, négatif", "nb, nb", "NULL",
  423, 423, 423
);
        
INSERT INTO sujet(label)
VALUES ("château");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (NULL, 423);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (423, 423);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (423, 423);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (423, 423);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (424, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (424, "Vitraux (saint Ythier)");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (424, "Sully-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (424, "CLVUE", "424", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "même vue expo différente",
  424, 424, 424
);
        
INSERT INTO sujet(label)
VALUES ("église Saint-Ythier");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Vitraux (saint Ythier)");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51713, 424);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (424, 424);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (424, 424);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (424, 424);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (425, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (425, "Vitraux (saint Ythier)");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (425, "Sully-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (425, "CLVUE", "425", "NULL", "NULL", "NULL", "NULL", "3", "négatif", "nb", "même vue expo différente",
  425, 425, 425
);
        
INSERT INTO sujet(label)
VALUES ("église Saint-Ythier");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Vitraux (saint Ythier)");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51713, 425);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (425, 425);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (425, 425);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (425, 425);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (426, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (426, "Pieta");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (426, "Sully-sur-Loire,  Sully-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (426, "CLVUE", "426", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "même vue expo différente",
  426, 426, 426
);
        
INSERT INTO sujet(label)
VALUES ("église Saint-Ythier, statue, église Saint-Germain, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Pieta");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51715, 426);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (426, 426);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (426, 426);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (426, 426);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (427, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (427, "Vieille fenêtre (prés Saint-Germain)");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (427, "Sully-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (427, "CLVUE", "427", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  427, 427, 427
);
        
INSERT INTO sujet(label)
VALUES ("maison");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Vieille fenêtre (prés Saint-Germain)");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51721, 427);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (427, 427);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (427, 427);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (427, 427);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (428, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (428, "Ruine de Saint-Germain");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (428, "Sully-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (428, "CLVUE", "428", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  428, 428, 428
);
        
INSERT INTO sujet(label)
VALUES ("église Saint-Germain");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Ruine de Saint-Germain");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51711, 428);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (428, 428);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (428, 428);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (428, 428);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (429, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (429, "Ruine de Saint-Germain");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (429, "Sully-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (429, "CLVUE", "429", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  429, 429, 429
);
        
INSERT INTO sujet(label)
VALUES ("église Saint-Germain");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Ruine de Saint-Germain");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51711, 429);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (429, 429);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (429, 429);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (429, 429);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (430, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (430, "Ruine de Saint-Germain");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (430, "Sully-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (430, "CLVUE", "430", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  430, 430, 430
);
        
INSERT INTO sujet(label)
VALUES ("église Saint-Germain");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Ruine de Saint-Germain");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51711, 430);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (430, 430);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (430, 430);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (430, 430);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (431, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (431, "Clocher de Saint-Germain");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (431, "Sully-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (431, "CLVUE", "431", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  431, 431, 431
);
        
INSERT INTO sujet(label)
VALUES ("église Saint-Germain");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Clocher de Saint-Germain");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51711, 431);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (431, 431);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (431, 431);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (431, 431);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (432, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (432, "Statue bois");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (432, "Sully-sur-Loire,  Sully-sur-Loire,  Sully-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (432, "CLVUE", "432", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  432, 432, 432
);
        
INSERT INTO sujet(label)
VALUES ("église Saint-Germain , église Saint-Ythier, statue, église Saint-Germain, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Statue bois");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51711 | 51715, 432);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (432, 432);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (432, 432);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (432, 432);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (433, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (433, "Inscriptions");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (433, "Sully-sur-Loire,  Sully-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (433, "CLVUE", "433", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  433, 433, 433
);
        
INSERT INTO sujet(label)
VALUES ("église Saint-Germain , église Saint-Germain, pierre tombale");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Inscriptions");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51711 | 51712, 433);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (433, 433);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (433, 433);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (433, 433);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (434, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (434, "Inscriptions");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (434, "Sully-sur-Loire,  Sully-sur-Loire,  Sully-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (434, "CLVUE", "434", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  434, 434, 434
);
        
INSERT INTO sujet(label)
VALUES ("église Saint-Germain , monument commémoratif, église Saint-Germain, plaque commémorative");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Inscriptions");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51711 | 51724, 434);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (434, 434);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (434, 434);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (434, 434);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (435, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (435, "Inscriptions");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (435, "Sully-sur-Loire,  Sully-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (435, "CLVUE", "435", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  435, 435, 435
);
        
INSERT INTO sujet(label)
VALUES ("église Saint-Germain , église Saint-Germain, pierre tombale");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Inscriptions");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51711 | 51712, 435);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (435, 435);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (435, 435);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (435, 435);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (436, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (436, "Inscriptions");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (436, "Sully-sur-Loire,  Sully-sur-Loire,  Sully-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (436, "CLVUE", "436", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  436, 436, 436
);
        
INSERT INTO sujet(label)
VALUES ("église Saint-Germain , monument commémoratif, église Saint-Germain, plaque commémorative");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Inscriptions");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51711 | 51724, 436);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (436, 436);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (436, 436);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (436, 436);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (437, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (437, "Inscriptions");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (437, "Sully-sur-Loire,  Sully-sur-Loire,  Sully-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (437, "CLVUE", "437", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  437, 437, 437
);
        
INSERT INTO sujet(label)
VALUES ("église Saint-Germain , monument commémoratif, église Saint-Germain, plaque commémorative");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Inscriptions");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51711 | 51724, 437);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (437, 437);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (437, 437);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (437, 437);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (438, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (438, "Porche");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (438, "Saint-Denis-en-Val,  Saint-Denis-en-Val", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (438, "CLVUE", "438", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  438, 438, 438
);
        
INSERT INTO sujet(label)
VALUES ("église , église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Porche");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51253 | 51257, 438);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (438, 438);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (438, 438);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (438, 438);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (439, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (439, "Tableau");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (439, "Saint-Denis-en-Val", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (439, "CLVUE", "439", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "NULL",
  439, 439, 439
);
        
INSERT INTO sujet(label)
VALUES ("église, tableau");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Tableau");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51258, 439);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (439, 439);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (439, 439);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (439, 439);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (440, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (440, "Lustre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (440, "Saint-Denis-en-Val", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (440, "CLVUE", "440", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  440, 440, 440
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Lustre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51254, 440);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (440, 440);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (440, 440);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (440, 440);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (441, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (441, "Inscriptions");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (441, "Saint-Denis-en-Val", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (441, "CLVUE", "441", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  441, 441, 441
);
        
INSERT INTO sujet(label)
VALUES ("église, pierre tombale");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Inscriptions");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51255, 441);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (441, 441);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (441, 441);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (441, 441);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (442, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (442, "Inscriptions");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (442, "Saint-Denis-en-Val", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (442, "CLVUE", "442", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  442, 442, 442
);
        
INSERT INTO sujet(label)
VALUES ("église, plaque commémorative");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Inscriptions");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51256, 442);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (442, 442);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (442, 442);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (442, 442);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (443, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (443, "Autel");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (443, "Châteauneuf-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (443, "CLVUE", "443", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "même vue expo différente/tache",
  443, 443, 443
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Autel");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48346, 443);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (443, 443);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (443, 443);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (443, 443);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (444, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (444, "Tombeau");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (444, "Châteauneuf-sur-Loire,  Châteauneuf-sur-Loire", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (444, "CLVUE", "444", "NULL", "NULL", "PHELYPEAUX, Louis (duc de la Vrillière, ministre, secrétaire d'Etat), tombeau", "NULL", "2", "négatif", "nb", "même vue expo différente",
  444, 444, 444
);
        
INSERT INTO sujet(label)
VALUES ("monument commémoratif, église, tombeau de Louis Phelypeaux de la Vrillière");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Tombeau");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48355, 444);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (444, 444);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (444, 444);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (444, 444);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (445, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (445, "Vue de l'église ");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (445, "Bou", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (445, "CLVUE", "445", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  445, 445, 445
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Vue de l'église ");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47980, 445);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (445, 445);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (445, 445);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (445, 445);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (446, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (446, "Vue de l'église ");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (446, "Bou", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (446, "CLVUE", "446", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "tache",
  446, 446, 446
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Vue de l'église ");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47980, 446);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (446, 446);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (446, 446);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (446, 446);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (447, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (447, "Saint Georges");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (447, "Bou", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (447, "CLVUE", "447", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  447, 447, 447
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Saint Georges");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47982, 447);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (447, 447);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (447, 447);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (447, 447);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (448, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (448, "Saint Aignan");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (448, "Bou", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (448, "CLVUE", "448", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "tache",
  448, 448, 448
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Saint Aignan");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47982, 448);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (448, 448);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (448, 448);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (448, 448);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (449, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (449, "Fauteuil");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (449, "Bou", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (449, "CLVUE", "449", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "tache",
  449, 449, 449
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Fauteuil");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47981, 449);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (449, 449);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (449, 449);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (449, 449);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (450, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (450, "Saint Jean Baptiste");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (450, "Bou", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (450, "CLVUE", "450", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "tache",
  450, 450, 450
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Saint Jean Baptiste");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47982, 450);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (450, 450);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (450, 450);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (450, 450);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (451, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (451, "Christ");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (451, "Bou", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (451, "CLVUE", "451", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "tache",
  451, 451, 451
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Christ");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47981, 451);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (451, 451);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (451, 451);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (451, 451);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (452, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (452, "Christ");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (452, "Bou", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (452, "CLVUE", "452", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "tache",
  452, 452, 452
);
        
INSERT INTO sujet(label)
VALUES ("église, mobilier religieux");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Christ");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47981, 452);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (452, 452);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (452, 452);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (452, 452);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (453, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (453, "Porche de l'église");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (453, "Lion-en-Sullias", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (453, "CLVUE", "453", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  453, 453, 453
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Porche de l'église");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49728, 453);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (453, 453);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (453, 453);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (453, 453);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (454, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (454, "Tumulus");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (454, "Lion-en-Sullias", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (454, "CLVUE", "454", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  454, 454, 454
);
        
INSERT INTO sujet(label)
VALUES ("motte féodale");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Tumulus");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49732, 454);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (454, 454);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (454, 454);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (454, 454);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (455, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (455, "Entrée du Tumulus");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (455, "Lion-en-Sullias", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (455, "CLVUE", "455", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  455, 455, 455
);
        
INSERT INTO sujet(label)
VALUES ("motte féodale");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Entrée du Tumulus");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49732, 455);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (455, 455);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (455, 455);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (455, 455);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (456, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (456, "Eglise");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (456, "Darvoy,  Darvoy", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (456, "CLVUE", "456", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  456, 456, 456
);
        
INSERT INTO sujet(label)
VALUES ("église, vue générale");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48828, 456);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (456, 456);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (456, 456);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (456, 456);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (457, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (457, "Eglise");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (457, "Darvoy,  Darvoy", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (457, "CLVUE", "457", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  457, 457, 457
);
        
INSERT INTO sujet(label)
VALUES ("église, vue générale");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48828, 457);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (457, 457);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (457, 457);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (457, 457);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (458, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (458, "Contrefort");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (458, "Darvoy,  Darvoy", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (458, "CLVUE", "458", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "tache",
  458, 458, 458
);
        
INSERT INTO sujet(label)
VALUES ("église, vue générale");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Contrefort");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48828, 458);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (458, 458);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (458, 458);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (458, 458);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (459, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (459, "Intérieur de l'église");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (459, "Saint-Denis-de-l'Hôtel", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (459, "CLVUE", "459", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "même vue expo différente",
  459, 459, 459
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Intérieur de l'église");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51233, 459);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (459, 459);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (459, 459);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (459, 459);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (460, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (460, "Intérieur de l'église");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (460, "Saint-Denis-de-l'Hôtel", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (460, "CLVUE", "460", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  460, 460, 460
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Intérieur de l'église");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51233, 460);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (460, 460);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (460, 460);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (460, 460);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (461, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (461, "Motif de l'autel");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (461, "Saint-Denis-de-l'Hôtel", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (461, "CLVUE", "461", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  461, 461, 461
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Motif de l'autel");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51233, 461);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (461, 461);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (461, 461);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (461, 461);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (462, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (462, "Motif de l'autel");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (462, "Saint-Denis-de-l'Hôtel", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (462, "CLVUE", "462", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  462, 462, 462
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Motif de l'autel");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51233, 462);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (462, 462);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (462, 462);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (462, 462);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (463, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (463, "Vue générale");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (463, "Saint-Denis-de-l'Hôtel,  Saint-Denis-de-l'Hôtel,  Saint-Denis-de-l'Hôtel,  Saint-Denis-de-l'Hôtel,  Loire (fleuve),  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (463, "CLVUE", "463", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  463, 463, 463
);
        
INSERT INTO sujet(label)
VALUES ("embâcle de Loire, pont, vue générale, Les Vernelles, embâcle, vue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Vue générale");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51236, 463);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (463, 463);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (463, 463);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (463, 463);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (464, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (464, "Vue de l'île aux canes");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (464, "Saint-Benoît-sur-Loire,  Saint-Benoît-sur-Loire,  Loire (fleuve),  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (464, "CLVUE", "464", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "même vue expo différente/tache",
  464, 464, 464
);
        
INSERT INTO sujet(label)
VALUES ("bords de Loire, embâcle de Loire, embâcle, vue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Vue de l'île aux canes");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51202, 464);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (464, 464);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (464, 464);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (464, 464);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (465, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (465, "Vue de l'île aux canes");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (465, "Saint-Benoît-sur-Loire,  Saint-Benoît-sur-Loire,  Loire (fleuve),  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (465, "CLVUE", "465", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "tache",
  465, 465, 465
);
        
INSERT INTO sujet(label)
VALUES ("bords de Loire, embâcle de Loire, embâcle, vue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Vue de l'île aux canes");
        
INSERT INTO cindoc(label, photo_id)
VALUES (51202, 465);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (465, 465);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (465, 465);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (465, 465);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (466, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (466, "Château");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (466, "La Bussière,  La Bussière", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (466, "CLVUE", "466", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  466, 466, 466
);
        
INSERT INTO sujet(label)
VALUES ("musée de la Pêche, château");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Château");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49428, 466);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (466, 466);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (466, 466);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (466, 466);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (467, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (467, "Château");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (467, "La Bussière,  La Bussière", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (467, "CLVUE", "466", "bis", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  467, 467, 467
);
        
INSERT INTO sujet(label)
VALUES ("musée de la Pêche, château");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Château");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49428, 467);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (467, 467);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (467, 467);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (467, 467);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (468, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (468, "Château");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (468, "La Bussière,  La Bussière", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (468, "CLVUE", "467", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  468, 468, 468
);
        
INSERT INTO sujet(label)
VALUES ("musée de la Pêche, château");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Château");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49428, 468);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (468, 468);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (468, 468);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (468, 468);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (469, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (469, "Château");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (469, "La Bussière,  La Bussière", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (469, "CLVUE", "468", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  469, 469, 469
);
        
INSERT INTO sujet(label)
VALUES ("musée de la Pêche, château");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Château");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49428, 469);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (469, 469);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (469, 469);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (469, 469);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (470, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (470, "Château, cour intérieure");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (470, "La Bussière,  La Bussière,  La Bussière", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (470, "CLVUE", "469", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  470, 470, 470
);
        
INSERT INTO sujet(label)
VALUES ("musée de la Pêche, château , puits");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Château, cour intérieure");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49428 | 49432, 470);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (470, 470);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (470, 470);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (470, 470);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (471, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (471, "Château, cuisinière");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (471, "La Bussière,  La Bussière", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (471, "CLVUE", "470", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "même vue expo différente",
  471, 471, 471
);
        
INSERT INTO sujet(label)
VALUES ("musée de la Pêche, château");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Château, cuisinière");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49428, 471);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (471, 471);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (471, 471);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (471, 471);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (472, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (472, "Château, salon ");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (472, "La Bussière,  La Bussière", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (472, "CLVUE", "471", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "même vue expo différente",
  472, 472, 472
);
        
INSERT INTO sujet(label)
VALUES ("musée de la Pêche, château");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Château, salon ");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49428, 472);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (472, 472);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (472, 472);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (472, 472);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (473, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (473, "Château, boudoir");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (473, "La Bussière,  La Bussière", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (473, "CLVUE", "472", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  473, 473, 473
);
        
INSERT INTO sujet(label)
VALUES ("musée de la Pêche, château");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Château, boudoir");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49428, 473);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (473, 473);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (473, 473);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (473, 473);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (474, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (474, "Eglise, lustre");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (474, "La Bussière", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (474, "CLVUE", "473", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  474, 474, 474
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise, lustre");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49422, 474);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (474, 474);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (474, 474);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (474, 474);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (475, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (475, "Eglise, Vierge");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (475, "La Bussière", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (475, "CLVUE", "474", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  475, 475, 475
);
        
INSERT INTO sujet(label)
VALUES ("église, statue");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Eglise, Vierge");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49424, 475);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (475, 475);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (475, 475);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (475, 475);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (476, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (476, "Château, aquarium");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (476, "La Bussière,  La Bussière,  La Bussière", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (476, "CLVUE", "475", "NULL", "NULL", "NULL", "NULL", "4", "négatif", "nb", "NULL",
  476, 476, 476
);
        
INSERT INTO sujet(label)
VALUES ("musée de la pêche , musée de la Pêche, château");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Château, aquarium");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49427 | 49428, 476);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (476, 476);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (476, 476);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (476, 476);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (477, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (477, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (477, "Beaugency,  Beaugency", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (477, "CLVUE", "476", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  477, 477, 477
);
        
INSERT INTO sujet(label)
VALUES ("hôtel de ville , tapisserie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47774 | 47786, 477);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (477, 477);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (477, 477);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (477, 477);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (478, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (478, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (478, "Beaugency,  Beaugency", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (478, "CLVUE", "477", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  478, 478, 478
);
        
INSERT INTO sujet(label)
VALUES ("hôtel de ville , tapisserie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47774 | 47786, 478);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (478, 478);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (478, 478);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (478, 478);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (479, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (479, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (479, "Beaugency,  Beaugency", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (479, "CLVUE", "478", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  479, 479, 479
);
        
INSERT INTO sujet(label)
VALUES ("hôtel de ville , tapisserie");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (47774 | 47786, 479);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (479, 479);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (479, 479);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (479, 479);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (480, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (480, "Calice et patène");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (480, "Neuville-aux-Bois", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (480, "CLVUE", "479", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "tache",
  480, 480, 480
);
        
INSERT INTO sujet(label)
VALUES ("église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Calice et patène");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50214, 480);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (480, 480);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (480, 480);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (480, 480);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (481, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (481, "Burettes");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (481, "Neuville-aux-Bois", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (481, "CLVUE", "480", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "tache",
  481, 481, 481
);
        
INSERT INTO sujet(label)
VALUES ("église, objet du culte");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Burettes");
        
INSERT INTO cindoc(label, photo_id)
VALUES (50214, 481);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (481, 481);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (481, 481);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (481, 481);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (482, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (482, "Souvigny en Sologne, église");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (482, "NULL", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (482, "CLVUE", "481", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "NULL",
  482, 482, 482
);
        
INSERT INTO sujet(label)
VALUES ("NULL");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Souvigny en Sologne, église");
        
INSERT INTO cindoc(label, photo_id)
VALUES (NULL, 482);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (482, 482);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (482, 482);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (482, 482);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (483, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (483, "Souvigny en Sologne, autel");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (483, "NULL", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (483, "CLVUE", "482", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "même vue expo différente",
  483, 483, 483
);
        
INSERT INTO sujet(label)
VALUES ("NULL");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Souvigny en Sologne, autel");
        
INSERT INTO cindoc(label, photo_id)
VALUES (NULL, 483);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (483, 483);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (483, 483);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (483, 483);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (484, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (484, "Souvigny en Sologne, Saint-Saturnin");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (484, "NULL", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (484, "CLVUE", "483", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  484, 484, 484
);
        
INSERT INTO sujet(label)
VALUES ("NULL");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Souvigny en Sologne, Saint-Saturnin");
        
INSERT INTO cindoc(label, photo_id)
VALUES (NULL, 484);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (484, 484);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (484, 484);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (484, 484);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (485, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (485, "Souvigny en Sologne, Sainte-Catherine");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (485, "NULL", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (485, "CLVUE", "484", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  485, 485, 485
);
        
INSERT INTO sujet(label)
VALUES ("NULL");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Souvigny en Sologne, Sainte-Catherine");
        
INSERT INTO cindoc(label, photo_id)
VALUES (NULL, 485);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (485, 485);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (485, 485);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (485, 485);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (486, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (486, "Souvigny en Sologne, aigle lutrin");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (486, "NULL", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (486, "CLVUE", "485", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  486, 486, 486
);
        
INSERT INTO sujet(label)
VALUES ("NULL");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Souvigny en Sologne, aigle lutrin");
        
INSERT INTO cindoc(label, photo_id)
VALUES (NULL, 486);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (486, 486);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (486, 486);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (486, 486);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (487, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (487, "Souvigny en Sologne, porche");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (487, "NULL", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (487, "CLVUE", "486", "NULL", "NULL", "NULL", "NULL", "3", "négatif", "nb", "dont 2 même vue expo différente",
  487, 487, 487
);
        
INSERT INTO sujet(label)
VALUES ("NULL");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Souvigny en Sologne, porche");
        
INSERT INTO cindoc(label, photo_id)
VALUES (NULL, 487);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (487, 487);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (487, 487);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (487, 487);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (488, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (488, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (488, "Marcilly-en-Villette", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (488, "CLVUE", "487", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  488, 488, 488
);
        
INSERT INTO sujet(label)
VALUES ("château d'Alosse");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49858, 488);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (488, 488);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (488, 488);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (488, 488);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (489, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (489, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (489, "Marcilly-en-Villette", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (489, "CLVUE", "488", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  489, 489, 489
);
        
INSERT INTO sujet(label)
VALUES ("château d'Alosse");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49858, 489);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (489, 489);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (489, 489);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (489, 489);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (490, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (490, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (490, "Marcilly-en-Villette", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (490, "CLVUE", "489", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  490, 490, 490
);
        
INSERT INTO sujet(label)
VALUES ("château d'Alosse");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49858, 490);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (490, 490);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (490, 490);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (490, 490);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (491, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (491, "Vitrail saint Nicolas ");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (491, "Combleux", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (491, "CLVUE", "490", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "même vue expo différente",
  491, 491, 491
);
        
INSERT INTO sujet(label)
VALUES ("église");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Vitrail saint Nicolas ");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48596, 491);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (491, 491);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (491, 491);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (491, 491);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (492, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (492, "Echelle de crues");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (492, "Combleux,  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (492, "CLVUE", "491", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  492, 492, 492
);
        
INSERT INTO sujet(label)
VALUES ("marine de Loire, marinier, objet");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Echelle de crues");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48601, 492);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (492, 492);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (492, 492);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (492, 492);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (493, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (493, "Echelle de crues");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (493, "Combleux,  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (493, "CLVUE", "492", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  493, 493, 493
);
        
INSERT INTO sujet(label)
VALUES ("marine de Loire, marinier, objet");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Echelle de crues");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48601, 493);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (493, 493);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (493, 493);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (493, 493);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (494, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (494, "Touret ");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (494, "Combleux,  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (494, "CLVUE", "493", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  494, 494, 494
);
        
INSERT INTO sujet(label)
VALUES ("marine de Loire, marinier, objet");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Touret ");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48601, 494);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (494, 494);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (494, 494);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (494, 494);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (495, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (495, "Motif de porte");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (495, "Combleux,  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (495, "CLVUE", "494", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  495, 495, 495
);
        
INSERT INTO sujet(label)
VALUES ("marine de Loire, marinier, objet");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Motif de porte");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48601, 495);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (495, 495);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (495, 495);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (495, 495);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (496, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (496, "Motif fer forgé");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (496, "Combleux,  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (496, "CLVUE", "495", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  496, 496, 496
);
        
INSERT INTO sujet(label)
VALUES ("marine de Loire, marinier, objet");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Motif fer forgé");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48601, 496);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (496, 496);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (496, 496);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (496, 496);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (497, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (497, "Borne entaillée");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (497, "Combleux,  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (497, "CLVUE", "496", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  497, 497, 497
);
        
INSERT INTO sujet(label)
VALUES ("marine de Loire, marinier, objet");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Borne entaillée");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48601, 497);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (497, 497);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (497, 497);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (497, 497);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (498, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (498, "Hangar et girouette ");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (498, "Combleux,  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (498, "CLVUE", "497", "NULL", "NULL", "NULL", "NULL", "2", "négatif", "nb", "même vue expo différente",
  498, 498, 498
);
        
INSERT INTO sujet(label)
VALUES ("marine de Loire, marinier, objet");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Hangar et girouette ");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48601, 498);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (498, 498);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (498, 498);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (498, 498);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (499, NULL, NULL, NULL);
        
INSERT INTO description(id, label)
VALUES (499, "Hangar ");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (499, "Combleux,  Loire (fleuve)", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (499, "CLVUE", "498", "NULL", "NULL", "NULL", "NULL", "3", "négatif", "nb", "dont 2 même vue expo différente",
  499, 499, 499
);
        
INSERT INTO sujet(label)
VALUES ("marine de Loire, marinier, objet");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("Hangar ");
        
INSERT INTO cindoc(label, photo_id)
VALUES (48601, 499);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (499, 499);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (499, 499);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (499, 499);
        
INSERT INTO date(id, jour, annee, mois)
VALUES (500, NULL, NULL, 1963);
        
INSERT INTO description(id, label)
VALUES (500, "NULL");
        
INSERT INTO geo(id, commune, coordonnee)
VALUES (500, "Jargeau,  Jargeau", NULL);
        
INSERT INTO photo(id, serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
VALUES (500, "CLVUE", "499", "NULL", "NULL", "NULL", "NULL", "1", "négatif", "nb", "NULL",
  500, 500, 500
);
        
INSERT INTO sujet(label)
VALUES ("pont, pont, construction");
        
INSERT INTO taille(largeur, hauteur)
VALUES (0, 0);
        
INSERT INTO iconographie(label)
VALUES ("NULL");
        
INSERT INTO cindoc(label, photo_id)
VALUES (49385, 500);
        
INSERT INTO sujets(photo_id, sujet_id)
VALUES (500, 500);
        
INSERT INTO tailles(photo_id, taille_id)
VALUES (500, 500);
        
INSERT INTO iconographies(photo_id, iconographie_id)
VALUES (500, 500);
        