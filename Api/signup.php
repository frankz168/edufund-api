<?php
header("Content-type: application/json");
include_once '../Database/database.php';
include_once '../Controller/users.php';
include_once '../Controller/common.php';

$data = json_decode(file_get_contents('php://input'), true);

//sign up account with post method
$email=$data['email'];
$password=$data['password'];
$phonenumber = $data['phonenumber'];

//$email = 'jovitasutanto97@gmail.com';
//$password = 'admin123';
//$phonenumber = '1242';

// get database connection
$database = new Database();
$db = $database->getConnection();
// prepare user object

//generate password to sh 256 with salt
$salt = "EduFund__asdSdas";
// Users password will now be combined (password+salt) to sha256 hash
$finalpassword = hash('sha256', $salt.$password);

$user = new Users($db);
$stmt = $user->signUpAccount($email, $finalpassword, $phonenumber);
if($stmt->rowCount() > 0){
    // create array
    $common = new Common();
    $linkActiveAccount = $common->linkUrl()."edufund-api/Api/successverification.php?email=".$email;
    $emailMessage = "Hello," . $email ."<br>"."You have been successfully sign up in this application." . "<br>". "Please click in this url link to active your account. " .  $linkActiveAccount  . "<br>". "Contact our support team if you are still having issues to active the account." . "<br>". "Regards The Edufund Team";
    $common -> sendEmail($email, 'Edufund Auto Mail', 'Verification account', $emailMessage);
    $signup_arr=array(
        "success" => 1,
        "message" => "Successfully create the account!"
    );
}
else{
    $signup_arr=array(
        "success" => 0,
        "message" => "Failed create the account!",
    );
}
// make it json format
print_r(json_encode($signup_arr));

?>