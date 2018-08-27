-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-07-2018 a las 22:35:46
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 7.2.3

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
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre_cliente` varchar(255) NOT NULL,
  `telefono_cliente` char(30) NOT NULL,
  `email_cliente` varchar(64) NOT NULL,
  `direccion_cliente` varchar(255) NOT NULL,
  `status_cliente` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre_cliente`, `telefono_cliente`, `email_cliente`, `direccion_cliente`, `status_cliente`, `date_added`) VALUES
(1, 'Alex', '1234567', 'alexasd@gmail.com', 'Calle Sol', 1, '2018-05-20 20:01:29');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(16, 'Vietnamese Dong', 'VND ', '0', '.', ',', 'VND'),
(17, 'Swiss Franc', 'CHF ', '2', '\'', '.', 'CHF'),
(18, 'Quetzal Guatemalteco', 'Q', '2', ',', '.', 'GTQ'),
(19, 'Malaysian Ringgit', 'RM', '2', ',', '.', 'MYR'),
(20, 'Real Brasile&ntilde;o', 'R$', '2', '.', ',', 'BRL'),
(21, 'Thai Baht', 'THB ', '2', ',', '.', 'THB'),
(22, 'Nigerian Naira', 'NGN ', '2', ',', '.', 'NGN'),
(23, 'Peso Argentino', '$', '2', '.', ',', 'ARS'),
(24, 'Bangladeshi Taka', 'Tk', '2', ',', '.', 'BDT'),
(25, 'United Arab Emirates Dirham', 'DH ', '2', ',', '.', 'AED'),
(26, 'Hong Kong Dollar', '$', '2', ',', '.', 'HKD'),
(27, 'Indonesian Rupiah', 'Rp', '2', ',', '.', 'IDR'),
(28, 'Peso Mexicano', '$', '2', ',', '.', 'MXN'),
(29, 'Egyptian Pound', '&pound;', '2', ',', '.', 'EGP'),
(30, 'Peso Colombiano', '$', '2', '.', ',', 'COP'),
(31, 'West African Franc', 'CFA ', '2', ',', '.', 'XOF'),
(32, 'Chinese Renminbi', 'RMB ', '2', ',', '.', 'CNY');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

