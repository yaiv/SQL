-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-04-2025 a las 23:53:23
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
-- Base de datos: `pescadeportiva`
--

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `afiliados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `afiliados` (
`Numero de Socio` int(11)
,`Nombre` varchar(25)
,`Apellido Paterno` varchar(20)
,`Apellido Materno` varchar(20)
,`Asociacion` varchar(80)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `capturas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `capturas` (
`Captura` int(11)
,`Socio` varchar(25)
,`Evento` varchar(80)
,`Lugar de Pez` int(11)
,`Hora` datetime
,`Fecha` datetime
,`Captura Avalada` bit(1)
,`Tamaño (cm)` int(11)
,`Referencia` varchar(200)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `comunidades`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `comunidades` (
`Comunidad` int(11)
,`Nombre de Comunidad` varchar(30)
,`Permiso` bit(1)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `eventos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `eventos` (
`Evento` int(11)
,`Nombre de Evento` varchar(80)
,`Asociacion` varchar(80)
,`Tipo de Evento` varchar(50)
,`Maximo de Participantes` int(11)
,`Lugar` varchar(80)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `eventosafiliados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `eventosafiliados` (
`Evento de Afiliado` int(11)
,`Nombre del Evento` varchar(80)
,`Trofeo` varchar(10)
,`Posicion` varchar(10)
,`Socio` varchar(25)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `licencias`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `licencias` (
`id de Licencia` int(11)
,`Licencia` varchar(80)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `lugares`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `lugares` (
`id Lugar` int(11)
,`Nombre del Lugar` varchar(80)
,`Tipo de Lugar` varchar(50)
,`Comunidad` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `peces`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `peces` (
`id de Pez` int(11)
,`Veda` int(11)
,`Nombre de Pez` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `peceslugares`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `peceslugares` (
`id de PezLugar` int(11)
,`Pez` varchar(30)
,`Lugar` varchar(80)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `posiciones`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `posiciones` (
`id de Posicion` int(11)
,`Posicion` varchar(10)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tafiliado`
--

CREATE TABLE `tafiliado` (
  `numSocio` int(11) NOT NULL,
  `nomAfiliado` varchar(25) NOT NULL,
  `aPaterno` varchar(20) NOT NULL,
  `aMaterno` varchar(20) DEFAULT NULL,
  `idAsociacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tafiliado`
--

INSERT INTO `tafiliado` (`numSocio`, `nomAfiliado`, `aPaterno`, `aMaterno`, `idAsociacion`) VALUES
(0, 'Jose', 'Vidal', 'Hernandez', 2),
(1, 'Sebastian', 'Ramos', 'Espinoza', 1),
(2, 'Daniel', 'Gonzales', 'Portilla', 2),
(3, 'Ana', 'Linares', 'Guzman', 3),
(4, 'Yair', 'Guerra', 'Morales', 4),
(5, 'Francisco', 'Ramirez', 'Herrera', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasociacion`
--

CREATE TABLE `tasociacion` (
  `idAsociacion` int(11) NOT NULL,
  `nomAsociacion` varchar(80) NOT NULL,
  `idTipoAsociacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tasociacion`
--

INSERT INTO `tasociacion` (`idAsociacion`, `nomAsociacion`, `idTipoAsociacion`) VALUES
(1, 'Fisherman Team', 1),
(2, 'Game Fish Association', 2),
(3, 'Redes al Viento', 1),
(4, 'Los Curricanes', 2),
(5, 'Nautica Aventura', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcaptura`
--

CREATE TABLE `tcaptura` (
  `idCaptura` int(11) NOT NULL,
  `numSocio` int(11) NOT NULL,
  `idEvento` int(11) NOT NULL,
  `idPezLugar` int(11) NOT NULL,
  `hora` datetime NOT NULL,
  `fecha` datetime NOT NULL,
  `foto` blob DEFAULT NULL,
  `CapAV` bit(1) NOT NULL,
  `Tamaño` int(11) NOT NULL,
  `Referencia` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tcaptura`
--

INSERT INTO `tcaptura` (`idCaptura`, `numSocio`, `idEvento`, `idPezLugar`, `hora`, `fecha`, `foto`, `CapAV`, `Tamaño`, `Referencia`) VALUES
(1, 5, 8, 2, '2011-05-06 00:00:00', '2024-03-23 00:00:00', NULL, b'1', 60, 'Pequeño Tanque de gas'),
(2, 3, 6, 4, '2012-07-09 00:00:00', '2024-07-22 00:00:00', NULL, b'0', 15, 'Medio Subway'),
(3, 1, 10, 2, '0000-00-00 00:00:00', '2024-03-23 00:00:00', NULL, b'1', 18, 'Platano Tabasco'),
(4, 2, 7, 4, '0000-00-00 00:00:00', '2024-07-22 00:00:00', NULL, b'1', 45, 'Machete'),
(5, 4, 9, 5, '2011-05-06 00:00:00', '2024-03-23 00:00:00', NULL, b'1', 100, 'Regla T');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcomunidad`
--

CREATE TABLE `tcomunidad` (
  `idComunidad` int(11) NOT NULL,
  `nomComunidad` varchar(30) NOT NULL,
  `Permiso` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tcomunidad`
--

INSERT INTO `tcomunidad` (`idComunidad`, `nomComunidad`, `Permiso`) VALUES
(1, 'Pescadores el Pelmar', b'1'),
(2, 'Catarroja', b'1'),
(3, 'Silla', b'1'),
(4, 'La lonja de Pescados', b'1'),
(5, 'Bahia de Atlanta', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tevento`
--

CREATE TABLE `tevento` (
  `idEvento` int(11) NOT NULL,
  `nomEvento` varchar(80) NOT NULL,
  `idAsociacion` int(11) NOT NULL,
  `idTipoEvento` int(11) NOT NULL,
  `maxParticipantes` int(11) NOT NULL,
  `idLugar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tevento`
--

INSERT INTO `tevento` (`idEvento`, `nomEvento`, `idAsociacion`, `idTipoEvento`, `maxParticipantes`, `idLugar`) VALUES
(6, 'Peces Felices', 1, 1, 5, 1),
(7, 'Fisher Land', 2, 2, 5, 2),
(8, 'Buscando a Nemo', 3, 2, 5, 3),
(9, 'Buscando a Dori', 4, 2, 5, 4),
(10, 'Aquaman', 5, 2, 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teventoafiliado`
--

CREATE TABLE `teventoafiliado` (
  `idEventoAfiliado` int(11) NOT NULL,
  `idEvento` int(11) NOT NULL,
  `idTrofeo` int(11) NOT NULL,
  `idPosicion` int(11) NOT NULL,
  `numSocio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `teventoafiliado`
--

INSERT INTO `teventoafiliado` (`idEventoAfiliado`, `idEvento`, `idTrofeo`, `idPosicion`, `numSocio`) VALUES
(7, 6, 1, 1, 1),
(8, 7, 2, 2, 5),
(9, 8, 3, 3, 2),
(10, 9, 1, 1, 2),
(11, 10, 2, 2, 4),
(12, 6, 3, 3, 1);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `tipoasociacion`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `tipoasociacion` (
`idAsociacion` int(11)
,`Nombre` varchar(80)
,`Tipo de Asociacion` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `tipoasociaciones`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `tipoasociaciones` (
`id de Tipo de Asociacion` int(11)
,`Nombre de Tipo de Asociacion` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `tipoeventos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `tipoeventos` (
`id de Tipo de Evento` int(11)
,`Nombre de Tipo de Evento` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `tipolugares`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `tipolugares` (
`id de Tipo del Lugar` int(11)
,`Nombre del Tipo del Lugar` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tlicencia`
--

CREATE TABLE `tlicencia` (
  `idLicencia` int(11) NOT NULL,
  `licencia` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tlicencia`
--

INSERT INTO `tlicencia` (`idLicencia`, `licencia`) VALUES
(4, 'Comercial'),
(5, 'Deportiva'),
(2, 'Embarcacion'),
(3, 'Submarina'),
(1, 'Tierra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tlugar`
--

CREATE TABLE `tlugar` (
  `idLugar` int(11) NOT NULL,
  `nomLugar` varchar(80) NOT NULL,
  `idTipoLugar` int(11) NOT NULL,
  `idComunidad` int(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tlugar`
--

INSERT INTO `tlugar` (`idLugar`, `nomLugar`, `idTipoLugar`, `idComunidad`) VALUES
(1, 'Riviera Nayarit', 2, 1),
(2, 'Los Cabos', 3, 5),
(3, 'Boca del Rio', 4, 3),
(4, 'Manzanillo Colima', 3, 4),
(5, 'Canal de Cozumel', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tpez`
--

CREATE TABLE `tpez` (
  `idPez` int(11) NOT NULL,
  `idVeda` int(11) NOT NULL,
  `nomPez` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tpez`
--

INSERT INTO `tpez` (`idPez`, `idVeda`, `nomPez`) VALUES
(1, 1, 'Arenque'),
(2, 2, 'Salmon'),
(3, 3, 'Trucha'),
(4, 4, 'Sardina'),
(5, 5, 'Anchoa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tpezlugar`
--

CREATE TABLE `tpezlugar` (
  `idPezLugar` int(11) NOT NULL,
  `idPez` int(11) NOT NULL,
  `idLugar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tpezlugar`
--

INSERT INTO `tpezlugar` (`idPezLugar`, `idPez`, `idLugar`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tposicion`
--

CREATE TABLE `tposicion` (
  `idPosicion` int(11) NOT NULL,
  `Posicion` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tposicion`
--

INSERT INTO `tposicion` (`idPosicion`, `Posicion`) VALUES
(4, 'Cuarto'),
(1, 'Primero'),
(5, 'Quinto'),
(2, 'Segundo'),
(3, 'Tercero');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `trofeos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `trofeos` (
`id de Trofeo` int(11)
,`Trofeo` varchar(10)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ttipoasociacion`
--

CREATE TABLE `ttipoasociacion` (
  `idTipoAsociacion` int(11) NOT NULL,
  `nomTipoAsociacion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ttipoasociacion`
--

INSERT INTO `ttipoasociacion` (`idTipoAsociacion`, `nomTipoAsociacion`) VALUES
(2, 'Privado'),
(1, 'Publico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ttipoevento`
--

CREATE TABLE `ttipoevento` (
  `idTipoEvento` int(11) NOT NULL,
  `TipoEven` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ttipoevento`
--

INSERT INTO `ttipoevento` (`idTipoEvento`, `TipoEven`) VALUES
(2, 'Externo'),
(1, 'Nuestro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ttipolugar`
--

CREATE TABLE `ttipolugar` (
  `idTipoLugar` int(11) NOT NULL,
  `nomTipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ttipolugar`
--

INSERT INTO `ttipolugar` (`idTipoLugar`, `nomTipo`) VALUES
(1, 'Cauce'),
(2, 'Fluvial'),
(3, 'Lago'),
(4, 'Pantano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ttrofeo`
--

CREATE TABLE `ttrofeo` (
  `idTrofeo` int(11) NOT NULL,
  `Trofeo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ttrofeo`
--

INSERT INTO `ttrofeo` (`idTrofeo`, `Trofeo`) VALUES
(3, 'Bronce'),
(1, 'Oro'),
(4, 'Participa'),
(2, 'Plata');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tveda`
--

CREATE TABLE `tveda` (
  `idVeda` int(11) NOT NULL,
  `idLicencia` int(11) NOT NULL,
  `tallaMinima` int(11) NOT NULL,
  `maxCaptura` int(11) NOT NULL,
  `costo` int(11) NOT NULL CHECK (`costo` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tveda`
--

INSERT INTO `tveda` (`idVeda`, `idLicencia`, `tallaMinima`, `maxCaptura`, `costo`) VALUES
(1, 1, 12, 30, 200),
(2, 2, 17, 25, 350),
(3, 3, 20, 40, 270),
(4, 4, 15, 35, 400),
(5, 5, 25, 50, 450);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vedas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vedas` (
`id de Veda` int(11)
,`Licencia` varchar(80)
,`Talla Minima` int(11)
,`Maximo de Capturas` int(11)
,`Costo` int(11)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `afiliados`
--
DROP TABLE IF EXISTS `afiliados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `afiliados`  AS SELECT `af`.`numSocio` AS `Numero de Socio`, `af`.`nomAfiliado` AS `Nombre`, `af`.`aPaterno` AS `Apellido Paterno`, `af`.`aMaterno` AS `Apellido Materno`, `a`.`nomAsociacion` AS `Asociacion` FROM (`tafiliado` `af` join `tasociacion` `a` on(`af`.`idAsociacion` = `a`.`idAsociacion`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `capturas`
--
DROP TABLE IF EXISTS `capturas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `capturas`  AS SELECT `c`.`idCaptura` AS `Captura`, `af`.`nomAfiliado` AS `Socio`, `e`.`nomEvento` AS `Evento`, `c`.`idPezLugar` AS `Lugar de Pez`, `c`.`hora` AS `Hora`, `c`.`fecha` AS `Fecha`, `c`.`CapAV` AS `Captura Avalada`, `c`.`Tamaño` AS `Tamaño (cm)`, `c`.`Referencia` AS `Referencia` FROM ((`tcaptura` `c` join `tafiliado` `af` on(`c`.`numSocio` = `af`.`numSocio`)) join `tevento` `e` on(`c`.`idEvento` = `e`.`idEvento`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `comunidades`
--
DROP TABLE IF EXISTS `comunidades`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `comunidades`  AS SELECT `co`.`idComunidad` AS `Comunidad`, `co`.`nomComunidad` AS `Nombre de Comunidad`, `co`.`Permiso` AS `Permiso` FROM `tcomunidad` AS `co` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `eventos`
--
DROP TABLE IF EXISTS `eventos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `eventos`  AS SELECT `e`.`idEvento` AS `Evento`, `e`.`nomEvento` AS `Nombre de Evento`, `a`.`nomAsociacion` AS `Asociacion`, `te`.`TipoEven` AS `Tipo de Evento`, `e`.`maxParticipantes` AS `Maximo de Participantes`, `l`.`nomLugar` AS `Lugar` FROM (((`tevento` `e` join `tasociacion` `a` on(`e`.`idAsociacion` = `a`.`idAsociacion`)) join `ttipoevento` `te` on(`e`.`idTipoEvento` = `te`.`idTipoEvento`)) join `tlugar` `l` on(`e`.`idLugar` = `l`.`idLugar`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `eventosafiliados`
--
DROP TABLE IF EXISTS `eventosafiliados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `eventosafiliados`  AS SELECT `ea`.`idEventoAfiliado` AS `Evento de Afiliado`, `e`.`nomEvento` AS `Nombre del Evento`, `t`.`Trofeo` AS `Trofeo`, `p`.`Posicion` AS `Posicion`, `af`.`nomAfiliado` AS `Socio` FROM ((((`teventoafiliado` `ea` join `tevento` `e` on(`ea`.`idEvento` = `e`.`idEvento`)) join `ttrofeo` `t` on(`ea`.`idTrofeo` = `t`.`idTrofeo`)) join `tposicion` `p` on(`ea`.`idPosicion` = `p`.`idPosicion`)) join `tafiliado` `af` on(`ea`.`numSocio` = `af`.`numSocio`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `licencias`
--
DROP TABLE IF EXISTS `licencias`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `licencias`  AS SELECT `li`.`idLicencia` AS `id de Licencia`, `li`.`licencia` AS `Licencia` FROM `tlicencia` AS `li` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `lugares`
--
DROP TABLE IF EXISTS `lugares`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lugares`  AS SELECT `l`.`idLugar` AS `id Lugar`, `l`.`nomLugar` AS `Nombre del Lugar`, `tl`.`nomTipo` AS `Tipo de Lugar`, `co`.`nomComunidad` AS `Comunidad` FROM ((`tlugar` `l` join `ttipolugar` `tl` on(`l`.`idTipoLugar` = `tl`.`idTipoLugar`)) join `tcomunidad` `co` on(`l`.`idComunidad` = `co`.`idComunidad`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `peces`
--
DROP TABLE IF EXISTS `peces`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `peces`  AS SELECT `p`.`idPez` AS `id de Pez`, `p`.`idVeda` AS `Veda`, `p`.`nomPez` AS `Nombre de Pez` FROM `tpez` AS `p` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `peceslugares`
--
DROP TABLE IF EXISTS `peceslugares`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `peceslugares`  AS SELECT `pl`.`idPezLugar` AS `id de PezLugar`, `p`.`nomPez` AS `Pez`, `l`.`nomLugar` AS `Lugar` FROM ((`tpezlugar` `pl` join `tpez` `p` on(`pl`.`idPez` = `p`.`idPez`)) join `tlugar` `l` on(`pl`.`idLugar` = `l`.`idLugar`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `posiciones`
--
DROP TABLE IF EXISTS `posiciones`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `posiciones`  AS SELECT `po`.`idPosicion` AS `id de Posicion`, `po`.`Posicion` AS `Posicion` FROM `tposicion` AS `po` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `tipoasociacion`
--
DROP TABLE IF EXISTS `tipoasociacion`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tipoasociacion`  AS SELECT `a`.`idAsociacion` AS `idAsociacion`, `a`.`nomAsociacion` AS `Nombre`, `ta`.`nomTipoAsociacion` AS `Tipo de Asociacion` FROM (`tasociacion` `a` join `ttipoasociacion` `ta` on(`a`.`idTipoAsociacion` = `ta`.`idTipoAsociacion`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `tipoasociaciones`
--
DROP TABLE IF EXISTS `tipoasociaciones`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tipoasociaciones`  AS SELECT `ta`.`idTipoAsociacion` AS `id de Tipo de Asociacion`, `ta`.`nomTipoAsociacion` AS `Nombre de Tipo de Asociacion` FROM `ttipoasociacion` AS `ta` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `tipoeventos`
--
DROP TABLE IF EXISTS `tipoeventos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tipoeventos`  AS SELECT `te`.`idTipoEvento` AS `id de Tipo de Evento`, `te`.`TipoEven` AS `Nombre de Tipo de Evento` FROM `ttipoevento` AS `te` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `tipolugares`
--
DROP TABLE IF EXISTS `tipolugares`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tipolugares`  AS SELECT `tl`.`idTipoLugar` AS `id de Tipo del Lugar`, `tl`.`nomTipo` AS `Nombre del Tipo del Lugar` FROM `ttipolugar` AS `tl` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `trofeos`
--
DROP TABLE IF EXISTS `trofeos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `trofeos`  AS SELECT `t`.`idTrofeo` AS `id de Trofeo`, `t`.`Trofeo` AS `Trofeo` FROM `ttrofeo` AS `t` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vedas`
--
DROP TABLE IF EXISTS `vedas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vedas`  AS SELECT `v`.`idVeda` AS `id de Veda`, `li`.`licencia` AS `Licencia`, `v`.`tallaMinima` AS `Talla Minima`, `v`.`maxCaptura` AS `Maximo de Capturas`, `v`.`costo` AS `Costo` FROM (`tveda` `v` join `tlicencia` `li` on(`v`.`idLicencia` = `li`.`idLicencia`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tafiliado`
--
ALTER TABLE `tafiliado`
  ADD PRIMARY KEY (`numSocio`),
  ADD UNIQUE KEY `nomAfiliado` (`nomAfiliado`),
  ADD UNIQUE KEY `aPaterno` (`aPaterno`),
  ADD KEY `idAsociacion` (`idAsociacion`);

--
-- Indices de la tabla `tasociacion`
--
ALTER TABLE `tasociacion`
  ADD PRIMARY KEY (`idAsociacion`),
  ADD UNIQUE KEY `nomAsociacion` (`nomAsociacion`),
  ADD KEY `idTipoAsociacion` (`idTipoAsociacion`);

--
-- Indices de la tabla `tcaptura`
--
ALTER TABLE `tcaptura`
  ADD PRIMARY KEY (`idCaptura`),
  ADD KEY `numSocio` (`numSocio`),
  ADD KEY `idEvento` (`idEvento`),
  ADD KEY `idPezLugar` (`idPezLugar`);

--
-- Indices de la tabla `tcomunidad`
--
ALTER TABLE `tcomunidad`
  ADD PRIMARY KEY (`idComunidad`),
  ADD UNIQUE KEY `nomComunidad` (`nomComunidad`);

--
-- Indices de la tabla `tevento`
--
ALTER TABLE `tevento`
  ADD PRIMARY KEY (`idEvento`),
  ADD UNIQUE KEY `nomEvento` (`nomEvento`),
  ADD KEY `idLugar` (`idLugar`),
  ADD KEY `idTipoEvento` (`idTipoEvento`),
  ADD KEY `idAsociacion` (`idAsociacion`);

--
-- Indices de la tabla `teventoafiliado`
--
ALTER TABLE `teventoafiliado`
  ADD PRIMARY KEY (`idEventoAfiliado`),
  ADD KEY `idEvento` (`idEvento`),
  ADD KEY `idTrofeo` (`idTrofeo`),
  ADD KEY `idPosicion` (`idPosicion`),
  ADD KEY `numSocio` (`numSocio`);

--
-- Indices de la tabla `tlicencia`
--
ALTER TABLE `tlicencia`
  ADD PRIMARY KEY (`idLicencia`),
  ADD UNIQUE KEY `licencia` (`licencia`);

--
-- Indices de la tabla `tlugar`
--
ALTER TABLE `tlugar`
  ADD PRIMARY KEY (`idLugar`),
  ADD KEY `idTipoLugar` (`idTipoLugar`),
  ADD KEY `idComunidad` (`idComunidad`);

--
-- Indices de la tabla `tpez`
--
ALTER TABLE `tpez`
  ADD PRIMARY KEY (`idPez`),
  ADD UNIQUE KEY `nomPez` (`nomPez`),
  ADD KEY `idVeda` (`idVeda`);

--
-- Indices de la tabla `tpezlugar`
--
ALTER TABLE `tpezlugar`
  ADD PRIMARY KEY (`idPezLugar`),
  ADD KEY `idPez` (`idPez`),
  ADD KEY `idLugar` (`idLugar`);

--
-- Indices de la tabla `tposicion`
--
ALTER TABLE `tposicion`
  ADD PRIMARY KEY (`idPosicion`),
  ADD UNIQUE KEY `Posicion` (`Posicion`);

--
-- Indices de la tabla `ttipoasociacion`
--
ALTER TABLE `ttipoasociacion`
  ADD PRIMARY KEY (`idTipoAsociacion`),
  ADD UNIQUE KEY `nomTipoAsociacion` (`nomTipoAsociacion`);

--
-- Indices de la tabla `ttipoevento`
--
ALTER TABLE `ttipoevento`
  ADD PRIMARY KEY (`idTipoEvento`),
  ADD UNIQUE KEY `TipoEven` (`TipoEven`);

--
-- Indices de la tabla `ttipolugar`
--
ALTER TABLE `ttipolugar`
  ADD PRIMARY KEY (`idTipoLugar`),
  ADD UNIQUE KEY `nomTipo` (`nomTipo`);

--
-- Indices de la tabla `ttrofeo`
--
ALTER TABLE `ttrofeo`
  ADD PRIMARY KEY (`idTrofeo`),
  ADD UNIQUE KEY `Trofeo` (`Trofeo`);

--
-- Indices de la tabla `tveda`
--
ALTER TABLE `tveda`
  ADD PRIMARY KEY (`idVeda`),
  ADD KEY `idLicencia` (`idLicencia`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tcaptura`
--
ALTER TABLE `tcaptura`
  MODIFY `idCaptura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tcomunidad`
--
ALTER TABLE `tcomunidad`
  MODIFY `idComunidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tevento`
--
ALTER TABLE `tevento`
  MODIFY `idEvento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `teventoafiliado`
--
ALTER TABLE `teventoafiliado`
  MODIFY `idEventoAfiliado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tlicencia`
--
ALTER TABLE `tlicencia`
  MODIFY `idLicencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tlugar`
--
ALTER TABLE `tlugar`
  MODIFY `idLugar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tpez`
--
ALTER TABLE `tpez`
  MODIFY `idPez` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tpezlugar`
--
ALTER TABLE `tpezlugar`
  MODIFY `idPezLugar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tposicion`
--
ALTER TABLE `tposicion`
  MODIFY `idPosicion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ttipoasociacion`
--
ALTER TABLE `ttipoasociacion`
  MODIFY `idTipoAsociacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ttipoevento`
--
ALTER TABLE `ttipoevento`
  MODIFY `idTipoEvento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ttipolugar`
--
ALTER TABLE `ttipolugar`
  MODIFY `idTipoLugar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ttrofeo`
--
ALTER TABLE `ttrofeo`
  MODIFY `idTrofeo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tveda`
--
ALTER TABLE `tveda`
  MODIFY `idVeda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tafiliado`
--
ALTER TABLE `tafiliado`
  ADD CONSTRAINT `tafiliado_ibfk_1` FOREIGN KEY (`idAsociacion`) REFERENCES `tasociacion` (`idAsociacion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tasociacion`
--
ALTER TABLE `tasociacion`
  ADD CONSTRAINT `tasociacion_ibfk_1` FOREIGN KEY (`idTipoAsociacion`) REFERENCES `ttipoasociacion` (`idTipoAsociacion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tcaptura`
--
ALTER TABLE `tcaptura`
  ADD CONSTRAINT `tcaptura_ibfk_1` FOREIGN KEY (`numSocio`) REFERENCES `tafiliado` (`numSocio`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tcaptura_ibfk_2` FOREIGN KEY (`idEvento`) REFERENCES `tevento` (`idEvento`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tcaptura_ibfk_3` FOREIGN KEY (`idPezLugar`) REFERENCES `tpezlugar` (`idPezLugar`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tevento`
--
ALTER TABLE `tevento`
  ADD CONSTRAINT `tevento_ibfk_1` FOREIGN KEY (`idLugar`) REFERENCES `tlugar` (`idLugar`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tevento_ibfk_2` FOREIGN KEY (`idTipoEvento`) REFERENCES `ttipoevento` (`idTipoEvento`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tevento_ibfk_3` FOREIGN KEY (`idAsociacion`) REFERENCES `tasociacion` (`idAsociacion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `teventoafiliado`
--
ALTER TABLE `teventoafiliado`
  ADD CONSTRAINT `teventoafiliado_ibfk_1` FOREIGN KEY (`idEvento`) REFERENCES `tevento` (`idEvento`) ON UPDATE CASCADE,
  ADD CONSTRAINT `teventoafiliado_ibfk_2` FOREIGN KEY (`idTrofeo`) REFERENCES `ttrofeo` (`idTrofeo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `teventoafiliado_ibfk_3` FOREIGN KEY (`idPosicion`) REFERENCES `tposicion` (`idPosicion`) ON UPDATE CASCADE,
  ADD CONSTRAINT `teventoafiliado_ibfk_4` FOREIGN KEY (`numSocio`) REFERENCES `tafiliado` (`numSocio`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tlugar`
--
ALTER TABLE `tlugar`
  ADD CONSTRAINT `tlugar_ibfk_1` FOREIGN KEY (`idTipoLugar`) REFERENCES `ttipolugar` (`idTipoLugar`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tlugar_ibfk_2` FOREIGN KEY (`idComunidad`) REFERENCES `tcomunidad` (`idComunidad`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tpez`
--
ALTER TABLE `tpez`
  ADD CONSTRAINT `tpez_ibfk_1` FOREIGN KEY (`idVeda`) REFERENCES `tveda` (`idVeda`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tpezlugar`
--
ALTER TABLE `tpezlugar`
  ADD CONSTRAINT `tpezlugar_ibfk_1` FOREIGN KEY (`idPez`) REFERENCES `tpez` (`idPez`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tpezlugar_ibfk_2` FOREIGN KEY (`idLugar`) REFERENCES `tlugar` (`idLugar`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tveda`
--
ALTER TABLE `tveda`
  ADD CONSTRAINT `tveda_ibfk_1` FOREIGN KEY (`idLicencia`) REFERENCES `tlicencia` (`idLicencia`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
