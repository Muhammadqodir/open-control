<?php
  require "db_helper.php";

  $db = new DBHelper();

  echo $db->getField("test");
