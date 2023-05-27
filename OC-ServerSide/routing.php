<?php

function goToRoute($route){
  require "config.php";
  header('Location: ' . $base_url . $route);
}

function goToRouteWithMessage($route, $message){
  require "config.php";
  $_SESSION["message"] = $message;
  header('Location: ' . $base_url . $route);
}

function goBack(){
  header('Location: ' . parse_url($_SERVER['HTTP_REFERER'], PHP_URL_PATH));
}

function goBackWithMessage($message){
  $_SESSION["message"] = $message;
  header('Location: ' . parse_url($_SERVER['HTTP_REFERER'], PHP_URL_PATH));
}

function getCurrentRoute(){
  require "config.php";
  $actual_link = "$_SERVER[REQUEST_URI]";
  return str_replace($base_url, "", (empty($_SERVER['HTTPS']) ? 'http' : 'https') . "://$_SERVER[HTTP_HOST]".parse_url($actual_link, PHP_URL_PATH));
}

function getRoute($route){
  require "config.php";
  return $base_url . $route;
}