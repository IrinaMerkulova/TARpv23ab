-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Aprill 16, 2024 kell 11:13 EL
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
-- Andmebaas: `hotel_aivanov`
--

DELIMITER $$
--
-- Toimingud
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_table` (IN `n_number` VARCHAR(40), IN `n_name` VARCHAR(40), IN `n_status` VARCHAR(40), IN `n_smoke` BOOLEAN, IN `n_room_type_id` INT)  COMMENT 'adds new room' BEGIN
INSERT INTO room (number,name,status,smoke,room_type_id)
VALUES (n_number,n_name,n_status,n_smoke,n_room_type_id);
SELECT * FROM room;
END$$

DELIMITER ;

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
(1, 'Vasili', 'Egorov', '2009-12-02'),
(2, 'Karl', 'Melik', '2015-03-07'),
(3, 'Petr', 'Efremov', '2013-03-05'),
(4, 'Rahid', 'Uss', '2011-03-01'),
(5, 'Allah', 'Akbar', '2008-03-11');

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
(1, '2019-02-24 12:00:00', '2019-03-24 06:00:00', 1, 1),
(2, '2018-02-24 07:00:00', '2018-03-24 06:00:00', 2, 2),
(3, '2017-02-24 11:00:00', '2017-03-24 06:00:00', 3, 3),
(4, '2016-02-24 10:00:00', '2016-03-24 06:00:00', 4, 4),
(5, '2015-02-24 09:00:00', '2015-03-24 06:00:00', 5, 5);

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
(1, '2019-02-24', '2019-03-24', 'Human Worker', 1),
(2, '2018-02-24', '2018-03-24', 'Human Worker', 2),
(3, '2017-02-24', '2017-03-24', 'Human Worker', 3),
(4, '2016-02-24', '2016-03-24', 'Human Worker', 4),
(5, '2014-02-24', '2014-03-24', 'Human Worker', 5);

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
(1, 2, 1, 1, 'reserved'),
(2, 3, 2, 2, 'free'),
(3, 4, 3, 3, 'free'),
(4, 1, 1, 4, 'reserved'),
(5, 2, 1, 5, 'reserved');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `number` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `status` varchar(40) DEFAULT NULL,
  `smoke` bit(1) DEFAULT NULL,
  `room_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `room`
--

INSERT INTO `room` (`id`, `number`, `name`, `status`, `smoke`, `room_type_id`) VALUES
(1, 'E11', 'dv', 'close', b'0', 2),
(2, 'E12', 'se', 'close', b'0', 3),
(3, 'E13', 'nh', 'open', b'0', 4),
(4, 'E14', 'tt', 'open', b'1', 5),
(5, 'E10', 'sv', 'open', b'1', 1),
(8, 'E17', 're', 'open', b'1', 3);

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
(1, 'lux', 1),
(2, 'ultra lux', 5),
(3, 'micro lux', 1),
(4, 'washed up lux', 2),
(5, 'omega lux', 8);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT tabelile `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
