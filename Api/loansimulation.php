<?php
header("Content-type: application/json");
//include_once "Database/koneksi.php";
include_once '../Database/database.php';
include_once '../Controller/users.php';

// get data from query string api json
//$periodtime= $_GET['periodtime'];
//$interestpermonth= $_GET['interestpermonth'];
//$loanamountrequest = $_GET['loanamountrequest'];

$periodtime = 12;
$interestpermonth = 1;
$loanamountrequest = 3500000;

$balance = $loanamountrequest;
$principal = 0;
$installments = 0;

$resultbalance = 0;
$resultprincipal = 0;
$resultinterest = 0;
$resultinstallments = 0;

if($periodtime != null){
    for ($x = 0; $x <= $periodtime; $x++) {
        $resultprincipal = $loanamountrequest / $periodtime;
        $resultinterest = $interestpermonth * $loanamountrequest / 100;

        if($x == 0){
            $balance -= $principal;
            $principal = 0;
            $interest = 0;
            $installments = 0;
        }
        else{
            $interest = $resultinterest;
            $balance -= $resultprincipal;
            $principal = $resultprincipal;
            $installments = $principal + $interest;
        }

        // change to decimal point 2 digits comma behind number.
        $formatinterest =  number_format($interest,2);
        $formatbalance = number_format($balance,2);
        $formatprincipal = number_format($principal,2);
        $formatinstallments = number_format($installments, 2);

//        echo "No: $x \n";
//        echo "Interest: $formatinterest \n";
//        echo "balance: $formatbalance \n";
//        echo "principal: $formatprincipal \n";
//        echo "Installment: $formatinstallments \n";

        $simulation_arr[]=array(
            "No" => $x,
            "interest" => $formatinterest,
            "balance" => $formatbalance,
            "principal" => $formatprincipal,
            "Installment" => $formatinstallments,
            "Status" => true
        );

    }
}
else{
    $simulation_arr=array(
        "status" => false,
        "message" => "Invalid Get Simulation Credit. Please Input the period time!",
    );
}

// make it json format
print_r(json_encode($simulation_arr));

?>