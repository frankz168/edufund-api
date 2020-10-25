<?php
header("Content-type: application/json");
include_once '../Database/database.php';
include_once '../Controller/loan.php';

$data = json_decode(file_get_contents('php://input'), true);
$email=$data['email'];
$InstallmentNumber = $data['InstallmentNumber'];
$PaidAmount = $data['PaidAmount'];


//$email="jovitasutanto98@gmail.com";
//$InstallmentNumber = 1;
//$PaidAmount = "511333.33";

// get database connection
$database = new Database();
$db = $database->getConnection();
// prepare loan object
$loan = new loan($db);
$stmt = $loan->UpdateManualPaidLoan($email, $InstallmentNumber, $PaidAmount);

if($stmt->rowCount() > 0){
        // create array
    $manualpayloan_arr=array(
            "status" => true,
            "message" => "Update Manual Paid Amount Successfully!",
    );

}
else{
    $manualpayloan_arr=array(
        "status" => false,
        "message" => "Update Manual Paid Amount Report!",
    );
}
// make it json format
print_r(json_encode($manualpayloan_arr));


?>