-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-05-2022 a las 02:15:00
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

(20, 'Elizabeth Lopez', '3213200152', 'crr15b#5a3'),
(21, 'Keily Hernandez', '3115475305', 'cll14#959'),
(22, 'Yefry Fonseca', '3125644188', 'villas de madrid'),
(23, 'Ivan Riaño', '3212182686', 'Amrilo');


CREATE TABLE `detalle_facturacion` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `iva` int(30) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `precio` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `detalle_facturacion` (`id`, `id_producto`, `id_venta`, `cantidad`, `iva`, `fecha`, `precio`, `total`) VALUES
(45, 7, 32, 3, 0, '2022-05-08 23:47:29', '200000.00', '600000.00'),
(46, 4, 32, 3, 0, '2022-05-08 23:47:29', '3000.00', '9000.00'),
(47, 4, 33, 10, 0, '2022-05-08 23:55:11', '3000.00', '30000.00'),
(48, 5, 33, 2, 0, '2022-05-08 23:55:11', '350.00', '700.00'),
(49, 4, 34, 2, 0, '2022-05-09 00:00:55', '3000.00', '6000.00'),
(50, 7, 34, 8, 0, '2022-05-09 00:00:55', '200000.00', '1600000.00'),
(51, 1, 35, 6, 0, '2022-05-09 00:08:52', '1500000.00', '9000000.00'),
(52, 5, 35, 3, 0, '2022-05-09 00:08:52', '350.00', '1050.00'),
(53, 5, 36, 1, 0, '2022-05-09 00:11:22', '350.00', '350.00'),
(54, 8, 37, 3, 0, '2022-05-09 00:12:29', '120000.00', '360000.00'),
(55, 1, 38, 3, 0, '2022-05-09 00:13:01', '1500000.00', '4500000.00');


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
  `iva` int(30) NOT NULL,
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
  `iva` int(30) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `facturacion` (`id`, `id_cliente`, `total`, `id_usuario`, `iva`, `fecha`) VALUES
(32, 21, '609000.00', 1, 0, '2022-05-08 23:47:29'),
(33, 20, '30700.00', 1, 0, '2022-05-08 23:55:11'),
(34, 20, '1606000.00', 1, 0, '2022-05-09 00:00:55'),
(35, 21, '9001050.00', 1, 0, '2022-05-09 00:08:52'),
(36, 20, '350.00', 1, 0, '2022-05-09 00:11:22'),
(37, 22, '360000.00', 1, 0, '2022-05-09 00:12:29'),
(38, 21, '4500000.00', 1, 0, '2022-05-09 00:13:01');


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
(1, '123456', 'Televisor Lg', '1500000.00', 35),
(2, '13256445', 'Celular Lg', '800.00', 90),
(3, '97879846', 'Impresora epson L300', '500.00', 90),
(4, '978798', 'Computadora Lenovo', '3000.00', 75),
(5, '7977989', 'Scanner', '350.00', 12),
(6, '78879978', 'Arroz Trujillo', '15.00', 90),
(7, '123456789', 'Escritorio', '200000.00', 12),
(8, '654789123', 'Computador Acer ', '120000.00', 51),
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
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;


ALTER TABLE `detalle_facturacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;


ALTER TABLE `detalle_permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;


ALTER TABLE `detalle_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;


ALTER TABLE `encabezado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE `facturacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;


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
