<?php
$var="something";
echo "Hello world";
echo $var;
/****************************************************
 * Remember that header() must be called before any actual output is sent,
 * either by normal HTML tags, blank lines in a file, or from PHP.
 *****************************************************/
echo "<script type='text/javascript'>document.location.href = 'index.php';</script>";
exit;
?>