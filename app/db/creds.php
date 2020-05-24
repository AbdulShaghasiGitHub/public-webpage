<?php
$host = "cloud-db.cxifj6rk0fai.us-east-1.rds.amazonaws.com";
$user = "root";
$pass = "password";
$db = "cloud";
$db = new mysqli($host, $user, $pass, $db);
if ($db->connect_error) { die("Connection failed: " . $db->connect_error);}
?>
