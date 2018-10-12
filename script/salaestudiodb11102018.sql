-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-10-2018 a las 19:29:10
-- Versión del servidor: 10.1.34-MariaDB
-- Versión de PHP: 7.1.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `salaestudiodb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `precision` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `thousand_separator` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `decimal_separator` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `precision`, `thousand_separator`, `decimal_separator`, `code`) VALUES
(1, 'US Dollar', '$', '2', ',', '.', 'USD'),
(2, 'Libra Esterlina', '&pound;', '2', ',', '.', 'GBP'),
(3, 'Euro', 'â‚¬', '2', '.', ',', 'EUR'),
(4, 'South African Rand', 'R', '2', '.', ',', 'ZAR'),
(5, 'Danish Krone', 'kr ', '2', '.', ',', 'DKK'),
(6, 'Israeli Shekel', 'NIS ', '2', ',', '.', 'ILS'),
(7, 'Swedish Krona', 'kr ', '2', '.', ',', 'SEK'),
(8, 'Kenyan Shilling', 'KSh ', '2', ',', '.', 'KES'),
(9, 'Canadian Dollar', 'C$', '2', ',', '.', 'CAD'),
(10, 'Philippine Peso', 'P ', '2', ',', '.', 'PHP'),
(11, 'Indian Rupee', 'Rs. ', '2', ',', '.', 'INR'),
(12, 'Australian Dollar', '$', '2', ',', '.', 'AUD'),
(13, 'Singapore Dollar', 'SGD ', '2', ',', '.', 'SGD'),
(14, 'Norske Kroner', 'kr ', '2', '.', ',', 'NOK'),
(15, 'New Zealand Dollar', '$', '2', ',', '.', 'NZD'),
(16, 'Vietnamese Dong', 'VND ', '0', '.', ',', 'VND');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `color` varchar(7) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `events`
--

INSERT INTO `events` (`id`, `title`, `color`, `start`, `end`) VALUES
(18, 'Reserva Banda ppi', '#008000', '2017-12-10 00:00:00', '2017-12-11 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ft_estado`
--

