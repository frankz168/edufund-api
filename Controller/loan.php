<?php


class loan
{
    // database connection and table name
    private $conn;

    // constructor with $db as database connection
    public function __construct($db){
        $this->conn = $db;
    }

//    // insert simulation helper
//    public function insertSimulationHelper($acc_id, $balance, $principal, $interest, $installments){
//        // call sp for insert simulation helper
//        try {
//            require_once '../Database/database.php';
//            $query = ("CALL InsertSimulationHelper('$acc_id','$balance', '$principal', '$interest', '$installments')") ;
//            // prepare query statement
//            $stmt = $this->conn->prepare($query);
//            $stmt->execute();
//            $stmt->bindParam('acc_id',$acc_id);
//            $stmt->bindParam('balance',$balance);
//            $stmt->bindParam('principal',$principal);
//            $stmt->bindParam('interest',$interest);
//            $stmt->bindParam('installments',$installments);
//            return $stmt;
//
//        }
//        catch(Exception $e)
//        {
//            print_r($e->getMessage());
//        }
//    }

    public function InsertLoan($email, $product_id, $loan_status_id, $AgreementDate, $DisbursementDate, $periodtime, $interest, $amount_without_interest, $totalamount,
                               $DueAmount, $DateAmount, $DueDateAmount, $LoanQuality, $LoanStatus,
                               $Reason){
        // call sp for insert loan
        try {
            require_once '../Database/database.php';
            $query = ("CALL InsertLoan('$email', '$product_id', '$loan_status_id', '$AgreementDate', '$DisbursementDate', '$periodtime', '$interest','$amount_without_interest','$totalamount',
            '$DueAmount', '$DateAmount', '$DueDateAmount', '$LoanQuality', '$LoanStatus',
            '$Reason')") ;
            // prepare query statement
            $stmt = $this->conn->prepare($query);
            $stmt->execute();
            $stmt->bindParam('email',$email);
            $stmt->bindParam('product_id',$product_id);
            $stmt->bindParam('loan_status_id',$loan_status_id);
            $stmt->bindParam('AgreementDate',$AgreementDate);
            $stmt->bindParam('DisbursementDate',$DisbursementDate);
            $stmt->bindParam('periodtime',$periodtime);
            $stmt->bindParam('interest',$interest);
            $stmt->bindParam('amount_without_interest',$amount_without_interest);
            $stmt->bindParam('totalamount',$totalamount);
            $stmt->bindParam('DueAmount',$DueAmount);
            $stmt->bindParam('DateAmount',$DateAmount);
            $stmt->bindParam('DueDateAmount',$DueDateAmount);
            $stmt->bindParam('LoanQuality',$LoanQuality);
            $stmt->bindParam('LoanStatus',$LoanStatus);
            $stmt->bindParam('Reason',$Reason);
            return $stmt;

        }
        catch(Exception $e)
        {
            print_r($e->getMessage());
        }
    }

    // insert invoice
    public function InsertInvoice($Loan_id, $acc_id, $InstallmentNumber, $Amount, $Status, $DueDate){
        // call sp for insert invoice
        try {
            require_once '../Database/database.php';
            $query = ("CALL InsertInvoice('$Loan_id','$acc_id', '$InstallmentNumber', '$Amount', '$Status', '$DueDate')") ;
            // prepare query statement
            $stmt = $this->conn->prepare($query);
            $stmt->execute();
            $stmt->bindParam('Loan_id',$Loan_id);
            $stmt->bindParam('acc_id',$acc_id);
            $stmt->bindParam('InstallmentNumber',$InstallmentNumber);
            $stmt->bindParam('Amount',$Amount);
            $stmt->bindParam('Status',$Status);
            $stmt->bindParam('DueDate',$DueDate);
            return $stmt;

        }
        catch(Exception $e)
        {
            print_r($e->getMessage());
        }
    }

    public function GetLoanReport($email, $startdate, $enddate){
        // call sp for get loan report
        try {
            require_once '../Database/database.php';
            $query = ("CALL LoanReport('$email','$startdate', '$enddate')") ;
            // prepare query statement
            $stmt = $this->conn->prepare($query);
            $stmt->execute();
            $stmt->bindParam('email',$email);
            $stmt->bindParam('startdate',$startdate);
            $stmt->bindParam('enddate',$enddate);
            return $stmt;

        }
        catch(Exception $e)
        {
            print_r($e->getMessage());
        }
    }

}