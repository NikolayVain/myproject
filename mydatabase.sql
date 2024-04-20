-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 19 2024 г., 22:50
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `EZK3`
--

-- --------------------------------------------------------

--
-- Структура таблицы `courses`
--

CREATE TABLE `courses` (
  `course_id` int NOT NULL,
  `number` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `courses`
--

INSERT INTO `courses` (`course_id`, `number`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `faculties`
--

CREATE TABLE `faculties` (
  `faculty_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `maxCourse` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `faculties`
--

INSERT INTO `faculties` (`faculty_id`, `name`, `full_name`, `maxCourse`) VALUES
(1, 'ФГиИБ', 'Факультет Геоинформатики и Информационной Безопасности', 1),
(2, 'ГФ', 'Геодезический Факультет', 2),
(3, 'КФ', 'Картографический Факультет', 3),
(4, 'ЗФ', 'Заочный Факультет', 4),
(5, 'ФОП', 'Факультет Оптического Приборостроения', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `grades`
--

CREATE TABLE `grades` (
  `grade_id` int NOT NULL,
  `student_id` int DEFAULT NULL,
  `schedule_date_id` int DEFAULT NULL,
  `grade` enum('отсутствует','зачет','незачет','5','4','3') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `grades`
--

INSERT INTO `grades` (`grade_id`, `student_id`, `schedule_date_id`, `grade`) VALUES
(1, 1, 1, '5'),
(2, 6, 6, '5'),
(3, 6, 7, '4'),
(4, 6, 8, '5'),
(5, 6, 9, '4'),
(6, 6, 10, '5'),
(7, 7, 6, '3'),
(8, 7, 7, '3'),
(9, 7, 8, '4'),
(10, 7, 9, '4'),
(11, 7, 10, '4'),
(12, 8, 6, 'зачет'),
(13, 8, 7, 'незачет'),
(14, 8, 8, 'зачет'),
(15, 8, 9, 'зачет'),
(16, 8, 10, 'зачет'),
(17, 9, 6, '5'),
(18, 9, 7, '5'),
(19, 9, 8, '5'),
(20, 9, 9, '5'),
(21, 9, 10, '5'),
(22, 10, 6, '4'),
(23, 10, 7, '4'),
(24, 10, 8, '3'),
(25, 10, 9, '4'),
(26, 10, 10, '3'),
(27, 7, 2, '4'),
(28, 7, 3, '3'),
(29, 7, 12, '4'),
(30, 7, 5, '5'),
(31, 10, 3, '3'),
(32, 10, 12, '5'),
(33, 10, 5, '5'),
(34, 1, 3, '3'),
(35, 1, 12, 'отсутствует'),
(36, 1, 5, '4'),
(37, 6, 3, '3'),
(38, 6, 12, 'отсутствует'),
(39, 6, 5, '3'),
(40, 9, 3, '3'),
(41, 9, 12, '3'),
(42, 9, 5, '3'),
(43, 8, 3, '3'),
(44, 8, 12, '5'),
(45, 8, 5, '4'),
(46, 7, 23, '4'),
(47, 10, 23, '4'),
(48, 1, 23, '4'),
(49, 6, 23, '4'),
(50, 9, 22, 'незачет'),
(51, 9, 23, '3'),
(52, 8, 22, 'отсутствует'),
(53, 8, 23, '3'),
(54, 7, 24, '4'),
(55, 10, 24, '4'),
(56, 1, 24, '4'),
(57, 6, 24, '4'),
(58, 9, 24, '3'),
(59, 8, 24, '3'),
(60, 7, 25, 'отсутствует'),
(61, 7, 26, '3'),
(62, 7, 28, 'незачет'),
(63, 10, 25, 'отсутствует'),
(64, 10, 26, '3'),
(65, 10, 28, 'зачет'),
(66, 1, 25, 'отсутствует'),
(67, 1, 26, '3'),
(68, 1, 28, 'зачет'),
(69, 6, 25, 'отсутствует'),
(70, 6, 26, '4'),
(71, 6, 28, 'зачет'),
(72, 9, 25, 'отсутствует'),
(73, 9, 26, '3'),
(74, 9, 28, 'зачет'),
(75, 8, 26, 'отсутствует'),
(76, 7, 29, '3'),
(77, 7, 31, '5'),
(78, 10, 29, '4'),
(79, 10, 30, '4'),
(80, 10, 31, '3'),
(81, 1, 29, '5'),
(82, 1, 30, '4'),
(83, 1, 31, '4'),
(84, 6, 29, '3'),
(85, 6, 30, '4'),
(86, 6, 31, '3'),
(87, 9, 29, 'незачет'),
(88, 9, 30, '4'),
(89, 9, 31, '5'),
(90, 8, 29, 'незачет'),
(91, 8, 30, '4'),
(92, 8, 31, '3');

-- --------------------------------------------------------

--
-- Структура таблицы `notes`
--

CREATE TABLE `notes` (
  `note_id` int NOT NULL,
  `schedule_date_id` int DEFAULT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `notes`
--

INSERT INTO `notes` (`note_id`, `schedule_date_id`, `text`) VALUES
(1, 1, 'л/р'),
(2, 3, 'к/р'),
(3, 12, 'с/р'),
(4, 22, 'проверочная'),
(5, 26, 'практика'),
(6, 29, 'практика 1');

-- --------------------------------------------------------

--
-- Структура таблицы `schedules`
--

CREATE TABLE `schedules` (
  `schedule_id` int NOT NULL,
  `semester_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `teacher_id` int DEFAULT NULL,
  `group_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `schedules`
--

INSERT INTO `schedules` (`schedule_id`, `semester_id`, `subject_id`, `teacher_id`, `group_id`) VALUES
(1, 1, 1, 1, 1),
(2, 2, 2, 2, 2),
(3, 3, 3, 3, 3),
(4, 4, 4, 4, 4),
(5, 5, 5, 5, 5),
(11, 1, 6, 1, 1),
(12, 1, 7, 2, 1),
(13, 1, 8, 3, 1),
(14, 1, 9, 4, 1),
(15, 1, 10, 5, 1),
(16, 1, 6, 1, 1),
(17, 1, 2, 1, 1),
(18, 1, 3, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `schedule_dates`
--

CREATE TABLE `schedule_dates` (
  `schedule_date_id` int NOT NULL,
  `schedule_id` int NOT NULL,
  `date` date NOT NULL,
  `type` enum('lesson','total') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `schedule_dates`
--

INSERT INTO `schedule_dates` (`schedule_date_id`, `schedule_id`, `date`, `type`) VALUES
(1, 1, '2024-09-01', 'lesson'),
(2, 1, '2024-09-08', 'lesson'),
(3, 1, '2024-09-15', 'lesson'),
(4, 1, '2024-09-22', 'lesson'),
(5, 1, '2024-09-29', 'total'),
(6, 2, '2024-10-01', 'lesson'),
(7, 2, '2024-10-08', 'lesson'),
(8, 2, '2024-10-15', 'lesson'),
(9, 2, '2024-10-22', 'lesson'),
(10, 2, '2024-10-29', 'total'),
(11, 1, '2024-10-06', 'lesson'),
(12, 1, '2024-10-13', 'lesson'),
(13, 1, '2024-10-20', 'lesson'),
(14, 1, '2024-10-27', 'lesson'),
(15, 1, '2024-11-03', 'total'),
(18, 1, '2024-09-15', 'lesson'),
(20, 1, '2024-09-29', 'lesson'),
(21, 1, '2024-10-06', 'total'),
(22, 16, '2024-04-01', 'lesson'),
(23, 16, '2024-04-15', 'lesson'),
(24, 16, '2024-04-30', 'total'),
(25, 17, '2024-04-01', 'lesson'),
(26, 17, '2024-04-08', 'lesson'),
(27, 17, '2024-04-20', 'lesson'),
(28, 17, '2024-04-29', 'total'),
(29, 18, '2024-04-01', 'lesson'),
(30, 18, '2024-04-21', 'lesson'),
(31, 18, '2024-04-30', 'total');

-- --------------------------------------------------------

--
-- Структура таблицы `semesters`
--

CREATE TABLE `semesters` (
  `semester_id` int NOT NULL,
  `number` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `semesters`
--

INSERT INTO `semesters` (`semester_id`, `number`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `specialties`
--

CREATE TABLE `specialties` (
  `specialty_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `faculty_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `specialties`
--

INSERT INTO `specialties` (`specialty_id`, `name`, `full_name`, `faculty_id`) VALUES
(1, 'ИСиТ', 'Информационные Системы и Технологии', 1),
(2, 'ИБ', 'Информационная Безопасность', 1),
(3, 'ПИ', 'Прикладная информатика', 1),
(4, 'ГиДЗ', 'Геодезия и дистанционное зондирование', 2),
(5, 'КиГ', 'Картография и геоинформатика', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `students`
--

CREATE TABLE `students` (
  `student_id` int NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `group_id` int DEFAULT NULL,
  `pass` varchar(255) NOT NULL,
  `loginS` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `students`
--

INSERT INTO `students` (`student_id`, `full_name`, `group_id`, `pass`, `loginS`) VALUES
(1, 'Иванов Иван Иванович', 1, 'pass1', 1001),
(2, 'Петров Петр Петрович', 2, 'pass2', 1002),
(3, 'Сидоров Сидор Сидорович', 3, 'pass3', 1003),
(4, 'Васильев Василий Васильевич', 4, 'pass4', 1004),
(5, 'Алексеев Алексей Алексеевич', 5, 'pass5', 1005),
(6, 'Мария Иванова', 1, 'pass6', 1006),
(7, 'Дмитрий Николаев', 1, 'pass7', 1007),
(8, 'Ольга Петрова', 1, 'pass8', 1008),
(9, 'Николай Сидоров', 1, 'pass9', 1009),
(10, 'Елена Васильева', 1, 'pass10', 1010);

-- --------------------------------------------------------

--
-- Структура таблицы `student_groups`
--

CREATE TABLE `student_groups` (
  `group_id` int NOT NULL,
  `number` text NOT NULL,
  `specialty_id` int DEFAULT NULL,
  `course_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `student_groups`
--

INSERT INTO `student_groups` (`group_id`, `number`, `specialty_id`, `course_id`) VALUES
(1, '2020-ФГиИБ-ИСиТ-2б', 1, 1),
(2, '2021-ФГиИБ-ИСиТ-1б', 1, 2),
(3, '2020-КФ-КиГ-1б', 3, 3),
(4, '2022-ФГиИБ-ИБ-1б', 2, 4),
(5, '2023-ГФ-ГиДЗ-1б', 4, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `control_type` enum('экзамен','зачет с оценкой','зачет') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `subjects`
--

INSERT INTO `subjects` (`subject_id`, `name`, `control_type`) VALUES
(1, 'Проектирование сетей', 'экзамен'),
(2, 'Криптографический анализ', 'зачет'),
(3, 'Базы данных', 'зачет с оценкой'),
(4, 'Математический анализ', 'экзамен'),
(5, 'Физическая культура', 'зачет с оценкой'),
(6, 'Информатика', 'экзамен'),
(7, 'Физика', 'экзамен'),
(8, 'Математический анализ', 'экзамен'),
(9, 'История', 'зачет с оценкой'),
(10, 'Основы управления проектами', 'зачет с оценкой');

-- --------------------------------------------------------

--
-- Структура таблицы `teachers`
--

CREATE TABLE `teachers` (
  `teacher_id` int NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `faculty_id` int DEFAULT NULL,
  `pass` varchar(255) NOT NULL,
  `loginT` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `teachers`
--

INSERT INTO `teachers` (`teacher_id`, `full_name`, `faculty_id`, `pass`, `loginT`) VALUES
(1, 'Кондей Василий Петрович', 1, '1477', 1477),
(2, 'Бебрышева Юлия Владимировна', 2, '0000', 1478),
(3, 'Миронов Алексей Борисович', 3, '1234', 1479),
(4, 'Иванова Мария Федоровна', 4, '2345', 1480),
(5, 'Петров Петр Петрович', 5, '3456', 1481);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`);

--
-- Индексы таблицы `faculties`
--
ALTER TABLE `faculties`
  ADD PRIMARY KEY (`faculty_id`),
  ADD KEY `maxCourse` (`maxCourse`);

--
-- Индексы таблицы `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`grade_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `schedule_date_id` (`schedule_date_id`);

--
-- Индексы таблицы `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`note_id`),
  ADD KEY `schedule_date_id` (`schedule_date_id`);

--
-- Индексы таблицы `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `semester_id` (`semester_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Индексы таблицы `schedule_dates`
--
ALTER TABLE `schedule_dates`
  ADD PRIMARY KEY (`schedule_date_id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Индексы таблицы `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`semester_id`);

--
-- Индексы таблицы `specialties`
--
ALTER TABLE `specialties`
  ADD PRIMARY KEY (`specialty_id`),
  ADD KEY `faculty_id` (`faculty_id`);

--
-- Индексы таблицы `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `loginS` (`loginS`),
  ADD KEY `group_id` (`group_id`);

--
-- Индексы таблицы `student_groups`
--
ALTER TABLE `student_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `specialty_id` (`specialty_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Индексы таблицы `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- Индексы таблицы `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacher_id`),
  ADD UNIQUE KEY `loginT` (`loginT`),
  ADD KEY `faculty_id` (`faculty_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `faculties`
--
ALTER TABLE `faculties`
  MODIFY `faculty_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `grades`
--
ALTER TABLE `grades`
  MODIFY `grade_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT для таблицы `notes`
--
ALTER TABLE `notes`
  MODIFY `note_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `schedules`
--
ALTER TABLE `schedules`
  MODIFY `schedule_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `schedule_dates`
--
ALTER TABLE `schedule_dates`
  MODIFY `schedule_date_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT для таблицы `semesters`
--
ALTER TABLE `semesters`
  MODIFY `semester_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `specialties`
--
ALTER TABLE `specialties`
  MODIFY `specialty_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `student_groups`
--
ALTER TABLE `student_groups`
  MODIFY `group_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacher_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `faculties`
--
ALTER TABLE `faculties`
  ADD CONSTRAINT `faculties_ibfk_1` FOREIGN KEY (`maxCourse`) REFERENCES `courses` (`course_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`schedule_date_id`) REFERENCES `schedule_dates` (`schedule_date_id`);

--
-- Ограничения внешнего ключа таблицы `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`schedule_date_id`) REFERENCES `schedule_dates` (`schedule_date_id`);

--
-- Ограничения внешнего ключа таблицы `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`semester_id`),
  ADD CONSTRAINT `schedules_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  ADD CONSTRAINT `schedules_ibfk_3` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`),
  ADD CONSTRAINT `schedules_ibfk_4` FOREIGN KEY (`group_id`) REFERENCES `student_groups` (`group_id`);

--
-- Ограничения внешнего ключа таблицы `schedule_dates`
--
ALTER TABLE `schedule_dates`
  ADD CONSTRAINT `schedule_dates_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`);

--
-- Ограничения внешнего ключа таблицы `specialties`
--
ALTER TABLE `specialties`
  ADD CONSTRAINT `specialties_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`faculty_id`);

--
-- Ограничения внешнего ключа таблицы `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `student_groups` (`group_id`);

--
-- Ограничения внешнего ключа таблицы `student_groups`
--
ALTER TABLE `student_groups`
  ADD CONSTRAINT `student_groups_ibfk_1` FOREIGN KEY (`specialty_id`) REFERENCES `specialties` (`specialty_id`),
  ADD CONSTRAINT `student_groups_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- Ограничения внешнего ключа таблицы `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`faculty_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
