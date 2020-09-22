<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require_once "library/PHPMailer.php";
require_once "library/Exception.php";
require_once "library/OAuth.php";
require_once "library/POP3.php";
require_once "library/SMTP.php";

$mail = new PHPMailer;

//Enable SMTP debugging.
$mail->SMTPDebug = 3;
//Set PHPMailer to use SMTP.
$mail->isSMTP();
//Set SMTP host name
$mail->Host = "tls://smtp.gmail.com"; //host mail server
//Set this to true if SMTP host requires authentication to send email
$mail->SMTPAuth = true;
//Provide username and password
$mail->Username = "franky.sutanto93@gmail.com";   //nama-email smtp
$mail->Password = "olordjesus943971382";           //password email smtp
//If SMTP requires TLS encryption then set it
$mail->SMTPSecure = "tsl";
//Set TCP port to connect to
$mail->Port = 587;

$mail->From = "franky.sutanto93@gmail.com"; //email pengirim
$mail->FromName = "Ini adalah PHPmailer"; //nama pengirim

$mail->addAddress("franky.sutanto93@gmail.com", "Franky"); //email penerima

$mail->isHTML(true);

$mail->Subject = "test send email"; //subject
$mail->Body    = "test12345"; //isi email
$mail->AltBody = "PHP mailer"; //body email (optional)

if(!$mail->send())
{
    echo "Mailer Error: " . $mail->ErrorInfo;
}
else
{
    echo "Message has been sent successfully";
}

?>
