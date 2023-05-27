<?php

class DBHelper
{


  public $mysqli;

  function __construct()
  {
    require "config.php";

    $this->mysqli = new mysqli($host, $user, $password, $db);

    $this->mysqli->set_charset("utf8");

    // Check connection
    if ($this->mysqli->connect_errno) {
      echo "Failed to connect to MySQL: " . $this->mysqli->connect_error;
      exit();
    }
  }

  function getField($field)
  {
    $sql = "SELECT * FROM fields WHERE name='$field'";
    if ($result = $this->mysqli->query($sql)) {
      return $result->fetch_assoc()["value"];
    } else {
      return "undefined";
    }
  }
  
  function updateField($field, $val)
  {
    $sql = "UPDATE fields SET value='$val' WHERE name='$field'";
    if ($result = $this->mysqli->query($sql)) {
      return true;
    } else {
      return false;
    }
  }

  function register($phone)
  {
    $sql = "SELECT * FROM users WHERE phone = '$phone'";
    if ($result = $this->mysqli->query($sql)) {
      $row = $result->fetch_assoc();
      if ($row != null && $row != false) {
        return $row;
      } else {
        if ($this->newUser($phone)) {
          return $this->register($phone);
        } else {
          return "undefined";
        }
      }
    } else {
      return "undefined";
    }
  }

  function generateToken($length)
  {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
      $randomString .= $characters[random_int(0, $charactersLength - 1)];
    }
    return $randomString;
  }

  function newUser($phone)
  {
    $token = $this->generateToken(16);
    $sql = "INSERT INTO users (phone, fullName, gender, birth_day, token) VALUES ('$phone', 'undefined', 'undefined', 'undefined', '$token')";

    if ($this->mysqli->query($sql) === TRUE) {
      return true;
    } else {
      return false;
    }
  }

  function closeConnection()
  {
    $this->mysqli->close();
  }
}
