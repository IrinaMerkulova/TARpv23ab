-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 05 2024 г., 21:05
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `hotellsandakovr`
--

DELIMITER $$
--
-- Процедуры
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddReservation` (IN `date_in` DATE, IN `date_out` DATE, IN `made_by` VARCHAR(20), IN `guest_id` INT)   BEGIN
    INSERT INTO reservation(date_in, date_out, made_by, guest_id)
    VALUES (date_in, date_out, made_by, guest_id);
    
    -- Опционально: Возврат всех бронирований после добавления нового
    SELECT * FROM reservation;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `guest`
--

CREATE TABLE `guest` (
  `id` int(11) NOT NULL,
  `first_name` varchar(80) DEFAULT NULL,
  `last_name` varchar(80) DEFAULT NULL,
  `member_since` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `guest`
--

INSERT INTO `guest` (`id`, `first_name`, `last_name`, `member_since`) VALUES
(1, 'Roman', 'Sandakov', '2024-02-19'),
(2, 'Alina', 'Ivanova', '2023-08-15'),
(3, 'Dmitry', 'Petrov', '2022-11-30'),
(4, 'Olga', 'Sidorova', '2023-05-10'),
(5, 'Ivan', 'Smirnov', '2023-12-25');

-- --------------------------------------------------------

--
-- Структура таблицы `hosted_at`
--

CREATE TABLE `hosted_at` (
  `id` int(11) NOT NULL,
  `guest_id` int(11) DEFAULT NULL,
  `occupied_room_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `hosted_at`
--

INSERT INTO `hosted_at` (`id`, `guest_id`, `occupied_room_id`) VALUES
(1, 1, 5),
(2, 2, 3),
(3, 3, 1),
(4, 4, 4),
(5, 5, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `occupied_room`
--

CREATE TABLE `occupied_room` (
  `id` int(11) NOT NULL,
  `check_in` datetime DEFAULT NULL,
  `check_out` datetime DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `reservation_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `occupied_room`
--

INSERT INTO `occupied_room` (`id`, `check_in`, `check_out`, `room_id`, `reservation_id`) VALUES
(1, '2024-05-23 11:35:00', '2024-05-30 12:19:20', 1, 1),
(2, '2024-05-01 14:00:00', '2024-05-10 10:00:00', 2, 2),
(3, '2024-06-12 16:45:30', '2024-06-20 11:30:15', 3, 3),
(4, '2024-07-15 17:20:00', '2024-07-25 12:45:00', 4, 4),
(5, '2024-08-05 13:30:00', '2024-08-15 09:50:00', 5, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `date_in` date DEFAULT NULL,
  `date_out` date DEFAULT NULL,
  `made_by` varchar(20) DEFAULT NULL,
  `guest_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `reservation`
--

INSERT INTO `reservation` (`id`, `date_in`, `date_out`, `made_by`, `guest_id`) VALUES
(1, '2024-04-16', '2024-04-26', 'Sunrise Inn', 1),
(2, '2024-05-01', '2024-05-10', 'Ocean Breeze Hotel', 2),
(3, '2024-06-12', '2024-06-20', 'Mountain View Lodge', 3),
(4, '2024-07-15', '2024-07-25', 'City Central Hotel', 4),
(5, '2024-08-05', '2024-08-15', 'Grand Stay Inn', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `reserved_room`
--

CREATE TABLE `reserved_room` (
  `id` int(11) NOT NULL,
  `number_of_rooms` int(11) DEFAULT NULL,
  `room_type_id` int(11) DEFAULT NULL,
  `reservation_id` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `reserved_room`
--

INSERT INTO `reserved_room` (`id`, `number_of_rooms`, `room_type_id`, `reservation_id`, `status`) VALUES
(1, 5, 1, 1, 'suletud'),
(2, 13, 1, 1, 'avatud'),
(3, 24, 1, 1, 'avatud'),
(4, 52, 1, 1, 'suletud'),
(5, 15, 1, 1, 'avatud');

-- --------------------------------------------------------

--
-- Структура таблицы `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `number` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `smoke` bit(1) DEFAULT NULL,
  `room_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `room`
--

INSERT INTO `room` (`id`, `number`, `name`, `status`, `smoke`, `room_type_id`) VALUES
(1, 'A1', 'sd', 'open', b'1', 1),
(2, 'B12', 'ma', 'close', b'0', 3),
(3, 'C52', 'mv', 'open', b'0', 2),
(4, 'B9', 'jt', 'open', b'1', 4),
(5, 'A22', 'ir', 'close', b'0', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `room_type`
--

CREATE TABLE `room_type` (
  `id` int(11) NOT NULL,
  `description` varchar(80) DEFAULT NULL,
  `max_capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `room_type`
--

INSERT INTO `room_type` (`id`, `description`, `max_capacity`) VALUES
(0, 'basic', 1),
(1, 'basic', 1),
(2, 'comfort', 2),
(3, 'comfort+', 3),
(4, 'lux', 4),
(5, 'president', 5);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `hosted_at`
--
ALTER TABLE `hosted_at`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guest_id` (`guest_id`),
  ADD KEY `occupied_room_id` (`occupied_room_id`);

--
-- Индексы таблицы `occupied_room`
--
ALTER TABLE `occupied_room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `reservation_id` (`reservation_id`);

--
-- Индексы таблицы `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guest_id` (`guest_id`);

--
-- Индексы таблицы `reserved_room`
--
ALTER TABLE `reserved_room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_type_id` (`room_type_id`),
  ADD KEY `reservation_id` (`reservation_id`);

--
-- Индексы таблицы `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_type_id` (`room_type_id`);

--
-- Индексы таблицы `room_type`
--
ALTER TABLE `room_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `guest`
--
ALTER TABLE `guest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `hosted_at`
--
ALTER TABLE `hosted_at`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `occupied_room`
--
ALTER TABLE `occupied_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `reserved_room`
--
ALTER TABLE `reserved_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `hosted_at`
--
ALTER TABLE `hosted_at`
  ADD CONSTRAINT `hosted_at_ibfk_1` FOREIGN KEY (`guest_id`) REFERENCES `guest` (`id`),
  ADD CONSTRAINT `hosted_at_ibfk_2` FOREIGN KEY (`occupied_room_id`) REFERENCES `occupied_room` (`id`);

--
-- Ограничения внешнего ключа таблицы `occupied_room`
--
ALTER TABLE `occupied_room`
  ADD CONSTRAINT `occupied_room_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`),
  ADD CONSTRAINT `occupied_room_ibfk_2` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`);

--
-- Ограничения внешнего ключа таблицы `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`guest_id`) REFERENCES `guest` (`id`);

--
-- Ограничения внешнего ключа таблицы `reserved_room`
--
ALTER TABLE `reserved_room`
  ADD CONSTRAINT `reserved_room_ibfk_1` FOREIGN KEY (`room_type_id`) REFERENCES `room_type` (`id`),
  ADD CONSTRAINT `reserved_room_ibfk_2` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`);

--
-- Ограничения внешнего ключа таблицы `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`room_type_id`) REFERENCES `room_type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
