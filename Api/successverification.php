<?php
include_once '../Database/database.php';
include_once '../Controller/users.php';
include_once '../Controller/common.php';
/*$email=$data['email'];*/

//$email = 'franky.sutanto93@gmail.com';

$url=$_SERVER['REQUEST_URI'];
$url_components = parse_url($url);
parse_str($url_components['query'], $params);

$common = new Common();
$linkurlfailed = $common->linkUrl()."edufund-api/Pages/verificationfailed.php";

if(empty($params['email'])){
    header("Location: " .$linkurlfailed);
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
    $linkurlsuccess = $common->linkUrl()."edufund-api/Pages/verificationsuccess.php";
    header("Location: " .$linkurlsuccess);
    /*   header("Location:  http://google.com");*/
}
else{
    header("Location: " .$linkurlfailed);
}

return;
?>