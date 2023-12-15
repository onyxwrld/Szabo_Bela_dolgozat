-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Dec 15. 10:30
-- Kiszolgáló verziója: 10.4.24-MariaDB
-- PHP verzió: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `szinhazdb`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szinhaz`
--

CREATE TABLE `szinhaz` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `percentage` int(2) NOT NULL,
  `code` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `szinhaz`
--

INSERT INTO `szinhaz` (`id`, `title`, `percentage`, `code`) VALUES
(1, 'szinhaz teszt', 56, 'SKPR-122558'),
(2, 'szinhaz teszt 2', 67, 'BLPR-122555'),
(3, 'szinhaz teszt 3', 14, 'BLET-122552'),
(20, 'asd', 23, 'BBBB-123456'),
(21, 'a', 10, 'BSBS-123456');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `szinhaz`
--
ALTER TABLE `szinhaz`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `szinhaz`
--
ALTER TABLE `szinhaz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
