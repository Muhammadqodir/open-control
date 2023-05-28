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

  function register($name, $phone, $owner, $password, $type)
  {
    $sql = "SELECT * FROM businesses WHERE phone = '$phone'";
    if ($result = $this->mysqli->query($sql)) {
      $row = $result->fetch_assoc();
      if ($row != null && $row != false) {
        return "already";
      } else {
        if ($this->newBusiness($name, $phone, $owner, $password, $type)) {
          return $this->login($phone, $password);
        }
      }
    } else {
      return "already";
    }
  }

  function getNadzor()
  {
    $res = [];
    $sql = "SELECT * FROM `cntrol_organ`";

    if ($result = $this->mysqli->query($sql)) {
      while ($row = $result->fetch_assoc()) {
        // $row["destination"] = $this->getDelivery($row["delivery"]);
        $row["themesData"] = json_decode($row["themes"]);
        $res[] = $row;
      }
      $result->free_result();
    }

    return $res;
  }

  function searchInspector($id, $date, $time)
  {
    $res = [];
    $sql = "SELECT * FROM `inspectors` WHERE control_organ_id = $id";

    if ($result = $this->mysqli->query($sql)) {
      while ($row = $result->fetch_assoc()) {
        $res[] = $row;
      }
      $result->free_result();
    }

    return $res;
  }

  function login($phone, $password)
  {
    $sql = "SELECT * FROM businesses WHERE phone = '$phone' AND password_hash = '$password'";
    if ($result = $this->mysqli->query($sql)) {
      $row = $result->fetch_assoc();
      if ($row != null && $row != false) {
        return $row;
      } else {
        return "undefined";
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

  function newBusiness($name, $phone, $owner, $password, $type)
  {
    $token = $this->generateToken(16);
    $date = $this->getCurrentDate();
    $sql = "INSERT INTO `businesses` (`id`, `name`, `owner`, `phone`, `password_hash`, `reg_date`, `type`, `token`)
            VALUES (NULL, '$name', '$owner', '$phone', '$password', '$date', '$type', '$token');";

    if ($this->mysqli->query($sql) === TRUE) {
      return true;
    } else {
      return false;
    }
  }

  function getCurrentDate()
  {
    return date("H:i:s d-m-Y");
  }

  function closeConnection()
  {
    $this->mysqli->close();
  }
}
