<?php
require "db_helper.php";

header('Content-Type: application/json; charset=utf-8');
$res = array();
$res["status"] = 500;
$res["message"] = "Bad request";

if (isset($_POST["phone"]) && isset($_POST["password"])) {
  
  $login = $_POST["phone"];
  $password = $_POST["password"];

  $db = new DBHelper();
  $user = $db->login($login, $password);

  if($user != "undefined"){
    $res["status"] = 200;
    $res["data"] = $user;
    $res["message"] = "ok";
  }else{
    $res["message"] = "Неверный логин или пароль";
  }
} else {
  $res["data"] = $_POST;
  $res["message"] = "Введите логин и пароль";
}

echo json_encode($res);