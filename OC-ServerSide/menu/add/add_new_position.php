<?php
session_start();
if (!isset($_SESSION["is_login"])) {
  goToRoute("login");
  exit();
}

require "../../db_helper.php";
require "../../routing.php";
require "image_compressor.php";
require "../../config.php";

if (
  isset($_POST["title"]) &&
  isset($_POST["description"]) &&
  isset($_POST["category"]) &&
  isset($_POST["price"]) &&
  isset($_FILES["photo1"]) &&
  isset($_FILES["photo2"]) &&
  isset($_FILES["photo3"]) &&
  isset($_FILES["photo4"])
) {
  if (
    $_POST["title"] != "" &&
    $_POST["description"] != "" &&
    $_POST["category"] != "" &&
    $_POST["price"] != "" &&
    !empty($_FILES["photo1"]["name"]) &&
    !empty($_FILES["photo2"]["name"]) &&
    !empty($_FILES["photo3"]["name"]) &&
    !empty($_FILES["photo4"]["name"])
  ) {
    uploadImage("photo1");
    uploadImage("photo2");
    uploadImage("photo3");
    uploadImage("photo4");
    $db = new DBHelper();
    $task = $db->newMenuPosition($_POST["title"], $_POST["description"], $_POST["price"], $_POST["category"], getImgs($base_url));
    goToRoute("menu");
  } else {
    goBackWithMessage("Заполните все поля!");
  }
} else {
  goBackWithMessage("Неверный формат запроса!");
}

function getImgs($url){
  $res = [
    $url. "uploads/" . getFileName() . 'photo1.jpg',
    $url. "uploads/" . getFileName() . 'photo2.jpg',
    $url. "uploads/" . getFileName() . 'photo3.jpg',
    $url. "uploads/" . getFileName() . 'photo4.jpg',
  ];
  return json_encode($res);
}

function uploadImage($key_img)
{
  $uploadPath = "../../uploads/";
  $imageUploadPath = $uploadPath . getFileName().$key_img . '.jpg';
  $fileType = pathinfo($imageUploadPath, PATHINFO_EXTENSION);

  // Allow certain file formats 
  $allowTypes = array('jpg', 'png', 'jpeg', 'gif');
  if (in_array($fileType, $allowTypes)) {
    // Image temp source and size 
    $imageTemp = $_FILES[$key_img]["tmp_name"];
    $imageSize = convert_filesize($_FILES[$key_img]["size"]);

    // Compress size and upload image 
    $compressedImage = compressImage($imageTemp, $imageUploadPath);

    if ($compressedImage) {
      $compressedImageSize = filesize($compressedImage);
      $compressedImageSize = convert_filesize($compressedImageSize);
      return [$imageSize, $compressedImageSize];
    } else {
      goBackWithMessage("Ошибка при сжатии фото");
    }
  } else {
    goBackWithMessage("Только файты типа: JPG, JPEG, PNG, & GIF");
  }
}


function getFileName()
{
  $cyr = [
    'Љ', 'Њ', 'Џ', 'џ', 'ш', 'ђ', 'ч', 'ћ', 'ж', 'љ', 'њ', 'Ш', 'Ђ', 'Ч', 'Ћ', 'Ж', 'Ц', 'ц', 'а', 'б', 'в', 'г', 'д', 'е', 'ё', 'ж', 'з', 'и', 'й', 'к', 'л', 'м', 'н', 'о', 'п', 'р', 'с', 'т', 'у', 'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'ъ', 'ы', 'ь', 'э', 'ю', 'я', 'А', 'Б', 'В', 'Г', 'Д', 'Е', 'Ё', 'Ж', 'З', 'И', 'Й', 'К', 'Л', 'М', 'Н', 'О', 'П', 'Р', 'С', 'Т', 'У', 'Ф', 'Х', 'Ц', 'Ч', 'Ш', 'Щ', 'Ъ', 'Ы', 'Ь', 'Э', 'Ю', 'Я', ' ', '/', '\\'
  ];
  $lat = [
    'Lj', 'Nj', 'Dz', 'dz', 'sh', 'd', 'c', 'c', 'z', 'lj', 'nj', 'S', 'D', 'C', 'C', 'Z', 'C', 'c', 'a', 'b', 'v', 'g', 'd', 'e', 'io', 'zh', 'z', 'i', 'y', 'k', 'l', 'm', 'n', 'o', 'p', 'r', 's', 't', 'u', 'f', 'h', 'ts', 'ch', 'sh', 'sht', 'a', 'i', 'y', 'e', 'yu', 'ya', 'A', 'B', 'V', 'G', 'D', 'E', 'Io', 'Zh', 'Z', 'I', 'Y', 'K', 'L', 'M', 'N', 'O', 'P', 'R', 'S', 'T', 'U', 'F', 'H', 'Ts', 'Ch', 'Sh', 'Sht', 'A', 'I', 'Y', 'e', 'Yu', 'Ya', '_', '', ''
  ];
  return str_replace($cyr, $lat, $_POST["title"]);
}
