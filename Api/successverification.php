<?php
//include_once "Database/koneksi.php";
include_once '../Database/database.php';
include_once '../Controller/users.php';
/*$email=$data['email'];*/

//$email = 'franky.sutanto93@gmail.com';

$url=$_SERVER['REQUEST_URI'];
$url_components = parse_url($url);
parse_str($url_components['query'], $params);

if(empty($params['email'])){
    header("Location:  http://localhost:63342/edufund-api/Api/verificationfailed.php");
    return;
}

$email= $params['email'];

// get database connection
$database = new Database();
$db = $database->getConnection();
// prepare user object
$user = new Users($db);
$status = "Active";
$stmt = $user->UpdateSuccessVerificationAccount($email, $status);
if($stmt->rowCount() > 0){
    header("Location:  http://localhost:63342/edufund-api/Pages/verificationsuccess.php");
    /*   header("Location:  http://google.com");*/
}
else{
    header("Location:  http://localhost:63342/edufund-api/Pages/verificationfailed.php");
}

return;
?>