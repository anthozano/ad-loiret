<?php

/**
 * Config
 */
class Config {

  private $db_user;
  private $db_pswd;
  private $db_host;
  private $db_name;
  private static $_instance;

  public static function getInstance() {
    if (is_null(self::$_instance)) {
      self::$_instance = new Config();
    }
    return self::$_instance;
  }

  public function __construct() {
    $this->db_name = "jeanne";
    $this->db_user = "root";
    $this->db_pswd = "";
    $this->db_host = "localhost";
  }

  public function getDb_user() { return $this->db_user; }
  public function getDb_pswd() { return $this->db_pswd; }
  public function getDb_host() { return $this->db_host; }
  public function getDb_name() { return $this->db_name; }

  public function setDb_user($db_user) { $this->db_user = $db_user; }
  public function setDb_pswd($db_pswd) { $this->db_pswd = $db_pswd; }
  public function setDb_host($db_host) { $this->db_host = $db_host; }
  public function setDb_name($db_name) { $this->db_name = $db_name; }

}
