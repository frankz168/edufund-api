<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

class common
{

    public function linkUrl()
    {
        $value = "http://192.168.0.17/";

        return $value;
    }

    public function generateRandomPassword($length) {
        $alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
        $pass = array(); //remember to declare $pass as an array
        $alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
        for ($i = 0; $i < $length; $i++) {
            $n = rand(0, $alphaLength);
            $pass[] = $alphabet[$n];
        }
        return implode($pass); //turn the array into a string
    }

    public function sendEmail($emailTo, $emailFromName, $emailSubject, $emailMessage){

        require_once "../library/PHPMailer.php";
        require_once "../library/Exception.php";
        require_once "../library/OAuth.php";
        require_once "../library/POP3.php";
        require_once "../library/SMTP.php";

        $mail = new PHPMailer;
        $mail->SMTPDebug = false;
        //Enable SMTP debugging.
        //$mail->SMTPDebug = 3;
        //Set PHPMailer to use SMTP.
        $mail->isSMTP();
        //Set SMTP host name
        $mail->Host = "tls://smtp.gmail.com"; //host mail server
        //Set this to true if SMTP host requires authentication to send email
        $mail->SMTPAuth = true;
        //Provide username and password
        $mail->Username = "edufund45@gmail.com";   //nama-email smtp
        $mail->Password = "fundation2019";           //password email smtp
        //If SMTP requires TLS encryption then set it
        $mail->SMTPSecure = "tsl";
        //Set TCP port to connect to
        $mail->Port = 587;

        $mail->From = "edufund45@gmail.com"; //email pengirim
        $mail->FromName = $emailFromName; //nama pengirim

        $mail->addAddress($emailTo, $emailFromName); //email penerima

        $mail->isHTML(true);

        $mail->Subject = $emailSubject; //subject
        $mail->Body    = $emailMessage; //isi email
        $mail->AltBody = "test"; //body email (optional)

        if(!$mail->send())
        {
            //echo "Mailer Error: " . $mail->ErrorInfo;
        }
        else
        {
            //echo "Message has been sent successfully";
        }
    }
}