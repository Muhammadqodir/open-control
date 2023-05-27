<?php
session_start();
if (!isset($_SESSION["is_login"])) {
  goToRoute("login");
  exit();
}

require "../db_helper.php";
require "../routing.php";

if (isset($_GET["name"]) && isset($_GET["value"])) {
  if($_GET["name"] != "" && $_GET["value"] != ""){
    $db = new DBHelper();
    $db->updateField($_GET["name"], $_GET["value"]);
    goBack();
  }else{
    goBackWithMessage("Неверный формат запроса!");
  }
} else {
  goBackWithMessage("Неверный формат запроса!");
}
