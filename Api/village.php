<?php
header("Content-type: application/json");
//include_once "Database/koneksi.php";
include_once '../Database/database.php';
include_once '../Controller/master.php';

// get database connection
$database = new Database();
$db = $database->getConnection();
// prepare village object
$village = new Master($db);
$stmt = $village->GetDataAllVillage();
if($stmt->rowCount() > 0){
    // get retrieved row
    while($row = $stmt->fetch())
    {
        // create array
        $village_arr[]=array(
            "village_id" => $row['Village_ID'],
            "village_name" => $row['Village_Name']
        );
    }

    //print_r($village_arr);
}
else{
    $village_arr=array(
        "message" => "Invalid Get Data Village!",
    );
}
// make it json format
print_r(json_encode($village_arr));

?>