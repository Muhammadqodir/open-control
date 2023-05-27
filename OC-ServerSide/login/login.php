<?php
session_start();
require "../db_helper.php";
require "../config.php";
require "../routing.php";

if (isset($_POST["login"]) && isset($_POST["password"])) {
  
  $login = $_POST["login"];
  $password = $_POST["password"];

  $db = new DBHelper();
  $actualLogin = $db->getField("login");
  $actualPassword = $db->getField("password");

  if($login == $actualLogin && $password == $actualPassword){
    $_SESSION["is_login"] = true;
    goToRoute("dashboard");
  }else{
    goBackWithMessage("Неверный логин или пароль");
  }
} else {
  goBackWithMessage("Введите логин и пароль");
}

exit();
