SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `film_test` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `film_test`;

CREATE TABLE `actor` (
  `ID_Actor` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `actor` (`ID_Actor`, `name`) VALUES
(1, 'Yoo Ji-tae'),
(2, 'Choi Min-sik'),
(3, 'Arnold Schwarzenegger'),
(4, 'Daniel Brühl'),
(5, 'Jacob Tremblay'),
(6, 'Brie Larson'),
(7, 'Linda Hamilton');

CREATE TABLE `film` (
  `ID_Film` int(11) NOT NULL,
  `name` text NOT NULL,
  `date` date NOT NULL,
  `country` text NOT NULL,
  `quality` int(11) NOT NULL,
  `resolution` text NOT NULL,
  `codec` text NOT NULL,
  `producer` text NOT NULL,
  `director` text NOT NULL,
  `carrier` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `film` (`ID_Film`, `name`, `date`, `country`, `quality`, `resolution`, `codec`, `producer`, `director`, `carrier`) VALUES
(1, 'Terminator 2: Judgment Day', '1995-07-22', 'USA', 4, '1080p', 'Codec1', 'prod1', 'James Cameron', 'DVD'),
(2, 'Oldeuboi', '2020-02-20', 'South-Korea', 5, '1080p', 'Codec2', ' prod2', 'Park Chan-wook', 'CD'),
(3, 'Room', '2018-02-24', 'USA', 3, '1080p', 'Codec3', 'prod3', 'Lenny Abrahamson', 'CD'),
(4, 'Rush', '1985-02-21', 'USA', 4, '1080p', 'Codec4', 'prod4', 'on Howard', 'DVD');

CREATE TABLE `film_actor` (
  `id` int(11) NOT NULL,
  `FID_Film` int(11) NOT NULL,
  `FID_Actor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `film_actor` (`id`, `FID_Film`, `FID_Actor`) VALUES
(1, 1, 7),
(2, 2, 1),
(3, 2, 2),
(4, 3, 6),
(5, 3, 5),
(6, 1, 3),
(7, 4, 4);

CREATE TABLE `film_genre` (
  `id` int(11) NOT NULL,
  `FID_Film` int(11) NOT NULL,
  `FID_Genre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `film_genre` (`id`, `FID_Film`, `FID_Genre`) VALUES
(1, 1, 1),
(2, 4, 2),
(3, 3, 3),
(5, 2, 2);

CREATE TABLE `genre` (
  `ID_Genre` int(11) NOT NULL,
  `title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `genre` (`ID_Genre`, `title`) VALUES
(1, 'Action'),
(2, 'Comedy'),
(3, 'Fantasy');


ALTER TABLE `actor`
  ADD PRIMARY KEY (`ID_Actor`);

ALTER TABLE `film`
  ADD PRIMARY KEY (`ID_Film`);

ALTER TABLE `film_actor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FID_Film` (`FID_Film`),
  ADD KEY `FID_Actor` (`FID_Actor`);

ALTER TABLE `film_genre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FID_Film` (`FID_Film`),
  ADD KEY `FID_Film_2` (`FID_Film`),
  ADD KEY `FID_Genre` (`FID_Genre`);

ALTER TABLE `genre`
  ADD PRIMARY KEY (`ID_Genre`);


ALTER TABLE `actor`
  MODIFY `ID_Actor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

ALTER TABLE `film`
  MODIFY `ID_Film` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `film_actor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

ALTER TABLE `film_genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `genre`
  MODIFY `ID_Genre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


ALTER TABLE `film_actor`
  ADD CONSTRAINT `film_actor_ibfk_1` FOREIGN KEY (`FID_Film`) REFERENCES `film` (`ID_Film`),
  ADD CONSTRAINT `film_actor_ibfk_2` FOREIGN KEY (`FID_Actor`) REFERENCES `actor` (`ID_Actor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
