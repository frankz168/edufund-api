<?php
header("Content-type: application/json");
include_once '../Database/database.php';
include_once '../Controller/master.php';

// get database connection
$database = new Database();
$db = $database->getConnection();
// prepare province object
$province = new Master($db);
$stmt = $province->GetDataAllProvince();
if($stmt->rowCount() > 0){
    // get retrieved row
    while($row = $stmt->fetch())
    {
        // create array
        $province_arr[]=array(
            "province_id" => $row['Province_ID'],
            "province_name" => $row['Province_Name']
        );
    }

    //print_r($province_arr);
}
else{
    $province_arr=array(
        "message" => "Invalid Get Data Province!",
    );
}
// make it json format
print_r(json_encode($province_arr));

?>