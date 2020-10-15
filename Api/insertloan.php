<?php
header("Content-type: application/json");
//include_once "Database/koneksi.php";
include_once '../Database/database.php';
include_once '../Controller/users.php';

$data = json_decode(file_get_contents('php://input'), true);
//$email=$data['email'];
//$periodtime=$data['periodtime'];
//$interest=$data['interest'];
//$amount_without_interest=$data['amount_without_interest'];
//$totalamount=$data['totalamount'];
//$Reason=$data['Reason'];


$email = 'jovitasutanto98@gmail.com';
$periodtime = '20';
$interest = '1.5';
$amount_without_interest = 20000000;
$totalamount = 26000000;
$Reason = "ingin bayar uang pangkal";



// get database connection
$database = new Database();
$db = $database->getConnection();
// prepare user object
$user = new Users($db);

$stmt = $user->InsertLoan($email, $periodtime, $interest, $amount_without_interest, $totalamount, $Reason);
if($stmt->rowCount() > 0){
    // create array
    $loan_arr=array(
        "success" => 1,
        "message" => "Successfully Submit Loan! Loan will be process by admin."
    );
}
else{
    $loan_arr=array(
        "success" => 0,
        "message" => "Submit Loan Failed!",
    );
}
// make it json format
print_r(json_encode($loan_arr));

?>