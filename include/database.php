<?php
$servername = "db";
$username = "root";
$password = "";
$database = "EZK";

    $conn = new mysqli($servername, $username, $password, $database);

    // Проверка соединения
    if ($conn->connect_error) {
        die("Ошибка подключения: " . $conn->connect_error);
    }
 
