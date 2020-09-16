<?php
header("Content-type: application/json");
//include_once "Database/koneksi.php";
include_once '../Database/database.php';
include_once '../Controller/users.php';

$data = json_decode(file_get_contents('php://input'), true);
$acc_id=$data['acc_id'];
$password=$data['password'];

/*$acc_id = '1';
$password = 'angel123';*/

// get database connection
$database = new Database();
$db = $database->getConnection();
// prepare user object
$user = new Users($db);
$stmt = $user->resetPassword($acc_id, $password);
    if($stmt->rowCount() > 0){
        // create array
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