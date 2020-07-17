-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 17. Jul 2020 um 21:20
-- Server-Version: 10.4.13-MariaDB
-- PHP-Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr10_patrickm_biglibrary`
--
CREATE DATABASE IF NOT EXISTS `cr10_patrickm_biglibrary` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cr10_patrickm_biglibrary`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `author`
--

INSERT INTO `author` (`author_id`, `first_name`, `last_name`) VALUES
(1, 'FirstnameAuthor1', 'LastnameAuthor1'),
(2, 'FirstnameAuthor2', 'LastnameAuthor2'),
(3, 'FirstnameAuthor3', 'LastnameAuthor3'),
(4, 'FirstnameAuthor4', 'LastnameAuthor4'),
(5, 'FirstnameAuthor5', 'LastnameAuthor5');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `media`
--

CREATE TABLE `media` (
  `media_id` int(100) NOT NULL,
  `title` varchar(50) NOT NULL,
  `ISBN` int(13) NOT NULL,
  `availability` enum('yes','no') DEFAULT 'yes',
  `fk_publisher_id` int(11) DEFAULT NULL,
  `fk_author_id` int(11) DEFAULT NULL,
  `fk_type_id` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `publish_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `media`
--

INSERT INTO `media` (`media_id`, `title`, `ISBN`, `availability`, `fk_publisher_id`, `fk_author_id`, `fk_type_id`, `image_url`, `publish_date`) VALUES
(1, 'Media1', 2147483647, 'yes', 1, 3, 2, 'https://sommerrodelbahn-freizeithugl.de/images/Bilder/Galerien/placeholder.png', '2001-11-21'),
(2, 'Media2', 2147483647, 'no', 1, 3, 3, 'https://sommerrodelbahn-freizeithugl.de/images/Bilder/Galerien/placeholder.png', '2000-05-05'),
(6, 'Media3', 12315888, 'yes', 3, 5, 1, 'https://sommerrodelbahn-freizeithugl.de/images/Bilder/Galerien/placeholder.png', '1996-03-21'),
(7, 'Media4', 23565655, 'no', 1, 5, 1, 'https://sommerrodelbahn-freizeithugl.de/images/Bilder/Galerien/placeholder.png', '1998-03-21'),
(8, 'Media5', 2147483647, 'yes', 1, 1, 1, 'https://sommerrodelbahn-freizeithugl.de/images/Bilder/Galerien/placeholder.png', '1951-05-26'),
(9, 'Media6', 232111212, 'yes', 1, 1, 1, 'https://sommerrodelbahn-freizeithugl.de/images/Bilder/Galerien/placeholder.png', '1960-07-21'),
(10, 'Media7', 2147483647, 'yes', 1, 1, 1, 'https://sommerrodelbahn-freizeithugl.de/images/Bilder/Galerien/placeholder.png', '1960-11-21'),
(11, 'Media8', 1232133323, 'yes', 1, 2, 1, 'https://sommerrodelbahn-freizeithugl.de/images/Bilder/Galerien/placeholder.png', '1996-03-21'),
(12, 'Media9', 2147483647, 'yes', 1, 2, 1, 'https://sommerrodelbahn-freizeithugl.de/images/Bilder/Galerien/placeholder.png', '1996-07-21'),
(13, 'Media10', 1323232322, 'no', 1, 2, 1, 'https://sommerrodelbahn-freizeithugl.de/images/Bilder/Galerien/placeholder.png', '1997-05-21');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `media_type`
--

CREATE TABLE `media_type` (
  `type_id` int(20) NOT NULL,
  `type_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `media_type`
--

INSERT INTO `media_type` (`type_id`, `type_name`) VALUES
(1, 'BOOK'),
(2, 'DVD'),
(3, 'CD');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `publisher`
--

CREATE TABLE `publisher` (
  `publisher_id` int(20) NOT NULL,
  `publisher_name` varchar(50) NOT NULL,
  `fk_size_id` int(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `publisher`
--

INSERT INTO `publisher` (`publisher_id`, `publisher_name`, `fk_size_id`, `address`) VALUES
(1, 'Publisher1', 1, 'address1, address1, address1'),
(2, 'Publisher2', 1, 'address2, address2, address2'),
(3, 'Publisher3', 1, 'address3, address3, address3');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `publisher_size`
--

CREATE TABLE `publisher_size` (
  `size_id` int(20) NOT NULL,
  `size_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `publisher_size`
--

INSERT INTO `publisher_size` (`size_id`, `size_type`) VALUES
(1, 'big'),
(2, 'medium'),
(3, 'small');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indizes für die Tabelle `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`media_id`),
  ADD KEY `fk_publisher_id` (`fk_publisher_id`),
  ADD KEY `fk_author_id` (`fk_author_id`),
  ADD KEY `fk_type_id` (`fk_type_id`);

--
-- Indizes für die Tabelle `media_type`
--
ALTER TABLE `media_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indizes für die Tabelle `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisher_id`),
  ADD KEY `fk_size_id` (`fk_size_id`);

--
-- Indizes für die Tabelle `publisher_size`
--
ALTER TABLE `publisher_size`
  ADD PRIMARY KEY (`size_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `author`
--
ALTER TABLE `author`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `media`
--
ALTER TABLE `media`
  MODIFY `media_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT für Tabelle `media_type`
--
ALTER TABLE `media_type`
  MODIFY `type_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `publisher`
--
ALTER TABLE `publisher`
  MODIFY `publisher_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `publisher_size`
--
ALTER TABLE `publisher_size`
  MODIFY `size_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`fk_publisher_id`) REFERENCES `publisher` (`publisher_id`),
  ADD CONSTRAINT `media_ibfk_2` FOREIGN KEY (`fk_author_id`) REFERENCES `author` (`author_id`),
  ADD CONSTRAINT `media_ibfk_3` FOREIGN KEY (`fk_type_id`) REFERENCES `media_type` (`type_id`);

--
-- Constraints der Tabelle `publisher`
--
ALTER TABLE `publisher`
  ADD CONSTRAINT `publisher_ibfk_1` FOREIGN KEY (`fk_size_id`) REFERENCES `publisher_size` (`size_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
