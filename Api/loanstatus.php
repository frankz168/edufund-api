<?php
header("Content-type: application/json");
//include_once "Database/koneksi.php";
include_once '../Database/database.php';
include_once '../Controller/master.php';

// get database connection
$database = new Database();
$db = $database->getConnection();
// prepare province object
$loanstatus = new Master($db);
$stmt = $loanstatus->GetDataAllLoanStatus();
if($stmt->rowCount() > 0){
    // get retrieved row
    while($row = $stmt->fetch())
    {
        // create array
        $loanstatus_arr[]=array(
            "loan_status_id" => $row['LoanStatusID'],
            "status_name" => $row['StatusName']
        );
    }

    //print_r($province_arr);
}
else{
    $loanstatus_arr=array(
        "message" => "Invalid Get Data Loan Status!",
    );
}
// make it json format
print_r(json_encode($loanstatus_arr));

?>