<?php

class Users
{

    // database connection and table name
    private $conn;
    private $table_name = "account";
    public $email;
    public $password;


    // constructor with $db as database connection
    public function __construct($db){
        $this->conn = $db;
    }

    // login user
    public function login($email, $password){
        // select all query
        try {
            require_once '../Database/database.php';
            $query = ("CALL GetDataAccount('$email','$password')") ;
            // prepare query statement
            $stmt = $this->conn->prepare($query);
            $stmt->execute();
            $stmt->bindParam('email',$email);
            $stmt->bindParam('password',$password);
            return $stmt;

        }
        catch(Exception $e)
        {
            print_r($e->getMessage());
        }

    }

    // reset password user
    public function resetPassword($acc_id, $password){
        // call sp for reset password
        try {
            require_once '../Database/database.php';
            $query = ("CALL ResetPassword('$acc_id','$password')") ;
            // prepare query statement
            $stmt = $this->conn->prepare($query);
            $stmt->execute();
            $stmt->bindParam('acc_id',$acc_id);
            $stmt->bindParam('password',$password);
            return $stmt;

        }
        catch(Exception $e)
        {
            print_r($e->getMessage());
        }
    }
}
