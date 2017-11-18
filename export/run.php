<?php

require "Exporter.php";

$exporter = Exporter::getInstance();
$exporter->runExport("../raw/ProjetBDDL3.csv");
