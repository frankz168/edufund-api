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

    // get profile account by email sp
    public function GetProfileAccountByEmail($email){
        // call sp for reset password
        try {
            require_once '../Database/database.php';
            $query = ("CALL GetProfileAccountByEmail('$email')") ;
            // prepare query statement
            $stmt = $this->conn->prepare($query);
            $stmt->execute();
            $stmt->bindParam('email',$email);
            return $stmt;

        }
        catch(Exception $e)
        {
            print_r($e->getMessage());
        }
    }




    // update profile account
    public function UpdateProfile($email, $idcardnumber, $placeofbirth, $dateofbirth, $gender, $religion, $ImageKTP, $ImageSelfie,
                                  $StatusMarriage, $Education, $TaxID, $ImageFamilyMemberCard,
                                  $Occupation, $Fields, $Position, $StatusOfEmployment,
                                  $ProofOfEmployment, $ProofOfIncome, $ProofOfBusiness,
                                  $ProofOfBusinessIncome, $Type, $Status, $Village_ID, $Province_ID, $Street, $Number, $RT, $RW, $City, $SubDistrict, $PostalCode,
                                  $ResidentialStatus, $Duration, $ProofOfResidence,
                                  $Name, $Phone, $Relationship){

        // call sp for update account profile
        try {
            require_once '../Database/database.php';
            $query = ("CALL UpdateProfileAccount('$email', '$idcardnumber', '$placeofbirth', '$dateofbirth', '$gender', '$religion', '$ImageKTP', '$ImageSelfie',
                                  '$StatusMarriage', '$Education', '$TaxID', '$ImageFamilyMemberCard',
                                  '$Occupation', '$Fields', '$Position', '$StatusOfEmployment',
                                  '$ProofOfEmployment', '$ProofOfIncome', '$ProofOfBusiness',
                                  '$ProofOfBusinessIncome', '$Type', '$Status', '$Village_ID', '$Province_ID', '$Street', '$Number', '$RT', '$RW', '$City', '$SubDistrict', '$PostalCode',
                                  '$ResidentialStatus', '$Duration', '$ProofOfResidence',
                                  '$Name', '$Phone', '$Relationship')") ;
            // prepare query statement
            $stmt = $this->conn->prepare($query);
            $stmt->execute();
            $stmt->bindParam('email',$email);
            $stmt->bindParam('idcardnumber',$idcardnumber);
            $stmt->bindParam('placeofbirth',$placeofbirth);
            $stmt->bindParam('dateofbirth',$dateofbirth);
            $stmt->bindParam('gender',$gender);
            $stmt->bindParam('religion',$religion);
            $stmt->bindParam('ImageKTP',$ImageKTP);
            $stmt->bindParam('ImageSelfie',$ImageSelfie);
            $stmt->bindParam('StatusMarriage',$StatusMarriage);
            $stmt->bindParam('Education',$Education);
            $stmt->bindParam('TaxID',$TaxID);
            $stmt->bindParam('ImageFamilyMemberCard',$ImageFamilyMemberCard);
            $stmt->bindParam('Occupation',$Occupation);
            $stmt->bindParam('Fields',$Fields);
            $stmt->bindParam('Position',$Position);
            $stmt->bindParam('StatusOfEmployment',$StatusOfEmployment);
            $stmt->bindParam('ProofOfEmployment',$ProofOfEmployment);
            $stmt->bindParam('ProofOfIncome',$ProofOfIncome);
            $stmt->bindParam('ProofOfBusiness',$ProofOfBusiness);
            $stmt->bindParam('ProofOfBusinessIncome',$ProofOfBusinessIncome);
            $stmt->bindParam('Type',$Type);
            $stmt->bindParam('Status',$Status);
            $stmt->bindParam('Village_ID',$Village_ID);
            $stmt->bindParam('Province_ID',$Province_ID);
            $stmt->bindParam('Street',$Street);
            $stmt->bindParam('Number',$Number);
            $stmt->bindParam('RT',$RT);
            $stmt->bindParam('RW',$RW);
            $stmt->bindParam('City',$City);
            $stmt->bindParam('SubDistrict',$SubDistrict);
            $stmt->bindParam('PostalCode',$PostalCode);
            $stmt->bindParam('ResidentialStatus',$ResidentialStatus);
            $stmt->bindParam('Duration',$Duration);
            $stmt->bindParam('ProofOfResidence',$ProofOfResidence);
            $stmt->bindParam('Name',$Name);
            $stmt->bindParam('Phone',$Phone);
            $stmt->bindParam('Relationship',$Relationship);

            return $stmt;

        }
        catch(Exception $e)
        {
            print_r($e->getMessage());
        }

    }

}
