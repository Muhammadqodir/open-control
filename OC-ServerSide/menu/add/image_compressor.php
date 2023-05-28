<?php 
function compressImage($source, $destination) { 
    // Get image info 
    $imgInfo = getimagesize($source); 
    $mime = $imgInfo['mime']; 
     
    // Create a new image from file 
    switch($mime){ 
        case 'image/jpeg': 
            $image = imagecreatefromjpeg($source); 
            break; 
        case 'image/png': 
            $image = imagecreatefrompng($source); 
            break; 
        case 'image/gif': 
            $image = imagecreatefromgif($source); 
            break; 
        default: 
            $image = imagecreatefromjpeg($source); 
    }
    $size = getimagesize($source);
    $ratio = $size[0]/$size[1]; // width/height
    if( $ratio > 1) {
        $width = 1000;
        $height = 1000/$ratio;
    }
    else {
        $width = 1000*$ratio;
        $height = 1000;
    }
    $dst = imagecreatetruecolor($width,$height);
    imagecopyresampled($dst,$image,0,0,0,0,$width,$height,$size[0],$size[1]);

    // Save image 
    imagejpeg($dst, $destination); 
     
    // Return compressed image 
    return $destination; 
}
function convert_filesize($bytes, $decimals = 2) { 
  $size = array('B','KB','MB','GB','TB','PB','EB','ZB','YB'); 
  $factor = floor((strlen($bytes) - 1) / 3); 
  return sprintf("%.{$decimals}f", $bytes / pow(1024, $factor)) . @$size[$factor]; 
}