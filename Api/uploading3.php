<?php

header("Content-type: multipart/form-data");
include_once '../Database/database.php';


$status = array();
if(is_uploaded_file($_FILES["ImageFamilyMemberCard"]["tmp_name"]))
{
    $tmp_file = $_FILES["ImageFamilyMemberCard"]["tmp_name"];
    $upload_dir = "./uploads/";

    // Generating random image name each time so image name will not be same .
    $upload_dir = $upload_dir . "/". "ImageFamilyMemberCard" .  ".jpeg";
    if (move_uploaded_file($tmp_file, $upload_dir)) {
        $upload_dir = $upload_dir ;
        $status['kode']=1;
        $status['deskripsi']='upload success';
        $status['ImageFamilyMemberCard']= $upload_dir;
    } else {
        $status['kode']=0;
        $status['deskripsi']='upload failed';
        $status['ImageFamilyMemberCard']= null;
    }
}

echo json_encode($status);

?>