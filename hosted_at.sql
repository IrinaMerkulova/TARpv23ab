-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Aprill 16, 2024 kell 11:32 EL
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
-- Andmebaas: `hotel.sql`
--

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
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `hosted_at`
--
ALTER TABLE `hosted_at`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guest_id` (`guest_id`),
  ADD KEY `occupied_room_id` (`occupied_room_id`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `hosted_at`
--
ALTER TABLE `hosted_at`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `hosted_at`
--
ALTER TABLE `hosted_at`
  ADD CONSTRAINT `hosted_at_ibfk_1` FOREIGN KEY (`guest_id`) REFERENCES `guest` (`id`),
  ADD CONSTRAINT `hosted_at_ibfk_2` FOREIGN KEY (`occupied_room_id`) REFERENCES `occupied_room` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
