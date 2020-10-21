<?php
header("Content-type: application/json");
//include_once "Database/koneksi.php";
include_once '../Database/database.php';
include_once '../Controller/loan.php';

// get data from query string api json
//$email=$_GET['email'];
//$startdate = $_GET['startdate'];
//$enddate = $_GET['enddate'];


$email="jovitasutanto98@gmail.com";
$startdate = "2020-10-10";
$enddate = "2020-10-19";


// get database connection
$database = new Database();
$db = $database->getConnection();
// prepare loan object
$loan = new loan($db);
$stmt = $loan->LoanReport($email, $startdate, $enddate);

if($stmt->rowCount() > 0){
    // get retrieved row
    while($row = $stmt->fetch())
    {
        // create array
        $loanreport_arr[]=array(
            "status" => true,
            "email" => $row['email'],
            "AgreementDate" => $row['AgreementDate'],
            "periodtime" => $row['periodtime'],
            "amount_without_interest" => $row['amount_without_interest'],
            "totalamount" => $row['totalamount'],
            "LoanStatus" => $row['LoanStatus'],
        );
    }

}
else{
    $loanreport_arr=array(
        "status" => false,
        "message" => "Invalid Get Loan Report!",
    );
}
// make it json format
print_r(json_encode($loanreport_arr));




?>