<?php

header("Content-type: multipart/form-data");
include_once '../Database/database.php';


$status = array();
if(is_uploaded_file($_FILES["ImageKTP"]["tmp_name"]))
{
    $tmp_file = $_FILES["ImageKTP"]["tmp_name"];
    $upload_dir = "./uploads/";

    // Generating image name each time.
    $upload_dir = $upload_dir . "/". "ImageKTP" .  ".jpeg";
    if (move_uploaded_file($tmp_file, $upload_dir)) {
        $upload_dir = $upload_dir ;
        $status['kode']=1;
        $status['deskripsi']='upload success';
        $status['ImageKTP']= $upload_dir;
    } else {
        $status['kode']=0;
        $status['deskripsi']='upload failed';
        $status['ImageKTP']= null;
    }
}

echo json_encode($status);

?>