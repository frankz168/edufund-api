<?php
header("Content-type: application/json");
//include_once "Database/koneksi.php";
include_once '../Database/database.php';
include_once '../Controller/users.php';

// get data from query string api json
$email=$_GET['email'];
//$email = 'franky.sutanto93@gmail.com';

// get database connection
$database = new Database();
$db = $database->getConnection();
// prepare user object
$user = new Users($db);
$stmt = $user->GetProfileAccountByEmail($email);
if($stmt->rowCount() > 0){
    // get retrieved row
    while($row = $stmt->fetch())
    {
        /*$test = $row['acc_id'];
        echo "your email is: ". $row['email'];*/
        // create array
        $getprofile_arr=array(
            "email" => $email,
            "status" => true,
            "message" => "Successfully Get Profile Account Data!",
            "acc_id" => $row['acc_id'],
            "idcardnumber" => $row['idcardnumber'],
            "placeofbirth" => $row['placeofbirth'],
            "dateofbirth" => $row['dateofbirth'],
            "Gender" => $row['Gender'],
            "Religion" => $row['Religion'],
            "ImageKTP" => $row['ImageKTP'],
            "ImageSelfie" => $row['ImageSelfie'],
            "StatusMarriage" => $row['StatusMarriage'],
            "Education" => $row['Education'],
            "TaxID" => $row['TaxID'],
            "ImageFamilyMemberCard" => $row['ImageFamilyMemberCard'],
            "Occupation" => $row['Occupation'],
            "Fields" => $row['Fields'],
            "Position" => $row['Position'],
            "StatusOfEmployment" => $row['StatusOfEmployment'],
            "ProofOfEmployment" => $row['ProofOfEmployment'],
            "ProofOfIncome" => $row['ProofOfIncome'],
            "ProofOfBusiness" => $row['ProofOfBusiness'],
            "ProofOfBusinessIncome" => $row['ProofOfBusinessIncome'],
            "Type" => $row['Type'],
            "Status" => $row['Status'],
            "Village_ID" => $row['Village_ID'],
            "Province_ID" => $row['Province_ID'],
            "Street" => $row['Street'],
            "Number" => $row['Number'],
            "RT" => $row['RT'],
            "RW" => $row['RW'],
            "City" => $row['City'],
            "SubDistrict" => $row['SubDistrict'],
            "PostalCode" => $row['PostalCode'],
            "ResidentialStatus" => $row['ResidentialStatus'],
            "Duration" => $row['Duration'],
            "ProofOfResidence" => $row['ProofOfResidence'],
            "Name" => $row['Name'],
            "Phone" => $row['Phone'],
            "Relationship" => $row['Relationship'],
        );
    }
}
else{
    $getprofile_arr=array(
        "status" => false,
        "message" => "Invalid Get Profile Account Data!",
    );
}
// make it json format
print_r(json_encode($getprofile_arr));

?>