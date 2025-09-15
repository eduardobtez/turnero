-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 15-09-2025 a las 16:15:59
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
-- Base de datos: `dermatologia`
--

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
(1, 'marsotelo', '$2y$10$nOg.8n/n7PO6WmsGam4Z0e1M8n94HlofU5r/qdfH9uVvNuv73ZCn6', 3, 1),
(3, 'laugomez', '$2y$10$Mm.v5fgTynbCa3nEHLYWFuqCDAup1F1gXMuaaAFhf76x/1MGa1f8q', 3, 2),
(6, 'andreavera', '$2y$10$HcyfSX66nxNMUvtWlqmNMOFF2.pbcWXdQ5W/NvVJ2xC11w14neXw2', 2, 3),
(7, 'ararodas', '$2y$10$1B2K42ykoym0FZCcnHPCkewO6wDQs.OyaxLN04r1yqPWtRNryFoSu', 3, 11),
(9, 'julietapontte', '$2y$10$Jgxi/3HqQcT4o1vnykqKueDiOjIT6y2CpwHLy8zm8W19afEIWe81i', 1, 12);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
