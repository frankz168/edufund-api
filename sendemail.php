<?php

use PHPMailerPHPMailerPHPMailer;
use PHPMailerPHPMailerException;

require_once '../library/PHPMailer.php';
require_once '../library/Exception.php';
require_once '../library/OAuth.php';
require_once '../library/POP3.php';
require_once '../library/SMTP.php';

$mail = new PHPMailer;

//Enable SMTP debugging.
//$mail->SMTPDebug = 3;
//Set PHPMailer to use SMTP.
$mail->isSMTP();
//Set SMTP host name
$mail->Host = 'tls';//smtp.gmail.com”; //host mail server
//Set this to true if SMTP host requires authentication to send email
$mail->SMTPAuth = true;
//Provide username and password
$mail->Username = 'franky.sutanto93@gmail.com';   //nama-email smtp
$mail->Password = 'olordjesus943971382';           //password email smtp
//If SMTP requires TLS encryption then set it
$mail->SMTPSecure = 'ssl';
//Set TCP port to connect to
$mail->Port = 587;

$mail->From = 'test php mailer'; //email pengirim
$mail->FromName = 'Ini adalah PHPmailer'; //nama pengirim

$mail->addAddress('jovitasutanto97@gmail.com', 'test franky'); //email penerima

$mail->isHTML(true);

$mail->Subject = 'test123'; //subject
$mail->Body    = 'test send email'; //isi email
$mail->AltBody = 'PHP mailer'; //body email

if(!$mail->send())
{
    echo 'Mailer Error: ' . $mail->ErrorInfo;
}
else
{
    echo 'Message has been sent successfully';
}

?>