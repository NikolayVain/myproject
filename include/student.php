<?php

if (empty($included)) die('No access');

$sql_semesters = "SELECT DISTINCT semesters.semester_id, semesters.number AS number
        FROM semesters order by number ASC";

$semesters = getListbyQuery($conn, $sql_semesters);

//todo - get from request
$selected_semester_id = 1;

// get student info

$sql_info = "SELECT student_groups.number as group_number, specialties.full_name as specialty_name, courses.number as course_number, faculties.full_name as faculty_name
                      FROM student_groups
                      JOIN specialties ON specialties.specialty_id = student_groups.specialty_id
                      JOIN courses ON courses.course_id = student_groups.course_id
                      JOIN faculties ON faculties.faculty_id = specialties.faculty_id
                      WHERE student_groups.group_id = ?";

$stmt = $conn->prepare($sql_info);
$stmt->bind_param("i", $user['group_id']);
$stmt->execute();
$result = $stmt->get_result();

$studentInfo = $result->fetch_assoc();

if ($studentInfo) {
    // calculate mean grades
    
    $sql = "SELECT AVG(grade) as mean
            FROM grades
            WHERE student_id = ?";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $user['student_id']);
    $stmt->execute();
    $result = $stmt->get_result();
    
    $row = $result->fetch_assoc();
    
    $studentInfo['mean'] = $row['mean'];    
    
    // get debts list
    
    $sql_info = "SELECT subjects.name
                          FROM grades
                          JOIN schedule_dates ON schedule_dates.schedule_date_id = grades.schedule_date_id
                          JOIN schedules ON schedules.schedule_id = schedule_dates.schedule_id
                          JOIN subjects ON subjects.subject_id = schedules.subject_id
                          WHERE grades.student_id = ? AND grade = ?
                          ORDER BY subjects.name ASC";

    $gradeDebt = 'незачет';
    
    $stmt = $conn->prepare($sql_info);
    $stmt->bind_param("is", $user['student_id'], $gradeDebt);
    $stmt->execute();
    $result = $stmt->get_result();
    
    $studentInfo['debts'] = [];

    while ($row = $result->fetch_assoc()) {
        $studentInfo['debts'][] = $row['name'];
    }
    
    //todo - add other calculated information
    
} else {
    die('Error: No data about student!!!');
}

// SQL-запрос для получения дат занятий
$sql_lessons_dates = "SELECT schedule_dates.date AS lesson_date, subjects.name, subjects.control_type, teachers.full_name, grades.grade
                      FROM schedule_dates
                      JOIN schedules ON schedule_dates.schedule_id = schedules.schedule_id
                      JOIN subjects ON subjects.subject_id = schedules.subject_id
                      JOIN student_groups ON schedules.group_id = student_groups.group_id
                      JOIN semesters ON schedules.semester_id = semesters.semester_id
                      JOIN teachers ON schedules.teacher_id = teachers.teacher_id
                      LEFT JOIN grades ON grades.schedule_date_id = schedule_dates.schedule_date_id
                      WHERE student_groups.group_id = ? AND semesters.semester_id = ?
                      ORDER BY lesson_date";

$stmt = $conn->prepare($sql_lessons_dates);
$stmt->bind_param("ii", $user['group_id'], $selected_semester_id);
$stmt->execute();
$result_lessons = $stmt->get_result();

$lessons = [];

