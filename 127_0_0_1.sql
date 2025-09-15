-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 06-03-2025 a las 15:55:27
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
-- Base de datos: `bd_clinica`
--
CREATE DATABASE IF NOT EXISTS `bd_clinica` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bd_clinica`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `analisis_clinico`
--

CREATE TABLE `analisis_clinico` (
  `id_analisisclinico` int(11) NOT NULL,
  `analisis` varchar(255) DEFAULT NULL,
  `diagnostico` varchar(255) DEFAULT NULL,
  `fecha_recepcion` date DEFAULT NULL,
  `prioridad` varchar(50) DEFAULT NULL,
  `id_medicos` int(11) DEFAULT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `paciente` varchar(255) DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `analisis_clinico`
--

INSERT INTO `analisis_clinico` (`id_analisisclinico`, `analisis`, `diagnostico`, `fecha_recepcion`, `prioridad`, `id_medicos`, `id_paciente`, `paciente`, `fecha_entrega`) VALUES
(1, 'hemograma', 'Evaluación preoperatoria', '2024-07-17', 'media', 1, 1, 'Martinez Alejandro ', '2024-07-29'),
(7, 'glucemia', 'Síndrome metabólico', '2024-07-12', 'media', 2, NULL, 'Sara Mendoza', '2024-07-30'),
(8, 'Glucosa en Sangre', 'Prediabete', '2024-07-18', 'media', 6, NULL, 'Valentino Bautista Moretti', '2024-07-29'),
(9, 'Perfil Lipídico', 'Evaluación cardiovascular', '2024-07-18', 'alta', 10, NULL, 'Valentino Bautista Moretti', '2024-07-31'),
(10, 'Función Renal', 'Enfermedad renal conocida', '2024-07-16', 'baja', 4, NULL, 'Benjamin Elias Ferreira', '2024-07-29'),
(11, 'Hemograma Completo', 'Trastornos de la coagulación', '2024-07-05', 'alta', 1, NULL, 'Federico Tomas Martinez', '2024-07-17'),
(12, 'Hemograma Completo', 'Anemia', '2024-07-19', 'baja', 1, NULL, 'Marina Soledad Morales', '2024-07-24'),
(13, 'Glucosa en Sangre', 'Diabetes mellitus', '2024-07-17', 'Baja', 1, NULL, 'Lorena Romina Cespedes', '2024-07-22'),
(14, 'Perfil Lipídico', 'Control hiperlipidemia', '2024-07-19', 'media', 1, NULL, 'Valentino Bautista Moretti', '2024-07-26'),
(15, 'Glucosa en Sangre', 'Diagnostico diabletes', '2024-07-26', 'alta', 2, NULL, 'Valentino Bautista Moretti', '2024-08-01'),
(16, 'Perfil Lipídico', 'Evaluciacón salud hígado', '2024-07-19', 'media', 2, NULL, 'Valentino Bautista Moretti', '2024-07-20'),
(17, 'Función Renal', 'Control transplante riñón', '2024-07-19', 'media', 2, NULL, 'Valentino Bautista Moretti', '2024-07-25'),
(18, 'Glucosa en Sangre', 'Diagnostico diabletes', '2024-07-18', 'media', 1, NULL, 'Valentino Bautista Moretti', '2024-07-25'),
(19, 'Perfil Lipídico', 'Control arterial', '2024-07-25', 'alta', 1, NULL, 'Valentino Bautista Moretti', '2024-07-27'),
(20, 'Hemograma Completo', 'Fatiga cronica', '2024-07-25', 'media', 1, NULL, 'Valentino Bautista Moretti', '2024-07-30'),
(21, 'Electrolitos', 'Control gral.', '2024-07-25', 'media', 1, NULL, 'Valentino Bautista Moretti', '2024-08-06'),
(22, 'Glucosa en Sangre', 'Control  diabetes', '2024-07-25', 'media', 8, NULL, 'Valentino Bautista Moretti', '2024-08-01'),
(23, 'Glucosa en Sangre', 'Condiciones hormonales', '2024-07-25', 'alta', 1, NULL, 'Valentino Bautista Moretti', '2024-08-01'),
(24, 'Electrolitos', 'Embarazo', '2024-07-25', 'alta', 1, NULL, 'Agustina Soledad Díaz', '2024-08-02'),
(25, 'Glucosa en Sangre', 'Enfermedades pancreáticas', '2024-07-25', 'alta', 1, NULL, 'Valentino Bautista Moretti', '2024-08-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita_medica`
--

