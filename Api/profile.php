<?php
header("Content-type: application/json");
include_once '../Database/database.php';
include_once '../Controller/users.php';

$data = json_decode(file_get_contents('php://input'), true);
$email=$data['email'];
$idcardnumber=$data['idcardnumber'];
$placeofbirth=$data['placeofbirth'];
$dateofbirth=$data['dateofbirth'];
$Gender=$data['Gender'];
$Religion=$data['Religion'];
$ImageKTP=$data['ImageKTP'];
$ImageSelfie=$data['ImageSelfie'];
$StatusMarriage=$data['StatusMarriage'];
$Education=$data['Education'];
$TaxID=$data['TaxID'];
$ImageFamilyMemberCard=$data['ImageFamilyMemberCard'];;
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

//$email='franky.sutanto93@gmail.com';
//$idcardnumber='12344556';
//$placeofbirth='Jakarta';
//$dateofbirth='1993-08-16';
//$Gender='L';
//$Religion='Kristen';
//$ImageKTP=null;
//$ImageSelfie=null;
//$StatusMarriage='Not Married';
//$Education='S1';
//$TaxID=1;
//$ImageFamilyMemberCard=null;
//$Occupation='Indonesia';
//$Fields='test';
//$Position='IT';
//$StatusOfEmployment='Active';
//$ProofOfEmployment='test';
//$ProofOfIncome='test';
//$ProofOfBusiness='test';
//$ProofOfBusinessIncome='test';
//$Type='Data';
//$Status='Active';
//$Village_ID='1';
//$Province_ID='1';
//$Street='Jakarta Barat';
//$Number='123456789';
//$RT='11850';
//$RW='11082';
//$City='Jakarta';
//$SubDistrict='test';
//$PostalCode='11850';
//$ResidentialStatus='Active';
//$Duration='20';
//$ProofOfResidence='Test';
//$Name='Jovita';
//$Phone='0812123';
//$Relationship='No';

if($ImageKTP == null) {
    $status = array();

    if (is_uploaded_file($_FILES["ImageKTP"]["name"])) {
        $tmp_file = $_FILES["ImageKTP"]["tmp_name"];
        $upload_dir = "../uploads/";

        // Generating random image name each time so image name will not be same .
        $upload_dir = $upload_dir . "/". "ImageKTP" .  ".jpeg";
        if (move_uploaded_file($tmp_file, $upload_dir)) {
            $sql = "UPDATE profile set ImageKTP = ('$upload_dir')";
            $stmt = $database->prepare($sql);
            if ($stmt->execute()) {
                $status['kode'] = 1;
                $status['deskripsi'] = 'upload success';
                $status['ImageKTP'] = $upload_dir;
            } else {
                $status['kode'] = 0;
                $status['deskripsi'] = 'upload failed';
                $ImageKTP = null;
            }

        }

    }
}

if($ImageSelfie == null) {

    $status = array();
    if (is_uploaded_file($_FILES["ImageSelfie"]["tmp_name"])) {
        $tmp_file = $_FILES["ImageSelfie"]["tmp_name"];
        $upload_dir = "../uploads/";

        // Generating random image name each time so image name will not be same .
        $upload_dir = $upload_dir . "/". "ImageSelfie" .  ".jpeg";
        if (move_uploaded_file($tmp_file, $upload_dir)) {
            $sql = "UPDATE profile set ImageSelfie = ('$upload_dir')";
            $stmt = $database->prepare($sql);
            if ($stmt->execute()) {
                $status['kode'] = 1;
                $status['deskripsi'] = 'upload success';
                $status['ImageSelfie'] = $upload_dir;
            } else {
                $status['kode'] = 0;
                $status['deskripsi'] = 'upload failed';
                $ImageSelfie = null;
            }

        }

    }
}

if($ImageFamilyMemberCard == null) {

    $status = array();
    if (is_uploaded_file($_FILES["ImageFamilyMemberCard"]["tmp_name"])) {
        $tmp_file = $_FILES["ImageFamilyMemberCard"]["tmp_name"];
        $upload_dir = "../uploads/";

        // Generating random image name each time so image name will not be same .
        $upload_dir = $upload_dir . "/". "ImageFamilyMemberCard" .  ".jpeg";
        if (move_uploaded_file($tmp_file, $upload_dir)) {
            $sql = "UPDATE profile set ImageFamilyMemberCard = ('$upload_dir')";
            $stmt = $database->prepare($sql);
            if ($stmt->execute()) {
                $status['kode'] = 1;
                $status['deskripsi'] = 'upload success';
                $status['ImageFamilyMemberCard'] = $upload_dir;
            } else {
                $status['kode'] = 0;
                $status['deskripsi'] = 'upload failed';
                $ImageSelfie = null;
            }

        }

    }
}

// get database connection
$database = new Database();
$db = $database->getConnection();
// prepare user object
$user = new Users($db);

$stmt = $user->UpdateProfile($email, $idcardnumber, $placeofbirth, $dateofbirth, $Gender, $Religion, $ImageKTP, $ImageSelfie,
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
print_r(json_encode($profile_arr));

?>