while ($row = $result_lessons->fetch_assoc()) {
    $lessons[] = [
        'name'          => $row['name'],
        'control_type'  => $row['control_type'],
        'date'          => date("d.M.Y", strtotime($row['lesson_date'])),
        'full_name'     => $row['full_name'],
        'grade'         => $row['grade'],
    ];
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Студенческая информационная система</title>
    <link rel="stylesheet" href="css/stylestudent.css"> <!-- Путь к CSS файлу -->
</head>
<body>
    <div class="header"></div>
    <h1>Личный кабинет студента</h1>

    <!-- Отображение фамилии, имени и отчества студента -->
    <div class="fio">
        <h2><?php echo isset($user['full_name']) ? $user['full_name'] : ''; ?></h2>
    </div>
    <!-- Фильтр по семестрам -->
    <div class="select-container">
        <label for="semester">Выберите семестр:</label>
        <select id="semester" name="semester">
            <?php foreach ($semesters as $item): ?>
                <option value="<?php echo $item['semester_id']; ?>" <?php if ($item['semester_id'] == $selected_semester_id) echo 'selected'; ?> ><?php echo $item['number']; ?></option>
            <?php endforeach; ?>
        </select>
    </div>
    
    <!-- Таблица с данными внутри одного семестра -->

    <div class="window" id="window-1">
        <table class="table-headers">
            <thead>
                <tr>
                    <th>Название дисциплины</th>
                    <th>Вид контроля</th>
                    <th>Дата аттестации</th>
                    <th>Преподаватель</th>
                    <th>Оценка</th>
                </tr>
            </thead>
            <?php foreach ($lessons as $item): ?>
                <tr>
                <?php foreach ($item as $value): ?>
                    <td>
                        <?php echo $value; ?>
                    </td>
                <?php endforeach; ?>
                </tr>
            <?php endforeach; ?>
        </table>
    </div>
    
    <!-- Информация о студенте -->
    <div class="window" id="window-2">
        <div class="student-info">
            <div class="info-pair">
                <div class="info-item fixed-width">
                    <p>Факультет: <br><?php echo $studentInfo['faculty_name']; ?></p>
                </div>

                <div class="info-item fixed-width">
                    <p>Направление подготовки: <br><?php echo $studentInfo['specialty_name']; ?></p>
                </div>
            </div>

            <div class="info-pair">
                <div class="info-item fixed-width">
                    <p>Курс: <br><?php echo $studentInfo['course_number']; ?></p>
                </div>

                <div class="info-item fixed-width">
                    <p>Группа: <br><?php echo $studentInfo['group_number']; ?></p>
                </div>
            </div>

            <div class="info-item fixed-width2">
                <p>Средний балл: <?php echo $studentInfo['mean']; ?></p>
            </div>

            <div class="info-item fixed-width2">
                <p>Рейтинг в группе: [рейтинг]</p>
            </div>
            <div class="info-item flexible-width">
                <p>Задолжности: <br>
                <ul>    
                <?php foreach ($studentInfo['debts'] as $item): ?>
                    <li><?php echo $item; ?></li>
                <?php endforeach; ?>
                </ul> 
                </p>
            </div>
        </div>
    </div>
        <div class="inf">
            <h3>Информация:</h3>
        </div>
    </div>
    <div class="LKS">
    <h1>Личный кабинет студента</h1>
    </div>
    <div class="footer"></div>
    <div class="logoezk-image"></div>

    <div class="mode-switch">
        <button id="infoBtn">Информация</button>
        <button id="gradeBookBtn">Зачетная книжка</button>
    </div>

        <!-- Скрипт для переключения режимов отображения -->
        <script>
    document.addEventListener('DOMContentLoaded', function() {
        const infoBtn = document.getElementById('infoBtn');
        const gradeBookBtn = document.getElementById('gradeBookBtn');
        const window1 = document.getElementById('window-1');
        const window2 = document.getElementById('window-2');
        const selectContainer = document.querySelector('.select-container');

        // Обработчики клика по кнопкам
        infoBtn.addEventListener('click', function() {
            window1.style.display = 'none';
            window2.style.display = 'block';
            selectContainer.style.display = 'none';
        });

        gradeBookBtn.addEventListener('click', function() {
            window1.style.display = 'block';
            window2.style.display = 'none';
            selectContainer.style.display = 'block';
        });
    });

    window.addEventListener('resize', function() {
        if (window.innerWidth >= 1701) {
            location.reload();
        }
    });
</script>

</body>
</html>