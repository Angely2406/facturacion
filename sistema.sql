-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-05-2022 a las 21:12:53
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(200) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `cliente` (`idcliente`, `nombre`, `telefono`, `direccion`) VALUES
(1, 'Elizabeth Lopez', '3213200152', 'crr15b#5a3'),
(2, 'Keily Hernandez', '3115475305', 'cll14#959'),
(4, 'Yefry Fonseca', '3125644188', 'villas de madrid'),
(6, 'Ivan Riaño', '3212182686', 'Amrilo');

CREATE TABLE `detalle_facturacion` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `precio` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `detalle_facturacion` (`id`, `id_producto`, `id_venta`, `cantidad`, `fecha`, `precio`, `total`) VALUES
(33, 7, 26, 6, '2022-05-06 23:02:23', '200000.00', '2400000.00'),
(34, 11, 26, 2, '2022-05-06 23:02:23', '200000.00', '400000.00'),
(35, 1, 27, 2, '2022-05-06 23:03:26', '1500.00', '3000.00'),
(36, 7, 27, 8, '2022-05-06 23:03:26', '200000.00', '1600000.00'),
(37, 9, 28, 2, '2022-05-07 01:41:51', '900000.00', '1800000.00'),
(38, 8, 28, 27, '2022-05-07 01:41:51', '120000.00', '3240000.00'),
(39, 1, 29, 2, '2022-05-07 03:07:39', '1500.00', '3000.00'),
(40, 9, 29, 2, '2022-05-07 03:07:39', '900000.00', '1800000.00');

CREATE TABLE `detalle_permisos` (
  `id` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `detalle_temp` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `precio_venta` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `encabezado` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


INSERT INTO `encabezado` (`id`, `nombre`, `telefono`, `email`, `direccion`) VALUES
(1, 'Facturas Angely', '3213200152', 'facturas.angely@gamil.com', 'Madrid, Cundinamrca ');

CREATE TABLE `facturacion` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `facturacion` (`id`, `id_cliente`, `total`, `id_usuario`, `fecha`) VALUES
(8, 1, '350.00', 1, '2022-05-06 17:48:55'),
(9, 2, '350.00', 1, '2022-05-06 17:50:47'),
(10, 2, '350.00', 1, '2022-05-06 17:52:03'),
(11, 2, '350.00', 1, '2022-05-06 17:55:19'),
(12, 1, '700.00', 1, '2022-05-06 18:02:05'),
(13, 1, '700.00', 1, '2022-05-06 18:06:42'),
(14, 1, '700.00', 1, '2022-05-06 18:07:19'),
(15, 1, '3000.00', 1, '2022-05-06 18:37:38'),
(16, 4, '60000.00', 1, '2022-05-06 18:39:21'),
(17, 1, '1200000.00', 1, '2022-05-06 20:58:13'),
(18, 1, '4000000.00', 1, '2022-05-06 21:07:15'),
(19, 1, '1600000.00', 1, '2022-05-06 21:28:17'),
(20, 1, '1800000.00', 1, '2022-05-06 21:42:52'),
(21, 1, '1600000.00', 1, '2022-05-06 21:52:07'),
(22, 1, '1600000.00', 1, '2022-05-06 21:55:46'),
(23, 1, '360000.00', 1, '2022-05-06 21:57:58'),
(24, 1, '2000000.00', 1, '2022-05-06 22:07:38'),
(25, 2, '4500000.00', 1, '2022-05-06 22:09:10'),
(26, 1, '2800000.00', 1, '2022-05-06 23:02:23'),
(27, 1, '1603000.00', 1, '2022-05-06 23:03:26'),
(28, 1, '5040000.00', 1, '2022-05-07 01:41:51'),
(29, 1, '1803000.00', 1, '2022-05-07 03:07:39');

CREATE TABLE `permisos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `permisos` (`id`, `nombre`) VALUES
(1, 'encabezado'),
(2, 'usuarios'),
(3, 'clientes'),
(4, 'productos'),
(5, 'facturacion'),
(6, 'nueva_venta');


CREATE TABLE `producto` (
  `codproducto` int(11) NOT NULL,
  `codigo` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `existencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


INSERT INTO `producto` (`codproducto`, `codigo`, `descripcion`, `precio`, `existencia`) VALUES
(1, '123456', 'Televisor', '1500000.00', 44),
(2, '13256445', 'Celular', '1800000.00', 90),
(3, '97879846', 'Impresora', '500000.00', 90),
(4, '978798', 'Computadora', '3000000.00', 90),
(5, '7977989', 'audifonos', '350000.00', 80),
(6, '78879978', 'scaner', '150000.00', 90),
(7, '123456789', 'Escritorio', '200000.00', 27),
(8, '654789123', 'Computador Acer ', '120000.00', 60),
(9, '987321456', 'Modem', '900000.00', 81),
(10, '741963852', 'Mouse', '500000.00', 82),
(11, '963852741', 'Teclado', '200000.00', 88);

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `usuario` (`idusuario`, `nombre`, `correo`, `usuario`, `clave`) VALUES
(1, 'Angely', 'angely@gmail.com', 'admin', '21232f297a57a5a743894a0e4a801fc3');

ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`);

ALTER TABLE `detalle_facturacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_venta` (`id_venta`);


ALTER TABLE `detalle_permisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_permiso` (`id_permiso`),
  ADD KEY `id_usuario` (`id_usuario`);

ALTER TABLE `detalle_temp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_producto` (`id_producto`);

ALTER TABLE `encabezado`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `facturacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_cliente` (`id_cliente`);

ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `producto`
  ADD PRIMARY KEY (`codproducto`);


ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `detalle_facturacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

ALTER TABLE `detalle_permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

ALTER TABLE `detalle_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

ALTER TABLE `encabezado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE `facturacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `producto`
  MODIFY `codproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

ALTER TABLE `detalle_facturacion`
  ADD CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`codproducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`id_venta`) REFERENCES `facturacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `detalle_permisos`
  ADD CONSTRAINT `detalle_permisos_ibfk_1` FOREIGN KEY (`id_permiso`) REFERENCES `permisos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_permisos_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `detalle_temp`
  ADD CONSTRAINT `detalle_temp_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`codproducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_temp_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `facturacion`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`idcliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;