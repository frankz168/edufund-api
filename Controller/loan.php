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

}