CREATE TABLE `ft_estado` (
  `ID_ESTADO` int(5) NOT NULL,
  `DES_ESTADO` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ft_estado`
--

INSERT INTO `ft_estado` (`ID_ESTADO`, `DES_ESTADO`) VALUES
(1, 'Pagado'),
(2, 'Pendiente de pago');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ft_factura`
--

CREATE TABLE `ft_factura` (
  `CS_FACTURA_ID` int(6) NOT NULL,
  `DS_CODIGO_FACTURA` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NM_VENDEDOR_ID` bigint(20) NOT NULL,
  `DS_NOTAS_FACTURA` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NM_PRECIO_SUBTOTAL` double NOT NULL,
  `NM_PRECIO_DESCUENTO` double DEFAULT '0',
  `NM_PRECIO_TOTAL` double NOT NULL,
  `NM_PRECIO_IVA` double DEFAULT NULL,
  `DT_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `NM_CLIENTE_ID` bigint(20) DEFAULT NULL,
  `DS_CLIENTE` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `ID_ESTADO` int(5) NOT NULL DEFAULT '1',
  `ID_FORMA_PAGO` int(5) DEFAULT NULL,
  `NM_PORCENTAJE_DESCUENTO` int(3) DEFAULT '0',
  `ID_RESERVA` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `ft_factura`
--

INSERT INTO `ft_factura` (`CS_FACTURA_ID`, `DS_CODIGO_FACTURA`, `NM_VENDEDOR_ID`, `DS_NOTAS_FACTURA`, `NM_PRECIO_SUBTOTAL`, `NM_PRECIO_DESCUENTO`, `NM_PRECIO_TOTAL`, `NM_PRECIO_IVA`, `DT_FECHA_CREACION`, `NM_CLIENTE_ID`, `DS_CLIENTE`, `ID_ESTADO`, `ID_FORMA_PAGO`, `NM_PORCENTAJE_DESCUENTO`, `ID_RESERVA`) VALUES
(1, '0000000001', 1152188863, 'asdfasdf', 135000, 0, 156600, 21600, '2018-09-16 11:28:31', 36610553, '', 1, 1, 0, NULL),
(2, '0000000001', 1152188863, 'asdfasdf', 135000, 0, 156600, 21600, '2018-09-16 11:57:15', 36610553, '', 1, 1, 0, NULL),
(3, '0000000001', 1152188863, 'asdfasdf', 135000, 0, 156600, 21600, '2018-09-16 11:58:17', 36610553, '', 1, 1, 0, NULL),
(4, '0000000004', 1152188863, 'prueba jajajaj', 135000, 0, 156600, 21600, '2018-09-16 11:59:20', 35611553, '', 1, 1, 0, NULL),
(5, '0000000004', 1152188863, 'prueba jajajaj', 135000, 0, 156600, 21600, '2018-09-16 11:59:58', 35611553, '', 1, 1, 0, NULL),
(6, '0000000006', 1152188863, '', 90000, 0, 104400, 14400, '2018-09-16 15:10:24', 43101104, '', 1, 1, 0, NULL),
(7, '0000000007', 1152188863, 'sdafasdf', 90000, 0, 104400, 14400, '2018-09-16 15:11:14', 35611553, '', 1, 1, 0, NULL),
(8, '0000000008', 1152188863, 'sdfsadf', 135000, 0, 156600, 21600, '2018-09-16 15:25:43', 95501690, '', 1, 1, 0, NULL),
(20, '0000000009', 1152188863, '', 135000, 0, 156600, 21600, '2018-09-16 15:43:32', NULL, 'cami lo pere', 1, 1, 0, NULL),
(21, '0000000009', 1152188863, '', 135000, 0, 156600, 21600, '2018-09-16 15:46:24', NULL, 'cami lo pere', 1, 1, 0, NULL),
(22, '0000000022', 1152188863, 'Ã±jkh', 360000, 0, 417600, 57600, '2018-09-17 08:01:36', 36610553, '', 1, 1, 0, NULL),
(23, '0000000023', 1152188863, 'esta es una prueba mas real', 135000, 0, 156600, 21600, '2018-09-17 09:29:12', 36610553, '', 1, 1, 0, NULL),
(24, '0000000024', 1152188863, '', 90000, 0, 104400, 14400, '2018-09-18 06:24:11', NULL, 'parra andrea jajajaja', 1, 1, 0, NULL),
(25, '0000000025', 1152188863, '', 90000, 0, 104400, 14400, '2018-09-18 07:56:17', 43101104, '', 1, 1, 0, NULL),
(26, '0000000026', 1152188863, 'prueba', 90000, 0, 104400, 14400, '2018-09-18 08:00:04', 95501690, '', 1, 1, 0, NULL),
(27, '0000000027', 1152188863, '', 135000, 0, 156600, 21600, '2018-09-18 08:02:10', 36610553, '', 1, 1, 0, NULL),
(28, 'ZW00000028', 1152188863, 'esta es una pruyeba', 45000, 0, 52200, 7200, '2018-09-18 08:04:17', NULL, 'carlos diego', 1, 1, 0, NULL),
(29, '0000000028', 1152188863, 'prueba pendiente de pago', 135000, 0, 156600, 21600, '2018-09-18 08:13:07', 2147483647, '', 1, 1, 0, NULL),
(30, 'Q000000003', 1152188863, 'prueb', 135000, 0, 156600, 21600, '2018-09-18 08:16:52', 95501690, '', 1, 1, 0, NULL),
(31, 'Q0000000030', 1152188863, 'sdaf', 90000, 0, 104400, 14400, '2018-09-18 08:22:55', 36610553, '', 1, 1, 0, NULL),
(32, 'WB0000000032', 1152188863, 'dfasdf', 135000, 0, 156600, 21600, '2018-09-18 08:24:33', 43101104, '', 1, 1, 0, NULL),
(33, '0000000033', 1152188863, 'sad', 135000, 0, 156600, 21600, '2018-09-18 08:25:23', 95501690, '', 1, 1, 0, NULL),
(34, '0DFS000000034', 1152188863, '', 135000, 0, 156600, 21600, '2018-09-18 08:26:24', 36610553, '', 1, 1, 0, NULL),
(35, 'F000000035', 1152188863, 'dsafd', 45000, 0, 52200, 7200, '2018-09-18 08:27:35', 94501690, '', 1, 1, 0, NULL),
(36, '0000000036', 1152188863, 'sdfas', 135000, 0, 156600, 21600, '2018-09-18 11:01:47', 35611553, '', 1, 1, 0, NULL),
(37, '0000000037', 1152188863, 'este señor debe.', 90000, 0, 104400, 14400, '2018-09-18 16:50:58', 36610553, '', 1, 1, 0, NULL),
(38, '0000000038', 1152188863, '', 90000, 0, 104400, 14400, '2018-09-18 12:08:32', 36610553, '', 1, 1, 0, NULL),
(39, '0000000039', 1152188863, '', 90000, 0, 104400, 14400, '2018-09-19 08:11:47', NULL, 'pepe guama', 1, 1, 0, NULL),
(40, '0000000040', 1152188863, '', 45000, 0, 52200, 7200, '2018-09-19 08:20:58', NULL, 'joseph ortiz', 1, 1, 0, NULL),
(41, '0000000041', 1152188863, '', 250000, 0, 290000, 40000, '2018-09-21 11:45:45', NULL, 'juan perez', 1, 1, 0, NULL),
(42, '0000000042', 1152188863, 'prueba', 3000, 0, 3480, 480, '2018-09-24 12:34:33', 1152188863, '', 1, 1, 0, NULL),
(43, '0000000043', 1152188863, 'prueba', 90000, 0, 104400, 14400, '2018-09-25 14:06:59', 999999999999999, '', 1, 1, 0, NULL),
(44, '0000000044', 1152188863, 'prueba', 105000, 0, 121800, 16800, '2018-09-25 14:07:47', 999999999999999, '', 1, 1, 0, NULL),
(45, '0000000045', 1152188863, 'quedo pendiente', 45000, 1800, 50400, 7200, '2018-09-25 17:50:33', 34610553, '', 1, 1, 4, NULL),
(46, '0000000046', 1152188863, 'SE LE VENDE NO SE QUE', 15000, 1500, 15900, 2400, '2018-09-25 06:14:45', NULL, 'PEPE LANDA', 1, 1, 10, NULL),
(47, '0000000047', 1152188863, '', 90000, 0, 104400, 14400, '2018-09-25 10:53:13', 34610553, '', 1, 1, 0, NULL),
(48, '0000000048', 1152188863, 'prueba', 6000, 0, 6960, 960, '2018-10-01 07:16:20', 35611553, '', 1, 1, 0, NULL),
(49, 'BA0000000049', 1152188863, 'prueba nota de la factura', 5400, 0, 6264, 864, '2018-10-04 16:10:02', 34610553, '', 1, 1, 0, NULL),
(50, 'HJA00000050', 1152188863, 'queda pendiente de pago', 96000, 0, 111360, 15360, '2018-10-04 16:14:45', 36610553, '', 1, NULL, 0, NULL),
(51, '0000000051', 94501690, '', 4000, 0, 4640, 640, '2018-10-11 12:13:18', 43101104, '', 2, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ft_factura_detalle`
--

CREATE TABLE `ft_factura_detalle` (
  `NM_ID_DETALLE_FACTURA` int(5) NOT NULL,
  `CS_FACTURA_ID` int(6) NOT NULL,
  `NM_CANTIDAD_COMPRA` int(4) NOT NULL,
  `CS_PRODUCTO_ID` int(6) NOT NULL,
  `NM_PRECIO_TOTAL_PRODUCTO` double NOT NULL,
  `NM_PRECIO_UNITARIO` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `ft_factura_detalle`
--

INSERT INTO `ft_factura_detalle` (`NM_ID_DETALLE_FACTURA`, `CS_FACTURA_ID`, `NM_CANTIDAD_COMPRA`, `CS_PRODUCTO_ID`, `NM_PRECIO_TOTAL_PRODUCTO`, `NM_PRECIO_UNITARIO`) VALUES
(35, 51, 2, 34, 4000, 2000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ft_forma_pago`
--

CREATE TABLE `ft_forma_pago` (
  `ID_FORMA_PAGO` int(5) NOT NULL,
  `DES_FORMA_PAGO` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ft_forma_pago`
--

INSERT INTO `ft_forma_pago` (`ID_FORMA_PAGO`, `DES_FORMA_PAGO`) VALUES
(1, 'Efectivo'),
(2, 'Crédito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `id_perfil` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`id_perfil`, `nombre`) VALUES
(1, 'Administrador'),
(2, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rs_multas_reserva`
--

CREATE TABLE `rs_multas_reserva` (
  `CS_MULTA_ID` bigint(20) NOT NULL,
  `CS_RESERVA_ID` int(6) NOT NULL,
  `NM_VALOR_MULTA_SALA` double NOT NULL,
  `DS_ESTADO` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rs_reserva_sala`
--

CREATE TABLE `rs_reserva_sala` (
  `id` int(6) NOT NULL,
  `documento` bigint(20) NOT NULL,
  `sala` int(4) NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `DS_ESTADO` varchar(10) NOT NULL,
  `DT_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `color` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `rs_reserva_sala`
--

INSERT INTO `rs_reserva_sala` (`id`, `documento`, `sala`, `start`, `end`, `title`, `DS_ESTADO`, `DT_FECHA_CREACION`, `color`) VALUES
(2, 43101104, 1, '2018-08-09 02:15:00', '2018-08-09 02:50:00', 'con audifonos', 'Activo', '2018-08-25 16:17:25', NULL),
(5, 43101104, 1, '2018-08-10 03:30:00', '2018-08-10 09:50:00', 'con audifono', 'Activo', '2018-08-27 17:48:59', NULL),
(6, 94501690, 1, '2018-08-10 04:25:00', '2018-08-10 05:40:00', 'con guitarra', 'Activo', '2018-08-27 17:50:33', NULL),
(8, 94501690, 1, '2018-08-27 03:25:00', '2018-08-27 05:20:00', 'olg', 'Activo', '2018-08-28 00:21:27', NULL),
(9, 34610553, 1, '2018-08-28 05:25:00', '2018-08-28 08:35:00', 'con bajo', 'Activo', '2018-08-28 20:33:21', NULL),
(10, 34610553, 1, '2018-08-28 08:55:00', '2018-08-28 09:55:00', 'con guitarra', 'Activo', '2018-08-28 20:36:24', NULL),
(11, 43101104, 1, '2018-08-28 04:15:00', '2018-08-28 04:55:00', 'con audifonos', 'Activo', '2018-08-28 20:38:06', NULL),
(35, 94501690, 1, '2018-08-29 03:20:00', '2018-08-29 04:30:00', 'ghjklÃ±', 'Activo', '2018-08-29 00:45:29', NULL),
(36, 34610553, 1, '2018-08-30 03:50:00', '2018-08-30 04:15:00', 'dfgbhnjmk', 'Activo', '2018-08-29 00:48:50', NULL),
(37, 94501690, 2, '2018-09-03 03:20:00', '2018-09-03 04:30:00', 'con  microfonos', 'Activo', '2018-09-02 16:09:15', NULL),
(38, 35611553, 1, '2018-09-08 03:25:00', '2018-09-08 05:35:00', 'con audifonos', 'Activo', '2018-09-07 19:47:27', NULL),
(39, 43101104, 1, '2018-09-08 03:00:00', '2018-09-08 03:20:00', 'lkjhygf', 'Activo', '2018-09-07 20:03:39', NULL),
(40, 94501690, 1, '2018-10-11 13:00:00', '2018-10-11 18:00:00', '\n		      	34610553 - diana viveros94501690 - edinson gallego-vaaaaaaaaaaaa', 'Activo', '2018-10-08 20:36:53', '#000000'),
(41, 36610553, 1, '2018-10-12 13:00:00', '2018-10-12 15:00:00', '36610553-vaaa', 'Activo', '2018-10-08 20:58:05', '#004080'),
(42, 36610553, 1, '2018-10-10 15:10:00', '2018-10-10 18:30:00', '36610553-oscar peuba', 'Activo', '2018-10-08 21:47:16', '#000000'),
(43, 1152188863, 1, '2018-10-11 10:00:00', '2018-10-11 11:00:00', '10:00 - 11:001152188863 - Oscar Mesa - bueno', 'Activo', '2018-10-08 21:59:30', '#ff0000'),
(44, 36610553, 1, '2018-10-12 08:00:00', '2018-10-12 09:00:00', '08:00 - 09:00 - 36610553 - jhon valencia - otra prueba mas  vamos a ver ', 'Activo', '2018-10-08 22:00:47', '#ffff00'),
(45, 43101104, 1, '2018-10-11 09:05:00', '2018-10-11 09:30:00', '09:05 - 09:30 - 43101104 - nidia valencia - buena', 'Activo', '2018-10-08 22:03:07', '#ff0000'),
(46, 1152188863, 1, '2018-10-12 17:00:00', '2018-10-12 19:00:00', '17:00 - 19:00 - 1152188863 - Oscar Mesa - esaa es una prueab', 'Activo', '2018-10-08 22:04:20', '#ff0000'),
(47, 36610553, 2, '2018-10-11 13:10:00', '2018-10-11 14:00:00', '13:10 - 14:00 - 36610553 - jhon valencia - vanmos a ver ', 'Activo', '2018-10-08 22:21:10', NULL),
(48, 123456789, 2, '2018-10-11 11:31:00', '2018-10-11 12:00:00', '11:31 - 12:00 - 123456789 - ana herrera -   jkkhkjnnmnkjjjjjjjjjjkb', 'Activo', '2018-10-09 01:33:48', NULL),
(49, 94501690, 2, '2018-10-09 10:45:00', '2018-10-09 17:30:00', '10:45 - 17:30 - 94501690 - edinson gallego - this is a prueba', 'Activo', '2018-10-09 01:35:12', NULL),
(50, 43101104, 1, '2018-10-12 10:00:00', '2018-10-12 11:00:00', '43101104 - nidia valencia - ptreaf', 'Activo', '2018-10-09 17:59:10', '#008040');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rs_sala`
--

CREATE TABLE `rs_sala` (
  `CS_SALA_ID` int(4) NOT NULL,
  `DS_NOMBRE_SALA` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `DS_DESCRIPCION_SALA` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NM_VALOR_HORA_SALA` double NOT NULL,
  `NM_CAPACIDAD_SALA` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `rs_sala`
--

INSERT INTO `rs_sala` (`CS_SALA_ID`, `DS_NOMBRE_SALA`, `DS_DESCRIPCION_SALA`, `NM_VALOR_HORA_SALA`, `NM_CAPACIDAD_SALA`) VALUES
(1, 'Sala 1', 'sala con guitarra', 42000, 8),
(2, 'Sala 2', 'Sala 2', 45000, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmp`
--

CREATE TABLE `tmp` (
  `id_tmp` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad_tmp` int(11) NOT NULL,
  `precio_tmp` double(8,2) DEFAULT NULL,
  `session_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tp_inventario_producto`
--

CREATE TABLE `tp_inventario_producto` (
  `CS_INVENTARIO_ID` int(6) NOT NULL,
  `CS_PRODUCTO_ID` int(6) NOT NULL,
  `NM_CANTIDAD_INVENTARIO` int(4) NOT NULL,
  `CS_VENDEDOR_PRODUCTO_ID` int(6) NOT NULL,
  `DT_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `NM_PRECIO_UNITARIO_COMPRA` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `tp_inventario_producto`
--

INSERT INTO `tp_inventario_producto` (`CS_INVENTARIO_ID`, `CS_PRODUCTO_ID`, `NM_CANTIDAD_INVENTARIO`, `CS_VENDEDOR_PRODUCTO_ID`, `DT_FECHA_CREACION`, `NM_PRECIO_UNITARIO_COMPRA`) VALUES
(16, 6, 10, 1, '2018-10-11 23:45:19', 1500),
(17, 34, 8, 1, '2018-10-12 00:10:45', 850),
(18, 6, 30, 2, '2018-10-12 00:25:07', 1513),
(19, 7, 30, 2, '2018-10-12 00:25:22', 1796),
(20, 8, 23, 3, '2018-10-12 00:25:46', 1197),
(21, 9, 30, 2, '2018-10-12 00:26:04', 1513),
(22, 10, 25, 2, '2018-10-12 00:26:22', 1513),
(23, 11, 30, 1, '2018-10-12 00:26:38', 600),
(24, 12, 25, 2, '2018-10-12 00:26:59', 1100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tp_producto`
--

CREATE TABLE `tp_producto` (
  `CS_PRODUCTO_ID` int(6) NOT NULL,
  `DS_CODIGO_PRODUCTO` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `DS_NOMBRE_PRODUCTO` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `DS_DESCRIPCION_PRODUCTO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NM_PRESENTACION_PRODUCTO` int(10) NOT NULL,
  `FK_UNIDAD` int(6) NOT NULL,
  `DT_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `NM_ESTADO` int(1) DEFAULT NULL,
  `DB_PRECIO_VENTA_UND` double DEFAULT NULL,
  `NM_PRECIO_UNITARIO_COMPRA_UND` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NM_ELIMINADO` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `tp_producto`
--

INSERT INTO `tp_producto` (`CS_PRODUCTO_ID`, `DS_CODIGO_PRODUCTO`, `DS_NOMBRE_PRODUCTO`, `DS_DESCRIPCION_PRODUCTO`, `NM_PRESENTACION_PRODUCTO`, `FK_UNIDAD`, `DT_FECHA_CREACION`, `NM_ESTADO`, `DB_PRECIO_VENTA_UND`, `NM_PRECIO_UNITARIO_COMPRA_UND`, `NM_ELIMINADO`) VALUES
(1, 'WQP', 'Galletas saltin', 'esta es casi una prueba  a ver si lo guarda', 0, 1, '2018-09-13 23:20:16', 1, 900, '200', 1),
(4, 'SALA', 'Sala reserva', 'Sala que reserva el usuario', 0, 3, '2018-09-22 00:30:12', 1, 4000, '4000', 0),
(6, 'C001', 'AGUILA', 'BOTELLA RETORNABLE', 0, 5, '2018-10-08 17:51:44', 1, 3000, '1513', 0),
(7, 'C002', 'CLUB COLOMBIA', 'BOTELLA RETORNABLE', 0, 5, '2018-10-08 17:51:44', 1, 3500, '1796', 0),
(8, 'C003', 'COSTEÑITA', 'BOTELLA RETORNABLE', 0, 5, '2018-10-08 17:51:45', 1, 2500, '1197', 0),
(9, 'C004', 'PILSEN', 'BOTELLA RETORNABLE', 0, 5, '2018-10-08 17:51:46', 1, 3000, '1513', 0),
(10, 'C005', 'POKER', 'BOTELLA RETORNABLE', 0, 5, '2018-10-08 17:51:46', 1, 3000, '1513', 0),
(11, 'B001', 'AGUA RENACER', 'PET 600ML', 0, 5, '2018-10-08 17:51:46', 1, 2000, '600', 0),
(12, 'B002', 'COCACOLA 250', 'PET 250ML', 0, 5, '2018-10-08 17:51:46', 1, 2000, '1100', 0),
(13, 'B003', 'GREEN', 'VIDRIO 370ML', 0, 5, '2018-10-08 17:51:46', 1, 4000, '2700', 0),
(14, 'B004', 'JUGO HIT', 'TETRA PACK 200ML', 0, 5, '2018-10-08 17:51:46', 1, 2000, '884', 0),
(15, 'B006', 'MR TEA', 'VIDRIO 300ML', 0, 5, '2018-10-08 17:51:46', 1, 2000, '1083', 0),
(16, 'B007', 'PONY MALTA', 'BOTELLA RETORNABLE', 0, 5, '2018-10-08 17:51:46', 1, 2000, '1105', 0),
(17, 'M001', 'CHEESETRIS', '', 0, 4, '2018-10-08 17:51:46', 1, 2000, '925', 0),
(18, 'M002', 'CHEETOS', '', 0, 4, '2018-10-08 17:51:46', 1, 1500, '446', 0),
(19, 'M003', 'CHOCLITOS', '', 0, 4, '2018-10-08 17:51:47', 1, 1500, '576', 0),
(20, 'M004', 'CHOCOLATINA JET', '', 0, 4, '2018-10-08 17:51:47', 1, 600, '345', 0),
(21, 'M005', 'CHOCORRAMO', 'GRANDE', 0, 4, '2018-10-08 17:51:47', 1, 2000, '1410', 0),
(22, 'M006', 'CHOKIS', '', 0, 4, '2018-10-08 17:51:47', 1, 1500, '756', 0),
(23, 'M007', 'DETODITO', '', 0, 4, '2018-10-08 17:51:47', 1, 2500, '1500', 0),
(24, 'M008', 'DORITOS', '', 0, 4, '2018-10-08 17:51:47', 1, 2000, '990', 0),
(25, 'M009', 'GALLETAS FESTIVAL', '', 0, 4, '2018-10-08 17:51:47', 1, 1500, '740', 0),
(26, 'M010', 'MANIMOTO', '', 0, 4, '2018-10-08 17:51:47', 1, 1500, '820', 0),
(27, 'M011', 'PAPITAS LA REINA', '', 0, 4, '2018-10-08 17:51:47', 1, 2000, '839', 0),
(28, 'M012', 'PLATANITOS', '', 0, 4, '2018-10-08 17:51:48', 1, 2000, '913', 0),
(29, 'M013', 'ROSQUITAS', '', 0, 4, '2018-10-08 17:51:48', 1, 2000, '806', 0),
(30, 'M014', 'TOSTACOS', '', 0, 4, '2018-10-08 17:51:48', 1, 1500, '583', 0),
(31, 'M015', 'MAIZITOS', '', 0, 4, '2018-10-08 17:51:48', 1, 1500, '583', 0),
(32, 'M016', 'MANI LA ESPECIAL', '', 0, 4, '2018-10-08 17:51:48', 1, 3000, '1550', 0),
(33, 'M017', 'GALLETAS TOSH', '', 0, 4, '2018-10-08 17:51:48', 1, 1500, '850', 0),
(34, 'M018', 'WAFER JET', 'Galleta de 22 gramos', 0, 4, '2018-10-08 17:51:48', 1, 2000, '850', 0),
(35, 'M019', 'WAFER JET', '', 0, 4, '2018-10-12 00:18:10', 1, 2000, '600', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tp_unidad_medida_producto`
--

CREATE TABLE `tp_unidad_medida_producto` (
  `CS_UNIDAD_ID` int(6) NOT NULL,
  `DS_NOMBRE_UNIDAD` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `DS_DESCRIPCION_UNIDAD` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `tp_unidad_medida_producto`
--

INSERT INTO `tp_unidad_medida_producto` (`CS_UNIDAD_ID`, `DS_NOMBRE_UNIDAD`, `DS_DESCRIPCION_UNIDAD`) VALUES
(1, 'LTR', 'Litro'),
(2, 'Caja', 'Cajetilla'),
(3, 'Unidad', 'Und'),
(4, 'Gr', 'Gramos'),
(5, 'ML', 'MiliLitros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tp_vendedor_producto`
--

CREATE TABLE `tp_vendedor_producto` (
  `CS_VENDEDOR_ID` int(6) NOT NULL,
  `DS_NOMBRE_VENDEDOR` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `DS_DESCRIPCION_VENDEDOR` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `tp_vendedor_producto`
--

INSERT INTO `tp_vendedor_producto` (`CS_VENDEDOR_ID`, `DS_NOMBRE_VENDEDOR`, `DS_DESCRIPCION_VENDEDOR`) VALUES
(1, 'Exito', 'Exito del poblado'),
(2, 'Consumo', 'Consumo de la america'),
(3, 'De uno', 'De uno de la vegas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `us_banda_detalle_usuario`
--

CREATE TABLE `us_banda_detalle_usuario` (
  `CS_BANDA_ID` int(5) DEFAULT NULL,
  `NM_DOCUMENTO_ID` bigint(20) DEFAULT NULL,
  `ES_LIDER` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `us_banda_detalle_usuario`
--

INSERT INTO `us_banda_detalle_usuario` (`CS_BANDA_ID`, `NM_DOCUMENTO_ID`, `ES_LIDER`) VALUES
(1, 35611553, 1),
(1, 95501690, 0),
(1, 36610553, 0),
(1, 982345456, 0),
(2, 36610553, 1),
(2, 94501690, 0),
(2, 1152204758, 0),
(2, 35611553, 0),
(2, 432423432423423, 0),
(2, 324123412341234, 0),
(1, 564353453454, 0),
(1, 345345435345345, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `us_banda_usuario`
--

CREATE TABLE `us_banda_usuario` (
  `CS_BANDA_ID` int(5) NOT NULL,
  `DS_NOMBRE_BANDA` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `DS_DESCRIPCION_BANDA` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `us_banda_usuario`
--

INSERT INTO `us_banda_usuario` (`CS_BANDA_ID`, `DS_NOMBRE_BANDA`, `DS_DESCRIPCION_BANDA`) VALUES
(1, 'Prueba C', 'Prueba c'),
(2, 'Pruebaaaaa', 'Prueba 1234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `us_estado_usuario`
--

CREATE TABLE `us_estado_usuario` (
  `CS_ESTADO_ID` int(4) NOT NULL,
  `DS_NOMBRE_ESTADO` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `DS_DESCRIPCION_ESTADO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `us_estado_usuario`
--

INSERT INTO `us_estado_usuario` (`CS_ESTADO_ID`, `DS_NOMBRE_ESTADO`, `DS_DESCRIPCION_ESTADO`) VALUES
(1, 'Activo', 'Activo'),
(2, 'Inactivo', 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `us_incentivo_tipo_usuario`
--

CREATE TABLE `us_incentivo_tipo_usuario` (
  `CS_INCENTIVO_ID` int(4) NOT NULL,
  `DS_NOMBRE_INCENTIVO` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `DS_DESCRIPCION_INCENTIVO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NM_VALOR_PORCENTAJE_INCENTIVO` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `us_incentivo_tipo_usuario`
--

INSERT INTO `us_incentivo_tipo_usuario` (`CS_INCENTIVO_ID`, `DS_NOMBRE_INCENTIVO`, `DS_DESCRIPCION_INCENTIVO`, `NM_VALOR_PORCENTAJE_INCENTIVO`) VALUES
(1, 'Admin', 'Administrador', 100),
(2, 'Banda', 'Banda', 50),
(3, 'Normal', 'Normal', 30),
(4, 'Docente', 'Se aplica descuento del 20 %', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `us_tipo_documento`
--

CREATE TABLE `us_tipo_documento` (
  `CS_TIPO_DOCUMENTO_ID` int(4) NOT NULL,
  `DS_NOMBRE_TIPO_DOCUMENTO` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `DS_DESCRIPCION_TIPO_DOCUMENTO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `us_tipo_documento`
--

INSERT INTO `us_tipo_documento` (`CS_TIPO_DOCUMENTO_ID`, `DS_NOMBRE_TIPO_DOCUMENTO`, `DS_DESCRIPCION_TIPO_DOCUMENTO`) VALUES
(1, 'Cédula Ciudadanía', 'Cédula Ciudadanía'),
(2, 'Tarjeta Identidad', 'Tarjeta Identidad'),
(3, 'Pasaporte', 'Pasaporte'),
(4, 'Cédula Extranjera ', 'Cédula Extranjera');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `us_tipo_usuario`
--

CREATE TABLE `us_tipo_usuario` (
  `CS_TIPO_USUARIO` int(4) NOT NULL,
  `DS_NOMBRE_TIPO_USUARIO` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `DS_DESCRIPCION_TIPO_USUARIO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NM_PORCENTAJE_INCENTIVO` double(4,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `us_tipo_usuario`
--

INSERT INTO `us_tipo_usuario` (`CS_TIPO_USUARIO`, `DS_NOMBRE_TIPO_USUARIO`, `DS_DESCRIPCION_TIPO_USUARIO`, `NM_PORCENTAJE_INCENTIVO`) VALUES
(1, 'Administrador', 'Administrador', 1),
(2, 'Banda', 'Banda', 2),
(3, 'Usuario Normal', 'Usario Normal', 20),
(4, 'Docente', 'que dicta clases', 20),
(5, 'Cliente', 'Clientes que asisten al establecimiento', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `us_usuario`
--

CREATE TABLE `us_usuario` (
  `NM_DOCUMENTO_ID` bigint(20) NOT NULL,
  `CS_TIPO_DOCUMENTO_ID` int(4) NOT NULL,
  `DS_NOMBRES_USUARIO` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `DS_APELLIDOS_USUARIO` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `NM_TELEFONO` int(7) DEFAULT NULL,
  `NM_CELULAR` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `DS_CORREO` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `DS_DIRECCION` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DS_CONTRASENA` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `CS_TIPO_USUARIO_ID` int(4) NOT NULL,
  `CS_ESTADO_ID` int(4) NOT NULL,
  `DT_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RESTAURAR_CONTRASENA` int(1) NOT NULL DEFAULT '0',
  `NM_ELIMINADO` int(1) DEFAULT '0',
  `ENVIO_CORREO_ACTIVACION` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `us_usuario`
--

INSERT INTO `us_usuario` (`NM_DOCUMENTO_ID`, `CS_TIPO_DOCUMENTO_ID`, `DS_NOMBRES_USUARIO`, `DS_APELLIDOS_USUARIO`, `NM_TELEFONO`, `NM_CELULAR`, `DS_CORREO`, `DS_DIRECCION`, `DS_CONTRASENA`, `CS_TIPO_USUARIO_ID`, `CS_ESTADO_ID`, `DT_FECHA_CREACION`, `RESTAURAR_CONTRASENA`, `NM_ELIMINADO`, `ENVIO_CORREO_ACTIVACION`) VALUES
(34610553, 1, 'diana', 'viveros', 3214697, '3214636790', 'edinson_gallego23152@elpoli.edu.co', NULL, '$2y$10$YNINJCyPd7V1ezeFMw9YDuc6of0j3PxG/U7toUD/qQAx7OGzcnaP2', 4, 1, '2018-08-28 20:31:00', 0, 0, 0),
(35611553, 1, 'jairo', 'ortiz', 1200000, '8452530125', 'jairo@gmail.com', NULL, '$2y$10$DUbb22PcZE3R0wvwv/SZzO9ef9PIBsg6W8b10YQ5O.OjBAEZnJU2.', 2, 2, '2018-09-06 17:00:14', 0, 1, 0),
(36610553, 1, 'jhon', 'valencia', 7896325, '8965635632', 'jhon@gmail.com', NULL, '$2y$10$6sZZ9FGEIaWYF10ZLeB40eR838NfAPd2fMzvMMgzyMve4yKRiBPWe', 2, 1, '2018-09-06 18:43:35', 0, 1, 0),
(43101104, 1, 'nidia', 'valencia', 3127899, '3127852212', 'edigahe77@hotmail.com', NULL, '$2y$10$Mo3BAL/l6V3aH9UxdupiY.0jRJ1dWrpwaFRAlBG8FSif2VA56xQl.', 2, 1, '2018-08-25 16:15:21', 0, 0, 0),
(94501690, 1, 'edinson', 'gallego', 3216366, '3216367908', 'edigahe77@gmail.com', NULL, '$2y$10$SMl8JxTiwCRtboFbK6yepu9fjmrps9gBAyg8nOmCqp6PfRRorUXo.', 2, 1, '2018-08-25 16:10:33', 0, 0, 0),
(95501690, 1, 'juan', 'acevedo', 7896366, '1521521255', 'juan@gmail.com', NULL, '$2y$10$IUQ0n8aZ4WmdByRAiF9HJec4kTxkHP26mXgyar0cBf4RW0xOzXNMq', 2, 2, '2018-09-06 20:03:01', 0, 1, 0),
(123456789, 2, 'ana', 'herrera', 4545632, '2563254896', 'ana@gmail.com', NULL, '$2y$10$nuKTZucQxy7mbMvoQt2TtOwwc9vRNZ8NjmqMIpjSMV1mfdzIOBwom', 2, 1, '2018-09-06 08:50:32', 0, 1, 0),
(324343333, 1, 'pepe', 'dfsadf', 2342343, '3232432234', 'ososcar@fasdf.com', NULL, '$2y$10$Gj8Zas7zys..mmXtvvTzMua6eOeg8zjcIIIFNNFGoEUb1Kn0vrVm6', 2, 2, '2018-09-06 18:41:14', 0, 1, 0),
(789623778, 1, 'pedro', 'perez', 12369, '789632', 'pedro@gmail.com', NULL, '$2y$10$29aWCUIkJ5mb8KKOevJLXuBiqiL5I8KhdGREpxJDkPOOOswp5eE7C', 2, 2, '2018-09-06 23:15:44', 0, 1, 0),
(982345456, 1, 'edinson', 'herrera', 7896152, '5634565625', 'edi@gmail.com', NULL, '$2y$10$4Mn3cUh8c3y09VI8FJ/lHedNHQDs1jG6XKKA4ZvB9e3YbyFJd8NcO', 4, 2, '2018-09-06 23:11:48', 0, 1, 0),
(987412212, 1, 'fghjk', 'cvvbnm', 5623048, '9865320765', 'ediha@gmail.com', NULL, '$2y$10$sYK47RC1LPsQwBIACyv79.M9l5SkHKwPnj9uBzqtUzPsW/OGj1Itq', 4, 2, '2018-09-07 00:33:20', 0, 1, 0),
(1152188863, 1, 'Oscar', 'Mesa', 5804661, '3012280744', 'oscarmesa.elpoli@gmail.com', NULL, '$2y$10$3sTTtL17ShNLWimjwm5f6ehtn3YcfJW5BRC3aT0hSWQd4fdfWEFGi', 1, 1, '2018-09-11 00:01:51', 0, 0, 0),
(1152204758, 1, 'santiago', 'betancur', 6666666, '6666666666', 'sbetancur859@gmail.com', NULL, '$2y$10$32AbUlynEMogC8aG/NEk6OtxD6hlD.QUjkZRWnv.C8ye3zCt87PGG', 2, 1, '2018-08-25 18:59:36', 0, 0, 0),
(2147483647, 1, 'Diego', 'Mejia', 5555555, '5555555555', '555@gmail.com', NULL, '$2y$10$doEZ4hYMaAxgWZiPdyyIX.hMT3HQwLWT3xAIcuA3YCBeGzKGIcGRC', 2, 2, '2018-09-06 21:14:52', 0, 1, 0),
(5435843958, 3, 'asdfasdf', 'sadfsdfasdf', 2313333, '3432423333', 'oscar@gmailc.om', NULL, '$2y$10$sJqVbpfYBnNs482CdCgJYeRDiRXxI5mjkDP7ZjAyvwVFnPK5hOQK.', 4, 2, '2018-09-07 21:10:45', 0, 1, 0),
(23123213123, 1, 'calitos', 'pepo', 2131232, '1232131233', 'carlos234@gmail.com', 'calle 123', '$2y$10$NNxohVe2CN8H2K3q/YV0/OjiRQjEHcQNWhiI0/h8kR7u3h3DzGx26', 2, 2, '2018-09-25 20:52:06', 0, 1, 0),
(564353453454, 4, 'pepito', 'perez', 2342342, '3242343243', 'pepoooo@gmail.com', 'callle 324324', '$2y$10$8QR9XCFgNWawPScSAxu1Du5TL1GNgeR3ENbbzIFa/ygKTedztVFkC', 3, 2, '2018-10-11 20:03:20', 0, 1, 0),
(111111111111111, 1, 'ana', 'mesa', 2314324, '2342342342', 'anamesa@gmail.com', 'calle 23123', '$2y$10$hjFasakxrStDbXiIxLFWSeH0ztgbEnZFDYeva19JuOQ9kVNEoNclW', 2, 2, '2018-09-25 20:54:48', 0, 1, 0),
(234324234234234, 1, 'pepito', 'asdfasdf', 3242342, '2342342343', 'casd@ksdfasdf.com', 'afsdfasdf', '$2y$10$1VUVzKMgemAJCyJ7Q1gM3urBp2yy5b1R5a2ZdzSHgSa6sVXcJlW3e', 3, 2, '2018-10-11 20:05:04', 0, 1, 0),
(324123412341234, 1, 'carlos', 'mesa', 3242342, '3242234234', 'pepito@gmaill.com', 'calere', '$2y$10$jHabhAQwKyDOeeMzqvYMce9JxPDzGWXmEwMuXHsA5EEQ2Ns5c1gCG', 2, 2, '2018-10-11 19:59:11', 0, 1, 0),
(324234234324234, 1, 'carlos', 'landa', 2343243, '2342343243', 'jaime12321@gmail.com', '', '$2y$10$8VExBHrLnMWQAxRdcCNpZ.napTbLqxh.psPj6ziJshwuMQGe9DcXG', 4, 2, '2018-09-25 01:16:13', 0, 1, 0),
(345345435345345, 1, 'sdafasfdasdasdf', 'sadfsdfasdfasdfasdf', 2342342, '3423432423', '234324@fmaol.com', 'cale', '$2y$10$FtlayZDyNC8YFTamZR4A6umMlOgG41BJZBoFS/spKWhIOeVggNogK', 3, 2, '2018-10-11 20:08:17', 0, 1, 0),
(432423432423423, 3, 'ewsadf', 'asdf', 2321312, '1231232342', 'pepe@gmail.com', 'calle 123', '$2y$10$0VWFYnJ4J4N.64HJ4exALej1.VfzNV66PhY3.WfvyEs1AQTlYEmoq', 2, 2, '2018-10-11 19:55:17', 0, 1, 0),
(454385345849838, 2, 'asdfh', 'dfjsf', 3423333, '3333333333', 'oscar_mesa24092@elpoli.edu.co', 'calle falsa 1234', '$2y$10$sOLpMBBizGbLn/M9hLBlQeHv.uBdg1iKM64wjgWgGbIP/bOL27xAG', 2, 1, '2018-09-07 21:09:12', 0, 1, 1),
(877777777777777, 1, 'sdfasdf', 'adfgdgsdfg', 5555555, '5555555555', 'asdfasdf@gmail.com', NULL, '$2y$10$lHEjTLDk4BoEshMS7ebJHuvQDeDCpwRd5E3HXMOdWRR8ycIc3maZW', 2, 2, '2018-09-07 21:44:43', 0, 1, 0),
(996954695469456, 2, 'dfgksdfgksdkfgsdfkgs', 'dskjfskf', 3432423, '4234234234', '4535345@gmail.com', NULL, '$2y$10$f0VW.aYOb2.nMcEkAoZVteW7MYUTWSoJr8tTEcKnFE6Ct2CdPwDZ6', 2, 2, '2018-09-07 21:13:32', 0, 1, 0),
(999999999999999, 1, 'Diego', 'Mejia', 5555555, '5555555555', '555@gmail.com', 'calle 1234', '$2y$10$hxmzv4AJN4G7pJQntHvEdOtIqRwj0/JIoFRaXjZY5I6HO5K27az7W', 2, 2, '2018-09-07 21:35:21', 0, 1, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indices de la tabla `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ft_estado`
--
ALTER TABLE `ft_estado`
  ADD PRIMARY KEY (`ID_ESTADO`);

--
-- Indices de la tabla `ft_factura`
--
ALTER TABLE `ft_factura`
  ADD PRIMARY KEY (`CS_FACTURA_ID`) USING BTREE,
  ADD KEY `FK_CLIENTE_FACTURA` (`NM_CLIENTE_ID`),
  ADD KEY `FK_VENDDOR_FACTURA` (`NM_VENDEDOR_ID`),
  ADD KEY `FK_ESTADO_FAC` (`ID_ESTADO`),
  ADD KEY `FK_MEDIO_PAGO` (`ID_FORMA_PAGO`),
  ADD KEY `ID_RESERVA` (`ID_RESERVA`);

--
-- Indices de la tabla `ft_factura_detalle`
--
ALTER TABLE `ft_factura_detalle`
  ADD PRIMARY KEY (`NM_ID_DETALLE_FACTURA`),
  ADD KEY `FK_FACTURA` (`CS_FACTURA_ID`) USING BTREE,
  ADD KEY `FK_PRODUTO` (`CS_PRODUCTO_ID`) USING BTREE;

--
-- Indices de la tabla `ft_forma_pago`
--
ALTER TABLE `ft_forma_pago`
  ADD PRIMARY KEY (`ID_FORMA_PAGO`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id_perfil`) USING BTREE;

--
-- Indices de la tabla `rs_multas_reserva`
--
ALTER TABLE `rs_multas_reserva`
  ADD PRIMARY KEY (`CS_MULTA_ID`) USING BTREE,
  ADD KEY `FK_RESERVA` (`CS_RESERVA_ID`) USING BTREE;

--
-- Indices de la tabla `rs_reserva_sala`
--
ALTER TABLE `rs_reserva_sala`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `FK_USUARIO` (`documento`) USING BTREE,
  ADD KEY `FK_SALA` (`sala`) USING BTREE;

--
-- Indices de la tabla `rs_sala`
--
ALTER TABLE `rs_sala`
  ADD PRIMARY KEY (`CS_SALA_ID`) USING BTREE;

--
-- Indices de la tabla `tmp`
--
ALTER TABLE `tmp`
  ADD PRIMARY KEY (`id_tmp`) USING BTREE;

--
-- Indices de la tabla `tp_inventario_producto`
--
ALTER TABLE `tp_inventario_producto`
  ADD PRIMARY KEY (`CS_INVENTARIO_ID`) USING BTREE,
  ADD KEY `FK_PRODUCTO` (`CS_PRODUCTO_ID`) USING BTREE,
  ADD KEY `FK_VENDEDOR` (`CS_VENDEDOR_PRODUCTO_ID`) USING BTREE;

--
-- Indices de la tabla `tp_producto`
--
ALTER TABLE `tp_producto`
  ADD PRIMARY KEY (`CS_PRODUCTO_ID`) USING BTREE,
  ADD KEY `FK_UNIDAD` (`FK_UNIDAD`) USING BTREE;

--
-- Indices de la tabla `tp_unidad_medida_producto`
--
ALTER TABLE `tp_unidad_medida_producto`
  ADD PRIMARY KEY (`CS_UNIDAD_ID`) USING BTREE;

--
-- Indices de la tabla `tp_vendedor_producto`
--
ALTER TABLE `tp_vendedor_producto`
  ADD PRIMARY KEY (`CS_VENDEDOR_ID`) USING BTREE;

--
-- Indices de la tabla `us_banda_detalle_usuario`
--
ALTER TABLE `us_banda_detalle_usuario`
  ADD KEY `FK_CS_BANDA_ID_USUARIO` (`CS_BANDA_ID`),
  ADD KEY `FK_NM_DOCUMENTO_ID_USUARIO` (`NM_DOCUMENTO_ID`);

--
-- Indices de la tabla `us_banda_usuario`
--
ALTER TABLE `us_banda_usuario`
  ADD PRIMARY KEY (`CS_BANDA_ID`) USING BTREE;

--
-- Indices de la tabla `us_estado_usuario`
--
ALTER TABLE `us_estado_usuario`
  ADD PRIMARY KEY (`CS_ESTADO_ID`) USING BTREE;

--
-- Indices de la tabla `us_incentivo_tipo_usuario`
--
ALTER TABLE `us_incentivo_tipo_usuario`
  ADD PRIMARY KEY (`CS_INCENTIVO_ID`);

--
-- Indices de la tabla `us_tipo_documento`
--
ALTER TABLE `us_tipo_documento`
  ADD PRIMARY KEY (`CS_TIPO_DOCUMENTO_ID`) USING BTREE;

--
-- Indices de la tabla `us_tipo_usuario`
--
ALTER TABLE `us_tipo_usuario`
  ADD PRIMARY KEY (`CS_TIPO_USUARIO`) USING BTREE,
  ADD KEY `FK_INCENTIVO` (`NM_PORCENTAJE_INCENTIVO`) USING BTREE;

--
-- Indices de la tabla `us_usuario`
--
ALTER TABLE `us_usuario`
  ADD PRIMARY KEY (`NM_DOCUMENTO_ID`) USING BTREE,
  ADD KEY `FK_TIPO_USUARIO` (`CS_TIPO_USUARIO_ID`) USING BTREE,
  ADD KEY `FK_ESTADO` (`CS_ESTADO_ID`) USING BTREE,
  ADD KEY `FK_TIPO_DOCUMENTO` (`CS_TIPO_DOCUMENTO_ID`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `ft_estado`
--
ALTER TABLE `ft_estado`
  MODIFY `ID_ESTADO` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ft_factura`
--
ALTER TABLE `ft_factura`
  MODIFY `CS_FACTURA_ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `ft_factura_detalle`
--
ALTER TABLE `ft_factura_detalle`
  MODIFY `NM_ID_DETALLE_FACTURA` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `ft_forma_pago`
--
ALTER TABLE `ft_forma_pago`
  MODIFY `ID_FORMA_PAGO` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `rs_multas_reserva`
--
ALTER TABLE `rs_multas_reserva`
  MODIFY `CS_MULTA_ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rs_reserva_sala`
--
ALTER TABLE `rs_reserva_sala`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `rs_sala`
--
ALTER TABLE `rs_sala`
  MODIFY `CS_SALA_ID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tmp`
--
ALTER TABLE `tmp`
  MODIFY `id_tmp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tp_inventario_producto`
--
ALTER TABLE `tp_inventario_producto`
  MODIFY `CS_INVENTARIO_ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `tp_producto`
--
ALTER TABLE `tp_producto`
  MODIFY `CS_PRODUCTO_ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `tp_unidad_medida_producto`
--
ALTER TABLE `tp_unidad_medida_producto`
  MODIFY `CS_UNIDAD_ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tp_vendedor_producto`
--
ALTER TABLE `tp_vendedor_producto`
  MODIFY `CS_VENDEDOR_ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `us_banda_usuario`
--
ALTER TABLE `us_banda_usuario`
  MODIFY `CS_BANDA_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `us_estado_usuario`
--
ALTER TABLE `us_estado_usuario`
  MODIFY `CS_ESTADO_ID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `us_incentivo_tipo_usuario`
--
ALTER TABLE `us_incentivo_tipo_usuario`
  MODIFY `CS_INCENTIVO_ID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `us_tipo_documento`
--
ALTER TABLE `us_tipo_documento`
  MODIFY `CS_TIPO_DOCUMENTO_ID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `us_tipo_usuario`
--
ALTER TABLE `us_tipo_usuario`
  MODIFY `CS_TIPO_USUARIO` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ft_factura`
--
ALTER TABLE `ft_factura`
  ADD CONSTRAINT `FK_CLIENTE_FACTURA` FOREIGN KEY (`NM_CLIENTE_ID`) REFERENCES `us_usuario` (`NM_DOCUMENTO_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ESTADO_FAC` FOREIGN KEY (`ID_ESTADO`) REFERENCES `ft_estado` (`ID_ESTADO`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_MEDIO_PAGO` FOREIGN KEY (`ID_FORMA_PAGO`) REFERENCES `ft_forma_pago` (`ID_FORMA_PAGO`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_VENDDOR_FACTURA` FOREIGN KEY (`NM_VENDEDOR_ID`) REFERENCES `us_usuario` (`NM_DOCUMENTO_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ft_factura_ibfk_1` FOREIGN KEY (`ID_RESERVA`) REFERENCES `rs_reserva_sala` (`id`);

--
-- Filtros para la tabla `ft_factura_detalle`
--
ALTER TABLE `ft_factura_detalle`
  ADD CONSTRAINT `FK_FACTURA` FOREIGN KEY (`CS_FACTURA_ID`) REFERENCES `ft_factura` (`CS_FACTURA_ID`),
  ADD CONSTRAINT `FK_PRODUTO` FOREIGN KEY (`CS_PRODUCTO_ID`) REFERENCES `tp_producto` (`CS_PRODUCTO_ID`);

--
-- Filtros para la tabla `rs_multas_reserva`
--
ALTER TABLE `rs_multas_reserva`
  ADD CONSTRAINT `FK_RESERVA` FOREIGN KEY (`CS_RESERVA_ID`) REFERENCES `rs_reserva_sala` (`id`);

--
-- Filtros para la tabla `rs_reserva_sala`
--
ALTER TABLE `rs_reserva_sala`
  ADD CONSTRAINT `FK_SALA` FOREIGN KEY (`sala`) REFERENCES `rs_sala` (`CS_SALA_ID`),
  ADD CONSTRAINT `FK_USUARIO` FOREIGN KEY (`documento`) REFERENCES `us_usuario` (`NM_DOCUMENTO_ID`);

--
-- Filtros para la tabla `tp_inventario_producto`
--
ALTER TABLE `tp_inventario_producto`
  ADD CONSTRAINT `FK_PRODUCTO` FOREIGN KEY (`CS_PRODUCTO_ID`) REFERENCES `tp_producto` (`CS_PRODUCTO_ID`),
  ADD CONSTRAINT `FK_VENDEDOR` FOREIGN KEY (`CS_VENDEDOR_PRODUCTO_ID`) REFERENCES `tp_vendedor_producto` (`CS_VENDEDOR_ID`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tp_producto`
--
ALTER TABLE `tp_producto`
  ADD CONSTRAINT `FK_UNIDAD` FOREIGN KEY (`FK_UNIDAD`) REFERENCES `tp_unidad_medida_producto` (`CS_UNIDAD_ID`);

--
-- Filtros para la tabla `us_banda_detalle_usuario`
--
ALTER TABLE `us_banda_detalle_usuario`
  ADD CONSTRAINT `FK_CS_BANDA_ID_USUARIO` FOREIGN KEY (`CS_BANDA_ID`) REFERENCES `us_banda_usuario` (`CS_BANDA_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_NM_DOCUMENTO_ID_USUARIO` FOREIGN KEY (`NM_DOCUMENTO_ID`) REFERENCES `us_usuario` (`NM_DOCUMENTO_ID`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `us_usuario`
--
ALTER TABLE `us_usuario`
  ADD CONSTRAINT `FK_ESTADO` FOREIGN KEY (`CS_ESTADO_ID`) REFERENCES `us_estado_usuario` (`CS_ESTADO_ID`),
  ADD CONSTRAINT `FK_TIPO_DOCUMENTO` FOREIGN KEY (`CS_TIPO_DOCUMENTO_ID`) REFERENCES `us_tipo_documento` (`CS_TIPO_DOCUMENTO_ID`),
  ADD CONSTRAINT `FK_TIPO_USUARIO` FOREIGN KEY (`CS_TIPO_USUARIO_ID`) REFERENCES `us_tipo_usuario` (`CS_TIPO_USUARIO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
