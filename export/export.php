<?php

require "Database.php";

$db = Database::getInstance();
$pdo = $db->getPDO();

$sql = fopen("../raw/export.sql", 'w');

/*
 * Base
 */
fwrite($sql,
"DROP DATABASE IF EXISTS jeanne;
CREATE DATABASE jeanne
    DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_general_ci;
");

/*
 * Table photo
 */
fwrite($sql, "
CREATE TABLE photo(
    id INT AUTO_INCREMENT PRIMARY KEY,
    ref_cindoc VARCHAR(255) DEFAULT NULL,
    serie VARCHAR(255) DEFAULT NULL,
    article VARCHAR(255) DEFAULT NULL,
    discriminant VARCHAR(255) DEFAULT NULL,
    notes_bdp VARCHAR(255) DEFAULT NULL,
    index_personnes VARCHAR(255) DEFAULT NULL,
    fichier_num VARCHAR(255) DEFAULT NULL,
    nb_cliche VARCHAR(255) DEFAULT NULL,
    support VARCHAR(255) DEFAULT NULL,
    chroma VARCHAR(255) DEFAULT NULL,
    remarques VARCHAR(255) DEFAULT NULL,
    id_geo INT DEFAULT NULL,
    id_description INT DEFAULT NULL,
    id_sujet INT DEFAULT NULL,
    id_date INT DEFAULT NULL
);");

/*
 * Table description
 */
fwrite($sql, "
CREATE TABLE description(
    id INT AUTO_INCREMENT PRIMARY KEY,
    label VARCHAR(255) DEFAULT NULL
);");

/*
 * Table sujet
 */
fwrite($sql, "
CREATE TABLE sujet(
    id INT AUTO_INCREMENT PRIMARY KEY,
    label VARCHAR(255) DEFAULT NULL
);");

/*
 * Table l_taille
 */
fwrite($sql, "
CREATE TABLE l_taille(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_taille INT DEFAULT NULL,
    id_photo INT DEFAULT NULL
);");

/*
 * Table taille
 */
fwrite($sql, "
CREATE TABLE taille(
    id INT AUTO_INCREMENT PRIMARY KEY,
    largeur INT DEFAULT NULL,
    hauteur INT DEFAULT NULL
);");

/*
 * Table date
 */
fwrite($sql, "
CREATE TABLE date(
    id INT AUTO_INCREMENT PRIMARY KEY,
    jour INT DEFAULT NULL
    mois INT DEFAULT NULL
    annee INT DEFAULT NULL
);");

/*
 * Table l_iconographie
 */
fwrite($sql, "
CREATE TABLE l_iconographie(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_iconographie INT DEFAULT NULL,
    id_photo INT DEFAULT NULL
);");

/*
 * Table iconographie
 */
fwrite($sql, "
CREATE TABLE iconographie(
    id INT AUTO_INCREMENT PRIMARY KEY,
    label VARCHAR(255) DEFAULT NULL
);");

/*
 * Table geo
 */
fwrite($sql, "
CREATE TABLE geo(
    id INT AUTO_INCREMENT PRIMARY KEY,
    ville VARCHAR(255) DEFAULT NULL,
    coord VARCHAR(255) DEFAULT NULL,
);");

/*
 * Table coord
 */
fwrite($sql, "
CREATE TABLE coord(
    id INT AUTO_INCREMENT PRIMARY KEY,
    long FLOAT DEFAULT NULL,
    lati FLOAT DEFAULT NULL,
);");


/*
 * Clef étrangéres
 */
fwrite($sql, "
ALTER TABLE photo
ADD FOREIGN KEY (id_geo) REFERENCES geo(id),
ADD FOREIGN KEY (id_description) REFERENCES description(id),
ADD FOREIGN KEY (id_sujet) REFERENCES sujet(id),
ADD FOREIGN KEY (id_date) REFERENCES date(id);

ALTER TABLE l_iconographie
ADD FOREIGN KEY (id_iconographie) REFERENCES iconographie(id),
ADD FOREIGN KEY (id_photo) REFERENCES photo(id);

ALTER TABLE l_taille
ADD FOREIGN KEY (id_taille) REFERENCES taille(id),
ADD FOREIGN KEY (id_photo) REFERENCES photo(id);
");

if (($handle = fopen("../raw/ProjetBDDL3.csv", "r")) !== FALSE) {
    while (($data = fgetcsv($handle, 0, ";")) !== FALSE) {
      var_dump($data);
      exit();
    }
    fclose($handle);
}
