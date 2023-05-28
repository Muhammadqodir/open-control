<?php
require "db_helper.php";

$db = new DBHelper();


header('Content-Type: application/json; charset=utf-8');
echo json_encode($db->getNadzor());