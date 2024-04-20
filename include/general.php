<?php

// Функция для создания вариантов в выпадающем списке
function generateOptions($result, $defaultOption) {
    if ($result->num_rows > 0) {
        // Вывод значений в выпадающий список
        while ($row = $result->fetch_assoc()) {
            echo '<option value="'.$row[$defaultOption].'">'.$row[$defaultOption].'</option>';
        }
    } else {
        echo '<option value="">Нет данных</option>';
    }
}

function getListbyQuery($conn, $sql) {
    $results = $conn->query($sql);

    $list = [];

    if ($results->num_rows > 0) {
        // Записываем данные о предметах в массив
        while ($row = $results->fetch_assoc()) {
            $list[] = $row;
        }
    }
    
    return $list;
}