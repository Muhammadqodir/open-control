<?php
// phpinfo();
require("db_helper.php");

$db = new DBHelper();

$users = $db->getField("login");

echo $users;
