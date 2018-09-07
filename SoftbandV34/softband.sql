-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-08-2018 a las 18:17:01
-- Versión del servidor: 5.7.17-log
-- Versión de PHP: 7.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `softband`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco`
--

CREATE TABLE `banco` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `banco`
--

INSERT INTO `banco` (`id`, `name`) VALUES
(1, 'BANCOLOMBIA'),
(6, 'BBVA'),
(7, 'NO APLICA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banda`
--

CREATE TABLE `banda` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `banda`
--

INSERT INTO `banda` (`id`, `name`) VALUES
(1, 'ROCK'),
(3, 'ROCKY AND ROLLY'),
(6, 'ALEJOS'),
(8, 'ROCK 3'),
(9, 'LA REAL'),
(10, 'LA REAL'),
(11, 'LELO'),
(12, 'BANDISIMAS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriamovimientos`
--

CREATE TABLE `categoriamovimientos` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoriamovimientos`
--

INSERT INTO `categoriamovimientos` (`id`, `name`, `description`) VALUES
(6, 'PAGO CLARO 4', '---'),
(7, 'PAG', ''),
(8, 'PAGO A CUENTAS', 'NADA 2'),
(9, 'PAGO SERVICIOS EPM', ''),
(10, 'ASD', 'WERWER'),
(11, 'ASD 2', ''),
(12, 'ASD', 'ASD'),
(13, 'ASD 4', 'WERWER'),
(14, 'ASD 45', 'WERWER');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriaproducto`
--

CREATE TABLE `categoriaproducto` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoriaproducto`
--

INSERT INTO `categoriaproducto` (`id`, `name`) VALUES
(1, 'BEBIDAS'),
(3, 'MEKATO'),
(5, 'OTROS'),
(6, 'SALAS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `identification` varchar(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `idband` int(11) NOT NULL,
  `email` varchar(150) NOT NULL,
  `address` varchar(150) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `mobilephone` varchar(50) NOT NULL,
  `credit` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `identification`, `name`, `idband`, `email`, `address`, `phone`, `mobilephone`, `credit`) VALUES
(2, '1017227140', 'ALEJANDRO VERA', 6, 'AVERA@ALEJANDROVERACARRASQUILLA.COM', 'CARRERA 85A #79-37', '222-2222', '222-222-2222', 22000),
(3, '71798652', 'GERLY SANTIAGO', 9, 'SSUAREZD@HOTMAIL.COM', '', '-', '300-615-9142', 0),
(4, '87876543', 'LUCAS JARAMILLO', 11, 'LUCASJARAMILLO@GMAIL.COM', '', '-', '300-634-5463', 20000),
(5, '1017227148', 'ESTEBAN GUITIERREZ', 3, '', '', '266-6262', '213-515-3512', 50000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id` int(11) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  `idaccountout` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `amount` varchar(11) NOT NULL,
  `date` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`id`, `idproveedor`, `idaccountout`, `description`, `amount`, `date`) VALUES
(1, 1, 2, '---', '', '26/11/2017'),
(2, 1, 2, 'aaa', '', '26/11/2017'),
(3, 1, 2, 'aaa', '', '26/11/2017'),
(4, 1, 2, 'COMPRAS DEL 8 DE DICIEMBRE', '', '3/12/2017'),
(5, 1, 2, '---', '', '3/12/2017'),
(6, 1, 2, '***', '2500', '4/12/2017'),
(7, 2, 3, '***', '11700', '1/12/2017'),
(8, 4, 3, 'COMPRAS', '146800', '8/08/2018'),
(9, 1, 2, 'COMPRAS', '4200', '11/08/2018');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compraitem`
--

CREATE TABLE `compraitem` (
  `id` int(11) NOT NULL,
  `idcompra` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT '1',
  `costbuy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compraitem`
--

INSERT INTO `compraitem` (`id`, `idcompra`, `idproducto`, `cantidad`, `costbuy`) VALUES
(1, 4, 1, 30, 2500),
(2, 5, 1, 1, 2500),
(3, 6, 1, 1, 2500),
(4, 7, 1, 1, 2500),
(5, 7, 1, 1, 2500),
(6, 7, 2, 1, 1700),
(7, 7, 7, 1, 5000),
(8, 8, 1, 5, 2500),
(9, 8, 2, 79, 1700),
(10, 9, 2, 1, 1700),
(11, 9, 1, 1, 2500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

CREATE TABLE `cuenta` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `idbank` int(11) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cuenta`
--

