<?php
header("Content-type: application/json");
//include_once "Database/koneksi.php";
include_once '../Database/database.php';
include_once '../Controller/users.php';

$data = json_decode(file_get_contents('php://input'), true);

//sign up account with post method
$email=$data['email'];
$password=$data['password'];
$phonenumber = $data['phonenumber'];

/*$email = 'cloud@gmail.com';
$password = 'cloud123';
$phonenumber = '124';*/

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