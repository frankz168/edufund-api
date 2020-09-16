<?php
header("Content-type: application/json");
//include_once "Database/koneksi.php";
include_once '../Database/database.php';
include_once '../Controller/users.php';

// get data from query string api json
$email=$_GET['email'];
$password=$_GET['password'];
/*$email = 'angela@gmail.com';
$password = 'angel';*/

// get database connection
$database = new Database();
$db = $database->getConnection();
// prepare user object
$user = new Users($db);
$stmt = $user->login($email, $password);
if($stmt->rowCount() > 0){
    // get retrieved row
    while($row = $stmt->fetch())
    {
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
        "message" => "Invalid Username or Password!",
    );
}
// make it json format
print_r(json_encode($user_arr));

?>