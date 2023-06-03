<?php

$host = 'localhost';
$user = 'root';
$password = '';
$database = 'attendence';

$conn = new mysqli($host, $user, $password, $database);

if ($conn->connect_error) {
    die('Cannot connect to server: ' . $conn->connect_error);
}

?>
