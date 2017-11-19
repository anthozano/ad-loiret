<?php

require "Database.php";

/**
 * Class Exporter
 *
 * Exports csv data into a MySQL data base
 * Warning, this class is specific to one and only one csv sheet and is 100% NOT REUSABLE in a different context.
 */
class Exporter
{

    private $pdo;
    private static $_instance;

    const MONTH = [1 => "janvier", 2 => "fevrier", 3 => "mars", 4 => "avril", 5 => "mai", 6 => "juin", 7 => "juillet", 8 => "aout", 9 => "septembre", 10 => "octobre", 11 => "novembre", 12 => "decembre"];

    private $lastGeoId;
    private $lastDateId;
    private $lastDescriptionId;
    private $lastPhotoId;
    private $lastTailleIds;
    private $lastSujetIds;
    private $lastIconographieIds;

    public function setLastGeoId($lastGeoId)
    {
        $this->lastGeoId = $lastGeoId;
    }

    public function setLastDateId($lastDateId)
    {
        $this->lastDateId = $lastDateId;
    }

    public function setLastDescriptionId($lastDescriptionId)
    {
        $this->lastDescriptionId = $lastDescriptionId;
    }

    public function setLastPhotoId($lastPhotoId)
    {
        $this->lastPhotoId = $lastPhotoId;
    }

    public function setLastTailleIds($lastTailleIds)
    {
        $this->lastTailleIds = $lastTailleIds;
    }

    public function setLastSujetIds($lastSujetIds)
    {
        $this->lastSujetIds = $lastSujetIds;
    }

    public function setLastIconographieIds($lastIconographieIds)
    {
        $this->lastIconographieIds = $lastIconographieIds;
    }

    public function getLastGeoId()
    {
        return $this->lastGeoId;
    }

    public function getLastDateId()
    {
        return $this->lastDateId;
    }

    public function getLastDescriptionId()
    {
        return $this->lastDescriptionId;
    }

    public function getLastPhotoId()
    {
        return $this->lastPhotoId;
    }

    public function getLastTailleIds()
    {
        return $this->lastTailleIds;
    }

    public function getLastSujetIds()
    {
        return $this->lastSujetIds;
    }

    public function getLastIconographieIds()
    {
        return $this->lastIconographieIds;
    }

    public static function getInstance()
    {
        if (is_null(self::$_instance)) {
            self::$_instance = new Exporter();
        }
        return self::$_instance;
    }

    public function __construct()
    {
        $this->pdo = Database::getInstance()->getPDO();
        $sql = file_get_contents("db.create_tables.sql");
        echo "Building database ...";
        $this->pdo->exec($sql);
    }

    private function removeQuotes($string)
    {
        return str_replace("\"", "", $string);
    }

    private function clean($string)
    {
        if (trim($string) == "") {
            return "NULL";
        } else {
            return trim($this->removeQuotes($string));
        }
    }

    public function runExport($file)
    {
        $lineCount = 0;
        if (($handle = fopen($file, "r")) !== FALSE) {
            while (($data = fgetcsv($handle, 0, ";")) !== FALSE) {

                /* cleanning raw data */
                for ($j = 0; $j < count($data); $j++) {
                    $row[$j] = $this->clean($data[$j]);
                }

                /* date */
                $this->date($data[7]);

                /* description */
                $this->description($data[6]);

                /* geo */
                $this->geo($data[4]);

                /* photo */
                $this->photo(
                    $data[1], // serie
                    $data[2], // article
                    $data[3], // discriminant
                    $data[8], // notes
                    $data[9], // index_personnes
                    $data[12], // nb_cliche
                    $data[14], // support
                    $data[15], // chroma
                    $data[16]  // remarques
                );

                /* taille */
                $this->taille($data[13]);

                /* iconographie */
                $this->iconographie($data[11]);

                /* cindoc */
                $this->cindoc($data[0]);

                /* fichier */
                $this->fichier($data[10]);

                /* sujet */
                $this->sujet($data[5]);

                /* sujets */
                $this->sujets();

                /* iconographies */
                $this->iconographies();

                /* tailles */
                $this->tailles();

                $lineCount++;
                echo "Line ${lineCount} done\n";
            }
            fclose($handle);
        }
    }

