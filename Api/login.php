<?php
header("Content-type: application/json");
//include_once "Database/koneksi.php";
include_once '../Database/database.php';
include_once '../Controller/users.php';

// get data from query string api json
$email=$_GET['email'];
$password=$_GET['password'];
//$email = 'franky.sutanto93@gmail.com';
//$password = 'admin123';

//decryption sha256 password
$salt = "EduFund__asdSdas";
$finalpassword = hash('sha256', $salt.$password);

// get database connection
$database = new Database();
$db = $database->getConnection();
// prepare user object
$user = new Users($db);
$stmt = $user->login($email, $finalpassword);
if($stmt->rowCount() > 0){
    // get retrieved row
    while($row = $stmt->fetch())
    {
        /*$test = $row['acc_id'];
        echo "your email is: ". $row['email'];*/
        // create array
        $user_arr=array(
            "status" => true,
            "message" => "Successfully Login!",
            "acc_id" => $row['acc_id'],
            "email" => $row['email'],
            "password" => $row['password']
        );
    }
}
else{
    $user_arr=array(
        "status" => false,
        "message" => "Invalid Email or Password!",
    );
}
// make it json format
print_r(json_encode($user_arr));

?>