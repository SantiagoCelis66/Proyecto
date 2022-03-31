-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-03-2022 a las 18:42:59
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calendario`
--

CREATE TABLE `calendario` (
  `idcalendario` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `hora` time NOT NULL,
  `dia` int(11) NOT NULL,
  `mes` varchar(45) DEFAULT NULL,
  `año` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `idciudad` int(11) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `localidad` varchar(45) NOT NULL,
  `barrio` varchar(45) NOT NULL,
  `codigo_postal` varchar(45) DEFAULT NULL,
  `iddepartamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `iddepartamento` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `iddireccion` int(11) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `estrato` varchar(45) NOT NULL,
  `idciudad` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `donacion`
--

CREATE TABLE `donacion` (
  `iddonacion` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudios`
--

CREATE TABLE `estudios` (
  `idestudios` int(11) NOT NULL,
  `tipo_estudio` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `idevento` int(11) NOT NULL,
  `asunto` varchar(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `proceso` varchar(45) NOT NULL,
  `area_organizativa` varchar(45) NOT NULL,
  `idcalendario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupoetnico`
--

CREATE TABLE `grupoetnico` (
  `idgrupoEtnico` int(11) NOT NULL,
  `grupoEtnico` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `identidaddegenero`
--

CREATE TABLE `identidaddegenero` (
  `idIdentidadDeGenero` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `info_donacion`
--

CREATE TABLE `info_donacion` (
  `idinfodonacion` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `iddonacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `info_evento`
--

CREATE TABLE `info_evento` (
  `idinfoevento` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idevento` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `lugar` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_contacto`
--

CREATE TABLE `persona_contacto` (
  `idgpersonacontacto` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `num_telefono` int(11) NOT NULL,
  `correo_electronico` varchar(45) NOT NULL,
  `parentesco` varchar(45) NOT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `idtipodocumento` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido1` varchar(45) NOT NULL,
  `apellido2` varchar(45) DEFAULT NULL,
  `nombre_identitario` varchar(45) DEFAULT NULL,
  `num_documento` int(11) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `idrol` int(11) NOT NULL,
  `idgrupoEtnico` int(11) NOT NULL,
  `idtipoDocumento` int(11) NOT NULL,
  `ididentidadDeGenero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calendario`
--
ALTER TABLE `calendario`
  ADD PRIMARY KEY (`idcalendario`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`idciudad`),
  ADD KEY `iddepartamento` (`iddepartamento`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`iddepartamento`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`iddireccion`),
  ADD KEY `idciudad` (`idciudad`),
  ADD KEY `idusuario` (`idusuario`);

--
-- Indices de la tabla `donacion`
--
ALTER TABLE `donacion`
  ADD PRIMARY KEY (`iddonacion`);

--
-- Indices de la tabla `estudios`
--
ALTER TABLE `estudios`
  ADD PRIMARY KEY (`idestudios`),
  ADD KEY `idusuario` (`idusuario`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`idevento`),
  ADD KEY `idcalendario` (`idcalendario`);

--
-- Indices de la tabla `grupoetnico`
--
ALTER TABLE `grupoetnico`
  ADD PRIMARY KEY (`idgrupoEtnico`);

--
-- Indices de la tabla `identidaddegenero`
--
ALTER TABLE `identidaddegenero`
  ADD PRIMARY KEY (`idIdentidadDeGenero`);

--
-- Indices de la tabla `info_donacion`
--
ALTER TABLE `info_donacion`
  ADD PRIMARY KEY (`idinfodonacion`),
  ADD KEY `idusuario` (`idusuario`),
  ADD KEY `iddonacion` (`iddonacion`);

--
-- Indices de la tabla `info_evento`
--
ALTER TABLE `info_evento`
  ADD PRIMARY KEY (`idinfoevento`),
  ADD KEY `idusuario` (`idusuario`),
  ADD KEY `idevento` (`idevento`);

--
-- Indices de la tabla `persona_contacto`
--
ALTER TABLE `persona_contacto`
  ADD PRIMARY KEY (`idgpersonacontacto`),
  ADD KEY `idusuario` (`idusuario`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`idtipodocumento`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD KEY `idrol` (`idrol`),
  ADD KEY `idgrupoEtnico` (`idgrupoEtnico`),
  ADD KEY `idtipoDocumento` (`idtipoDocumento`),
  ADD KEY `ididentidadDeGenero` (`ididentidadDeGenero`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calendario`
--
ALTER TABLE `calendario`
  MODIFY `idcalendario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `idciudad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `iddepartamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `iddireccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `donacion`
--
ALTER TABLE `donacion`
  MODIFY `iddonacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estudios`
--
ALTER TABLE `estudios`
  MODIFY `idestudios` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `idevento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupoetnico`
--
ALTER TABLE `grupoetnico`
  MODIFY `idgrupoEtnico` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `identidaddegenero`
--
ALTER TABLE `identidaddegenero`
  MODIFY `idIdentidadDeGenero` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `info_donacion`
--
ALTER TABLE `info_donacion`
  MODIFY `idinfodonacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `info_evento`
--
ALTER TABLE `info_evento`
  MODIFY `idinfoevento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persona_contacto`
--
ALTER TABLE `persona_contacto`
  MODIFY `idgpersonacontacto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idrol` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `idtipodocumento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `ciudad_ibfk_1` FOREIGN KEY (`iddepartamento`) REFERENCES `departamento` (`iddepartamento`);

--
-- Filtros para la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `direccion_ibfk_1` FOREIGN KEY (`idciudad`) REFERENCES `ciudad` (`idciudad`),
  ADD CONSTRAINT `direccion_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `estudios`
--
ALTER TABLE `estudios`
  ADD CONSTRAINT `estudios_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`idcalendario`) REFERENCES `calendario` (`idcalendario`);

--
-- Filtros para la tabla `info_donacion`
--
ALTER TABLE `info_donacion`
  ADD CONSTRAINT `info_donacion_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`),
  ADD CONSTRAINT `info_donacion_ibfk_2` FOREIGN KEY (`iddonacion`) REFERENCES `donacion` (`iddonacion`);

--
-- Filtros para la tabla `info_evento`
--
ALTER TABLE `info_evento`
  ADD CONSTRAINT `info_evento_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`),
  ADD CONSTRAINT `info_evento_ibfk_2` FOREIGN KEY (`idevento`) REFERENCES `evento` (`idevento`);

--
-- Filtros para la tabla `persona_contacto`
--
ALTER TABLE `persona_contacto`
  ADD CONSTRAINT `persona_contacto_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`idgrupoEtnico`) REFERENCES `grupoetnico` (`idgrupoEtnico`),
  ADD CONSTRAINT `usuario_ibfk_3` FOREIGN KEY (`idtipoDocumento`) REFERENCES `tipo_documento` (`idtipodocumento`),
  ADD CONSTRAINT `usuario_ibfk_4` FOREIGN KEY (`ididentidadDeGenero`) REFERENCES `identidaddegenero` (`idIdentidadDeGenero`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
