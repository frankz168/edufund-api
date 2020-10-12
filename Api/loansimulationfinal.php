<?php
header("Content-type: application/json");
//include_once "Database/koneksi.php";
include_once '../Database/database.php';
include_once '../Controller/users.php';

// get data from query string api json
$periodtime= $_GET['periodtime'];
$interestpermonth= $_GET['interestpermonth'];
$loanamountrequest = $_GET['loanamountrequest'];
$dppercent = $_GET['dppercent'];

//$periodtime = 6;
//$interestpermonth = 1.5;
//$loanamountrequest = 9000000;
//$dppercent = 0.2;

$principal = 0;
$installments = 0;

$resultbalance = 0;
$resultprincipal = 0;
$resultinterest = 0;
$resultinstallments = 0;

if($periodtime != null){
    $resultprincipal = $loanamountrequest / $periodtime;
    $resultinterestpermonth = ($interestpermonth * $loanamountrequest / 100);

    $totalinterest = $resultinterestpermonth * $periodtime;
    $totalinstallments = $resultprincipal + $resultinterestpermonth;
    $totalloanamountrequest = $loanamountrequest + $totalinterest;

    $dp = ($dppercent * $loanamountrequest);

    // change to decimal point 2 digits comma behind number.
    $formattotalloanamountrequest = number_format($totalloanamountrequest ,2);
    $formattotalinstallment =  number_format($totalinstallments,2);
    $formattotalinterest = number_format( $totalinterest ,2);
    $formatdp = number_format( $dp ,2);

    $simulation_arr=array(
        "periodtime" => $periodtime,
        "interestpermonth" => $interestpermonth,
        "loanamountrequest" => $loanamountrequest,
        "totalloanamountrequest" =>  $formattotalloanamountrequest,
        "totalinterest" => $formattotalinterest,
        "totalinstallment" => $formattotalinstallment,
        "dp" => $formatdp,
        "Status" => true
    );
}
else{
    $simulation_arr=array(
        "status" => false,
        "message" => "Invalid Get Simulation Loan Summary. Please Input the period time!",
    );
}

// make it json format
print_r(json_encode($simulation_arr));

?>