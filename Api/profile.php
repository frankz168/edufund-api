<?php
header("Content-type: application/json");
//include_once "Database/koneksi.php";
include_once '../Database/database.php';
include_once '../Controller/users.php';

$data = json_decode(file_get_contents('php://input'), true);
$email=$data['email'];
$idcardnumber=$data['idcardnumber'];
$placeofbirth=$data['placeofbirth'];
$dateofbirth=$data['dateofbirth'];
$gender=$data['gender'];
$religion=$data['religion'];
$ImageKTP=$data['ImageKTP'];
$ImageSelfie=$data['ImageSelfie'];
$StatusMarriage=$data['StatusMarriage'];
$Education=$data['Education'];
$TaxID=$data['TaxID'];
$ImageFamilyMemberCard=$data['ImageFamilyMemberCard'];
$Occupation=$data['Occupation'];
$Fields=$data['Fields'];
$Position=$data['Position'];
$StatusOfEmployment=$data['StatusOfEmployment'];
$ProofOfEmployment=$data['ProofOfEmployment'];
$ProofOfIncome=$data['ProofOfIncome'];
$ProofOfBusiness=$data['ProofOfBusiness'];
$ProofOfBusinessIncome=$data['ProofOfBusinessIncome'];
$Type=$data['Type'];
$Status=$data['Status'];
$Village_ID=$data['Village_ID'];
$Province_ID=$data['Province_ID'];
$Street=$data['Street'];
$Number=$data['Number'];
$RT=$data['RT'];
$RW=$data['RW'];
$City=$data['City'];
$SubDistrict=$data['SubDistrict'];
$PostalCode=$data['PostalCode'];
$ResidentialStatus=$data['ResidentialStatus'];
$Duration=$data['Duration'];
$ProofOfResidence=$data['ProofOfResidence'];
$Name=$data['Name'];
$Phone=$data['Phone'];
$Relationship=$data['Relationship'];

// get database connection
$database = new Database();
$db = $database->getConnection();
// prepare user object
$user = new Users($db);

$stmt = $user->UpdateProfile($email, $idcardnumber, $placeofbirth, $dateofbirth, $gender, $religion, $ImageKTP, $ImageSelfie,
    $StatusMarriage, $Education, $TaxID, $ImageFamilyMemberCard,
    $Occupation, $Fields, $Position, $StatusOfEmployment,
    $ProofOfEmployment, $ProofOfIncome, $ProofOfBusiness,
    $ProofOfBusinessIncome, $Type, $Status, $Village_ID, $Province_ID, $Street, $Number, $RT, $RW, $City, $SubDistrict, $PostalCode,
    $ResidentialStatus, $Duration, $ProofOfResidence,
    $Name, $Phone, $Relationship);
if($stmt->rowCount() > 0){
    // create array
    $profile_arr=array(
        "success" => 1,
        "message" => "Successfully Update Profile!"
    );
}
else{
    $profile_arr=array(
        "success" => 0,
        "message" => "Update Profile Failed!",
    );
}
// make it json format
print_r(json_encode($respass_arr));

?>