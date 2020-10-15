<?php
header("Content-type: application/json");
//include_once "Database/koneksi.php";
include_once '../Database/database.php';
include_once '../Controller/loan.php';

$data = json_decode(file_get_contents('php://input'), true);
//$email=$data['email'];
//$periodtime=$data['periodtime'];
//$interest=$data['interest'];
//$amount_without_interest=$data['amount_without_interest'];
//$totalamount=$data['totalamount'];
//$Reason=$data['Reason'];


//CALL InsertLoan('franky.sutanto93@gmail.com','1', '1', '2020-10-15', '2020-10-15', '6', '1.5', '4000000', '4500000',
//    '4500000', '2020-10-15', '2021-04-10', 'Good', 'Submit',
//    'test borrow')

$email = 'jovitasutanto98@gmail.com';
$product_id = '1';
$loan_status_id = '1';
$AgreementDate = '2020-10-10';
$DisbursementDate = '2020-10-10';
$periodtime = '12';
$interest = '1.5';
$amount_without_interest = 20000000;
$totalamount = 26000000;
$DueAmount = 20000000;
$DateAmount = '2020-10-10';
$DueDateAmount  = '2020-10-10';
$LoanQuality = 'Good';
$LoanStatus = 'InProgress';
$Reason = "ingin bayar uang pangkal";



// get database connection
$database = new Database();
$db = $database->getConnection();
// prepare user object
$loan = new loan($db);

$stmt = $loan->InsertLoan($email, $product_id, $loan_status_id, $AgreementDate, $DisbursementDate, $periodtime, $interest, $amount_without_interest, $totalamount, $DueAmount, $DateAmount, $DueDateAmount, $LoanQuality, $LoanStatus, $Reason);
if($stmt->rowCount() > 0){
    if($periodtime != null){
        while($row = $stmt->fetch())
        {
            $loanid = $row['Loan_Id'];
            $accid = $row['acc_id'];
            $DueDateAmount = $row['DueDateAmount'];

            for ($x = -1; $x <= $periodtime; $x++) {
                echo "No: $x \n";
                $stmt2 = $loan->InsertInvoice($loanid, $accid, $x, $DueDateAmount);
                if($stmt2->rowCount() > 0){
                    echo "Success: $x \n";
                }
            }
        }
    }

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