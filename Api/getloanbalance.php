<?php
header("Content-type: application/json");
include_once '../Database/database.php';
include_once '../Controller/loan.php';

// get data from query string api json
$email=$_GET['email'];


//$email="jovitasutanto98@gmail.com";


// get database connection
$database = new Database();
$db = $database->getConnection();
// prepare loan object
$loan = new loan($db);
$stmt = $loan->GetLoanBalance($email);

if($stmt->rowCount() > 0){
    // get retrieved row
    while($row = $stmt->fetch())
    {
        // create array
        $getloanbalance_arr=array(
            "status" => true,
            "loan_id" => $row['loan_id'],
            "acc_id" => $row['acc_id'],
            "email" => $row['email'],
            "periodtime" => $row['periodtime'],
            "NetAmount" => $row['amount_without_interest'],
            "totalamount" => $row['totalamount'],
            "Balance" => $row['Balance'],
            "PaidAmount" => $row['PaidAmount'],
            "LoanStatus" => $row['LoanStatus'],
            "message" => "Sucessfully Get Loan Balance!"
        );
    }

}
else{
    $getloanbalance_arr=array(
        "status" => false,
        "message" => "Invalid Get Loan Balance!"
    );
}
// make it json format
print_r(json_encode($getloanbalance_arr));




?>