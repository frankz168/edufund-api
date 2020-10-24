<?php
header("Content-type: application/json");
include_once '../Database/database.php';
include_once '../Controller/loan.php';

// get data from query string api json
$email=$_GET['email'];
//$email="franky.sutanto93@gmail.com";



// get database connection
$database = new Database();
$db = $database->getConnection();
// prepare loan object
$loan = new loan($db);
$stmt = $loan->GetLoanHistory($email);

if($stmt->rowCount() > 0){
    // get retrieved row
    while($row = $stmt->fetch())
    {
        // create array
        $loanhistory_arr[]=array(
            "success" => true,
            "Monthly" => $row['Monthly'],
            "Amount" => $row['Amount'],
            "DueDate" => $row['DueDate'],
            "Status" => $row['Status'],
        );
    }

}
else{
    $loanhistory_arr=array(
        "success" => false,
        "message" => "Invalid Get Loan History!",
    );
}
// make it json format
print_r(json_encode($loanhistory_arr));




?>