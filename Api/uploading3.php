<?php

header("Content-type: multipart/form-data");
include_once '../Database/database.php';



$ImageFamilyMemberCard=$_POST['ImageFamilyMemberCard'];
$target_dir = 'uploads/';
$target_file = $target_dir . basename($_FILES['ImageFamilyMemberCard']['name']);

$status = array();

if (move_uploaded_file($_FILES['ImageFamilyMemberCard']['tmp_name'], $target_file)) {
    $status['kode']=1;
    $status['deskripsi']='upload success';
    $ImageFamilyMemberCard = $target_file ;
} else {
    $status['kode']=0;
    $status['deskripsi']='upload failed';
    $ImageFamilyMemberCard = null;
}
echo json_encode($status);

?>