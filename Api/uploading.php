<?php

header("Content-type: multipart/form-data");
include_once '../Database/database.php';


$ImageKTP=$_POST['ImageKTP'];
$target_dir = 'uploads/';
$target_file = $target_dir . basename($_FILES['ImageKTP']['name']);

$status = array();

if (move_uploaded_file($_FILES['ImageKTP']['tmp_name'], $target_file)) {
    $status['kode']=1;
    $status['deskripsi']='upload success';
    $ImageKTP = $target_file ;
} else {
    $status['kode']=0;
    $status['deskripsi']='upload failed';
    $ImageKTP = null;
}
echo json_encode($status);

?>