INSERT INTO `cuenta` (`id`, `name`, `idbank`, `description`, `type`, `amount`) VALUES
(2, 'SANTI 2', 1, '10072536791', 0, 586300),
(3, 'CAJA 1', 7, 'CAJA MENOR', 2, 574700),
(4, 'CAJA 2', 7, 'CAJA MAYOR', 2, 5100000),
(12, 'LUCAS', 1, '10098765432', 1, 9080191),
(13, 'BANQUITOS', 1, 'ASDFASDFA', 2, 14000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deuda`
--

CREATE TABLE `deuda` (
  `id` int(11) NOT NULL,
  `IDClient` varchar(15) NOT NULL,
  `nameClient` varchar(150) NOT NULL,
  `codeFact` varchar(15) NOT NULL,
  `amount` double NOT NULL,
  `date` varchar(15) NOT NULL,
  `active` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `deuda`
--

INSERT INTO `deuda` (`id`, `IDClient`, `nameClient`, `codeFact`, `amount`, `date`, `active`) VALUES
(8, '1017227140', 'ALEJANDRO VERA', 'FAC13', 2000, '11/12/2017', 0),
(9, '1017227140', 'ALEJANDRO VERA', 'FAC14', 5000, '11/12/2017', 0),
(10, '1017227140', 'ALEJANDRO VERA', 'FAC15', 2000, '12/12/2017', 0),
(11, '1017227140', 'ALEJANDRO VERA', 'FAC16', 4000, '12/12/2017', 0),
(12, '1017227140', 'ALEJANDRO VERA', 'FAC17', 37000, '12/12/2017', 0),
(13, '1017227140', 'ALEJANDRO VERA', 'FAC18', 40000, '12/12/2017', 0),
(14, '1017227140', 'ALEJANDRO VERA', 'FAC19', 40000, '12/12/2017', 0),
(15, '1017227140', 'ALEJANDRO VERA', 'GHJK', 22000, '12/12/2017', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `identification` varchar(11) NOT NULL,
  `nameClient` varchar(150) NOT NULL,
  `banda` varchar(150) NOT NULL,
  `fecha` varchar(150) NOT NULL,
  `amount` double NOT NULL,
  `idaccountin` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id`, `code`, `identification`, `nameClient`, `banda`, `fecha`, `amount`, `idaccountin`, `active`) VALUES
