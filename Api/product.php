<?php
header("Content-type: application/json");
//include_once "Database/koneksi.php";
include_once '../Database/database.php';
include_once '../Controller/master.php';

// get database connection
$database = new Database();
$db = $database->getConnection();
// prepare product object
$product = new Master($db);
$stmt = $product->GetDataAllProduct();
if($stmt->rowCount() > 0){
    // get retrieved row
    while($row = $stmt->fetch())
    {
        // create array
        $product_arr[]=array(
            "product_id" => $row['product_id'],
            "product_name" => $row['product_name'],
            "status" => $row['status']
        );
    }

    //print_r($province_arr);
}
else{
    $product_arr=array(
        "message" => "Invalid Get Data Product!",
    );
}
// make it json format
print_r(json_encode($product_arr));

?>