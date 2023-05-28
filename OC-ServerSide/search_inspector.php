<?php
require "db_helper.php";

header('Content-Type: application/json; charset=utf-8');
$res = [];

if (isset($_POST["id"]) && isset($_POST["date"]) && isset($_POST["time"])) {
  
  $id = $_POST["id"];
  $date = $_POST["date"];
  $time = $_POST["time"];

  $db = new DBHelper();
  $data = $db->searchInspector($id, $date, $time);

  $res = $data;
}

echo json_encode($res);