-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-04-2025 a las 23:55:38
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `vinateria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcanal`
--

CREATE TABLE `tcanal` (
  `claveCanal` int(11) NOT NULL,
  `nombreCanal` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcliente`
--

CREATE TABLE `tcliente` (
  `idCliente` int(11) NOT NULL,
  `claveCanal` int(11) NOT NULL,
  `nombreOds` varchar(40) NOT NULL,
  `rfc` char(13) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `calleNum` varchar(40) NOT NULL,
  `colonia` varchar(20) NOT NULL,
  `estado` varchar(21) NOT NULL,
  `cPostal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmarca`
--

CREATE TABLE `tmarca` (
  `idMarca` int(11) NOT NULL,
  `nombreMarca` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tmarca`
--

INSERT INTO `tmarca` (`idMarca`, `nombreMarca`) VALUES
(1, 'Centenario'),
(7, 'Kosako'),
(4, 'Rancho Escondido'),
(2, 'Santo Tomás'),
(6, 'Tonayan');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `torigen`
--

CREATE TABLE `torigen` (
  `idOrigen` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `torigen`
--

INSERT INTO `torigen` (`idOrigen`, `descripcion`) VALUES
(3, 'Brazil'),
(2, 'Colombia'),
(1, 'Inglaterra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tpresentacion`
--

CREATE TABLE `tpresentacion` (
  `mililitros` int(11) NOT NULL CHECK (`mililitros` > 0),
  `numporcaja` int(11) NOT NULL CHECK (`numporcaja` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tpresentacion`
--

INSERT INTO `tpresentacion` (`mililitros`, `numporcaja`) VALUES
(500, 6),
(750, 8),
(1000, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tsabor`
--

CREATE TABLE `tsabor` (
  `idSabor` int(11) NOT NULL,
  `descripcion` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tsabor`
--

INSERT INTO `tsabor` (`idSabor`, `descripcion`) VALUES
(3, 'Agrio'),
(1, 'Amargo'),
(2, 'Dulce');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ttipo`
--

CREATE TABLE `ttipo` (
  `idTipo` int(11) NOT NULL,
  `descripcion` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ttipo`
--

INSERT INTO `ttipo` (`idTipo`, `descripcion`) VALUES
(3, 'Blanco'),
(2, 'Rosado'),
(1, 'Tinto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tvino`
--

CREATE TABLE `tvino` (
  `claveVino` int(11) NOT NULL,
  `claveContabilidad` int(11) NOT NULL,
  `abreviatura` varchar(8) NOT NULL,
  `idMarca` int(11) NOT NULL,
  `idOrigen` int(11) NOT NULL,
  `idSabor` int(11) NOT NULL,
  `idTipo` int(11) NOT NULL,
  `mililitros` int(11) NOT NULL,
  `numporcaja` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `precio` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tvino`
--

INSERT INTO `tvino` (`claveVino`, `claveContabilidad`, `abreviatura`, `idMarca`, `idOrigen`, `idSabor`, `idTipo`, `mililitros`, `numporcaja`, `nombre`, `precio`) VALUES
(1, 4568, 'ksk', 7, 2, 2, 1, 1000, 12, 'kpremium', 300),
(2, 2255, 'RE', 4, 3, 3, 2, 500, 6, 'Ranch', 100),
(3, 1308, 'ST', 2, 1, 1, 3, 750, 8, 'Santo', 200);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tcanal`
--
ALTER TABLE `tcanal`
  ADD PRIMARY KEY (`claveCanal`),
  ADD UNIQUE KEY `nombreCanal` (`nombreCanal`);

--
-- Indices de la tabla `tcliente`
--
ALTER TABLE `tcliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD UNIQUE KEY `nombreOds` (`nombreOds`),
  ADD UNIQUE KEY `rfc` (`rfc`),
  ADD KEY `claveCanal` (`claveCanal`);

--
-- Indices de la tabla `tmarca`
--
ALTER TABLE `tmarca`
  ADD PRIMARY KEY (`idMarca`),
  ADD UNIQUE KEY `nombreMarca` (`nombreMarca`);

--
-- Indices de la tabla `torigen`
--
ALTER TABLE `torigen`
  ADD PRIMARY KEY (`idOrigen`),
  ADD UNIQUE KEY `descripcion` (`descripcion`);

--
-- Indices de la tabla `tpresentacion`
--
ALTER TABLE `tpresentacion`
  ADD PRIMARY KEY (`mililitros`,`numporcaja`);

--
-- Indices de la tabla `tsabor`
--
ALTER TABLE `tsabor`
  ADD PRIMARY KEY (`idSabor`),
  ADD UNIQUE KEY `descripcion` (`descripcion`);

--
-- Indices de la tabla `ttipo`
--
ALTER TABLE `ttipo`
  ADD PRIMARY KEY (`idTipo`),
  ADD UNIQUE KEY `descripcion` (`descripcion`);

--
-- Indices de la tabla `tvino`
--
ALTER TABLE `tvino`
  ADD PRIMARY KEY (`claveVino`),
  ADD KEY `idMarca` (`idMarca`),
  ADD KEY `idOrigen` (`idOrigen`),
  ADD KEY `idSabor` (`idSabor`),
  ADD KEY `idTipo` (`idTipo`),
  ADD KEY `mililitros` (`mililitros`,`numporcaja`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tcanal`
--
ALTER TABLE `tcanal`
  MODIFY `claveCanal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tcliente`
--
ALTER TABLE `tcliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tmarca`
--
ALTER TABLE `tmarca`
  MODIFY `idMarca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `torigen`
--
ALTER TABLE `torigen`
  MODIFY `idOrigen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tsabor`
--
ALTER TABLE `tsabor`
  MODIFY `idSabor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ttipo`
--
ALTER TABLE `ttipo`
  MODIFY `idTipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tvino`
--
ALTER TABLE `tvino`
  MODIFY `claveVino` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tcliente`
--
ALTER TABLE `tcliente`
  ADD CONSTRAINT `tcliente_ibfk_1` FOREIGN KEY (`claveCanal`) REFERENCES `tcanal` (`claveCanal`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tvino`
--
ALTER TABLE `tvino`
  ADD CONSTRAINT `tvino_ibfk_1` FOREIGN KEY (`idMarca`) REFERENCES `tmarca` (`idMarca`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tvino_ibfk_2` FOREIGN KEY (`idOrigen`) REFERENCES `torigen` (`idOrigen`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tvino_ibfk_3` FOREIGN KEY (`idSabor`) REFERENCES `tsabor` (`idSabor`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tvino_ibfk_4` FOREIGN KEY (`idTipo`) REFERENCES `ttipo` (`idTipo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tvino_ibfk_5` FOREIGN KEY (`mililitros`,`numporcaja`) REFERENCES `tpresentacion` (`mililitros`, `numporcaja`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