CREATE TABLE `cita_medica` (
  `id_citamedica` int(11) NOT NULL,
  `id_medicos` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `horario` time DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `consultorio` char(2) DEFAULT NULL,
  `id_persona` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cita_medica`
--

INSERT INTO `cita_medica` (`id_citamedica`, `id_medicos`, `fecha`, `horario`, `descripcion`, `consultorio`, `id_persona`) VALUES
(1, 3, '2024-07-05', '10:30:00', 'Control general', '7', 11),
(2, 5, '2024-07-16', '15:30:00', 'Dolores recurrentes de cabeza, migraña', '3', 12),
(3, 2, '2024-07-08', '11:00:00', 'Consulta pediatrica', '9', 13),
(4, 7, '2024-07-17', '14:00:00', 'Control general', '1', 14),
(5, 1, '2024-07-23', '12:00:00', 'Consulta cardiaca ', '5', 15),
(6, 6, '2024-07-24', '19:00:00', 'Consulta General', '4', 16),
(7, 9, '2024-07-24', '16:30:00', 'Examen cardiaco', '8', 17),
(8, 8, '2024-07-23', '10:45:00', 'Por con dolores estomacales', '6', 18),
(9, 6, '2024-07-09', '16:00:00', 'Terapia ', '2', 19),
(10, 3, '2024-07-18', '08:00:00', 'Examen General', '9', 20),
(11, 9, '2024-07-26', '15:00:00', 'prueba a la conexion para cargar los datos', '5', 42),
(12, 9, '2024-07-26', '17:00:00', 'es una prueba para veriicar el modal', '9', 43),
(13, 9, '2024-07-26', '12:00:00', 'prueba para el diseño del modal', '5', 44);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cobertura`
--

CREATE TABLE `cobertura` (
  `id_cobertura` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cobertura`
--

INSERT INTO `cobertura` (`id_cobertura`, `nombre`) VALUES
(1, 'OSDE'),
(2, 'Swiss Medical'),
(3, 'Espata'),
(4, 'OMINT'),
(5, 'MEDIFE'),
(6, 'Particular'),
(7, 'OSDE'),
(8, 'Iosfa'),
(9, 'Galeno'),
(10, 'MEDIFE'),
(11, 'iosfa'),
(12, 'particular'),
(13, 'Espata');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE `contacto` (
  `id_contacto` int(11) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contacto`
--

INSERT INTO `contacto` (`id_contacto`, `telefono`, `correo`) VALUES
(1, '3704123456', 'lautaro.giordano@example.com'),
(2, '3704234567', 'rinaldimar@example.com'),
(3, '3704345678', 'ignacio.rossi@example.com'),
(4, '3704456789', 'valetinaisolini@example.com'),
(5, '3704561743', 'pachecomateo@example.com'),
(6, '370467524', 'bienchinimia@example.com'),
(7, '3704184529', 'romerojulian@example.com'),
(8, '3704890123', 'alavrengasofi@example.com'),
(9, '3704926817', 'benjaferreira@example.com'),
(10, '3704691267', 'licenciadaojeda@example.com'),
(11, '3704561298', 'lucasemiliano@example.com'),
(12, '3703274567', 'antogonzalez@example.com'),
(13, '3704921764', 'marianatorres@example.com'),
(14, '3704237812', 'insarraldebelen@example.com'),
(15, '3704781247', 'lopezpablo@example.com'),
(16, '3704781290', 'carosalinas@example.com'),
(17, '3704891264', 'vegaale@example.com'),
(18, '3704276239', 'valen@example.com'),
(19, '3704791276', 'fedetomas@example.com'),
(20, '3704238162', 'marinamorales@example.com'),
(21, '3704234567', 'solediaz@example.com'),
(22, '3704781925', 'valerodriguez@example.com'),
(23, '3704702110', 'santiruiz@example.com'),
(24, '3704227291', 'julimendez@example.com'),
(25, '3705190283', 'aylluna@example.com'),
(26, '3704193311', 'matigut@example.com'),
(27, '3704193311', 'matigut@example.com'),
(28, '3704011023', 'ambar.herrera@example.com'),
(29, '3704003378', 'lamponepablo@example.com'),
(30, '3704788127', 'julito@example.com'),
(31, '3706571289', 'solbelen@example.com'),
(32, '3704229010', 'susu@example.com'),
(33, '3705891221', 'pedropedro@example.com'),
(34, '3704446346', 'marioto@example.com'),
(35, '3705675243', 'jorgeluis@example.com'),
(36, '3704882147', 'maridolores@example.com'),
(37, '3704001369', 'angelgonz@example.com'),
(38, '3704602111', 'sofidelturco@example.com'),
(39, '3704221038', 'pilarlopez@example.com'),
(40, '3705223217', 'mariateresa@example.com'),
(41, '3706129014', 'mikafernandez@example.com'),
(42, '3705904578', 'lorecespedes@example.com'),
(43, '3705220845', 'fabidoc@example.com'),
(44, '3705882947', 'mariaeuge@example.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cronograma`
--

CREATE TABLE `cronograma` (
  `id_cronograma` int(11) NOT NULL,
  `horario` time DEFAULT NULL,
  `dia` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id_departamento` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `id_provincia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `id_direccion` int(11) NOT NULL,
  `calle` varchar(255) DEFAULT NULL,
  `barrio` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`id_direccion`, `calle`, `barrio`) VALUES
(1, '25 de Mayo 123', 'San Francisco'),
(2, 'España 456', 'La Nueva Formosa'),
(3, 'San Martin 789', 'Villar del Carmen'),
(4, 'Rivadavia 321', 'Independencia'),
(5, 'Italia 654', 'San Francisco'),
(6, 'Belgrano 366', 'Centro'),
(7, 'Mitre 32', 'San Miguel'),
(8, 'Nacimiento Filho 67', 'La Pilar'),
(9, 'Saavedra 780', 'San Martin'),
(10, 'Suipacha 67', 'Mariano Moreno'),
(11, 'Bosch 120', 'San Francisco'),
(12, 'Manzana 78 Casa 12', 'Eva Peron'),
(13, 'Italia 723', 'San Pedro'),
(14, 'Pasaje D casa 5', 'Fleming'),
(15, 'Manzana 32 Casa 17', 'Juan Domingo Peron'),
(16, 'Nestor Kirchner 1270', 'Coluccio'),
(17, 'Foterhigam 823', 'Don Bosco'),
(18, 'Manzana 19 Casa 1', 'Republica Argentina'),
(19, 'Oggihins 60', 'San Miguel'),
(20, 'Bransen 146', 'Libertad'),
(21, 'Argentino Roca 210', 'Don Bosco'),
(22, 'Manzana 10 casa 6', 'Las Orquideas'),
(23, 'Manzana 70 Parcela 19', 'La Nueva Formosa'),
(24, 'Bloque H casa 5', 'La Paz'),
(25, 'Sarmiento 712', 'Don Bosco'),
(26, 'Juan Domingo Peron 190', 'Independencia'),
(27, 'Juan Domingo Peron 190', 'Independencia'),
(28, '9 de julio 89', 'Independencia'),
(29, 'Jose Maria Uriburu 201', 'Mariano Moreno'),
(30, 'Manzana 18 Casa 2', 'Antenor Gauna'),
(31, 'Sector A Casa 3', 'Venezuela'),
(32, 'Torre F Departamento 7', 'Incone'),
(33, 'Eva Peron 700', 'Bernardino Rivadavia'),
(34, 'Manzana 7 Casa 12', '7 de mayo'),
(35, 'Brandsen 32', 'Centro'),
(36, 'Manzana 14 Casa 1', 'Porvenir'),
(37, 'Salta 2278', 'Villa del Rosario'),
(38, 'Italia 523', 'San Pedro'),
(39, 'Bransen 102', 'Centro'),
(40, 'Corrientes 1357', 'Fontana'),
(41, 'Manzana 57 casa 19', 'Eva Peron'),
(42, 'Sector D Torre 8 Departamento 7', 'Guadalupe'),
(43, 'Juan Jose Silva 27', 'San Martin'),
(44, 'Cordoba 780', 'Don Bosco');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleados` int(11) NOT NULL,
  `id_persona` int(11) DEFAULT NULL,
  `id_medicos` int(11) DEFAULT NULL,
  `id_matricula` int(11) DEFAULT NULL,
  `id_vacaciones` int(11) DEFAULT NULL,
  `id_ingresosustitucion` int(11) DEFAULT NULL,
  `ocupacion` varchar(100) DEFAULT NULL,
  `id_cronograma` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleados`, `id_persona`, `id_medicos`, `id_matricula`, `id_vacaciones`, `id_ingresosustitucion`, `ocupacion`, `id_cronograma`) VALUES
(1, 21, NULL, NULL, NULL, 1, 'Administrativo', NULL),
(2, 22, NULL, NULL, NULL, 2, 'Administrativo', NULL),
(3, 23, NULL, NULL, NULL, 3, 'Administrativo', NULL),
(4, 24, NULL, NULL, NULL, 4, 'Administrativo', NULL),
(5, 25, NULL, NULL, NULL, 5, 'Tecnico en Laboratorio', NULL),
(6, 26, NULL, NULL, NULL, 6, 'Tecnico en Laboratorio', NULL),
(7, 27, NULL, NULL, NULL, 7, 'Tecnico en Laboratorio', NULL),
(8, 28, NULL, NULL, NULL, 8, 'Tecnico en Laboratorio', NULL),
(9, 29, NULL, NULL, NULL, 9, 'Chofer Ambulancia', NULL),
(10, 30, NULL, NULL, NULL, 10, 'Chofer Ambulancia', NULL),
(11, 31, NULL, NULL, NULL, 11, 'Paramedico', NULL),
(12, 32, NULL, NULL, NULL, 12, 'Enfermeria', NULL),
(13, 33, NULL, NULL, NULL, 13, 'Conserje', NULL),
(14, 34, NULL, NULL, NULL, 14, 'Conserje', NULL),
(15, 35, NULL, NULL, NULL, 15, 'Paramedico', NULL),
(16, 36, NULL, NULL, NULL, 16, 'Enfermeria', NULL),
(17, 37, NULL, NULL, NULL, 17, 'Enfermeria', NULL),
(18, NULL, 12, NULL, NULL, 19, NULL, NULL),
(19, NULL, 14, 30, NULL, 21, NULL, NULL),
(20, NULL, 15, 31, NULL, 22, NULL, NULL),
(21, 46, NULL, NULL, NULL, NULL, 'Enfermería', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo_sanguineo`
--

CREATE TABLE `grupo_sanguineo` (
  `id_gruposanguineo` int(11) NOT NULL,
  `tipo` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `grupo_sanguineo`
--

INSERT INTO `grupo_sanguineo` (`id_gruposanguineo`, `tipo`) VALUES
(1, 'AB'),
(2, '0+'),
(3, 'A-'),
(4, 'BA+'),
(5, 'A-'),
(6, 'BA+'),
(7, 'A-'),
(8, 'A-'),
(9, '0+'),
(10, '0+'),
(11, 'A+'),
(12, '-0'),
(13, '0+');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `id_historia` int(11) NOT NULL,
  `id_paciente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso_sustitucion`
--

CREATE TABLE `ingreso_sustitucion` (
  `id_ingresosustitucion` int(11) NOT NULL,
  `fecha_alta` date DEFAULT NULL,
  `fecha_baja` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ingreso_sustitucion`
--

INSERT INTO `ingreso_sustitucion` (`id_ingresosustitucion`, `fecha_alta`, `fecha_baja`) VALUES
(1, '2023-03-20', '2024-07-19'),
(2, '2017-03-31', '2024-08-01'),
(3, '2010-04-05', '2024-07-19'),
(4, '2023-02-15', '2024-07-19'),
(5, '2024-02-12', NULL),
(6, '2024-02-12', NULL),
(7, '2024-02-12', NULL),
(8, '2023-07-15', NULL),
(9, '2022-08-25', NULL),
(10, '2022-07-02', NULL),
(11, '2020-05-12', NULL),
(12, '2024-06-12', NULL),
(13, '2009-10-07', NULL),
(14, '2009-02-06', NULL),
(15, '2021-12-22', NULL),
(16, '2024-01-22', NULL),
(17, '2018-12-15', NULL),
(19, '2024-07-19', NULL),
(21, '2024-07-15', NULL),
(22, '2024-07-27', '2024-08-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `internacion`
--

CREATE TABLE `internacion` (
  `id_internacion` int(11) NOT NULL,
  `fecha_alta` date DEFAULT NULL,
  `fecha_baja` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula`
--

CREATE TABLE `matricula` (
  `id_matricula` int(11) NOT NULL,
  `N_matricula` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `matricula`
--

INSERT INTO `matricula` (`id_matricula`, `N_matricula`) VALUES
(1, '1234'),
(2, '5678'),
(3, '910'),
(4, '067'),
(5, '023'),
(6, '322'),
(7, '056'),
(8, '780'),
(9, '140'),
(10, '128'),
(11, '567'),
(12, '517'),
(13, '418'),
(14, '618'),
(15, '518'),
(16, '109'),
(17, '109'),
(18, '034'),
(19, '109'),
(20, '112'),
(21, '671'),
(22, '121'),
(23, '667'),
(24, '091'),
(25, '511'),
(26, '023'),
(27, '022'),
(28, '193'),
(29, '142'),
(30, '142'),
(31, '237'),
(32, '492');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `id_medicos` int(11) NOT NULL,
  `id_persona` int(11) DEFAULT NULL,
  `situacion` varchar(255) DEFAULT NULL,
  `especialidad` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`id_medicos`, `id_persona`, `situacion`, `especialidad`) VALUES
(1, 1, 'Titular', 'Cardiología'),
(2, 2, 'Titular', 'Pediatría'),
(3, 3, 'Suplente', 'Dermatología'),
(4, 4, 'Titular', 'Neurología'),
(5, 5, 'Residente', 'Pediatría'),
(6, 6, 'Suplente', 'Medico General'),
(7, 7, 'Titular', 'Medico General'),
(8, 8, 'Titular', 'Traumatología'),
(9, 9, 'Residente', 'Medico General'),
(10, 10, 'Titular', 'Psicología'),
(11, 38, 'Suplente', 'dermatologia'),
(12, 39, 'Suplente', 'dermatologia'),
(13, 40, 'Suplente', 'dermatologia'),
(14, 41, 'Suplente', 'cardiología'),
(15, 45, 'Titular', 'dermatologia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `id_municipio` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `id_departamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id_paciente` int(11) NOT NULL,
  `id_persona` int(11) DEFAULT NULL,
  `id_citamedica` int(11) DEFAULT NULL,
  `id_cobertura` int(11) DEFAULT NULL,
  `id_registro` int(11) DEFAULT NULL,
  `id_internacion` int(11) DEFAULT NULL,
  `id_gruposanguineo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id_paciente`, `id_persona`, `id_citamedica`, `id_cobertura`, `id_registro`, `id_internacion`, `id_gruposanguineo`) VALUES
(1, 16, NULL, NULL, NULL, NULL, NULL),
(5, 17, NULL, NULL, NULL, NULL, NULL),
(6, 16, NULL, NULL, NULL, NULL, NULL),
(7, 16, NULL, NULL, NULL, NULL, NULL),
(8, 16, NULL, NULL, NULL, NULL, NULL),
(9, 16, NULL, NULL, NULL, NULL, NULL),
(10, 16, NULL, NULL, NULL, NULL, NULL),
(11, 16, NULL, NULL, NULL, NULL, NULL),
(12, 16, NULL, NULL, NULL, NULL, NULL),
(13, 16, NULL, NULL, NULL, NULL, NULL),
(14, 16, NULL, NULL, NULL, NULL, NULL),
(15, 18, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `id_pais` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`id_pais`, `nombre`) VALUES
(1, 'Argentina'),
(2, 'Argentina'),
(3, 'Argentina'),
(4, 'Argentina'),
(5, 'Argentina'),
(6, 'Argentina'),
(7, 'Argentina'),
(8, 'Argentina'),
(9, 'Argentina'),
(10, 'Argentina'),
(11, 'Argentina'),
(12, 'Argentina'),
(13, 'Argentina'),
(14, 'Argentina'),
(15, 'Argentina'),
(16, 'Argentina'),
(17, 'Argentina'),
(18, 'Argentina'),
(19, 'Argentina'),
(20, 'Argentina'),
(21, 'Argentina'),
(22, 'Argentina'),
(23, 'Argentina'),
(24, 'Argentina'),
(25, 'Argentina'),
(26, 'Argentina'),
(27, 'Argentina'),
(28, 'Argentina'),
(29, 'Argentina'),
(30, 'Argentina'),
(31, 'Argentina'),
(32, 'Argentina'),
(33, 'Argentina'),
(34, 'Argentina'),
(35, 'Argentina'),
(36, 'Argentina'),
(37, 'Argentina'),
(38, 'Argentina'),
(39, 'Argentina'),
(40, 'Argentina'),
(41, 'Argentina'),
(42, 'Argentina'),
(43, 'Argentina'),
(44, 'Argentina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_persona` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `DNI` char(10) DEFAULT NULL,
  `CUIL` char(11) DEFAULT NULL,
  `N_S_S` char(15) DEFAULT NULL,
  `sexo` varchar(10) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `id_municipio` int(11) DEFAULT NULL,
  `id_direccion` int(11) DEFAULT NULL,
  `id_contacto` int(11) DEFAULT NULL,
  `id_medicos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_persona`, `nombre`, `apellido`, `DNI`, `CUIL`, `N_S_S`, `sexo`, `fecha_nacimiento`, `id_municipio`, `id_direccion`, `id_contacto`, `id_medicos`) VALUES
(1, 'Lautaro Enzo', 'Giordano', '30456789', '20304567890', '123456', 'masculino', '1990-12-05', NULL, 1, 1, 1),
(2, 'Martina Luz', 'Rinaldi', '31567890', '27315678901', '234567', 'femenino', '1985-08-21', NULL, NULL, NULL, NULL),
(3, 'Ignacio Facundo', 'Rodriguez', '32678901', '20326789012', '345678', 'masculino', '1978-11-29', NULL, NULL, NULL, NULL),
(4, 'Valetina Sofia', 'Isolini', '33789012', '27337890123', '183914', 'femenino', '1992-11-03', NULL, NULL, NULL, NULL),
(5, 'Mateo Leon', 'Pacheco', '34890123', '20348901234', '567812', 'masculino', '1981-07-17', NULL, NULL, NULL, NULL),
(6, 'Camila Mia', 'Bianchini', '35901735', '27359017355', '781215', 'femenino', '1994-12-28', NULL, NULL, NULL, NULL),
(7, 'Julian Gabriel', 'Romero', '36012345', '27360123457', '781023', 'masculino', '1983-05-05', NULL, NULL, NULL, NULL),
(8, 'Sofia Milagros', 'Alvarenga', '37123475', '27371234755', '891245', 'femenino', '1990-09-22', NULL, NULL, NULL, NULL),
(9, 'Benjamin Elias', 'Ferreira', '38234567', '20382345678', '891278', 'masculino', '1999-01-11', NULL, NULL, NULL, NULL),
(10, 'Agustina Elena', 'Ojeda', '39345678', '20393456786', '901843', 'femenino', '1984-04-16', NULL, NULL, NULL, NULL),
(11, 'Lucas Emiliano', 'Fernandez', '30456726', '20304567264', NULL, 'masculino', '1980-12-01', NULL, NULL, NULL, NULL),
(12, 'Antonella', 'Gonzalez Prieto', '31567890', '20315678908', NULL, 'femenino', '1985-08-21', NULL, NULL, NULL, NULL),
(13, 'Juan Martin', 'Melgarejo', '50345127', '30503451275', NULL, 'masculino', '2009-05-12', NULL, NULL, NULL, NULL),
(14, 'Martina Belen', 'Insarralde', '33785623', '22337856237', NULL, 'femenino', '1992-07-19', NULL, NULL, NULL, NULL),
(15, 'Pablo Martin', 'Lopez', '23456123', '20234561236', NULL, 'masculino', '1978-08-07', NULL, NULL, NULL, NULL),
(16, 'Carolina Noelia', 'Salinas', '39456182', '28394561825', NULL, 'femenino', '1997-10-10', NULL, NULL, NULL, NULL),
(17, 'Diego Alejandro', 'Vega', '28652894', '22286528948', NULL, 'masculino', '1986-04-23', NULL, NULL, NULL, NULL),
(18, 'Valentino Bautista', 'Moretti', '40657297', '25406572977', NULL, 'masculino', '2008-07-15', NULL, NULL, NULL, NULL),
(19, 'Federico Tomas', 'Martinez', '38234567', '29382345675', NULL, 'masculino', '1993-11-10', NULL, NULL, NULL, NULL),
(20, 'Marina Soledad', 'Morales', '39345678', '20393456785', NULL, 'femenino', '1983-04-16', NULL, NULL, NULL, NULL),
(21, 'Agustina Soledad', 'Díaz', '44678901', '27446789012', '892317', 'femenino', '1990-05-12', NULL, NULL, NULL, NULL),
(22, 'Valeria Rocio', 'Rodriguez', '41345678', '29413456786', '891025', 'masculino', '1979-05-25', NULL, NULL, NULL, NULL),
(23, 'Roberto Santiago', 'Ruiz', '43547890', '20435478901', '781053', 'masculino', '1982-03-28', NULL, NULL, NULL, NULL),
(24, 'Julieta Elizabeth', 'Mendez', '40234567', '27402345678', '901739', 'femenino', '1983-10-07', NULL, NULL, NULL, NULL),
(25, 'Martina Aylen', 'Luna', '39802891', '20398028914', '801036', 'femenino', '1990-04-16', NULL, NULL, NULL, NULL),
(26, 'Matias Ezequiel', 'Gutiérrez', '49789012', '22497890128', '012281', 'masculino', '1987-06-15', NULL, NULL, NULL, NULL),
(27, 'Lorenzo Ramiro', 'Ferttoni', '39385012', '22393850125', '012281', 'masculino', '1991-06-25', NULL, NULL, NULL, NULL),
(28, 'Ambar Luciana', 'Herrera', '36890192', '20368901926', '193643', 'femenino', '1998-08-18', NULL, NULL, NULL, NULL),
(29, 'Pablo', 'Lampone', '47901234', '20479012342', '908212', 'masculino', '1981-11-20', NULL, NULL, NULL, NULL),
(30, 'Julio Andres', 'Martinez', '50123456', '22501234566', '909915', 'masculino', '1979-04-12', NULL, NULL, NULL, NULL),
(31, 'Solange Belen', 'Mendez', '38701967', '20387019676', '196204', 'femenino', '1990-08-06', NULL, NULL, NULL, NULL),
(32, 'Andrea Susana', 'Castillo', '38901221', '20389012216', '429810', 'femenino', '1993-08-20', NULL, NULL, NULL, NULL),
(33, 'Pedro Antonio', 'Trinidad', '32012345', '16320123457', '116012', 'masculino', '1975-11-08', NULL, NULL, NULL, NULL),
(34, 'Mario Alfonso', 'Torales', '12542875', '19125428754', '198712', 'masculino', '1966-12-10', NULL, NULL, NULL, NULL),
(35, 'Jorge Luis', 'Ramirez', '41234567', '20412345675', '801934', 'masculino', '1983-10-03', NULL, NULL, NULL, NULL),
(36, 'Maria Dolores', 'Iza', '37127743', '20371277439', '016722', 'femenino', '1998-03-17', NULL, NULL, NULL, NULL),
(37, 'Angel Esteban', 'Gonzalez', '36891078', '29368910786', '732817', 'masculino', '1991-06-20', NULL, NULL, NULL, NULL),
(38, 'Sofia Agustina', 'Delturco', '39605020', '20396050209', '103489', 'femenino', '1996-02-20', NULL, NULL, NULL, NULL),
(39, 'Sofia Agustina', 'Delturco', '39605020', '20396050209', '103489', 'femenino', '1996-02-20', NULL, NULL, NULL, NULL),
(40, 'Pilar', 'Lopez Aguero', '32361012', '20323610129', '791045', 'femenino', '1991-03-02', NULL, NULL, NULL, NULL),
(41, 'Pilar', 'Lopez Aguero', '32361012', '20323610129', '791045', 'femenino', '1991-03-02', NULL, NULL, NULL, NULL),
(42, 'maria teresa', 'montesco', '39108311', '10391083116', NULL, 'femenino', '1994-05-26', NULL, NULL, NULL, NULL),
(43, 'Mikaela Karina', 'Fernandez', '37102570', '28371025707', NULL, 'femenino', '1998-07-11', NULL, NULL, NULL, NULL),
(44, 'Lorena Romina', 'Cespedes', '32789126', '22327891268', NULL, 'femenino', '1985-03-28', NULL, NULL, NULL, NULL),
(45, 'Fabian', 'Cerfoglio', '28645912', '17286459127', '193478', 'masculino', '1975-03-24', NULL, NULL, NULL, NULL),
(46, 'Maria Eugenia', 'Fernandez', '36193672', '20361936722', '234876', 'femenino', '1990-07-10', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `id_provincia` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `codigo_postal` varchar(10) DEFAULT NULL,
  `id_pais` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`id_provincia`, `nombre`, `codigo_postal`, `id_pais`) VALUES
(1, 'Formosa', '3600', NULL),
(2, 'Formosa', '3600', NULL),
(3, 'Formosa', '3600', NULL),
(4, 'Formosa', '3600', NULL),
(5, 'Formosa', '3600', NULL),
(6, 'Formosa', '3600', NULL),
(7, 'Formosa', '3600', NULL),
(8, 'Formosa', '3600', NULL),
(9, 'Formosa', '3600', NULL),
(10, 'Formosa', '3600', NULL),
(11, 'Formosa', '3600', NULL),
(12, 'Formosa', '3600', NULL),
(13, 'Formosa', '3600', NULL),
(14, 'Formosa', '3600', NULL),
(15, 'Formosa', '3600', NULL),
(16, 'Formosa', '3600', NULL),
(17, 'Formosa', '3600', NULL),
(18, 'Formosa', '3600', NULL),
(19, 'Formosa', '3600', NULL),
(20, 'Formosa', '3600', NULL),
(21, 'Formosa', '3600', NULL),
(22, 'Formosa', '3600', NULL),
(23, 'Formosa', '3600', NULL),
(24, 'Formosa', '3600', NULL),
(25, 'Formosa', '3600', NULL),
(26, 'Formosa', '3600', NULL),
(27, 'Formosa', '3600', NULL),
(28, 'Formosa', '3600', NULL),
(29, 'Formosa', '3600', NULL),
(30, 'Formosa', '3600', NULL),
(31, 'Formosa', '3600', NULL),
(32, 'Formosa', '3600', NULL),
(33, 'Formosa', '3600', NULL),
(34, 'Formosa', '3600', NULL),
(35, 'Formosa', '3600', NULL),
(36, 'Formosa', '3600', NULL),
(37, 'Formosa', '3600', NULL),
(38, 'Formosa', '3600', NULL),
(39, 'Formosa', '3600', NULL),
(40, 'Formosa', '3600', NULL),
(41, 'Formosa', '3600', NULL),
(42, 'Formosa', '3600', NULL),
(43, 'Formosa', '3600', NULL),
(44, 'Formosa', '3600', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `id_registro` int(11) NOT NULL,
  `id_medicos` int(11) DEFAULT NULL,
  `id_analisisclinico` int(11) DEFAULT NULL,
  `diagnostico` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `paciente` varchar(50) NOT NULL,
  `DNI` varchar(10) NOT NULL,
  `id_persona` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` (`id_registro`, `id_medicos`, `id_analisisclinico`, `diagnostico`, `fecha`, `paciente`, `DNI`, `id_persona`) VALUES
(1, 5, NULL, 'Migraña. Tratamiento con analgésicos y triptanes según necesidad. Registro de factores desencadenantes. diagnostico editado\r\nhoy. edicion 17', '2024-07-17', 'Valentino Bautista Moretti', '40657297', NULL),
(2, 5, NULL, 'Migraña. Tratamiento con analgésicos y triptanes según necesidad. Registro de factores desencadenantes. nuevo editado\r\nnuehhsjjhs hhdfnhgfksbde tempertura de30°', '2024-07-17', 'Valentino Bautista Moretti', '40657297', NULL),
(3, 5, NULL, 'Migraña. Tratamiento con analgésicos y triptanes según necesidad. Registro de factores desencadenantes.\r\na ver si se guarda', '2024-07-17', 'Valentino Bautista Moretti', '40657297', NULL),
(4, 6, NULL, 'prueba modal', '2024-07-17', 'Valentino Bautista Moretti', '40657297', NULL),
(5, 2, NULL, 'prueba modal 2', '2024-07-17', 'Valentino Bautista Moretti', '40657297', NULL),
(6, 2, NULL, 'prueba modal 2', '2024-07-17', 'Valentino Bautista Moretti', '40657297', NULL),
(7, 1, NULL, 'prueba 3 modal', '2024-07-17', 'Valentino Bautista Moretti', '40657297', NULL),
(8, 1, NULL, 'prueba modal 4', '2024-07-17', 'Valentino Bautista Moretti', '40657297', NULL),
(9, 5, NULL, 'prueba modal 5', '2024-07-17', 'Valentino Bautista Moretti', '40657297', NULL),
(10, 1, NULL, 'otra pureba de modal 6', '2024-07-17', 'Valentino Bautista Moretti', '40657297', NULL),
(11, 1, NULL, 'prueba para nuevo diagnostico', '2024-07-18', 'Valentino Bautista Moretti', '40657297', NULL),
(12, 1, NULL, 'prueba de diseño ', '2024-07-23', 'Valentino Bautista Moretti', '40657297', NULL),
(13, 1, NULL, 'nueva prueba de diseño, la barra de navegacion quedó optima en su ubicacion. ', '2024-07-23', 'Valentino Bautista Moretti', '40657297', NULL),
(14, 1, NULL, 'ahora probaremos el diseño del modal', '2024-07-23', 'Valentino Bautista Moretti', '40657297', NULL),
(15, 1, NULL, 'probemos de neuvo el modal', '2024-07-23', 'Valentino Bautista Moretti', '40657297', NULL),
(16, 1, NULL, 'nuevo color del modal', '2024-07-23', 'Valentino Bautista Moretti', '40657297', NULL),
(17, 1, NULL, 'probar el funcionamiento despues de muchas pruebas de diseño. ', '2024-07-23', 'Valentino Bautista Moretti', '40657297', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_roles` int(11) NOT NULL,
  `rol` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_roles`, `rol`) VALUES
(1, 'administrador'),
(2, 'administrativo'),
(3, 'tecnico'),
(4, 'medico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `id_persona` int(11) DEFAULT NULL,
  `id_roles` int(11) DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `contraseña` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `id_persona`, `id_roles`, `usuario`, `contraseña`) VALUES
(1, NULL, 1, 'eduardo_adm', '$2y$10$WI09lOtza1rohNM6J/dxAeB6/EVHTLxzePdv8wpL3WaKOR0Vu2nOq'),
(2, 1, 4, 'giordano_lautaro', '$2y$10$Q.NmAb9vPZikgRdTaQNT/uf9X/kN74v/4MWRdHes1430C1oxeIY3C'),
(3, 24, 2, 'mendez_julieta', '$2y$10$SlecZLrNW05onegbx5edTuEbMdcci1PjnWVw7aYxl4qN94oqRHQAi'),
(4, 28, 3, 'herrera_luciana', '$2y$10$8PuFiwE7FkaJi/aILMXid.1DQuvQu7/asxw2UDT/2N46D9sX.B2Ce');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacaciones`
--

CREATE TABLE `vacaciones` (
  `id_vacaciones` int(11) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_final` date DEFAULT NULL,
  `id_persona` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vacaciones`
--

INSERT INTO `vacaciones` (`id_vacaciones`, `fecha_inicio`, `fecha_final`, `id_persona`) VALUES
(1, '2024-07-04', '2024-07-04', 33),
(2, '2024-07-27', '2024-08-10', 25),
(3, '2024-07-10', '2024-07-02', 18);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `analisis_clinico`
--
ALTER TABLE `analisis_clinico`
  ADD PRIMARY KEY (`id_analisisclinico`),
  ADD KEY `fk_analisis_clinico_medicos` (`id_medicos`),
  ADD KEY `fk_id_paciente` (`id_paciente`);

--
-- Indices de la tabla `cita_medica`
--
ALTER TABLE `cita_medica`
  ADD PRIMARY KEY (`id_citamedica`),
  ADD KEY `id_medicos` (`id_medicos`),
  ADD KEY `fk_cita_medica_id_persona` (`id_persona`);

--
-- Indices de la tabla `cobertura`
--
ALTER TABLE `cobertura`
  ADD PRIMARY KEY (`id_cobertura`);

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`id_contacto`);

--
-- Indices de la tabla `cronograma`
--
ALTER TABLE `cronograma`
  ADD PRIMARY KEY (`id_cronograma`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id_departamento`),
  ADD KEY `id_provincia` (`id_provincia`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id_direccion`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleados`),
  ADD KEY `id_persona` (`id_persona`),
  ADD KEY `id_medicos` (`id_medicos`),
  ADD KEY `id_matricula` (`id_matricula`),
  ADD KEY `id_vacaciones` (`id_vacaciones`),
  ADD KEY `id_ingresosustitucion` (`id_ingresosustitucion`),
  ADD KEY `fk_cronograma_empleados` (`id_cronograma`);

--
-- Indices de la tabla `grupo_sanguineo`
--
ALTER TABLE `grupo_sanguineo`
  ADD PRIMARY KEY (`id_gruposanguineo`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`id_historia`),
  ADD KEY `id_paciente` (`id_paciente`);

--
-- Indices de la tabla `ingreso_sustitucion`
--
ALTER TABLE `ingreso_sustitucion`
  ADD PRIMARY KEY (`id_ingresosustitucion`);

--
-- Indices de la tabla `internacion`
--
ALTER TABLE `internacion`
  ADD PRIMARY KEY (`id_internacion`);

--
-- Indices de la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD PRIMARY KEY (`id_matricula`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`id_medicos`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`id_municipio`),
  ADD KEY `id_departamento` (`id_departamento`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id_paciente`),
  ADD KEY `id_persona` (`id_persona`),
  ADD KEY `id_citamedica` (`id_citamedica`),
  ADD KEY `id_cobertura` (`id_cobertura`),
  ADD KEY `id_registro` (`id_registro`),
  ADD KEY `id_internacion` (`id_internacion`),
  ADD KEY `id_gruposanguineo` (`id_gruposanguineo`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`id_pais`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_persona`),
  ADD KEY `id_municipio` (`id_municipio`),
  ADD KEY `id_direccion` (`id_direccion`),
  ADD KEY `id_contacto` (`id_contacto`),
  ADD KEY `fk_id_medicos` (`id_medicos`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`id_provincia`),
  ADD KEY `id_pais` (`id_pais`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`id_registro`),
  ADD KEY `id_medicos` (`id_medicos`),
  ADD KEY `id_analisisclinico` (`id_analisisclinico`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_roles`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_persona` (`id_persona`),
  ADD KEY `id_roles` (`id_roles`);

--
-- Indices de la tabla `vacaciones`
--
ALTER TABLE `vacaciones`
  ADD PRIMARY KEY (`id_vacaciones`),
  ADD KEY `fk_id_persona` (`id_persona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `analisis_clinico`
--
ALTER TABLE `analisis_clinico`
  MODIFY `id_analisisclinico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `cita_medica`
--
ALTER TABLE `cita_medica`
  MODIFY `id_citamedica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `cobertura`
--
ALTER TABLE `cobertura`
  MODIFY `id_cobertura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `contacto`
--
ALTER TABLE `contacto`
  MODIFY `id_contacto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `cronograma`
--
ALTER TABLE `cronograma`
  MODIFY `id_cronograma` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id_departamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id_direccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleados` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `grupo_sanguineo`
--
ALTER TABLE `grupo_sanguineo`
  MODIFY `id_gruposanguineo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `id_historia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingreso_sustitucion`
--
ALTER TABLE `ingreso_sustitucion`
  MODIFY `id_ingresosustitucion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `internacion`
--
ALTER TABLE `internacion`
  MODIFY `id_internacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `matricula`
--
ALTER TABLE `matricula`
  MODIFY `id_matricula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `medicos`
--
ALTER TABLE `medicos`
  MODIFY `id_medicos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `municipio`
--
ALTER TABLE `municipio`
  MODIFY `id_municipio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `id_pais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `provincia`
--
ALTER TABLE `provincia`
  MODIFY `id_provincia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `registro`
--
ALTER TABLE `registro`
  MODIFY `id_registro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_roles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `vacaciones`
--
ALTER TABLE `vacaciones`
  MODIFY `id_vacaciones` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `analisis_clinico`
--
ALTER TABLE `analisis_clinico`
  ADD CONSTRAINT `fk_analisis_clinico_medicos` FOREIGN KEY (`id_medicos`) REFERENCES `medicos` (`id_medicos`),
  ADD CONSTRAINT `fk_id_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`);

--
-- Filtros para la tabla `cita_medica`
--
ALTER TABLE `cita_medica`
  ADD CONSTRAINT `cita_medica_ibfk_1` FOREIGN KEY (`id_medicos`) REFERENCES `medicos` (`id_medicos`),
  ADD CONSTRAINT `fk_cita_medica_id_persona` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`id_provincia`) REFERENCES `provincia` (`id_provincia`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`),
  ADD CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`id_medicos`) REFERENCES `medicos` (`id_medicos`),
  ADD CONSTRAINT `empleados_ibfk_3` FOREIGN KEY (`id_matricula`) REFERENCES `matricula` (`id_matricula`),
  ADD CONSTRAINT `empleados_ibfk_4` FOREIGN KEY (`id_vacaciones`) REFERENCES `vacaciones` (`id_vacaciones`),
  ADD CONSTRAINT `empleados_ibfk_5` FOREIGN KEY (`id_ingresosustitucion`) REFERENCES `ingreso_sustitucion` (`id_ingresosustitucion`),
  ADD CONSTRAINT `fk_cronograma_empleados` FOREIGN KEY (`id_cronograma`) REFERENCES `cronograma` (`id_cronograma`);

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`);

--
-- Filtros para la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD CONSTRAINT `medicos_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD CONSTRAINT `municipio_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`);

--
-- Filtros para la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `pacientes_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`),
  ADD CONSTRAINT `pacientes_ibfk_2` FOREIGN KEY (`id_citamedica`) REFERENCES `cita_medica` (`id_citamedica`),
  ADD CONSTRAINT `pacientes_ibfk_3` FOREIGN KEY (`id_cobertura`) REFERENCES `cobertura` (`id_cobertura`),
  ADD CONSTRAINT `pacientes_ibfk_4` FOREIGN KEY (`id_registro`) REFERENCES `registro` (`id_registro`),
  ADD CONSTRAINT `pacientes_ibfk_5` FOREIGN KEY (`id_internacion`) REFERENCES `internacion` (`id_internacion`),
  ADD CONSTRAINT `pacientes_ibfk_6` FOREIGN KEY (`id_gruposanguineo`) REFERENCES `grupo_sanguineo` (`id_gruposanguineo`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_id_medicos` FOREIGN KEY (`id_medicos`) REFERENCES `medicos` (`id_medicos`),
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id_municipio`),
  ADD CONSTRAINT `persona_ibfk_2` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`),
  ADD CONSTRAINT `persona_ibfk_3` FOREIGN KEY (`id_contacto`) REFERENCES `contacto` (`id_contacto`);

--
-- Filtros para la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD CONSTRAINT `provincia_ibfk_1` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`);

--
-- Filtros para la tabla `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `registro_ibfk_1` FOREIGN KEY (`id_medicos`) REFERENCES `medicos` (`id_medicos`),
  ADD CONSTRAINT `registro_ibfk_2` FOREIGN KEY (`id_analisisclinico`) REFERENCES `analisis_clinico` (`id_analisisclinico`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_roles`) REFERENCES `roles` (`id_roles`);

--
-- Filtros para la tabla `vacaciones`
--
ALTER TABLE `vacaciones`
  ADD CONSTRAINT `fk_id_persona` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`);
--
-- Base de datos: `biblioteca`
--
CREATE DATABASE IF NOT EXISTS `biblioteca` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `biblioteca`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `autor` varchar(255) NOT NULL,
  `genero` varchar(100) DEFAULT NULL,
  `anio_publicacion` int(11) DEFAULT NULL,
  `estado` enum('disponible','prestado') DEFAULT 'disponible',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id`, `titulo`, `autor`, `genero`, `anio_publicacion`, `estado`, `created_at`) VALUES
(1, 'mauro', 'boveda', 'masculino', 2024, 'prestado', '2024-11-23 05:13:29'),
(2, 'marcial', 'dicaprio', 'masculino', 1999, 'disponible', '2024-11-23 05:17:02'),
(3, 'Di Maria ', 'franc', 'masculino', 2023, 'prestado', '2024-11-23 05:51:13'),
(4, '100 de soledad', 'gabriel garcia marquz', 'fantastica', 1950, 'prestado', '2024-11-25 20:02:34'),
(5, 'el señor de los anillos', 'jrr tolkien', 'fantasia', 1939, 'prestado', '2024-11-25 20:27:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id_persona` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id_persona`, `nombre`, `apellido`, `dni`, `telefono`, `email`) VALUES
(1, 'Juan', 'Pérez', '12345678', '1112345678', 'juan.perez@example.com'),
(2, 'belen', 'valenzuela', '', NULL, 'belen@example.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `id` int(11) NOT NULL,
  `libro_id` int(11) DEFAULT NULL,
  `usuario_nombre` varchar(255) NOT NULL,
  `usuario_email` varchar(255) NOT NULL,
  `fecha_prestamo` datetime NOT NULL,
  `fecha_devolucion` datetime DEFAULT NULL,
  `estado` enum('activo','devuelto') DEFAULT 'activo',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`id`, `libro_id`, `usuario_nombre`, `usuario_email`, `fecha_prestamo`, `fecha_devolucion`, `estado`, `created_at`) VALUES
(1, 1, 'carlos', 'carlos23@gmail.com', '2024-11-23 02:48:59', NULL, 'activo', '2024-11-23 05:48:59'),
(2, 3, 'lujan', 'lujan1234@gmail.com', '2024-11-23 02:52:45', NULL, 'activo', '2024-11-23 05:52:45'),
(3, 4, 'belen', 'belen@example.com', '2024-11-25 17:03:24', NULL, 'activo', '2024-11-25 20:03:24'),
(4, 5, 'mauro', 'maurito@example.com', '2024-11-25 17:28:34', NULL, 'activo', '2024-11-25 20:28:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_roles` int(11) NOT NULL,
  `rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_roles`, `rol`) VALUES
(1, 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contrasenia` varchar(255) NOT NULL,
  `id_roles` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `contrasenia`, `id_roles`, `id_persona`) VALUES
(1, 'admin', '$2y$10$E1Q4D7dHC/ohuzWQUP2QOufcPzZWdSOJ0s0j2LXVD4Bm9bnPX/gja', 1, 1),
(3, 'belen', '$2y$10$wflLA/ISon6MlVBWahusMuftCo7KRRhLh5QVa0ZoJzxeR6uoLSQme', 1, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id_persona`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `libro_id` (`libro_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_roles`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD KEY `id_roles` (`id_roles`),
  ADD KEY `id_persona` (`id_persona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_roles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`libro_id`) REFERENCES `libros` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_roles`) REFERENCES `roles` (`id_roles`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`);
--
-- Base de datos: `dermatologia`
--
CREATE DATABASE IF NOT EXISTS `dermatologia` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dermatologia`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id_compras` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `total` decimal(10,2) NOT NULL,
  `detalles` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id_persona` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id_persona`, `nombre`, `apellido`, `dni`, `telefono`, `email`) VALUES
(1, 'Marianella', 'Sotelo', '38540887', '3704925959', 'marsotelo@example.com'),
(2, 'Laura', 'Gomez', '34567890', '(370) 492-5944', 'lauragomez@example.com'),
(3, 'Andrea', 'Vera', '37345129', '370481297', 'andrevera@example.com'),
(4, 'Sara', 'Lopez', '40657297', '3704172369', 'saralopez@example.com'),
(5, 'Yanina', 'Isolini', '39462987', '3718 493495', 'yaninaisolini@example.com'),
(9, 'Yanina ', 'salcedo', '38640172', '3704346887', 'salcedoyani@example.com'),
(10, 'Camila', 'Gomez', '37231127', '3704321405', 'camigomez@example.com'),
(11, 'Araceli', 'Rodas', '39357240', NULL, 'ararodas@example.com'),
(12, 'Julieta', 'Pontte', '30704210', '3704351520', 'ponttejulieta@example.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_roles` int(11) NOT NULL,
  `rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_roles`, `rol`) VALUES
(2, 'asistente'),
(1, 'doctora'),
(3, 'paciente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamientos`
--

CREATE TABLE `tratamientos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tratamientos`
--

INSERT INTO `tratamientos` (`id`, `titulo`, `descripcion`, `precio`, `fecha_creacion`, `imagen`) VALUES
(2, 'Limpieza Facial Profunda', 'Elimina impurezas, células muertas y exceso de grasa en la piel. Ayuda a reducir puntos negros y mantener un rostro fresco y radiante.', 7500.00, '2024-11-24 20:21:48', '1736636740-LimpiezaFacial.jpg'),
(3, 'Masajes Faciales', 'Técnica que ayuda a relajar los músculos, aliviar tensiones y mejorar la circulación. Ideal para personas con estrés o contracturas.', 3000.00, '2024-11-24 20:40:28', '1736638082-MasajeFacial.jpg'),
(4, 'Depilación Láser', 'Tratamiento de depilación permanente con tecnología láser, que reduce el vello en diferentes áreas del cuerpo de manera efectiva.', 6500.00, '2024-11-24 20:40:52', '1736638162-DepilacionLaser.jpg'),
(5, 'Peeling ', 'Procedimiento que exfolia la piel para tratar manchas, cicatrices de acné y arrugas. Favorece la regeneración celular para una piel más luminosa y uniforme.', 6200.00, '2024-11-24 20:41:18', '1736638338-PeelingQuimico.jpg'),
(6, 'Tratamiento de Hidratación Profunda', 'Rehidrata las capas internas de la piel mediante productos específicos o tecnología como la oxigenoterapia. Ideal para pieles secas o deshidratadas.', 3800.00, '2024-11-24 20:41:41', '1736638832-Hidratacion.jpg'),
(7, 'Radiofrecuencia Facial y Corporal', 'Estimula la producción de colágeno para tensar la piel y reducir la flacidez. Puede aplicarse en rostro o zonas corporales. Que requieran del tramamiento', 7000.00, '2024-11-24 20:44:47', '1736639029-RadioFrecuencia.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

CREATE TABLE `turnos` (
  `id_turno` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `diagnostico` varchar(250) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `estado` enum('reservado','confirmado','cancelado') DEFAULT 'reservado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `turnos`
--

INSERT INTO `turnos` (`id_turno`, `fecha`, `hora`, `diagnostico`, `id_persona`, `estado`) VALUES
(9, '2024-11-26', '08:30:00', 'acne consulta nueva consulta', 4, 'reservado'),
(10, '2024-11-28', '08:30:00', 'piel seca', 9, 'reservado'),
(14, '2024-12-02', '09:30:00', 'segunda prueba de calendario de este mes', 2, 'reservado'),
(15, '2024-11-28', '08:00:00', 'ultima', 4, 'reservado'),
(16, '2024-11-27', '10:00:00', 'prueba de agendar cita', 4, 'reservado'),
(18, '2024-11-26', '08:00:00', 'prueba de diseño', 4, 'reservado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contrasenia` varchar(255) NOT NULL,
  `id_roles` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `contrasenia`, `id_roles`, `id_persona`) VALUES
(1, 'marsotelo', '$2y$10$5849z/fX.ZZ74/iJcYrdzuBE7zSN4361D3cjzf3NeqWnIGTpz6eVa', 3, 1),
(3, 'laugomez', '$2y$10$Mm.v5fgTynbCa3nEHLYWFuqCDAup1F1gXMuaaAFhf76x/1MGa1f8q', 3, 2),
(6, 'andreavera', '$2y$10$HcyfSX66nxNMUvtWlqmNMOFF2.pbcWXdQ5W/NvVJ2xC11w14neXw2', 2, 3),
(7, 'ararodas', '$2y$10$1B2K42ykoym0FZCcnHPCkewO6wDQs.OyaxLN04r1yqPWtRNryFoSu', 3, 11),
(9, 'julietapontte', '$2y$10$6Ar4AYI806zXt4nZuxUiX.CavvUVotGxp49mwQDGVijfUJ7T9tNe.', 1, 12);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id_compras`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id_persona`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_roles`),
  ADD UNIQUE KEY `rol` (`rol`);

--
-- Indices de la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`id_turno`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD KEY `id_roles` (`id_roles`),
  ADD KEY `id_persona` (`id_persona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id_compras` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_roles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `turnos`
--
ALTER TABLE `turnos`
  MODIFY `id_turno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD CONSTRAINT `turnos_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`) ON DELETE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_roles`) REFERENCES `roles` (`id_roles`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`);
--
-- Base de datos: `mvc`
--
CREATE DATABASE IF NOT EXISTS `mvc` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mvc`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `id` int(11) NOT NULL,
  `title` varchar(75) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`id`, `title`, `content`) VALUES
(7, 'Análisis y Diseño de Sotfware ', 'Principios de Diseño de Software\r\nPatrones de Diseño\r\nArquitectura de Software\r\nDiseño Orientado a Objetos (OOD)\r\nDiseño Basado en Componentes\r\nModelado UML (Lenguaje Unificado de Modelado)\r\nPrincipios SOLID\r\nMetodologías de Diseño Ágil\r\nControl de Versiones y Gestión de Cambios\r\nDocumentación y Especificación de Software'),
(9, 'Base de Datos II', 'Modelado de datos\r\nDiseño de bases de datos relacionales\r\nNormalización y desnormalización\r\nLenguaje SQL (Structured Query Language)\r\nTransacciones y control de concurrencia\r\nSistemas de gestión de bases de datos (DBMS)\r\nAlmacenamiento y recuperación de datos\r\nSeguridad y privacidad en bases de datos\r\nBases de datos NoSQL\r\nOptimización de consultas y rendimiento');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Volcado de datos para la tabla `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"relation_lines\":\"true\",\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"dermatologia\",\"table\":\"personas\"},{\"db\":\"dermatologia\",\"table\":\"usuarios\"},{\"db\":\"dermatologia\",\"table\":\"roles\"},{\"db\":\"dermatologia\",\"table\":\"tratamientos\"},{\"db\":\"dermatologia\",\"table\":\"compras\"},{\"db\":\"biblioteca\",\"table\":\"personas\"},{\"db\":\"biblioteca\",\"table\":\"roles\"},{\"db\":\"biblioteca\",\"table\":\"usuarios\"},{\"db\":\"mvc\",\"table\":\"materias\"},{\"db\":\"sistema_biblioteca\",\"table\":\"usuarios\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Volcado de datos para la tabla `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'biblioteca', 'usuarios', '[]', '2024-11-25 20:14:17'),
('root', 'dermatologia', 'personas', '{\"CREATE_TIME\":\"2024-11-17 16:35:21\",\"col_order\":[0,1,2,3,4,5],\"col_visib\":[1,1,1,1,1,1]}', '2025-03-01 23:40:26'),
('root', 'dermatologia', 'turnos', '{\"sorted_col\":\"`turnos`.`id_persona` DESC\"}', '2024-11-23 22:37:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-03-02 00:08:34', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"es\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `sistema_biblioteca`
--
CREATE DATABASE IF NOT EXISTS `sistema_biblioteca` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sistema_biblioteca`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `autor` varchar(255) NOT NULL,
  `anio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `id` int(11) NOT NULL,
  `id_libro` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_prestamo` date DEFAULT NULL,
  `fecha_devolucion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `contraseña` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `contraseña`) VALUES
(2, 'belen', 'belen123');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_libro` (`id_libro`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id`),
  ADD CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