    private function date($raw)
    {
        /* saving line */
        $date = $this->formatDate($raw);
        $stmt = $this->pdo->prepare("
          INSERT IGNORE INTO `date`(`jour`, `mois`, `annee`)
          VALUES (:jour, :mois, :annee);
        ");
        $stmt->bindParam(':jour', $date["day"]);
        $stmt->bindParam(':mois', $date["month"]);
        $stmt->bindParam(':annee', $date["year"]);
        $stmt->execute();

        /* fetch id of saved line for fk purposes */
        $saveLastStmt = $this->pdo->prepare("
            SELECT `id`
            FROM `date`
            WHERE `jour` = :jour AND `mois` = :mois AND `annee` = :annee
            LIMIT 1;
        ");
        $saveLastStmt->bindParam(':jour', $date["day"]);
        $saveLastStmt->bindParam(':mois', $date["month"]);
        $saveLastStmt->bindParam(':annee', $date["year"]);
        $saveLastStmt->execute();
        $lastInserted = $saveLastStmt->fetchObject();
        $this->setLastDateId($lastInserted->id);
    }

    private function formatDate($raw)
    {
        $date = ["day" => "NULL", "month" => "NULL", "year" => "NULL"];
        $raw_date = explode(':', $raw);
        $raw = trim($raw_date[count($raw_date) - 1]);
        $raw = str_replace('û', 'u', $raw);
        $raw = str_replace('é', 'e', $raw);
        $raw = trim(strtolower($raw));

        if (preg_match('#[\d]{4}#', $raw, $year)) {
            $date["year"] = $year[0];
        }

        foreach (self::MONTH as $n => $month) {
            if (preg_match("#$month#", $raw, $m)) {
                $date["month"] = $n;
            }
        }

        if (preg_match('#[\d]{1,2} #', $raw, $day)) {
            $date["day"] = $day[0];
        }
        return $date;
    }

    private function description($raw)
    {
        /* saving line */
        $description = $this->clean($raw);
        $stmt = $this->pdo->prepare("
          INSERT INTO `description`(`label`)
          VALUES (:description);
        ");
        $stmt->bindParam(':description', $description);
        $stmt->execute();

        /* fetch id of saved line for fk purposes */
        $saveLastStmt = $this->pdo->prepare("
            SELECT `id`
            FROM `description`
            WHERE `label` = :label
            LIMIT 1;
        ");
        $saveLastStmt->bindParam(':label', $description);
        $saveLastStmt->execute();
        $lastInserted = $saveLastStmt->fetchObject();
        $this->lastDescriptionId = $lastInserted->id;
    }

    private function geo($raw)
    {
        /* saving line */
        $geo = $this->clean($raw);
        $stmt = $this->pdo->prepare("
          INSERT INTO `geo`(`commune`, `coordonnee`)
          VALUES (:geo, NULL);
        ");
        $stmt->bindParam(':geo', $geo);
        $stmt->execute();

        /* fetch id of saved line for fk purposes */
        $saveLastStmt = $this->pdo->prepare("
            SELECT `id`
            FROM `geo`
            WHERE `commune` = :commune
            LIMIT 1;
        ");
        $saveLastStmt->bindParam(':commune', $geo);
        $saveLastStmt->execute();
        $lastInserted = $saveLastStmt->fetchObject();
        $this->setLastGeoId($lastInserted->id);
    }

    private function photo($serie, $article, $discriminant, $notes, $index_personnes, $nb_cliche, $support, $chroma, $remarques)
    {
        /* saving line */
        $photo = $this->formatPhoto($serie, $article, $discriminant, $notes, $index_personnes, $nb_cliche, $support, $chroma, $remarques);
        $description_id = $this->getLastDescriptionId();
        $date_id = $this->getLastDateId();
        $geo_id = $this->getLastGeoId();
        $stmt = $this->pdo->prepare("
            INSERT INTO photo(serie, article, discriminant, notes, index_personnes, nb_cliche, support, chroma, remarques, description_id, date_id, geo_id)
            VALUES (:serie, :article, :discriminant, :notes, :index_personnes, :nb_cliche, :support, :chroma, :remarques, :description_id, :date_id, :geo_id);
            ");
        $stmt->bindParam(':serie', $photo["serie"]);
        $stmt->bindParam(':article', $photo["article"]);
        $stmt->bindParam(':discriminant', $photo["discriminant"]);
        $stmt->bindParam(':notes', $photo["notes"]);
        $stmt->bindParam(':index_personnes', $photo["index_personnes"]);
        $stmt->bindParam(':nb_cliche', $photo["nb_cliche"]);
        $stmt->bindParam(':support', $photo["support"]);
        $stmt->bindParam(':chroma', $photo["chroma"]);
        $stmt->bindParam(':remarques', $photo["remarques"]);
        $stmt->bindParam(':description_id', $description_id);
        $stmt->bindParam(':date_id', $date_id);
        $stmt->bindParam(':geo_id', $geo_id);
        $stmt->execute();

        /* fetch id of saved line for fk purposes */
        $saveLastStmt = $this->pdo->prepare("
            SELECT `id`
            FROM `photo`
            WHERE
                `serie` = :serie AND
                `article` = :article AND
                `discriminant` = :discriminant AND
                `notes` = :notes AND
                `index_personnes` = :index_personnes AND
                `nb_cliche` = :nb_cliche AND
                `support` = :support AND
                `chroma` = :chroma AND
                `remarques` = :remarques AND
                `description_id` = :description_id AND
                `date_id` = :date_id AND
                `geo_id` = :geo_id 
            LIMIT 1;
        ");
        $saveLastStmt->bindParam(':serie', $photo["serie"]);
        $saveLastStmt->bindParam(':article', $photo["article"]);
        $saveLastStmt->bindParam(':discriminant', $photo["discriminant"]);
        $saveLastStmt->bindParam(':notes', $photo["notes"]);
        $saveLastStmt->bindParam(':index_personnes', $photo["index_personnes"]);
        $saveLastStmt->bindParam(':nb_cliche', $photo["nb_cliche"]);
        $saveLastStmt->bindParam(':support', $photo["support"]);
        $saveLastStmt->bindParam(':chroma', $photo["chroma"]);
        $saveLastStmt->bindParam(':remarques', $photo["remarques"]);
        $saveLastStmt->bindParam(':description_id', $description_id);
        $saveLastStmt->bindParam(':date_id', $date_id);
        $saveLastStmt->bindParam(':geo_id', $geo_id);
        $saveLastStmt->execute();
        $lastInserted = $saveLastStmt->fetchObject();
        $this->setLastPhotoId($lastInserted->id);
    }

    private function iconographie($raw)
    {
        $lastInserts = [];
        $iconos = $this->formatIcono($raw);
        foreach ($iconos as $icono) {
            /* saving line */
            $stmt = $this->pdo->prepare("
                INSERT IGNORE INTO `iconographie`(`label`)
                VALUES (:icono);
            ");
            $stmt->bindParam(':icono', $icono);
            $stmt->execute();

            /* fetch id of saved line for fk purposes */
            $saveLastStmt = $this->pdo->prepare("
                SELECT `id`
                FROM `iconographie`
                WHERE `label` = :label
                LIMIT 1;
            ");
            $saveLastStmt->bindParam(':label', $icono);
            $saveLastStmt->execute();
            $lastInserted = $saveLastStmt->fetchObject();
            array_push($lastInserts, $lastInserted->id);
        }
        $this->setLastIconographieIds($lastInserts);
    }

    private function formatIcono($raw)
    {
        $format = [];
        $iconos = preg_split("#[,/|]+#", $raw);
        foreach ($iconos as $icono) {
            array_push($format, ucfirst($icono));
        }
        return $iconos;
    }

    private function fichier($raw)
    {
        $fichiers = $this->formatFichier($raw);
        $photo_id = $this->getLastPhotoId();
        foreach ($fichiers as $fichier) {
            $stmt = $this->pdo->prepare("
              INSERT INTO `fichier`(`label`, `photo_id`)
              VALUES (:label, :photo_id);
            ");
            $stmt->bindParam(':label', $fichier);
            $stmt->bindParam(':photo_id', $photo_id);
            $stmt->execute();
        }
    }


    private function cindoc($raw)
    {
        $cindocs = $this->formatCindoc($raw);
        foreach ($cindocs as $cindoc) {
            $photo_id = $this->getLastPhotoId();
            $stmt = $this->pdo->prepare("
              INSERT INTO `cindoc`(`label`, `photo_id`)
              VALUES (:label, :photo_id);
            ");
            $stmt->bindParam(':label', $cindoc);
            $stmt->bindParam(':photo_id', $photo_id);
            $stmt->execute();
        }
    }

    private function taille($raw)
    {
        $lastInserts = [];
        $tailles = $this->formatTaille($raw);
        foreach ($tailles as $taille) {
            /* saving line */
            $stmt = $this->pdo->prepare("
                INSERT IGNORE INTO `taille`(`largeur`, `hauteur`)
                VALUES (:largeur, :hauteur);
            ");
            $stmt->bindParam(':largeur', $taille["largeur"]);
            $stmt->bindParam(':hauteur', $taille["hauteur"]);
            $stmt->execute();

            /* fetch id of saved line for fk purposes */
            $saveLastStmt = $this->pdo->prepare("
                SELECT `id`
                FROM `taille`
                WHERE `largeur` = :largeur AND `hauteur` = :hauteur
                LIMIT 1;
            ");
            $saveLastStmt->bindParam(':largeur', $taille["largeur"]);
            $saveLastStmt->bindParam(':hauteur', $taille["hauteur"]);
            $saveLastStmt->execute();
            $lastInserted = $saveLastStmt->fetchObject();
            array_push($lastInserts, $lastInserted->id);
        }
        $this->setLastTailleIds($lastInserts);
    }

    private function formatPhoto($serie, $article, $discriminant, $notes, $index_personnes, $nb_cliche, $support, $chroma, $remarques)
    {
        return $photo = [
            "serie" => $serie,
            "article" => $article,
            "discriminant" => $discriminant,
            "notes" => $notes,
            "index_personnes" => $index_personnes,
            "nb_cliche" => $nb_cliche,
            "support" => $support,
            "chroma" => $chroma,
            "remarques" => $remarques
        ];
    }

    private function formatTaille($raw)
    {
        $format = array();
        $taille = ["largeur" => 0, "hauteur" => 0];
        $tailles = trim(preg_replace("#\([^\)]+\)#", "", $raw));
        preg_match_all("#[\d]*(?(?=,),5)x[\d]*(?(?=,),5*)#", $tailles, $matches);
        foreach ($matches[0] as $matche) {
            $matche = str_replace(',', '.', $matche);
            $hl = explode('x', $matche);
            $taille = ["largeur" => $hl[0], "hauteur" => $hl[1]];
            array_push($format, $taille);
        }
        return $format;
    }

    private function formatCindoc($raw)
    {
        $cindocs = preg_split('# | #', $raw);
        return $cindocs;
    }

    private function formatFichier($raw)
    {
        $fichiers = preg_split('#/#', $raw);
        return $fichiers;
    }

    private function sujets()
    {
        $photo_id = $this->getLastPhotoId();
        foreach ($this->getLastSujetIds() as $id) {
            $stmt = $this->pdo->prepare("
              INSERT INTO `sujets`(`photo_id`, `sujet_id`)
              VALUES (:photo_id, :sujet_id);
            ");
            $stmt->bindParam(':photo_id', $photo_id);
            $stmt->bindParam(':sujet_id', $id);
            $stmt->execute();
        }
    }

    private function tailles()
    {
        $photo_id = $this->getLastPhotoId();
        foreach ($this->getLastTailleIds() as $id) {
            $stmt = $this->pdo->prepare("
              INSERT INTO `tailles`(`photo_id`, `taille_id`)
              VALUES (:photo_id, :taille_id);
            ");
            $stmt->bindParam(':photo_id', $photo_id);
            $stmt->bindParam(':taille_id', $id);
            $stmt->execute();
        }
    }

    private function iconographies()
    {
        $photo_id = $this->getLastPhotoId();
        foreach ($this->getLastIconographieIds() as $id) {
            $stmt = $this->pdo->prepare("
              INSERT INTO `iconographies`(`photo_id`, `iconographie_id`)
              VALUES (:photo_id, :iconographie_id);
            ");
            $stmt->bindParam(':photo_id', $photo_id);
            $stmt->bindParam(':iconographie_id', $id);
            $stmt->execute();
        }
    }

    private function sujet($raw)
    {
        $lastInserts = [];
        $sujets = $this->formatSujet($raw);
        foreach ($sujets as $sujet) {
            /* saving line */
            $stmt = $this->pdo->prepare("
              INSERT IGNORE INTO sujet(label)
              VALUES (:sujet)
            ");
            $stmt->bindParam(':sujet', $sujet);
            $stmt->execute();

            /* fetch id of saved line for fk purposes */
            $saveLastStmt = $this->pdo->prepare("
                SELECT `id`
                FROM `sujet`
                WHERE `label` = :label
                LIMIT 1;
            ");
            $saveLastStmt->bindParam(':label', $sujet);
            $saveLastStmt->execute();
            $lastInserted = $saveLastStmt->fetchObject();
            array_push($lastInserts, $lastInserted->id);
        }
        $this->setLastSujetIds($lastInserts);
    }

    private function formatSujet($raw)
    {
        $sujets = explode(',', $raw);
        return $sujets;
    }
}
