<?php

require "Database.php";

$db = Database::getInstance();
$pdo = $db->getPDO();
$pdo->exec(require "db.create_tables.sql");

function removeQuotes($string) {
  return str_replace("\"", "", $string);
}

function clean($string) {
  if (trim($string) == "") {
    return "NULL";
  } else {
    return trim(removeQuotes($string));
  }
}

$months = [
  1 => "janvier",
  2 => "fevrier",
  3 => "mars",
  4 => "avril",
  5 => "mai",
  6 => "juin",
  7 => "juillet",
  8 => "aout",
  9 => "septembre",
  10 => "octobre",
  11 => "novembre",
  12 => "decembre"
];

$i = 0;

if (($handle = fopen("../raw/ProjetBDDL3.csv", "r")) !== FALSE) {
    while (($data = fgetcsv($handle, 0, ";")) !== FALSE) {

        /*
         * Premier nettoyage
         */

        for ($j = 0; $j < count($data); $j++) {
            $row[$j] = clean($data[$j]);
        }

        /*
         * Date
         */

        $date = ["day" => "NULL", "month" => "NULL", "year" => "NULL"];

        $raw_date = explode(':', $data[7]);
        $row[7] = trim($raw_date[count($raw_date) - 1]);
        $row[7] = str_replace('û', 'u', $row[7]);
        $row[7] = str_replace('é', 'e', $row[7]);
        $row[7] = trim(strtolower($row[7]));

        if (preg_match('#[\d]{4}#', $row[7], $year)) {
            $date["year"] = $year[0];
        }

        foreach ($months as $n => $month) {
          if (preg_match("#$month#", $row[7], $m)) {
              $date["month"] = $n;
          }
        }

        if (preg_match('#[\d]{1,2} #', $row[7], $day)) {
            $date["day"] = $day[0];
        }

        $pdo->exec("
          INSERT IGNORE INTO date(jour, mois, annee)
          VALUES (" . $date["day"] . ", " . $date["month"] . ", " . $date["year"] . ");
        ");

        /*
         * Description
         */
        
        $description = removeQuotes($row[6]);

        $pdo->exec("
          INSERT INTO description(label)
          VALUES (\"$description\");
        ");

        /*
         * geo
         */


        $pdo->exec("
          INSERT INTO geo(commune, coordonnee)
          VALUES (\"$row[4]\", NULL);
        ");

        $stmt = $pdo->prepare("SELECT * FROM description ORDER BY id DESC LIMIT 1");
        $stmt->execute();
        $description = $stmt->fetchObject();

        $stmt = $pdo->prepare("SELECT * FROM geo ORDER BY id DESC LIMIT 1");
        $stmt->execute();
        $geo = $stmt->fetchObject();

        $stmt = $pdo->prepare("SELECT * FROM date WHERE jour = :day AND mois = :month AND annee = :year");
        $stmt->bindParam(':day', $date["day"]);
        $stmt->bindParam(':month', $date["month"]);
        $stmt->bindParam(':year', $date["year"]);
        $stmt->execute();
        $date = $stmt->fetchObject();

        $remarques = removeQuotes($row[16]);

        $sql = "INSERT INTO photos(serie, article, discriminant, notes, index_personnes, fichier_num, nb_cliche, support, chroma, remarques, id_description, id_date, id_geo)
          VALUES (\"$row[1]\", \"$row[2]\", \"$row[3]\", \"$row[8]\", \"$row[9]\", \"$row[10]\", \"$row[12]\", \"$row[14]\", \"$row[15]\", \"$remarques\",
            " . ($description ? $description->id : 1) . ", 
            " . ($date ? $date->id : 1) . ",  
            " . ($geo->id) . ");";

        echo $row[10];
        $pdo->exec($sql);
       
        $sujets = explode(',', $row[5]); 

        foreach ($sujets as $sujet) {
          $sujet = str_replace("\"", "", $sujet);
          if ($sujet != "NULL" && $sujet != "") {
            $sujet = ucfirst($sujet);
            $pdo->exec("
c
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


        $pdo->exec("
          INSERT INTO cindoc(label, photo_id)
          VALUES (\"$row[0]\", $i);
        ");


        $pdo->exec("
          INSERT INTO fichier(label, photo_id)
          VALUES (\"$row[10]\", $i);
        ");
        
        /*

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

        */
        if ($i > 10000) {
            exit();
        }
        $i++;
        echo("\nline $i done\n");
    }
    fclose($handle);
}

?>
