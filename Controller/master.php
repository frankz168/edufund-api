<?php

class Master
{

    // database connection and table name
    private $conn;

    // constructor with $db as database connection
    public function __construct($db){
        $this->conn = $db;
    }

    // call sp get data all province
    public function GetDataAllProvince(){
        // select all query
        try {
            require_once '../Database/database.php';
            $query = ("CALL GetDataAllProvince()") ;
            // prepare query statement
            $stmt = $this->conn->prepare($query);
            $stmt->execute();
            return $stmt;

        }
        catch(Exception $e)
        {
            print_r($e->getMessage());
        }

    }

    // call sp get data all village
    public function GetDataAllVillage(){
        // select all query
        try {
            require_once '../Database/database.php';
            $query = ("CALL GetDataAllVillage()") ;
            // prepare query statement
            $stmt = $this->conn->prepare($query);
            $stmt->execute();
            return $stmt;

        }
        catch(Exception $e)
        {
            print_r($e->getMessage());
        }

    }
}
