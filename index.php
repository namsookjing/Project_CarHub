<?php
include 'config.php';

$sql = "SELECT * FROM sellers";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "Data: " . json_encode($row) . "<br>";
    }
} else {
    echo "No results";
}
?>
