-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Aprill 16, 2024 kell 11:14 EL
-- Serveri versioon: 10.4.27-MariaDB
-- PHP versioon: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `hotellallik`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `guest`
--

CREATE TABLE `guest` (
  `id` int(11) NOT NULL,
  `first_name` varchar(80) DEFAULT NULL,
  `last_name` varchar(80) DEFAULT NULL,
  `member_since` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `guest`
--

INSERT INTO `guest` (`id`, `first_name`, `last_name`, `member_since`) VALUES
(1, 'Valeria', 'Allik', '2024-04-16'),
(2, 'Daria', 'Halchenko', '2024-04-17'),
(3, 'Alexandra', 'Semjonova', '2024-05-06'),
(4, 'Maria', 'Gorbunova', '2024-04-29'),
(5, 'Martin', 'Sild', '2024-05-30');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `hosted_at`
--

CREATE TABLE `hosted_at` (
  `id` int(11) NOT NULL,
  `guest_id` int(11) DEFAULT NULL,
  `occupied_room_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `hosted_at`
--

INSERT INTO `hosted_at` (`id`, `guest_id`, `occupied_room_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `occupied_room`
--

CREATE TABLE `occupied_room` (
  `id` int(11) NOT NULL,
  `check_in` datetime DEFAULT NULL,
  `check_out` datetime DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `reservation_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `occupied_room`
--

INSERT INTO `occupied_room` (`id`, `check_in`, `check_out`, `room_id`, `reservation_id`) VALUES
(1, '2024-04-23 15:30:45', '2024-05-01 12:15:40', 1, 1),
(2, '2024-04-17 05:43:19', '2024-04-17 14:31:36', 2, 2),
(3, '2024-04-09 09:37:19', '2024-04-17 07:14:38', 3, 3),
(4, '2024-04-02 08:40:40', '2024-04-29 06:21:40', 4, 4),
(5, '2024-04-17 07:18:17', '2024-04-25 05:21:36', 5, 5);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `date_in` date DEFAULT NULL,
  `date_out` date DEFAULT NULL,
  `made_by` varchar(20) DEFAULT NULL,
  `guest_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `reservation`
--

INSERT INTO `reservation` (`id`, `date_in`, `date_out`, `made_by`, `guest_id`) VALUES
(1, '2024-04-16', '2024-04-26', 'TallinnHotell', 1),
(2, '2024-04-01', '2024-04-05', 'TallinnHotell', 2),
(3, '2024-04-17', '2024-04-20', 'TallinnHotell', 3),
(4, '2024-04-01', '2024-04-11', 'TallinnHotell', 4),
(5, '2024-04-24', '2024-04-25', 'TallinnHotell', 5);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `reserved_room`
--

CREATE TABLE `reserved_room` (
  `id` int(11) NOT NULL,
  `number_of_rooms` int(11) DEFAULT NULL,
  `room_type_id` int(11) DEFAULT NULL,
  `reservation_id` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `reserved_room`
--

INSERT INTO `reserved_room` (`id`, `number_of_rooms`, `room_type_id`, `reservation_id`, `status`) VALUES
(1, 505, 1, 1, 'puhastamine'),
(2, 222, 1, 1, 'puhastamine'),
(3, 333, 2, 2, 'puhastamine'),
(4, 444, 3, 3, 'puhastamine'),
(5, 555, 4, 4, 'puhastamine'),
(6, 666, 5, 5, 'puhastamine');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `room`
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
-- Andmete tõmmistamine tabelile `room`
--

INSERT INTO `room` (`id`, `number`, `name`, `status`, `smoke`, `room_type_id`) VALUES
(1, 'E10', 'sv', 'open', b'1', 1),
(2, 'B33', 'gg', 'close', b'1', 1),
(3, 'T12', 'rt', 'open', b'0', 2),
(4, 'G55', 'iu', 'close', b'1', 3),
(5, 'S77', 'er', 'open', b'1', 4),
(6, 'H34', 'kj', 'open', b'1', 5);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `room_type`
--

CREATE TABLE `room_type` (
  `id` int(11) NOT NULL,
  `description` varchar(80) DEFAULT NULL,
  `max_capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `room_type`
--

INSERT INTO `room_type` (`id`, `description`, `max_capacity`) VALUES
(1, 'super lux', 1),
(2, 'super lux', 1),
(3, 'standart', 2),
(4, 'bedroom', 3),
(5, 'apartment', 4);

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`id`);

--
-- Indeksid tabelile `hosted_at`
--
ALTER TABLE `hosted_at`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guest_id` (`guest_id`),
  ADD KEY `occupied_room_id` (`occupied_room_id`);

--
-- Indeksid tabelile `occupied_room`
--
ALTER TABLE `occupied_room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `reservation_id` (`reservation_id`);

--
-- Indeksid tabelile `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guest_id` (`guest_id`);

--
-- Indeksid tabelile `reserved_room`
--
ALTER TABLE `reserved_room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_type_id` (`room_type_id`),
  ADD KEY `reservation_id` (`reservation_id`);

--
-- Indeksid tabelile `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_type_id` (`room_type_id`);

--
-- Indeksid tabelile `room_type`
--
ALTER TABLE `room_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `guest`
--
ALTER TABLE `guest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT tabelile `hosted_at`
--
ALTER TABLE `hosted_at`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT tabelile `occupied_room`
--
ALTER TABLE `occupied_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT tabelile `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT tabelile `reserved_room`
--
ALTER TABLE `reserved_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT tabelile `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT tabelile `room_type`
--
ALTER TABLE `room_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `hosted_at`
--
ALTER TABLE `hosted_at`
  ADD CONSTRAINT `hosted_at_ibfk_1` FOREIGN KEY (`guest_id`) REFERENCES `guest` (`id`),
  ADD CONSTRAINT `hosted_at_ibfk_2` FOREIGN KEY (`occupied_room_id`) REFERENCES `occupied_room` (`id`);

--
-- Piirangud tabelile `occupied_room`
--
ALTER TABLE `occupied_room`
  ADD CONSTRAINT `occupied_room_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`),
  ADD CONSTRAINT `occupied_room_ibfk_2` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`);

--
-- Piirangud tabelile `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`guest_id`) REFERENCES `guest` (`id`);

--
-- Piirangud tabelile `reserved_room`
--
ALTER TABLE `reserved_room`
  ADD CONSTRAINT `reserved_room_ibfk_1` FOREIGN KEY (`room_type_id`) REFERENCES `room_type` (`id`),
  ADD CONSTRAINT `reserved_room_ibfk_2` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`);

--
-- Piirangud tabelile `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`room_type_id`) REFERENCES `room_type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