CREATE TABLE `detalle_factura` (
  `id_detalle` int(11) NOT NULL,
  `numero_factura` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `id_factura` int(11) NOT NULL,
  `numero_factura` int(11) NOT NULL,
  `fecha_factura` datetime NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `condiciones` varchar(30) NOT NULL,
  `total_venta` varchar(20) NOT NULL,
  `estado_factura` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ft_factura`
--

CREATE TABLE `ft_factura` (
  `CS_FACTURA_ID` int(6) NOT NULL,
  `DS_CODIGO_FACTURA` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `NM_DOCUMENTO_ID` int(11) NOT NULL,
  `DS_NOTAS_FACTURA` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NM_PRECIO_SUBTOTAL` double NOT NULL,
  `NM_PRECIO_TOTAL` double NOT NULL,
  `DT_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ft_factura_detalle`
--

CREATE TABLE `ft_factura_detalle` (
  `CS_FACTURA_ID` int(6) NOT NULL,
  `NM_CANTIDAD_COMPRA` int(4) NOT NULL,
  `CS_PRODUCTO_ID` int(6) NOT NULL,
  `NM_PRECIO_TOTAL_PRODUCTO` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `id_perfil` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`id_perfil`, `nombre`) VALUES
(1, 'Administrador'),
(2, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id_producto` int(11) NOT NULL,
  `codigo_producto` char(20) NOT NULL,
  `nombre_producto` char(255) NOT NULL,
  `status_producto` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `precio_producto` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id_producto`, `codigo_producto`, `nombre_producto`, `status_producto`, `date_added`, `precio_producto`) VALUES
(2, '122', 'Gaseosa', 1, '2018-05-20 23:13:55', 2000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rs_multas_reserva`
--

CREATE TABLE `rs_multas_reserva` (
  `CS_MULTA_ID` int(6) NOT NULL,
  `CS_RESERVA_ID` int(6) NOT NULL,
  `NM_VALOR_MULTA_SALA` double NOT NULL,
  `DS_ESTADO` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rs_reserva_sala`
--

CREATE TABLE `rs_reserva_sala` (
  `CS_RESERVA_ID` int(6) NOT NULL,
  `NM_DOCUMENTO_ID` int(11) NOT NULL,
  `CS_SALA_ID` int(4) NOT NULL,
  `DT_FECHA_INICIAL` timestamp NULL DEFAULT NULL,
  `DT_FECHA_FINAL` timestamp NULL DEFAULT NULL,
  `DS_NOTAS_RESERVA` varchar(255) DEFAULT NULL,
  `DS_ESTADO` varchar(10) NOT NULL,
  `DT_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tp_inventario_producto`
--

CREATE TABLE `tp_inventario_producto` (
  `CS_INVENTARIO_ID` int(6) NOT NULL,
  `CS_PRODUCTO_ID` int(6) NOT NULL,
  `NM_CANTIDAD_INVENTARIO` int(4) NOT NULL,
  `NM_PRECIO_UNITARIO_COMPRA` double NOT NULL,
  `NM_PRECIO_UNITARIO_VENTA` double NOT NULL,
  `CS_VENDEDOR_PRODUCTO_ID` int(6) NOT NULL,
  `DT_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `DT_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tp_unidad_medida_producto`
--

CREATE TABLE `tp_unidad_medida_producto` (
  `CS_UNIDAD_ID` int(6) NOT NULL,
  `DS_NOMBRE_UNIDAD` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `DS_DESCRIPCION_UNIDAD` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tp_vendedor_producto`
--

CREATE TABLE `tp_vendedor_producto` (
  `CS_VENDEDOR_ID` int(6) NOT NULL,
  `DS_NOMBRE_VENDEDOR` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `DS_DESCRIPCION_VENDEDOR` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL COMMENT 'auto incrementing user_id of each user, unique index',
  `firstname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s name, unique',
  `user_password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s password in salted and hashed format',
  `user_email` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s email, unique',
  `id_perfil` int(11) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data';

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `firstname`, `lastname`, `user_name`, `user_password_hash`, `user_email`, `id_perfil`, `date_added`) VALUES
(1, 'Edinson', 'Gallego', 'edinson', '$2y$10$ghzIntu0DDpa3FQsHF7P5uoqlXqVQfev8L0QUgGGgHAQunqpe1gG2', 'edigahe77@gmail.com', 1, '2018-05-24 08:19:54'),
(2, 'santiago', 'betancourt', 'santiago', '$2y$10$JidBywLyCCN.LOu/.WxWMOosJrMq1LhG9XDoFI/RctFuVGo4.WNyW', 'santiago2@hotmail.com', 1, '2018-05-27 17:42:34'),
(12, 'camilo', 'gutierrez', 'camilo', '$2y$10$fbMktTPBINeorreMvm9tK.TVAiaLqBHbJw.FqndhfXa/Zrlaf6ApS', 'camilo10@hotmail.com', 2, '2018-05-27 17:56:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `us_banda_detalle_usuario`
--

CREATE TABLE `us_banda_detalle_usuario` (
  `CS_BANDA_ID` int(4) DEFAULT NULL,
  `NM_DOCUMENTO_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `us_banda_detalle_usuario`
--

INSERT INTO `us_banda_detalle_usuario` (`CS_BANDA_ID`, `NM_DOCUMENTO_ID`) VALUES
(1, 123456789);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `us_banda_usuario`
--

CREATE TABLE `us_banda_usuario` (
  `CS_BANDA_ID` int(4) NOT NULL,
  `DS_NOMBRE_BANDA` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `id_contacto_banda` int(11) NOT NULL,
  `DS_DESCRIPCION_BANDA` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `us_banda_usuario`
--

INSERT INTO `us_banda_usuario` (`CS_BANDA_ID`, `DS_NOMBRE_BANDA`, `id_contacto_banda`, `DS_DESCRIPCION_BANDA`) VALUES
(1, 'Pr', 123123, 'Pr'),
(2, 'PPI', 94501690, 'PPI'),
(3, 'Roba Panocha', 0, 'DSGFDSGSSDS'),
(13123, 'PPI Prueba', 0, 'Bnada de rock'),
(1231564, 'RBD', 1231564, 'sdfsdf'),
(1017238239, 'liga', 1017238239, 'Ligaaaa'),
(2147483647, 'edinson', 0, 'Solista');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `us_contactos_banda_usuario`
--

CREATE TABLE `us_contactos_banda_usuario` (
  `NM_DOCUMENTO_CONTACTO_ID` int(11) NOT NULL,
  `CS_TIPO_DOCUMENTO_ID` int(4) NOT NULL,
  `DS_NOMBRE_CONTACTO` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `DS_APELLIDO_CONTACTO` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `DS_CORREO_CONTACTO` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `us_contactos_banda_usuario`
--

INSERT INTO `us_contactos_banda_usuario` (`NM_DOCUMENTO_CONTACTO_ID`, `CS_TIPO_DOCUMENTO_ID`, `DS_NOMBRE_CONTACTO`, `DS_APELLIDO_CONTACTO`, `DS_CORREO_CONTACTO`) VALUES
(13123, 1, 'Alex', 'Chalarca', 'aaaa@hhhd.com'),
(123123, 1, 'Alexander', 'Chalarca Caro', 'asd@gmail.com'),
(1231564, 1, 'rbd', 'rbd', 'rbd@sd.com'),
(94501690, 1, 'Edinson', 'Gallego', 'edg@gmail.com'),
(1017238239, 1, 'Alexander', 'Chalarca Caro', 'desarrollo@kubbox.com'),
(2147483647, 1, 'builes', 'gsaa', 'edg@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `us_estado_usuario`
--

CREATE TABLE `us_estado_usuario` (
  `CS_ESTADO_ID` int(4) NOT NULL,
  `DS_NOMBRE_ESTADO` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `DS_DESCRIPCION_ESTADO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `CS_INCENTIVO_ID` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `us_tipo_usuario`
--

INSERT INTO `us_tipo_usuario` (`CS_TIPO_USUARIO`, `DS_NOMBRE_TIPO_USUARIO`, `DS_DESCRIPCION_TIPO_USUARIO`, `CS_INCENTIVO_ID`) VALUES
(1, 'Administrador', 'Administrador', 1),
(2, 'Banda', 'Banda', 2),
(3, 'Usuario Normal', 'Usario Normal', 3),
(4, 'Docente', 'que dicta clases', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `us_usuario`
--

CREATE TABLE `us_usuario` (
  `NM_DOCUMENTO_ID` int(11) NOT NULL,
  `CS_TIPO_DOCUMENTO_ID` int(4) NOT NULL,
  `DS_NOMBRES_USUARIO` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `DS_APELLIDOS_USUARIO` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `NM_TELEFONO` int(7) DEFAULT NULL,
  `NM_CELULAR` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `DS_CORREO` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `DS_CONTRASENA` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `CS_TIPO_USUARIO_ID` int(4) NOT NULL,
  `CS_ESTADO_ID` int(4) NOT NULL,
  `DT_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `us_usuario`
--

INSERT INTO `us_usuario` (`NM_DOCUMENTO_ID`, `CS_TIPO_DOCUMENTO_ID`, `DS_NOMBRES_USUARIO`, `DS_APELLIDOS_USUARIO`, `NM_TELEFONO`, `NM_CELULAR`, `DS_CORREO`, `DS_CONTRASENA`, `CS_TIPO_USUARIO_ID`, `CS_ESTADO_ID`, `DT_FECHA_CREACION`) VALUES
(234, 1, 'wsfsa', 'sdfsd', 234234, '123213123', 'dasd@asd.com', '123seqx213esx123wsa', 2, 1, '2018-07-10 21:32:21'),
(2312, 1, 'edinson', 'gallego', 355550000, '23432432', 'Edigahe77@gmail.com', '$2y$10$uQfMiukqzuLsYHy2ZdtIMOROWQyBITIa.87OU5o7wNi4XvUnD4PP.', 1, 1, '2018-04-20 05:00:00'),
(2354, 1, 'dsf', 'sfdas', 12435, '23424', 'dasd@asd.com', 'qwedwq142wqdas234dsa', 4, 1, '2018-07-10 21:32:21'),
(9876, 4, 'sdcxz sdxc', 'sadfasdf', 654324, '1231242364', 'dasd@asd.com', 'hdf342r5fav', 2, 2, '2018-07-10 21:32:21'),
(100000, 1, 'santiago', 'betancourt', 123, '123', 'santiago11@gmail.com', 'd9b1d7db4cd6e70935368a1efb10e377', 2, 1, '2018-04-19 05:00:00'),
(5634894, 3, 'sadfsafcsd', 'sdfsda', 12343, '15324512', 'dasd@asd.com', 'wedfsa324r34rfsd', 3, 2, '2018-07-10 21:32:21'),
(34610553, 1, 'camilo', 'gutierrez', 123, '123', 'camilo10@gmail.com', '1cc39ffd758234422e1f75beadfc5fb2', 1, 1, '2018-04-20 05:00:00'),
(43191104, 1, 'nidia', 'valencia', 123, '123', 'desarrollo@kubbox.com', '$2y$10$/rhe0jVthzcOdk66iYgfaexKdIHD718qLHz5U0Dgq45r0xW8zCNsK', 2, 1, '2018-04-19 05:00:00'),
(234213423, 1, 'ads', 'asd', 234234, '123123123', 'dasd@asd.com', 'asd234ed23ed324ed32d', 1, 2, '2018-07-10 21:33:28'),
(345342534, 1, 'adsas', 'sadfsafasfd', 1243123, '1231231212', 'dasd@asd.com', 'qwe1231ads21341qwde21e23eds23', 2, 2, '2018-07-10 21:32:21'),
(1017238239, 1, 'Alexander', 'Chalarca ', 52425, '3002781941', 'alexcuba96@gmail.com', '$2y$10$qHMWj/rO3kEiMLR7/UZUKORaYHLIHqB2M9bNZlsSPUo.7i2BEKox2', 1, 1, '2018-07-09 12:40:02'),
(1111111111, 1, 'qwdsa', 'asdas', 123123, '12321', 'dasd@asd.com', 'wrqwr234r234rdf234e', 1, 2, '2018-07-10 21:33:28');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `codigo_producto` (`nombre_cliente`);

--
-- Indices de la tabla `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `numero_cotizacion` (`numero_factura`,`id_producto`);

--
-- Indices de la tabla `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id_factura`),
  ADD UNIQUE KEY `numero_cotizacion` (`numero_factura`);

--
-- Indices de la tabla `ft_factura`
--
ALTER TABLE `ft_factura`
  ADD PRIMARY KEY (`CS_FACTURA_ID`);

--
-- Indices de la tabla `ft_factura_detalle`
--
ALTER TABLE `ft_factura_detalle`
  ADD KEY `FK_FACTURA` (`CS_FACTURA_ID`),
  ADD KEY `FK_PRODUTO` (`CS_PRODUCTO_ID`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id_perfil`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_producto`),
  ADD UNIQUE KEY `codigo_producto` (`codigo_producto`);

--
-- Indices de la tabla `rs_multas_reserva`
--
ALTER TABLE `rs_multas_reserva`
  ADD PRIMARY KEY (`CS_MULTA_ID`),
  ADD KEY `FK_RESERVA` (`CS_RESERVA_ID`);

--
-- Indices de la tabla `rs_reserva_sala`
--
ALTER TABLE `rs_reserva_sala`
  ADD PRIMARY KEY (`CS_RESERVA_ID`),
  ADD KEY `FK_USUARIO` (`NM_DOCUMENTO_ID`),
  ADD KEY `FK_SALA` (`CS_SALA_ID`);

--
-- Indices de la tabla `rs_sala`
--
ALTER TABLE `rs_sala`
  ADD PRIMARY KEY (`CS_SALA_ID`);

--
-- Indices de la tabla `tmp`
--
ALTER TABLE `tmp`
  ADD PRIMARY KEY (`id_tmp`);

--
-- Indices de la tabla `tp_inventario_producto`
--
ALTER TABLE `tp_inventario_producto`
  ADD PRIMARY KEY (`CS_INVENTARIO_ID`),
  ADD KEY `FK_PRODUCTO` (`CS_PRODUCTO_ID`),
  ADD KEY `FK_VENDEDOR` (`CS_VENDEDOR_PRODUCTO_ID`);

--
-- Indices de la tabla `tp_producto`
--
ALTER TABLE `tp_producto`
  ADD PRIMARY KEY (`CS_PRODUCTO_ID`),
  ADD KEY `FK_UNIDAD` (`FK_UNIDAD`);

--
-- Indices de la tabla `tp_unidad_medida_producto`
--
ALTER TABLE `tp_unidad_medida_producto`
  ADD PRIMARY KEY (`CS_UNIDAD_ID`);

--
-- Indices de la tabla `tp_vendedor_producto`
--
ALTER TABLE `tp_vendedor_producto`
  ADD PRIMARY KEY (`CS_VENDEDOR_ID`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- Indices de la tabla `us_banda_detalle_usuario`
--
ALTER TABLE `us_banda_detalle_usuario`
  ADD KEY `FK_BANDA` (`CS_BANDA_ID`),
  ADD KEY `FK_DOCUMENTO_USUARIO` (`NM_DOCUMENTO_ID`);

--
-- Indices de la tabla `us_banda_usuario`
--
ALTER TABLE `us_banda_usuario`
  ADD PRIMARY KEY (`CS_BANDA_ID`);

--
-- Indices de la tabla `us_contactos_banda_usuario`
--
ALTER TABLE `us_contactos_banda_usuario`
  ADD PRIMARY KEY (`NM_DOCUMENTO_CONTACTO_ID`),
  ADD KEY `FK_TIPO_DOCUMENTO_CONTACTO` (`CS_TIPO_DOCUMENTO_ID`);

--
-- Indices de la tabla `us_estado_usuario`
--
ALTER TABLE `us_estado_usuario`
  ADD PRIMARY KEY (`CS_ESTADO_ID`);

--
-- Indices de la tabla `us_incentivo_tipo_usuario`
--
ALTER TABLE `us_incentivo_tipo_usuario`
  ADD PRIMARY KEY (`CS_INCENTIVO_ID`);

--
-- Indices de la tabla `us_tipo_documento`
--
ALTER TABLE `us_tipo_documento`
  ADD PRIMARY KEY (`CS_TIPO_DOCUMENTO_ID`);

--
-- Indices de la tabla `us_tipo_usuario`
--
ALTER TABLE `us_tipo_usuario`
  ADD PRIMARY KEY (`CS_TIPO_USUARIO`),
  ADD KEY `FK_INCENTIVO` (`CS_INCENTIVO_ID`);

--
-- Indices de la tabla `us_usuario`
--
ALTER TABLE `us_usuario`
  ADD PRIMARY KEY (`NM_DOCUMENTO_ID`),
  ADD KEY `FK_TIPO_USUARIO` (`CS_TIPO_USUARIO_ID`),
  ADD KEY `FK_ESTADO` (`CS_ESTADO_ID`),
  ADD KEY `FK_TIPO_DOCUMENTO` (`CS_TIPO_DOCUMENTO_ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ft_factura`
--
ALTER TABLE `ft_factura`
  MODIFY `CS_FACTURA_ID` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `rs_multas_reserva`
--
ALTER TABLE `rs_multas_reserva`
  MODIFY `CS_MULTA_ID` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rs_reserva_sala`
--
ALTER TABLE `rs_reserva_sala`
  MODIFY `CS_RESERVA_ID` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rs_sala`
--
ALTER TABLE `rs_sala`
  MODIFY `CS_SALA_ID` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tmp`
--
ALTER TABLE `tmp`
  MODIFY `id_tmp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tp_inventario_producto`
--
ALTER TABLE `tp_inventario_producto`
  MODIFY `CS_INVENTARIO_ID` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tp_producto`
--
ALTER TABLE `tp_producto`
  MODIFY `CS_PRODUCTO_ID` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tp_vendedor_producto`
--
ALTER TABLE `tp_vendedor_producto`
  MODIFY `CS_VENDEDOR_ID` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'auto incrementing user_id of each user, unique index', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `us_banda_usuario`
--
ALTER TABLE `us_banda_usuario`
  MODIFY `CS_BANDA_ID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483647;

--
-- AUTO_INCREMENT de la tabla `us_contactos_banda_usuario`
--
ALTER TABLE `us_contactos_banda_usuario`
  MODIFY `NM_DOCUMENTO_CONTACTO_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483647;

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
  MODIFY `CS_TIPO_USUARIO` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

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
  ADD CONSTRAINT `FK_RESERVA` FOREIGN KEY (`CS_RESERVA_ID`) REFERENCES `rs_reserva_sala` (`CS_RESERVA_ID`);

--
-- Filtros para la tabla `rs_reserva_sala`
--
ALTER TABLE `rs_reserva_sala`
  ADD CONSTRAINT `FK_SALA` FOREIGN KEY (`CS_SALA_ID`) REFERENCES `rs_sala` (`CS_SALA_ID`),
  ADD CONSTRAINT `FK_USUARIO` FOREIGN KEY (`NM_DOCUMENTO_ID`) REFERENCES `us_usuario` (`NM_DOCUMENTO_ID`);

--
-- Filtros para la tabla `tp_inventario_producto`
--
ALTER TABLE `tp_inventario_producto`
  ADD CONSTRAINT `FK_PRODUCTO` FOREIGN KEY (`CS_PRODUCTO_ID`) REFERENCES `tp_producto` (`CS_PRODUCTO_ID`),
  ADD CONSTRAINT `FK_VENDEDOR` FOREIGN KEY (`CS_VENDEDOR_PRODUCTO_ID`) REFERENCES `tp_vendedor_producto` (`CS_VENDEDOR_ID`);

--
-- Filtros para la tabla `tp_producto`
--
ALTER TABLE `tp_producto`
  ADD CONSTRAINT `FK_UNIDAD` FOREIGN KEY (`FK_UNIDAD`) REFERENCES `tp_unidad_medida_producto` (`CS_UNIDAD_ID`);

--
-- Filtros para la tabla `us_banda_detalle_usuario`
--
ALTER TABLE `us_banda_detalle_usuario`
  ADD CONSTRAINT `FK_BANDA` FOREIGN KEY (`CS_BANDA_ID`) REFERENCES `us_banda_usuario` (`CS_BANDA_ID`);

--
-- Filtros para la tabla `us_contactos_banda_usuario`
--
ALTER TABLE `us_contactos_banda_usuario`
  ADD CONSTRAINT `FK_TIPO_DOCUMENTO_CONTACTO` FOREIGN KEY (`CS_TIPO_DOCUMENTO_ID`) REFERENCES `us_tipo_documento` (`CS_TIPO_DOCUMENTO_ID`);

--
-- Filtros para la tabla `us_tipo_usuario`
--
ALTER TABLE `us_tipo_usuario`
  ADD CONSTRAINT `FK_INCENTIVO` FOREIGN KEY (`CS_INCENTIVO_ID`) REFERENCES `us_incentivo_tipo_usuario` (`CS_INCENTIVO_ID`);

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
