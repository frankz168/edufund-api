<?php
header("Content-type: application/json");
include_once '../Database/database.php';
include_once '../Controller/loan.php';


$data = json_decode(file_get_contents('php://input'), true);
//$email=$data['email'];
//$product_id = $data['product_id'];
//$loan_status_id = $data['loan_status_id'];
//$AgreementDate = $data['AgreementDate'];
//$DisbursementDate = $data['DisbursementDate'];
//$periodtime =$data['periodtime'];
//$interest =$data['interest'];
//$amount_without_interest=$data['amount_without_interest'];
//$DueAmount = $data['DueAmount'];
//$LoanQuality = $data['LoanQuality'];
//$LoanStatus = $data['LoanStatus'];
//$Reason=$data['Reason'];


//CALL InsertLoan('franky.sutanto93@gmail.com','1', '1', '2020-10-15', '2020-10-15', '6', '1.5', '4000000', '4500000',
//    '4500000', '2020-10-15', '2021-04-10', 'Good', 'Submit',
//    'test borrow')

$email = 'jovitasutanto98@gmail.com';
$product_id = '1';
$loan_status_id = '1';
$AgreementDate = '2020-10-10';
$DisbursementDate = '2020-10-10';
$periodtime = 12;
$interest = '1.5';
$amount_without_interest = 5200000;
$DueAmount = 5200000;
$LoanQuality = 'Good';
$LoanStatus = 'In Process';
$Reason = "ingin bayar uang pangkal";

//can't be deleted.
$InvoiceStatus = "Not Paid";

$successbool = 0;
$message ="Submit Loan Failed!. Your loan data form still outstanding";

// get database connection
$database = new Database();
$db = $database->getConnection();
// prepare user object
$loan = new loan($db);

if($periodtime == null){
    $loan_arr=array(
        "success" => 0,
        "message" => "Submit Loan Failed! Please input the period time",
    );
    // make it json format
    print_r(json_encode($loan_arr));
    return;
}

// automatic calculate duedateamount
$date1 = new DateTime();
$date2 = new DateTime();
$DateAmount = $date1;
$DueDateAmount = $date2->modify("+".$periodtime."month"); // or you can use '-90 day' for deduct
//$DueDateAmount  = $DueDateAmount ->format('Y-m-d h:i:s');
//$DateAmount = $DateAmount ->format('Y-m-d h:i:s');
//echo $DueDateAmount;

// calculate (total amount request and total amount permonth) get from amount without interest.
$resultprincipal = 0;
$resultprincipal = $amount_without_interest / $periodtime;
$resultinterestpermonth = ($interest  * $amount_without_interest / 100);
$totalinterest = $resultinterestpermonth * $periodtime;
$totalloanamountrequest = $amount_without_interest+ $totalinterest;
$totalamountpermonth = $totalloanamountrequest / $periodtime;

$stmt = $loan->InsertLoan($email, $product_id, $loan_status_id, $AgreementDate, $DisbursementDate, $periodtime, $interest, $amount_without_interest, $totalloanamountrequest, $DueAmount, $DateAmount ->format('Y-m-d'),  $DueDateAmount ->format('Y-m-d'), $LoanQuality, $LoanStatus, $Reason);
if($stmt->rowCount() > 0){

    while($row = $stmt->fetch())
    {
            $loanid = $row['Loan_Id'];
            $accid = $row['acc_id'];
            //$DueDateAmount = $row['DueDateAmount'];
            $DueDateAmountInvoice  = new DateTime();
            for ($x = -1; $x <= $periodtime; $x++) {
                //echo "No: $x \n";
                if($x > 0){
                    $DueDateAmountInvoice->modify("+1 month"); // or you can use '-90 day' for deduct
                }
                $stmt2 = $loan->InsertInvoice($loanid, $accid, $x, $totalamountpermonth, $InvoiceStatus, $DueDateAmountInvoice ->format('Y-m-d'));
                if($stmt2->rowCount() > 0){
                    $successbool = 1;
                    $message = "Successfully Submit Loan! Loan will be process by admin.";
                    //echo "Success: $x \n";
                }
            }
    }

    // create array
    $loan_arr=array(
        "success" => $successbool,
        "message" => $message
    );
}
else{
    $loan_arr=array(
        "success" => $successbool,
        "message" => $message
    );
}
// make it json format
print_r(json_encode($loan_arr));

?>