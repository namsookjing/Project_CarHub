<?php

phpinfo();
error_reporting(E_ALL);
ini_set('display_errors', 1);
$servername = getenv('DB_HOST');
$username = getenv('DB_USER');
$password = getenv('DB_PASS');
$dbname = getenv('DB_NAME');
$port = getenv('DB_PORT');

$conn = new mysqli($servername, $username, $password, $dbname, $port);

if ($conn->connect_error) {
    die("ERROR: " . $conn->connect_error);
}
echo "Successfully Connect";

?>