(13, 'FAC1', '1017227140', 'ALEJANDRO VERA', 'ALEJOS', '11/12/2017', 13000, 2, 1),
(14, 'FAC14', '1017227140', 'ALEJANDRO VERA', 'ALEJOS', '11/12/2017', 10000, 2, 1),
(15, 'FAC15', '1017227140', 'ALEJANDRO VERA', 'ALEJOS', '12/12/2017', 43000, 2, 1),
(16, 'FAC16', '1017227140', 'ALEJANDRO VERA', 'ALEJOS', '12/12/2017', 41000, 2, 1),
(17, 'FAC17', '1017227140', 'ALEJANDRO VERA', 'ALEJOS', '12/12/2017', 37000, 2, 1),
(18, 'FAC18', '1017227140', 'ALEJANDRO VERA', 'ALEJOS', '12/12/2017', 40000, 2, 1),
(19, 'FAC19', '1017227140', 'ALEJANDRO VERA', 'ALEJOS', '12/12/2017', 40000, 2, 1),
(20, 'FAC20', '1017227140', 'CLIENTE GENÉRICO', 'ALEJOS', '12/12/2017', 15000, 2, 1),
(21, 'FAC21', '1017227140', 'ALEJANDRO VERA', 'ALEJOS', '8/08/2018', 500000, 2, 1),
(22, 'FAC22', '1017227140', 'ALEJANDRO VERA', 'ALEJOS', '5/06/2018', 22500, 2, 1),
(23, 'FAC23', '1017227140', 'ALEJANDRO VERA', 'ALEJOS', '8/08/2018', 5000, 2, 1),
(24, 'FAC24', '1017227140', 'ALEJANDRO VERA', 'ALEJOS', '11/08/2018', 40500, 2, 1),
(25, 'FAC25', '1017227140', 'ALEJANDRO VERA', 'ALEJOS', '11/08/2018', 40500, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturaitem`
--

CREATE TABLE `facturaitem` (
  `id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `name` varchar(150) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `codeinvoice` varchar(5) NOT NULL,
  `nota` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `facturaitem`
--

INSERT INTO `facturaitem` (`id`, `code`, `name`, `price`, `quantity`, `codeinvoice`, `nota`) VALUES
(1, 'S1', 'SALA 1', 20000, 2, 'FAC1', ''),
(2, 'CA', 'CEVEZA AGUILA', 3000, 8, 'FAC1', ''),
(3, 'CC', 'CEVEZA COSTEÑITA', 2500, 2, 'FAC1', ''),
(4, 'ASD', 'POLITA', 5000, 1, 'FAC2', ''),
(5, 'ASD', 'POLITA', 5000, 1, 'FAC2', ''),
(6, 'ASD', 'POLITA', 5000, 1, 'FAC3', ''),
(7, 'CC', 'CEVEZA COSTEÑITA', 2500, 1, 'FAC4', ''),
(8, 'CP', 'CEVEZA PILSEN', 3000, 1, 'FAC4', ''),
(9, 'ASD', 'POLITA', 5000, 1, 'FAC4', ''),
(10, 'ASD', 'POLITA', 5000, 11, 'FAC5', ''),
(11, 'ASD', 'POLITA', 5000, 1, 'FAC6', ''),
(12, 'ASD', 'POLITA', 5000, 1, 'FAC7', ''),
(13, 'CP', 'CEVEZA PILSEN', 3000, 1, 'FAC7', ''),
(14, 'CA', 'CEVEZA AGUILA', 3000, 1, 'FAC7', ''),
(15, 'CA', 'CEVEZA AGUILA', 3000, 1, 'FAC7', ''),
(16, 'ASD', 'POLITA', 5000, 1, 'FAC8', ''),
(17, 'CP', 'CEVEZA PILSEN', 3000, 1, 'FAC8', ''),
(18, 'CA', 'CEVEZA AGUILA', 3000, 1, 'FAC8', ''),
(19, 'CA', 'CEVEZA AGUILA', 3000, 1, 'FAC8', ''),
(20, 'CP', 'CEVEZA PILSEN', 3000, 1, 'FAC9', ''),
(21, 'CA', 'CEVEZA AGUILA', 3000, 1, 'FAC9', ''),
(22, 'ASD', 'POLITA', 5000, 1, 'FAC9', ''),
(23, 'CA', 'CEVEZA AGUILA', 3000, 1, 'FAC9', ''),
(24, 'CA', 'CEVEZA AGUILA', 3000, 1, 'FAC10', ''),
(25, 'MOXOO', 'LICORERA', 15000, 1, 'FAC11', ''),
(26, 'MOXOO', 'LICORERA', 15000, 2, 'FAC12', ''),
(27, 'MOXOO', 'LICORERA', 15000, 1, 'FAC13', ''),
(28, 'MOXOO', 'LICORERA', 15000, 1, 'FAC14', ''),
(29, 'MOXOO', 'LICORERA', 15000, 3, 'FAC15', ''),
(30, 'MOXOO', 'LICORERA', 15000, 3, 'FAC16', ''),
(31, 'MOXOO', 'LICORERA', 15000, 3, 'FAC17', ''),
(32, 'MOXOO', 'LICORERA', 15000, 1, 'FAC18', ''),
(33, 'MOXOO', 'LICORERA', 15000, 1, 'FAC18', ''),
(34, 'MOXOO', 'LICORERA', 15000, 1, 'FAC18', ''),
(35, 'MOXOO', 'LICORERA', 15000, 1, 'FAC19', ''),
(36, 'MOXOO', 'LICORERA', 15000, 1, 'FAC19', ''),
(37, 'MOXOO', 'LICORERA', 15000, 1, 'FAC19', ''),
(38, 'MOXOO', 'LICORERA', 15000, 1, 'FAC20', ''),
(39, 'ASD 2', 'POLITA', 5000, 100, 'FAC21', ''),
(40, 'ASD', 'POLITA', 5000, 1, 'FAC22', ''),
(41, 'CA', 'CEVEZA AGUILA', 3000, 1, 'FAC22', ''),
(42, 'CC', 'CEVEZA COSTEÑITA', 2500, 1, 'FAC22', ''),
(43, 'CP', 'CEVEZA PILSEN', 3000, 1, 'FAC22', ''),
(44, 'CP', 'CEVEZA PILSEN', 3000, 1, 'FAC22', ''),
(45, 'CP', 'CEVEZA PILSEN', 3000, 1, 'FAC22', ''),
(46, 'CP', 'CEVEZA PILSEN', 3000, 1, 'FAC22', ''),
(47, 'ASD', 'POLITA', 5000, 1, 'FAC23', ''),
(48, 'ASD', 'POLITA', 5000, 1, 'FAC24', ''),
(49, 'CA', 'CEVEZA AGUILA', 3000, 1, 'FAC24', ''),
(50, 'CP', 'CEVEZA PILSEN', 3000, 1, 'FAC24', ''),
(51, 'CC', 'CEVEZA COSTEÑITA', 2500, 1, 'FAC24', ''),
(52, 'S1', 'SALA 1', 22000, 1, 'FAC24', ''),
(53, 'CC', 'CEVEZA COSTEÑITA', 2500, 1, 'FAC24', ''),
(54, 'CC', 'CEVEZA COSTEÑITA', 2500, 1, 'FAC24', ''),
(55, 'ASD', 'POLITA', 5000, 1, 'FAC25', ''),
(56, 'CA', 'CEVEZA AGUILA', 3000, 1, 'FAC25', ''),
(57, 'CP', 'CEVEZA PILSEN', 3000, 1, 'FAC25', ''),
(58, 'CC', 'CEVEZA COSTEÑITA', 2500, 1, 'FAC25', ''),
(59, 'S1', 'SALA 1', 22000, 1, 'FAC25', ''),
(60, 'CC', 'CEVEZA COSTEÑITA', 2500, 1, 'FAC25', ''),
(61, 'CC', 'CEVEZA COSTEÑITA', 2500, 1, 'FAC25', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `meses`
--

CREATE TABLE `meses` (
  `id` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientosmonetarios`
--

CREATE TABLE `movimientosmonetarios` (
  `id` int(11) NOT NULL,
  `idaccount` int(11) NOT NULL,
  `idcatmovement` int(11) NOT NULL,
  `idtypemovement` int(11) NOT NULL,
  `amount` double NOT NULL,
  `description` varchar(250) NOT NULL,
  `date` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `movimientosmonetarios`
--

INSERT INTO `movimientosmonetarios` (`id`, `idaccount`, `idcatmovement`, `idtypemovement`, `amount`, `description`, `date`) VALUES
(1, 2, 6, 1, 217000, '', '3/12/2017'),
(2, 2, 6, 0, 2000, 'cuadre de caja', '3/12/2017'),
(3, 3, 7, 1, 6000, '0000', '3/12/2017'),
(4, 2, 9, 1, 60000, '...', '3/12/2017'),
(5, 2, 6, 1, 39000, 'lll', '3/12/2017'),
(6, 13, 9, 0, 8000000, 'SIN DESCRIPCION VALIDA', '12/06/2018'),
(7, 13, 6, 1, 2000000, 'PAGO DE FACTURAS', '12/06/2018');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `name` varchar(150) NOT NULL,
  `idcategory` int(11) NOT NULL,
  `description` varchar(250) NOT NULL,
  `costsale` double NOT NULL,
  `costbuy` double NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `code`, `name`, `idcategory`, `description`, `costsale`, `costbuy`, `stock`) VALUES
(1, 'ASD', 'POLITA', 1, '...', 5000, 2500, 12),
(2, 'CA', 'CEVEZA AGUILA', 1, 'BOTELLA RETORNABLE', 3000, 1700, 87),
(3, 'CP', 'CEVEZA PILSEN', 1, 'BOTELLA RETORNABLE', 3000, 1700, 4),
(4, 'CC', 'CEVEZA COSTEÑITA', 1, 'BOTELLA RETORNABLE', 2500, 1700, 3),
(5, 'S1', 'SALA 1', 6, '', 22000, 0, 999998),
(6, 'PAP', 'PAPITAS A REINA', 3, '', 2000, 1200, 10),
(7, 'MOXOO', 'LICORERA', 1, 'EMPACADO DE LICORES VARIOS', 15000, 5000, -11),
(8, 'ASD 2', 'POLITA', 1, '...', 5000, 2500, -90),
(9, 'ASDA', 'POLITA', 1, '...', 5000, 2500, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promo`
--

CREATE TABLE `promo` (
  `id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `percent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL,
  `identification` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id`, `identification`, `name`, `address`, `phone`) VALUES
(1, '1017227140', 'ALEJANDRO VERA CARRASQUILLA', 'CARRERA 85A #79-37', '3045599915'),
(2, '001', 'INVERSIONES GAMO', '', '3248725'),
(3, '002', 'ALMACENES EXITO', '', ''),
(4, '003', 'MACRO', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transferenciacuentas`
--

CREATE TABLE `transferenciacuentas` (
  `id` int(11) NOT NULL,
  `idaccountin` int(11) NOT NULL,
  `idaccountout` int(11) NOT NULL,
  `amount` double NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `dateMove` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `transferenciacuentas`
--

INSERT INTO `transferenciacuentas` (`id`, `idaccountin`, `idaccountout`, `amount`, `description`, `dateMove`) VALUES
(1, 2, 2, 5000, 'ASDFASDF', '31/07/2018');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `identification` varchar(12) NOT NULL,
  `name` varchar(150) NOT NULL,
  `nickName` varchar(150) NOT NULL,
  `password` varchar(250) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `identification`, `name`, `nickName`, `password`, `active`) VALUES
(1, '1017227140', 'ALEJANDRO VERA CARRASQUILLA', 'Avera123', 'Avera123', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `banco`
--
ALTER TABLE `banco`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `banda`
--
ALTER TABLE `banda`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `categoriamovimientos`
--
ALTER TABLE `categoriamovimientos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categoriaproducto`
--
ALTER TABLE `categoriaproducto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compraitem`
--
ALTER TABLE `compraitem`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `idbank` (`idbank`);

--
-- Indices de la tabla `deuda`
--
ALTER TABLE `deuda`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indices de la tabla `facturaitem`
--
ALTER TABLE `facturaitem`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `meses`
--
ALTER TABLE `meses`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `movimientosmonetarios`
--
ALTER TABLE `movimientosmonetarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `promo`
--
ALTER TABLE `promo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `transferenciacuentas`
--
ALTER TABLE `transferenciacuentas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `banco`
--
ALTER TABLE `banco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `banda`
--
ALTER TABLE `banda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `categoriamovimientos`
--
ALTER TABLE `categoriamovimientos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `categoriaproducto`
--
ALTER TABLE `categoriaproducto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `compraitem`
--
ALTER TABLE `compraitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `deuda`
--
ALTER TABLE `deuda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `facturaitem`
--
ALTER TABLE `facturaitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `meses`
--
ALTER TABLE `meses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimientosmonetarios`
--
ALTER TABLE `movimientosmonetarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `promo`
--
ALTER TABLE `promo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `transferenciacuentas`
--
ALTER TABLE `transferenciacuentas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
