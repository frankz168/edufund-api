<?php
header("Content-type: application/json");
include_once '../Database/database.php';
include_once '../Controller/users.php';
include_once '../Controller/common.php';


$common = new Common();
$data = json_decode(file_get_contents('php://input'), true);

$email=$data['email'];
$password= $common->generateRandomPassword(10);

/*$email = 'jovita.sutanto97@gmail.com';
$password = $common->generateRandomPassword(10);*/

// get database connection
$database = new Database();
$db = $database->getConnection();
// prepare user object

//generate password to sh 256 with salt
// Idea of salt is to make users password longer

$salt = "EduFund__asdSdas";
// Users password will now be combined (password+salt) to sha256 hash
$finalpassword = hash('sha256', $salt.$password);

$user = new Users($db);
$stmt = $user->resetPassword($email, $finalpassword);
if($stmt->rowCount() > 0){
    // create array
    $emailMessage = "Hello," . $email ."<br>"."You have requested to reset your password." . "<br>". "Your new password is:" . $password . "<br>". "Contact our support team if you are still having issues logging in." . "<br>". "Regards The Edufund Team";
    $common -> sendEmail($email, 'Edufund Auto Mail', 'Forgot Password', $emailMessage);
    $respass_arr=array(
        "success" => 1,
        "message" => "Successfully Reset Password!"
    );
}
else{
    $respass_arr=array(
        "success" => 0,
        "message" => "Reset Password Failed!",
    );
}
// make it json format
print_r(json_encode($respass_arr));

?>