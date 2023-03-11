-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-03-2023 a las 05:20:02
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `softnet`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `drivers`
--

CREATE TABLE `drivers` (
  `id` int(10) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `ssd` varchar(25) NOT NULL,
  `dob` date NOT NULL,
  `address` varchar(25) NOT NULL,
  `city` varchar(25) NOT NULL,
  `zip` varchar(25) NOT NULL,
  `phone` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `drivers`
--

INSERT INTO `drivers` (`id`, `last_name`, `first_name`, `ssd`, `dob`, `address`, `city`, `zip`, `phone`, `active`, `updated_at`, `created_at`) VALUES
(1, 'daniel', 'Loren', 'mfp', '2023-03-09', 'carrera 24', 'Cartagena', 'sip', 301526454, 1, NULL, NULL),
(2, 'Jirian', 'Martinez', 'Kfs', '2023-03-09', 'carrera 30', 'cali', 'sip', 301526454, 1, '2023-03-11', '2023-03-09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `routers`
--

CREATE TABLE `routers` (
  `id` int(10) NOT NULL,
  `description` varchar(25) NOT NULL,
  `driver_id` int(15) NOT NULL,
  `vehicle_id` int(15) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `routers`
--

INSERT INTO `routers` (`id`, `description`, `driver_id`, `vehicle_id`, `active`, `updated_at`, `created_at`) VALUES
(1, 'Control', 2, 1, 1, '2023-03-11', '2023-03-09'),
(2, 'Creacion', 1, 1, 1, '2023-03-09', '2023-03-09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `schedules`
--

CREATE TABLE `schedules` (
  `id` int(10) NOT NULL,
  `router_id` int(10) NOT NULL,
  `week_num` int(10) NOT NULL,
  `from` date NOT NULL,
  `to` date NOT NULL,
  `active` tinyint(1) NOT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `schedules`
--

INSERT INTO `schedules` (`id`, `router_id`, `week_num`, `from`, `to`, `active`, `updated_at`, `created_at`) VALUES
(2, 2, 2000, '2023-03-02', '2023-03-16', 1, '2023-03-11', '2023-03-11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `alias` varchar(25) NOT NULL,
  `contraseña` varchar(25) NOT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `alias`, `contraseña`, `updated_at`, `created_at`) VALUES
(1, 'prueba', 'Cali', '333665', '2023-03-09', '2023-03-09'),
(2, 'Jirian Martinez', 'HellBlast', '333669', '2023-03-09', '2023-03-09'),
(3, 'hector', 'BrushBrosh', '12345', '2023-03-10', '2023-03-10'),
(4, 'prueba05', 'Impuesto', '333', '2023-03-11', '2023-03-11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(10) NOT NULL,
  `description` varchar(25) NOT NULL,
  `year` int(10) NOT NULL,
  `make` int(10) NOT NULL,
  `capacity` int(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vehicles`
--

INSERT INTO `vehicles` (`id`, `description`, `year`, `make`, `capacity`, `active`, `updated_at`, `created_at`) VALUES
(1, 'carro', 2022, 22, 12, 0, '2023-03-09', NULL),
(3, 'avion', 2020, 20, 2, 1, '2023-03-11', '2023-03-10');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `routers`
--
ALTER TABLE `routers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `router_driver_id_fk` (`driver_id`),
  ADD KEY `router_vehicle_id_fk` (`vehicle_id`);

--
-- Indices de la tabla `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedules_route_id_fk` (`router_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `routers`
--
ALTER TABLE `routers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `routers`
--
ALTER TABLE `routers`
  ADD CONSTRAINT `router_driver_id_fk` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`),
  ADD CONSTRAINT `router_vehicle_id_fk` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`);

--
-- Filtros para la tabla `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_route_id_fk` FOREIGN KEY (`router_id`) REFERENCES `routers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
