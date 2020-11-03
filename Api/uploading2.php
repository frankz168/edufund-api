<?php

header("Content-type: multipart/form-data");
include_once '../Database/database.php';


$ImageSelfie=$_POST['ImageSelfie'];
$target_dir = 'uploads/';
$target_file = $target_dir . basename($_FILES['ImageSelfie']['name']);

$status = array();

if (move_uploaded_file($_FILES['ImageSelfie']['tmp_name'], $target_file)) {
    $status['kode']=1;
    $status['deskripsi']='upload success';
    $ImageSelfie = $target_file ;
} else {
    $status['kode']=0;
    $status['deskripsi']='upload failed';
    $ImageSelfie = null;
}
echo json_encode($status);

?>