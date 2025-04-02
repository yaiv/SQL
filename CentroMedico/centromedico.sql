-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-04-2025 a las 23:54:47
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
-- Base de datos: `centromedico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tconcepto`
--

CREATE TABLE `tconcepto` (
  `idConcepto` tinyint(4) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tespecialidad`
--

CREATE TABLE `tespecialidad` (
  `idEspecialidad` int(11) NOT NULL,
  `especialidad` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `thistoria`
--

CREATE TABLE `thistoria` (
  `idHistoria` int(11) NOT NULL,
  `fHistoria` datetime NOT NULL,
  `observacion` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `thistoriapaciente`
--

CREATE TABLE `thistoriapaciente` (
  `idHistoria` int(11) NOT NULL,
  `idPaciente` int(11) NOT NULL,
  `idMedico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmedico`
--

CREATE TABLE `tmedico` (
  `idMedico` int(11) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidoP` varchar(50) NOT NULL,
  `apellidoM` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmedicoespecialidad`
--

CREATE TABLE `tmedicoespecialidad` (
  `idMedico` int(11) NOT NULL,
  `idEspecialidad` int(11) NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tpacientes`
--

CREATE TABLE `tpacientes` (
  `idPaciente` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `fNacimiento` date NOT NULL,
  `domicilio` varchar(100) NOT NULL,
  `idPais` char(3) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `observacion` varchar(100) NOT NULL,
  `DNI` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tpago`
--

CREATE TABLE `tpago` (
  `idpago` int(11) NOT NULL,
  `concepto` tinyint(4) NOT NULL,
  `fecha` datetime NOT NULL,
  `monto` decimal(8,2) NOT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `obs` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tpagopaciente`
--

CREATE TABLE `tpagopaciente` (
  `idPago` int(11) NOT NULL,
  `idPaciente` int(11) NOT NULL,
  `idTurno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tpais`
--

CREATE TABLE `tpais` (
  `idPais` char(3) NOT NULL,
  `pais` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tturno`
--

CREATE TABLE `tturno` (
  `idTurno` int(11) NOT NULL,
  `fechaTurno` datetime NOT NULL,
  `estado` smallint(6) NOT NULL,
  `observacion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tturnoestado`
--

CREATE TABLE `tturnoestado` (
  `idEstado` smallint(6) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tturnopaciente`
--

CREATE TABLE `tturnopaciente` (
  `idTurno` int(11) NOT NULL,
  `idPaciente` int(11) NOT NULL,
  `idMedico` int(11) NOT NULL,
  `observacion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tconcepto`
--
ALTER TABLE `tconcepto`
  ADD PRIMARY KEY (`idConcepto`);

--
-- Indices de la tabla `tespecialidad`
--
ALTER TABLE `tespecialidad`
  ADD PRIMARY KEY (`idEspecialidad`);

--
-- Indices de la tabla `thistoria`
--
ALTER TABLE `thistoria`
  ADD PRIMARY KEY (`idHistoria`);

--
-- Indices de la tabla `thistoriapaciente`
--
ALTER TABLE `thistoriapaciente`
  ADD PRIMARY KEY (`idHistoria`,`idPaciente`,`idMedico`);

--
-- Indices de la tabla `tmedico`
--
ALTER TABLE `tmedico`
  ADD PRIMARY KEY (`idMedico`);

--
-- Indices de la tabla `tmedicoespecialidad`
--
ALTER TABLE `tmedicoespecialidad`
  ADD PRIMARY KEY (`idMedico`,`idEspecialidad`);

--
-- Indices de la tabla `tpacientes`
--
ALTER TABLE `tpacientes`
  ADD PRIMARY KEY (`idPaciente`);

--
-- Indices de la tabla `tpago`
--
ALTER TABLE `tpago`
  ADD PRIMARY KEY (`idpago`);

--
-- Indices de la tabla `tpagopaciente`
--
ALTER TABLE `tpagopaciente`
  ADD PRIMARY KEY (`idPago`,`idPaciente`,`idTurno`);

--
-- Indices de la tabla `tpais`
--
ALTER TABLE `tpais`
  ADD PRIMARY KEY (`idPais`);

--
-- Indices de la tabla `tturno`
--
ALTER TABLE `tturno`
  ADD PRIMARY KEY (`idTurno`);

--
-- Indices de la tabla `tturnoestado`
--
ALTER TABLE `tturnoestado`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `tturnopaciente`
--
ALTER TABLE `tturnopaciente`
  ADD PRIMARY KEY (`idTurno`,`idPaciente`,`idMedico`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tconcepto`
--
ALTER TABLE `tconcepto`
  MODIFY `idConcepto` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tespecialidad`
--
ALTER TABLE `tespecialidad`
  MODIFY `idEspecialidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `thistoria`
--
ALTER TABLE `thistoria`
  MODIFY `idHistoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tmedico`
--
ALTER TABLE `tmedico`
  MODIFY `idMedico` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tpacientes`
--
ALTER TABLE `tpacientes`
  MODIFY `idPaciente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tpago`
--
ALTER TABLE `tpago`
  MODIFY `idpago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tturno`
--
ALTER TABLE `tturno`
  MODIFY `idTurno` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
