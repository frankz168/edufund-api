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
    public function resetPassword($email, $password){
        // call sp for reset password
        try {
            require_once '../Database/database.php';
            $query = ("CALL ResetPassword('$email','$password')") ;
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

    // sign up user
    public function signUpAccount($email, $password, $phonenumber){
        // call sp for sign up Account
        try {
            require_once '../Database/database.php';
            $query = ("CALL SignUpAccount('$email','$password', '$phonenumber')") ;
            // prepare query statement
            $stmt = $this->conn->prepare($query);
            $stmt->execute();
            $stmt->bindParam('email',$email);
            $stmt->bindParam('password',$password);
            $stmt->bindParam('password',$phonenumber);
            return $stmt;

        }
        catch(Exception $e)
        {
            print_r($e->getMessage());
        }
    }

    // update status success verification account
    public function UpdateSuccessVerificationAccount($email, $status){
        // call sp for reset password
        try {
            require_once '../Database/database.php';
            $query = ("CALL UpdateStatusAccount('$email','$status')") ;
            // prepare query statement
            $stmt = $this->conn->prepare($query);
            $stmt->execute();
            $stmt->bindParam('email',$email);
            $stmt->bindParam('status',$status);
            return $stmt;

        }
        catch(Exception $e)
        {
            print_r($e->getMessage());
        }
    }
}
