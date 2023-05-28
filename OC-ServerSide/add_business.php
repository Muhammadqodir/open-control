<?php
  require "db_helper.php";

  header('Content-Type: application/json; charset=utf-8');
  $res = array();
  $res["status"] = 400;
  $res["message"] = "Invalid request";

  if (
    isset($_POST["name"]) &&
    isset($_POST["owner"]) &&
    isset($_POST["type"]) &&
    isset($_POST["phone"]) &&
    isset($_POST["password"])
  ) {
    if (
      $_POST["name"] != "" &&
      $_POST["owner"] != "" &&
      $_POST["type"] != "" &&
      $_POST["phone"] != "" &&
      $_POST["password"] != ""
    ) {
      $name = $_POST["name"];
      $owner = $_POST["owner"];
      $type = $_POST["type"];
      $phone = $_POST["phone"];
      $password = $_POST["password"];
      
      $db = new DBHelper();
      $user = $db->register($name, $phone, $owner, $password, $type);
      if($user != "already"){
        $res["status"] = 200;
        $res["data"] = $user;
        $res["message"] = "ok";
      }else{
        $res["status"] = 500;
        $res["message"] = "Этот номер телефора уже зарегистрирован";
      }
    }else{
      $res["message"] = "Empty values";
    }
  }else{
    $res["message"] = "Bad request";
  }

  echo json_encode($res);