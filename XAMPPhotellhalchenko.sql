-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 16 2024 г., 11:22
-- Версия сервера: 10.4.27-MariaDB
-- Версия PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `hotellhalchenko`
--

DELIMITER $$
--
-- Процедуры
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `guestLisamine` (IN `uusfirstname` VARCHAR(80), IN `uuslastname` VARCHAR(80), IN `uusmembersince` DATE)  COMMENT 'htr' BEGIN
INSERT INTO guest (first_name, last_name, member_since)
VALUES(uusfirstname, uuslastname, uusmembersince) ;
SELECT * FROM guest;
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
(1, 'Daria', 'Halchenko', '2024-10-04'),
(2, 'Sofiia', 'Halchenko', '2024-04-24'),
(3, 'Valeria', 'Allik', '2024-04-23'),
(4, 'Darja', 'Jermitsova', '2024-04-21'),
(5, 'Anton', 'Ivanov', '2024-04-17'),
(6, 'Bogdan', 'Sergatsov', '2024-10-11');

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
(1, 1, 1),
(2, 2, 5),
(3, 4, 2),
(4, 5, 3),
(5, 3, 4);

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
(1, '2024-09-23 12:30:56', '2024-10-24 13:45:13', 1, 1),
(2, '2024-04-26 11:23:39', '2024-05-16 11:23:36', 2, 3),
(3, '2024-04-26 14:23:36', '2024-04-27 14:23:36', 2, 5),
(4, '2024-04-18 11:23:36', '2024-04-30 11:23:36', 5, 4),
(5, '2024-04-26 17:23:36', '2024-04-29 17:23:36', 1, 1);

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
(1, '2024-10-11', '2025-10-12', 'Eleon', 1),
(2, '2024-10-11', '2024-04-17', 'Anton', 2),
(3, '2024-05-16', '2024-05-16', 'Irina', 3),
(4, '2024-04-17', '2024-04-26', 'Vlad', 4),
(5, '2024-04-24', '2024-04-30', 'Maksim', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `reserved_room`
--

CREATE TABLE `reserved_room` (
  `id` int(11) NOT NULL,
  `number_of_rooms` int(11) DEFAULT NULL,
  `room_type_id` int(11) DEFAULT NULL,
  `reservation_id` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `reserved_room`
--

INSERT INTO `reserved_room` (`id`, `number_of_rooms`, `room_type_id`, `reservation_id`, `status`) VALUES
(1, 101, 1, 1, 'puhastamine'),
(2, 102, 1, 1, 'open'),
(3, 103, 2, 4, 'open'),
(4, 211, 4, 3, 'open'),
(5, 106, 3, 5, 'open');

-- --------------------------------------------------------

--
-- Структура таблицы `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `number` varchar(10) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `smoke` bit(1) DEFAULT NULL,
  `room_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `room`
--

INSERT INTO `room` (`id`, `number`, `name`, `status`, `smoke`, `room_type_id`) VALUES
(1, 'E10', 'sv', 'open', b'1', 1),
(2, 'B220', 'Oksana', 'open', b'0', 2),
(3, 'B340', 'Valeria', 'open', b'0', 3),
(4, 'E312', 'Maks', 'open', b'0', 4),
(5, 'A13', 'Vlad', 'open', b'0', 5);

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
(1, ' super lux', 1),
(2, 'standard', 35),
(3, 'luksus', 15),
(4, 'presidendi sviit', 10),
(5, 'tavaline', 100);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
-- AUTO_INCREMENT для таблицы `room_type`
--
ALTER TABLE `room_type`
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
