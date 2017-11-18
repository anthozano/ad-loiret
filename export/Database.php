<?php

require "Config.php";

/**
 * Database
 * Holds database connection and dialog
 */
class Database {
  
  private $config;
  private $pdo;
  private static $_instance;

  public static function getInstance() {
    if (is_null(self::$_instance)) {
      self::$_instance = new Database();
    }
    return self::$_instance;
  } 

  public function __construct($configByDefault = true) {
    $this->config = new Config();
    $this->setPDO();
  }

  private function setPDO() {

    /**
     * @var $dsn string DSN : Data Source Name
     */
    $dsn = 'mysql:host=' . $this->config->getDb_host() . ';dbname=' . $this->config->getDb_name(); // dsn = data source name

    try {
      $this->pdo = new PDO($dsn, $this->config->getDb_user(), $this->config->getDb_pswd());
      $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch(PDOException $pdoe) {
      echo $pdoe->getMessage();
    }

    return $this->pdo;
  }

  public function getPDO() {
    return $this->pdo;
  }

}
