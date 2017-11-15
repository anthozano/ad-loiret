<?php

require "Database.php";

$db = Database::getInstance();
$pdo = $db->getPDO();
$pdo->exec("
  DROP DATABASE IF EXISTS jeanne;
  CREATE DATABASE jeanne
      DEFAULT CHARACTER SET utf8
      DEFAULT COLLATE utf8_general_ci;
  USE jeanne;
");

// -----------------------------------------------------
// Table `sujet`
// -----------------------------------------------------
$pdo->exec("
  CREATE TABLE IF NOT EXISTS `sujet` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `label` VARCHAR(255) NULL UNIQUE,
    PRIMARY KEY (`id`));
");

// -----------------------------------------------------
// Table `date`
// -----------------------------------------------------
$pdo->exec("
  CREATE TABLE IF NOT EXISTS `date` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `jour` INT NULL,
    `mois` INT NULL,
    `annee` INT NULL,
    PRIMARY KEY (`id`));
");

// -----------------------------------------------------
// Table `geo`
// -----------------------------------------------------
$pdo->exec("
  CREATE TABLE IF NOT EXISTS `geo` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `commune` VARCHAR(255) NULL,
    `coordonnee` VARCHAR(255) NULL,
    PRIMARY KEY (`id`));
");

// -----------------------------------------------------
// Table `description`
// -----------------------------------------------------
$pdo->exec("
  CREATE TABLE IF NOT EXISTS `description` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `label` VARCHAR(255) NULL,
    PRIMARY KEY (`id`));
");

// -----------------------------------------------------
// Table `photos`
// -----------------------------------------------------
$pdo->exec("
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
");

// -----------------------------------------------------
// Table `iconographie`
// -----------------------------------------------------
$pdo->exec("
  CREATE TABLE IF NOT EXISTS `iconographie` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `label` VARCHAR(255) NULL UNIQUE,
    PRIMARY KEY (`id`));
");

// -----------------------------------------------------
// Table `taille`
// -----------------------------------------------------
$pdo->exec("
  CREATE TABLE IF NOT EXISTS `taille` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `largeur` FLOAT NULL,
    `hauteur` FLOAT NULL,
    CONSTRAINT UC_taille UNIQUE (largeur, hauteur),
    PRIMARY KEY (`id`));
");

// -----------------------------------------------------
// Table `sujets`
// -----------------------------------------------------
$pdo->exec("
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
");

// -----------------------------------------------------
// Table `iconographies`
// -----------------------------------------------------
$pdo->exec("
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
");

// -----------------------------------------------------
// Table `cindoc`
// -----------------------------------------------------
$pdo->exec("
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
");

// -----------------------------------------------------
// Table `tailles`
// -----------------------------------------------------
$pdo->exec("
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
");

$i = 0;

if (($handle = fopen("../raw/ProjetBDDL3.csv", "r")) !== FALSE) {
    while (($data = fgetcsv($handle, 0, ";")) !== FALSE) {

        for ($j = 0; $j < count($data); $j++) {
            $row[$j] = trim($data[$j]) == "" ? "NULL" : $data[$j];
        }


        $date = ["day" => "NULL", "month" => "NULL", "year" => "NULL"];
        $raw_date = explode(':', $data[7]);
        $row[7] = trim($raw_date[count($raw_date) - 1]);

        if (preg_match('/[0-9]{4}/', $row[7], $year)) {
            $date["year"] = $year[0];
        }

        $pdo->exec("
          INSERT INTO date(id, jour, annee, mois)
          VALUES ($i, " . $date["day"] . ", " . $date["month"] . ", " . $date["year"] . ");
        ");
        /*

        $pdo->exec("
          INSERT INTO description(id, label)
          VALUES ($i, \"$row[6]\");
        ");

        $pdo->exec("
          INSERT INTO geo(id, commune, coordonnee)
          VALUES ($i, \"$row[4]\", NULL);
        ");

        $pdo->exec("
          INSERT INTO photos(id, serie, article, discriminant, notes, index_personnes,          fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
          VALUES ($i, \"$row[1]\", \"$row[2]\", \"$row[3]\", \"$row[8]\", \"$row[9]\", \"$row[10]\", \"$row[12]\", \"$row[14]\", \"$row[15]\", \"$row[16]\",
            $i, $i, $i
          );
        ");

        */
       
        $sujets = explode(',', $row[5]); 

        foreach ($sujets as $sujet) {
          $sujet = str_replace("\"", "", $sujet);
          if ($sujet != "NULL" && $sujet != "") {
            $sujet = ucfirst($sujet);
            $pdo->exec("
              INSERT IGNORE INTO sujet(label)
              VALUES (\"$sujet\")
            ");
          }
        }


        /*
         * Taille
         */
        
        $taille = ["largeur" => 0, "hauteur" => 0];
        $tailles = trim(preg_replace("#\([^\)]+\)#", "", $row[13]));
        preg_match_all("#[\d]*(?(?=,),5)x[\d]*(?(?=,),5*)#", $tailles, $matches);
        foreach ($matches[0] as $matche) {
          $matche = str_replace(',', '.', $matche);
          $hl = explode('x', $matche);
          $taille = ["largeur" => $hl[0], "hauteur" => $hl[1]];
          $pdo->exec("
            INSERT IGNORE INTO taille(largeur, hauteur)
            VALUES (" . $taille["largeur"] . ", " . $taille["hauteur"] . ");
          ");
        }

        /*
         * Iconographie
         */

       
        $icons = preg_split("^[,/|]+^", $row[11]); 
        foreach ($icons as $icon) {
          $icon = str_replace("\"", "", $icon);
          if ($icon != "NULL" && $icon != "") {
            $icon = ucfirst(trim($icon));
            $pdo->exec("
              INSERT IGNORE INTO iconographie(label)
              VALUES (\"$icon\");
            ");
          }
        }


        /*

        $pdo->exec("
          INSERT INTO cindoc(label, photo_id)
          VALUES (\"$row[0]\", $i);
        ");

        $pdo->exec("
          INSERT INTO sujets(photo_id, sujet_id)
          VALUES ($i, $i);
        ");

        $pdo->exec("
          INSERT INTO tailles(photo_id, taille_id)
          VALUES ($i, $i);
        ");

        $pdo->exec("
          INSERT INTO iconographies(photo_id, iconographie_id)
          VALUES ($i, $i);
        ");


        if ($i > 500) {
            exit();
        }
        $i++;
        */
        echo("\nline $i ok\n");
    }
    fclose($handle);
}

?>
