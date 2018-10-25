/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : salaestudiodb

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-09-25 13:27:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for currencies
-- ----------------------------
DROP TABLE IF EXISTS `currencies`;
CREATE TABLE `currencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `precision` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `thousand_separator` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `decimal_separator` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of currencies
-- ----------------------------
INSERT INTO `currencies` VALUES ('1', 'US Dollar', '$', '2', ',', '.', 'USD');
INSERT INTO `currencies` VALUES ('2', 'Libra Esterlina', '&pound;', '2', ',', '.', 'GBP');
INSERT INTO `currencies` VALUES ('3', 'Euro', 'â‚¬', '2', '.', ',', 'EUR');
INSERT INTO `currencies` VALUES ('4', 'South African Rand', 'R', '2', '.', ',', 'ZAR');
INSERT INTO `currencies` VALUES ('5', 'Danish Krone', 'kr ', '2', '.', ',', 'DKK');
INSERT INTO `currencies` VALUES ('6', 'Israeli Shekel', 'NIS ', '2', ',', '.', 'ILS');
INSERT INTO `currencies` VALUES ('7', 'Swedish Krona', 'kr ', '2', '.', ',', 'SEK');
INSERT INTO `currencies` VALUES ('8', 'Kenyan Shilling', 'KSh ', '2', ',', '.', 'KES');
INSERT INTO `currencies` VALUES ('9', 'Canadian Dollar', 'C$', '2', ',', '.', 'CAD');
INSERT INTO `currencies` VALUES ('10', 'Philippine Peso', 'P ', '2', ',', '.', 'PHP');
INSERT INTO `currencies` VALUES ('11', 'Indian Rupee', 'Rs. ', '2', ',', '.', 'INR');
INSERT INTO `currencies` VALUES ('12', 'Australian Dollar', '$', '2', ',', '.', 'AUD');
INSERT INTO `currencies` VALUES ('13', 'Singapore Dollar', 'SGD ', '2', ',', '.', 'SGD');
INSERT INTO `currencies` VALUES ('14', 'Norske Kroner', 'kr ', '2', '.', ',', 'NOK');
INSERT INTO `currencies` VALUES ('15', 'New Zealand Dollar', '$', '2', ',', '.', 'NZD');
INSERT INTO `currencies` VALUES ('16', 'Vietnamese Dong', 'VND ', '0', '.', ',', 'VND');
INSERT INTO `currencies` VALUES ('17', 'Swiss Franc', 'CHF ', '2', '\'', '.', 'CHF');
INSERT INTO `currencies` VALUES ('18', 'Quetzal Guatemalteco', 'Q', '2', ',', '.', 'GTQ');
INSERT INTO `currencies` VALUES ('19', 'Malaysian Ringgit', 'RM', '2', ',', '.', 'MYR');
INSERT INTO `currencies` VALUES ('20', 'Real Brasile&ntilde;o', 'R$', '2', '.', ',', 'BRL');
INSERT INTO `currencies` VALUES ('21', 'Thai Baht', 'THB ', '2', ',', '.', 'THB');
INSERT INTO `currencies` VALUES ('22', 'Nigerian Naira', 'NGN ', '2', ',', '.', 'NGN');
INSERT INTO `currencies` VALUES ('23', 'Peso Argentino', '$', '2', '.', ',', 'ARS');
INSERT INTO `currencies` VALUES ('24', 'Bangladeshi Taka', 'Tk', '2', ',', '.', 'BDT');
INSERT INTO `currencies` VALUES ('25', 'United Arab Emirates Dirham', 'DH ', '2', ',', '.', 'AED');
INSERT INTO `currencies` VALUES ('26', 'Hong Kong Dollar', '$', '2', ',', '.', 'HKD');
INSERT INTO `currencies` VALUES ('27', 'Indonesian Rupiah', 'Rp', '2', ',', '.', 'IDR');
INSERT INTO `currencies` VALUES ('28', 'Peso Mexicano', '$', '2', ',', '.', 'MXN');
INSERT INTO `currencies` VALUES ('29', 'Egyptian Pound', '&pound;', '2', ',', '.', 'EGP');
INSERT INTO `currencies` VALUES ('30', 'Peso Colombiano', '$', '2', '.', ',', 'COP');
INSERT INTO `currencies` VALUES ('31', 'West African Franc', 'CFA ', '2', ',', '.', 'XOF');
INSERT INTO `currencies` VALUES ('32', 'Chinese Renminbi', 'RMB ', '2', ',', '.', 'CNY');

-- ----------------------------
-- Table structure for events
-- ----------------------------
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `color` varchar(7) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of events
-- ----------------------------
INSERT INTO `events` VALUES ('18', 'Reserva Banda ppi', '#008000', '2017-12-10 00:00:00', '2017-12-11 00:00:00');

-- ----------------------------
-- Table structure for ft_estado
-- ----------------------------
DROP TABLE IF EXISTS `ft_estado`;
CREATE TABLE `ft_estado` (
  `ID_ESTADO` int(5) NOT NULL AUTO_INCREMENT,
  `DES_ESTADO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_ESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ft_estado
-- ----------------------------
INSERT INTO `ft_estado` VALUES ('1', 'Pagado');
INSERT INTO `ft_estado` VALUES ('2', 'Pendiente de pago');

-- ----------------------------
-- Table structure for ft_factura
-- ----------------------------
DROP TABLE IF EXISTS `ft_factura`;
CREATE TABLE `ft_factura` (
  `CS_FACTURA_ID` int(6) NOT NULL AUTO_INCREMENT,
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
  `ID_FORMA_PAGO` int(5) DEFAULT '1',
  `NM_PORCENTAJE_DESCUENTO` int(3) DEFAULT '0',
  PRIMARY KEY (`CS_FACTURA_ID`) USING BTREE,
  KEY `FK_CLIENTE_FACTURA` (`NM_CLIENTE_ID`),
  KEY `FK_VENDDOR_FACTURA` (`NM_VENDEDOR_ID`),
  KEY `FK_ESTADO_FAC` (`ID_ESTADO`),
  KEY `FK_MEDIO_PAGO` (`ID_FORMA_PAGO`),
  CONSTRAINT `FK_CLIENTE_FACTURA` FOREIGN KEY (`NM_CLIENTE_ID`) REFERENCES `us_usuario` (`NM_DOCUMENTO_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ESTADO_FAC` FOREIGN KEY (`ID_ESTADO`) REFERENCES `ft_estado` (`ID_ESTADO`) ON UPDATE CASCADE,
  CONSTRAINT `FK_MEDIO_PAGO` FOREIGN KEY (`ID_FORMA_PAGO`) REFERENCES `ft_forma_pago` (`ID_FORMA_PAGO`) ON UPDATE CASCADE,
  CONSTRAINT `FK_VENDDOR_FACTURA` FOREIGN KEY (`NM_VENDEDOR_ID`) REFERENCES `us_usuario` (`NM_DOCUMENTO_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ft_factura
-- ----------------------------
INSERT INTO `ft_factura` VALUES ('1', '0000000001', '1152188863', 'asdfasdf', '135000', '0', '156600', '21600', '2018-09-16 06:28:31', '36610553', '', '1', '1', '0');
INSERT INTO `ft_factura` VALUES ('2', '0000000001', '1152188863', 'asdfasdf', '135000', '0', '156600', '21600', '2018-09-16 06:57:15', '36610553', '', '1', '1', '0');
INSERT INTO `ft_factura` VALUES ('3', '0000000001', '1152188863', 'asdfasdf', '135000', '0', '156600', '21600', '2018-09-16 06:58:17', '36610553', '', '1', '1', '0');
INSERT INTO `ft_factura` VALUES ('4', '0000000004', '1152188863', 'prueba jajajaj', '135000', '0', '156600', '21600', '2018-09-16 06:59:20', '35611553', '', '1', '1', '0');
INSERT INTO `ft_factura` VALUES ('5', '0000000004', '1152188863', 'prueba jajajaj', '135000', '0', '156600', '21600', '2018-09-16 06:59:58', '35611553', '', '1', '1', '0');
INSERT INTO `ft_factura` VALUES ('6', '0000000006', '1152188863', '', '90000', '0', '104400', '14400', '2018-09-16 10:10:24', '43101104', '', '1', '1', '0');
INSERT INTO `ft_factura` VALUES ('7', '0000000007', '1152188863', 'sdafasdf', '90000', '0', '104400', '14400', '2018-09-16 10:11:14', '35611553', '', '1', '1', '0');
INSERT INTO `ft_factura` VALUES ('8', '0000000008', '1152188863', 'sdfsadf', '135000', '0', '156600', '21600', '2018-09-16 10:25:43', '95501690', '', '1', '1', '0');
INSERT INTO `ft_factura` VALUES ('20', '0000000009', '1152188863', '', '135000', '0', '156600', '21600', '2018-09-16 10:43:32', null, 'cami lo pere', '1', '1', '0');
INSERT INTO `ft_factura` VALUES ('21', '0000000009', '1152188863', '', '135000', '0', '156600', '21600', '2018-09-16 10:46:24', null, 'cami lo pere', '1', '1', '0');
INSERT INTO `ft_factura` VALUES ('22', '0000000022', '1152188863', 'Ã±jkh', '360000', '0', '417600', '57600', '2018-09-17 03:01:36', '36610553', '', '1', '1', '0');
INSERT INTO `ft_factura` VALUES ('23', '0000000023', '1152188863', 'esta es una prueba mas real', '135000', '0', '156600', '21600', '2018-09-17 04:29:12', '36610553', '', '1', '1', '0');
INSERT INTO `ft_factura` VALUES ('24', '0000000024', '1152188863', '', '90000', '0', '104400', '14400', '2018-09-18 01:24:11', null, 'parra andrea jajajaja', '1', '1', '0');
INSERT INTO `ft_factura` VALUES ('25', '0000000025', '1152188863', '', '90000', '0', '104400', '14400', '2018-09-18 02:56:17', '43101104', '', '1', '1', '0');
INSERT INTO `ft_factura` VALUES ('26', '0000000026', '1152188863', 'prueba', '90000', '0', '104400', '14400', '2018-09-18 03:00:04', '95501690', '', '1', '1', '0');
INSERT INTO `ft_factura` VALUES ('27', '0000000027', '1152188863', '', '135000', '0', '156600', '21600', '2018-09-18 03:02:10', '36610553', '', '1', '1', '0');
INSERT INTO `ft_factura` VALUES ('28', 'ZW00000028', '1152188863', 'esta es una pruyeba', '45000', '0', '52200', '7200', '2018-09-18 03:04:17', null, 'carlos diego', '1', '1', '0');
INSERT INTO `ft_factura` VALUES ('29', '0000000028', '1152188863', 'prueba pendiente de pago', '135000', '0', '156600', '21600', '2018-09-18 03:13:07', '2147483647', '', '1', '1', '0');
INSERT INTO `ft_factura` VALUES ('30', 'Q000000003', '1152188863', 'prueb', '135000', '0', '156600', '21600', '2018-09-18 03:16:52', '95501690', '', '1', '1', '0');
INSERT INTO `ft_factura` VALUES ('31', 'Q0000000030', '1152188863', 'sdaf', '90000', '0', '104400', '14400', '2018-09-18 03:22:55', '36610553', '', '1', '1', '0');
INSERT INTO `ft_factura` VALUES ('32', 'WB0000000032', '1152188863', 'dfasdf', '135000', '0', '156600', '21600', '2018-09-18 03:24:33', '43101104', '', '1', '1', '0');
INSERT INTO `ft_factura` VALUES ('33', '0000000033', '1152188863', 'sad', '135000', '0', '156600', '21600', '2018-09-18 03:25:23', '95501690', '', '1', '1', '0');
INSERT INTO `ft_factura` VALUES ('34', '0DFS000000034', '1152188863', '', '135000', '0', '156600', '21600', '2018-09-18 03:26:24', '36610553', '', '1', '1', '0');
INSERT INTO `ft_factura` VALUES ('35', 'F000000035', '1152188863', 'dsafd', '45000', '0', '52200', '7200', '2018-09-18 03:27:35', '94501690', '', '1', '1', '0');
INSERT INTO `ft_factura` VALUES ('36', '0000000036', '1152188863', 'sdfas', '135000', '0', '156600', '21600', '2018-09-18 06:01:47', '35611553', '', '1', '1', '0');
INSERT INTO `ft_factura` VALUES ('37', '0000000037', '1152188863', 'este señor debe.', '90000', '0', '104400', '14400', '2018-09-18 11:50:58', '36610553', '', '1', '1', '0');
INSERT INTO `ft_factura` VALUES ('38', '0000000038', '1152188863', '', '90000', '0', '104400', '14400', '2018-09-18 07:08:32', '36610553', '', '1', '1', '0');
INSERT INTO `ft_factura` VALUES ('39', '0000000039', '1152188863', '', '90000', '0', '104400', '14400', '2018-09-19 03:11:47', null, 'pepe guama', '1', '1', '0');
INSERT INTO `ft_factura` VALUES ('40', '0000000040', '1152188863', '', '45000', '0', '52200', '7200', '2018-09-19 03:20:58', null, 'joseph ortiz', '1', '1', '0');
INSERT INTO `ft_factura` VALUES ('41', '0000000041', '1152188863', '', '250000', '0', '290000', '40000', '2018-09-21 06:45:45', null, 'juan perez', '2', '1', '0');
INSERT INTO `ft_factura` VALUES ('42', '0000000042', '1152188863', 'prueba', '3000', '0', '3480', '480', '2018-09-24 07:34:33', '1152188863', '', '2', '1', '0');
INSERT INTO `ft_factura` VALUES ('43', '0000000043', '1152188863', 'prueba', '90000', '0', '104400', '14400', '2018-09-25 09:06:59', '999999999999999', '', '1', '1', '0');
INSERT INTO `ft_factura` VALUES ('44', '0000000044', '1152188863', 'prueba', '105000', '0', '121800', '16800', '2018-09-25 09:07:47', '999999999999999', '', '2', '1', '0');
INSERT INTO `ft_factura` VALUES ('45', '0000000045', '1152188863', 'quedo pendiente', '45000', '1800', '50400', '7200', '2018-09-25 12:50:33', '34610553', '', '2', '1', '4');
INSERT INTO `ft_factura` VALUES ('46', '0000000046', '1152188863', 'SE LE VENDE NO SE QUE', '15000', '1500', '15900', '2400', '2018-09-25 01:14:45', null, 'PEPE LANDA', '2', '1', '10');

-- ----------------------------
-- Table structure for ft_factura_detalle
-- ----------------------------
DROP TABLE IF EXISTS `ft_factura_detalle`;
CREATE TABLE `ft_factura_detalle` (
  `NM_ID_DETALLE_FACTURA` int(5) NOT NULL AUTO_INCREMENT,
  `CS_FACTURA_ID` int(6) NOT NULL,
  `NM_CANTIDAD_COMPRA` int(4) NOT NULL,
  `CS_PRODUCTO_ID` int(6) NOT NULL,
  `NM_PRECIO_TOTAL_PRODUCTO` double NOT NULL,
  `NM_PRECIO_UNITARIO` double DEFAULT NULL,
  PRIMARY KEY (`NM_ID_DETALLE_FACTURA`),
  KEY `FK_FACTURA` (`CS_FACTURA_ID`) USING BTREE,
  KEY `FK_PRODUTO` (`CS_PRODUCTO_ID`) USING BTREE,
  CONSTRAINT `FK_FACTURA` FOREIGN KEY (`CS_FACTURA_ID`) REFERENCES `ft_factura` (`CS_FACTURA_ID`),
  CONSTRAINT `FK_PRODUTO` FOREIGN KEY (`CS_PRODUCTO_ID`) REFERENCES `tp_producto` (`CS_PRODUCTO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ft_factura_detalle
-- ----------------------------
INSERT INTO `ft_factura_detalle` VALUES ('3', '21', '3', '2', '135000', '45000');
INSERT INTO `ft_factura_detalle` VALUES ('4', '22', '8', '2', '360000', '45000');
INSERT INTO `ft_factura_detalle` VALUES ('5', '23', '3', '2', '135000', '45000');
INSERT INTO `ft_factura_detalle` VALUES ('6', '24', '2', '2', '90000', '45000');
INSERT INTO `ft_factura_detalle` VALUES ('7', '25', '2', '2', '90000', '45000');
INSERT INTO `ft_factura_detalle` VALUES ('8', '26', '2', '2', '90000', '45000');
INSERT INTO `ft_factura_detalle` VALUES ('9', '27', '3', '2', '135000', '45000');
INSERT INTO `ft_factura_detalle` VALUES ('10', '28', '1', '2', '45000', '45000');
INSERT INTO `ft_factura_detalle` VALUES ('11', '29', '3', '2', '135000', '45000');
INSERT INTO `ft_factura_detalle` VALUES ('12', '30', '3', '2', '135000', '45000');
INSERT INTO `ft_factura_detalle` VALUES ('13', '31', '2', '2', '90000', '45000');
INSERT INTO `ft_factura_detalle` VALUES ('14', '32', '3', '2', '135000', '45000');
INSERT INTO `ft_factura_detalle` VALUES ('15', '33', '3', '2', '135000', '45000');
INSERT INTO `ft_factura_detalle` VALUES ('16', '34', '3', '2', '135000', '45000');
INSERT INTO `ft_factura_detalle` VALUES ('17', '35', '1', '2', '45000', '45000');
INSERT INTO `ft_factura_detalle` VALUES ('18', '36', '3', '2', '135000', '45000');
INSERT INTO `ft_factura_detalle` VALUES ('19', '37', '2', '2', '90000', '45000');
INSERT INTO `ft_factura_detalle` VALUES ('20', '38', '2', '2', '90000', '45000');
INSERT INTO `ft_factura_detalle` VALUES ('21', '39', '2', '2', '90000', '45000');
INSERT INTO `ft_factura_detalle` VALUES ('22', '40', '1', '2', '45000', '45000');
INSERT INTO `ft_factura_detalle` VALUES ('23', '41', '10', '2', '250000', '25000');
INSERT INTO `ft_factura_detalle` VALUES ('24', '42', '1', '3', '3000', '3000');
INSERT INTO `ft_factura_detalle` VALUES ('25', '43', '2', '2', '90000', '45000');
INSERT INTO `ft_factura_detalle` VALUES ('26', '44', '2', '2', '90000', '45000');
INSERT INTO `ft_factura_detalle` VALUES ('27', '44', '5', '3', '15000', '3000');
INSERT INTO `ft_factura_detalle` VALUES ('28', '45', '1', '2', '45000', '45000');
INSERT INTO `ft_factura_detalle` VALUES ('29', '46', '5', '3', '15000', '3000');

-- ----------------------------
-- Table structure for ft_forma_pago
-- ----------------------------
DROP TABLE IF EXISTS `ft_forma_pago`;
CREATE TABLE `ft_forma_pago` (
  `ID_FORMA_PAGO` int(5) NOT NULL AUTO_INCREMENT,
  `DES_FORMA_PAGO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_FORMA_PAGO`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ft_forma_pago
-- ----------------------------
INSERT INTO `ft_forma_pago` VALUES ('1', 'Efectivo');
INSERT INTO `ft_forma_pago` VALUES ('2', 'Crédito');

-- ----------------------------
-- Table structure for perfil
-- ----------------------------
DROP TABLE IF EXISTS `perfil`;
CREATE TABLE `perfil` (
  `id_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  PRIMARY KEY (`id_perfil`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of perfil
-- ----------------------------
INSERT INTO `perfil` VALUES ('1', 'Administrador');
INSERT INTO `perfil` VALUES ('2', 'Usuario');

-- ----------------------------
-- Table structure for rs_multas_reserva
-- ----------------------------
DROP TABLE IF EXISTS `rs_multas_reserva`;
CREATE TABLE `rs_multas_reserva` (
  `CS_MULTA_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CS_RESERVA_ID` int(6) NOT NULL,
  `NM_VALOR_MULTA_SALA` double NOT NULL,
  `DS_ESTADO` varchar(10) NOT NULL,
  PRIMARY KEY (`CS_MULTA_ID`) USING BTREE,
  KEY `FK_RESERVA` (`CS_RESERVA_ID`) USING BTREE,
  CONSTRAINT `FK_RESERVA` FOREIGN KEY (`CS_RESERVA_ID`) REFERENCES `rs_reserva_sala` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of rs_multas_reserva
-- ----------------------------

-- ----------------------------
-- Table structure for rs_reserva_sala
-- ----------------------------
DROP TABLE IF EXISTS `rs_reserva_sala`;
CREATE TABLE `rs_reserva_sala` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `documento` bigint(20) NOT NULL,
  `sala` int(4) NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `DS_ESTADO` varchar(10) NOT NULL,
  `DT_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_USUARIO` (`documento`) USING BTREE,
  KEY `FK_SALA` (`sala`) USING BTREE,
  CONSTRAINT `FK_SALA` FOREIGN KEY (`sala`) REFERENCES `rs_sala` (`CS_SALA_ID`),
  CONSTRAINT `FK_USUARIO` FOREIGN KEY (`documento`) REFERENCES `us_usuario` (`NM_DOCUMENTO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of rs_reserva_sala
-- ----------------------------
INSERT INTO `rs_reserva_sala` VALUES ('2', '43101104', '1', '2018-08-09 02:15:00', '2018-08-09 02:50:00', 'con audifonos', 'Activo', '2018-08-25 11:17:25');
INSERT INTO `rs_reserva_sala` VALUES ('5', '43101104', '1', '2018-08-10 03:30:00', '2018-08-10 09:50:00', 'con audifono', 'Activo', '2018-08-27 12:48:59');
INSERT INTO `rs_reserva_sala` VALUES ('6', '94501690', '1', '2018-08-10 04:25:00', '2018-08-10 05:40:00', 'con guitarra', 'Activo', '2018-08-27 12:50:33');
INSERT INTO `rs_reserva_sala` VALUES ('8', '94501690', '1', '2018-08-27 03:25:00', '2018-08-27 05:20:00', 'olg', 'Activo', '2018-08-27 19:21:27');
INSERT INTO `rs_reserva_sala` VALUES ('9', '34610553', '1', '2018-08-28 05:25:00', '2018-08-28 08:35:00', 'con bajo', 'Activo', '2018-08-28 15:33:21');
INSERT INTO `rs_reserva_sala` VALUES ('10', '34610553', '1', '2018-08-28 08:55:00', '2018-08-28 09:55:00', 'con guitarra', 'Activo', '2018-08-28 15:36:24');
INSERT INTO `rs_reserva_sala` VALUES ('11', '43101104', '1', '2018-08-28 04:15:00', '2018-08-28 04:55:00', 'con audifonos', 'Activo', '2018-08-28 15:38:06');
INSERT INTO `rs_reserva_sala` VALUES ('35', '94501690', '1', '2018-08-29 03:20:00', '2018-08-29 04:30:00', 'ghjklÃ±', 'Activo', '2018-08-28 19:45:29');
INSERT INTO `rs_reserva_sala` VALUES ('36', '34610553', '1', '2018-08-30 03:50:00', '2018-08-30 04:15:00', 'dfgbhnjmk', 'Activo', '2018-08-28 19:48:50');
INSERT INTO `rs_reserva_sala` VALUES ('37', '94501690', '2', '2018-09-03 03:20:00', '2018-09-03 04:30:00', 'con  microfonos', 'Activo', '2018-09-02 11:09:15');
INSERT INTO `rs_reserva_sala` VALUES ('38', '35611553', '1', '2018-09-08 03:25:00', '2018-09-08 05:35:00', 'con audifonos', 'Activo', '2018-09-07 14:47:27');
INSERT INTO `rs_reserva_sala` VALUES ('39', '43101104', '1', '2018-09-08 03:00:00', '2018-09-08 03:20:00', 'lkjhygf', 'Activo', '2018-09-07 15:03:39');

-- ----------------------------
-- Table structure for rs_sala
-- ----------------------------
DROP TABLE IF EXISTS `rs_sala`;
CREATE TABLE `rs_sala` (
  `CS_SALA_ID` int(4) NOT NULL AUTO_INCREMENT,
  `DS_NOMBRE_SALA` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `DS_DESCRIPCION_SALA` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NM_VALOR_HORA_SALA` double NOT NULL,
  `NM_CAPACIDAD_SALA` int(4) NOT NULL,
  PRIMARY KEY (`CS_SALA_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of rs_sala
-- ----------------------------
INSERT INTO `rs_sala` VALUES ('1', 'Sala 1', 'sala con guitarra', '42000', '8');
INSERT INTO `rs_sala` VALUES ('2', 'Sala 2', 'Sala 2', '45000', '12');

-- ----------------------------
-- Table structure for tmp
-- ----------------------------
DROP TABLE IF EXISTS `tmp`;
CREATE TABLE `tmp` (
  `id_tmp` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `cantidad_tmp` int(11) NOT NULL,
  `precio_tmp` double(8,2) DEFAULT NULL,
  `session_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tmp`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tmp
-- ----------------------------

-- ----------------------------
-- Table structure for tp_inventario_producto
-- ----------------------------
DROP TABLE IF EXISTS `tp_inventario_producto`;
CREATE TABLE `tp_inventario_producto` (
  `CS_INVENTARIO_ID` int(6) NOT NULL AUTO_INCREMENT,
  `CS_PRODUCTO_ID` int(6) NOT NULL,
  `NM_CANTIDAD_INVENTARIO` int(4) NOT NULL,
  `CS_VENDEDOR_PRODUCTO_ID` int(6) NOT NULL,
  `DT_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `NM_PRECIO_UNITARIO_COMPRA` double NOT NULL,
  PRIMARY KEY (`CS_INVENTARIO_ID`) USING BTREE,
  KEY `FK_PRODUCTO` (`CS_PRODUCTO_ID`) USING BTREE,
  KEY `FK_VENDEDOR` (`CS_VENDEDOR_PRODUCTO_ID`) USING BTREE,
  CONSTRAINT `FK_PRODUCTO` FOREIGN KEY (`CS_PRODUCTO_ID`) REFERENCES `tp_producto` (`CS_PRODUCTO_ID`),
  CONSTRAINT `FK_VENDEDOR` FOREIGN KEY (`CS_VENDEDOR_PRODUCTO_ID`) REFERENCES `tp_vendedor_producto` (`CS_VENDEDOR_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tp_inventario_producto
-- ----------------------------
INSERT INTO `tp_inventario_producto` VALUES ('3', '2', '10', '1', '2018-09-14 16:59:52', '3000');
INSERT INTO `tp_inventario_producto` VALUES ('4', '2', '10', '1', '2018-09-14 17:48:34', '3000');
INSERT INTO `tp_inventario_producto` VALUES ('7', '1', '3', '3', '2018-09-21 14:51:26', '800');
INSERT INTO `tp_inventario_producto` VALUES ('8', '2', '3', '2', '2018-09-21 14:58:19', '1000');
INSERT INTO `tp_inventario_producto` VALUES ('9', '3', '20', '2', '2018-09-21 15:00:20', '1900');
INSERT INTO `tp_inventario_producto` VALUES ('10', '2', '15', '1', '2018-09-21 15:01:19', '1900');
INSERT INTO `tp_inventario_producto` VALUES ('11', '3', '2', '2', '2018-09-21 15:06:18', '300');
INSERT INTO `tp_inventario_producto` VALUES ('12', '2', '2', '1', '2018-09-21 15:07:45', '200');
INSERT INTO `tp_inventario_producto` VALUES ('13', '3', '29', '2', '2018-09-21 15:09:47', '2000');
INSERT INTO `tp_inventario_producto` VALUES ('14', '2', '5', '1', '2018-09-21 18:43:53', '3233');

-- ----------------------------
-- Table structure for tp_producto
-- ----------------------------
DROP TABLE IF EXISTS `tp_producto`;
CREATE TABLE `tp_producto` (
  `CS_PRODUCTO_ID` int(6) NOT NULL AUTO_INCREMENT,
  `DS_CODIGO_PRODUCTO` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `DS_NOMBRE_PRODUCTO` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `DS_DESCRIPCION_PRODUCTO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NM_PRESENTACION_PRODUCTO` int(10) NOT NULL,
  `FK_UNIDAD` int(6) NOT NULL,
  `DT_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `NM_ESTADO` int(1) DEFAULT NULL,
  `DB_PRECIO_VENTA_UND` double DEFAULT NULL,
  `NM_PRECIO_UNITARIO_COMPRA_UND` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NM_ELIMINADO` int(1) DEFAULT '0',
  PRIMARY KEY (`CS_PRODUCTO_ID`) USING BTREE,
  KEY `FK_UNIDAD` (`FK_UNIDAD`) USING BTREE,
  CONSTRAINT `FK_UNIDAD` FOREIGN KEY (`FK_UNIDAD`) REFERENCES `tp_unidad_medida_producto` (`CS_UNIDAD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tp_producto
-- ----------------------------
INSERT INTO `tp_producto` VALUES ('1', 'WQP', 'Galletas saltin', 'esta es casi una prueba  a ver si lo guarda', '0', '1', '2018-09-13 18:20:16', '1', '900', '200', '1');
INSERT INTO `tp_producto` VALUES ('2', 'WBVF', 'Aguardiente', 'Aguardiente antioqueÃ±o, guarito para la gente. ', '0', '1', '2018-09-13 19:11:13', '1', '45000', '599', '0');
INSERT INTO `tp_producto` VALUES ('3', 'POWE', 'Cigarrillos boston', 'Caja de cigarillos boston ligth', '0', '2', '2018-09-13 22:09:07', '1', '3000', '400', '0');
INSERT INTO `tp_producto` VALUES ('4', 'SALA', 'Sala reserva', 'Sala que reserva el usuario', '0', '3', '2018-09-21 19:30:12', '1', '4000', '4000', '0');

-- ----------------------------
-- Table structure for tp_unidad_medida_producto
-- ----------------------------
DROP TABLE IF EXISTS `tp_unidad_medida_producto`;
CREATE TABLE `tp_unidad_medida_producto` (
  `CS_UNIDAD_ID` int(6) NOT NULL AUTO_INCREMENT,
  `DS_NOMBRE_UNIDAD` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `DS_DESCRIPCION_UNIDAD` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`CS_UNIDAD_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tp_unidad_medida_producto
-- ----------------------------
INSERT INTO `tp_unidad_medida_producto` VALUES ('1', 'LTR', 'Litro');
INSERT INTO `tp_unidad_medida_producto` VALUES ('2', 'Caja', 'Cajetilla');
INSERT INTO `tp_unidad_medida_producto` VALUES ('3', 'Unidad', 'Und');

-- ----------------------------
-- Table structure for tp_vendedor_producto
-- ----------------------------
DROP TABLE IF EXISTS `tp_vendedor_producto`;
CREATE TABLE `tp_vendedor_producto` (
  `CS_VENDEDOR_ID` int(6) NOT NULL AUTO_INCREMENT,
  `DS_NOMBRE_VENDEDOR` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `DS_DESCRIPCION_VENDEDOR` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`CS_VENDEDOR_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tp_vendedor_producto
-- ----------------------------
INSERT INTO `tp_vendedor_producto` VALUES ('1', 'Exito', 'Exito del poblado');
INSERT INTO `tp_vendedor_producto` VALUES ('2', 'Consumo', 'Consumo de la america');
INSERT INTO `tp_vendedor_producto` VALUES ('3', 'De uno', 'De uno de la vegas');

-- ----------------------------
-- Table structure for us_banda_detalle_usuario
-- ----------------------------
DROP TABLE IF EXISTS `us_banda_detalle_usuario`;
CREATE TABLE `us_banda_detalle_usuario` (
  `CS_BANDA_ID` int(5) DEFAULT NULL,
  `NM_DOCUMENTO_ID` bigint(20) DEFAULT NULL,
  `ES_LIDER` int(1) DEFAULT '0',
  KEY `FK_CS_BANDA_ID_USUARIO` (`CS_BANDA_ID`),
  KEY `FK_NM_DOCUMENTO_ID_USUARIO` (`NM_DOCUMENTO_ID`),
  CONSTRAINT `FK_CS_BANDA_ID_USUARIO` FOREIGN KEY (`CS_BANDA_ID`) REFERENCES `us_banda_usuario` (`CS_BANDA_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_NM_DOCUMENTO_ID_USUARIO` FOREIGN KEY (`NM_DOCUMENTO_ID`) REFERENCES `us_usuario` (`NM_DOCUMENTO_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of us_banda_detalle_usuario
-- ----------------------------
INSERT INTO `us_banda_detalle_usuario` VALUES ('2', '35611553', '1');
INSERT INTO `us_banda_detalle_usuario` VALUES ('2', '94501690', '0');
INSERT INTO `us_banda_detalle_usuario` VALUES ('2', '36610553', '0');
INSERT INTO `us_banda_detalle_usuario` VALUES ('1', '35611553', '1');
INSERT INTO `us_banda_detalle_usuario` VALUES ('1', '95501690', '0');
INSERT INTO `us_banda_detalle_usuario` VALUES ('1', '36610553', '0');
INSERT INTO `us_banda_detalle_usuario` VALUES ('1', '982345456', '0');

-- ----------------------------
-- Table structure for us_banda_usuario
-- ----------------------------
DROP TABLE IF EXISTS `us_banda_usuario`;
CREATE TABLE `us_banda_usuario` (
  `CS_BANDA_ID` int(5) NOT NULL AUTO_INCREMENT,
  `DS_NOMBRE_BANDA` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `DS_DESCRIPCION_BANDA` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`CS_BANDA_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of us_banda_usuario
-- ----------------------------
INSERT INTO `us_banda_usuario` VALUES ('1', 'Prueba C', 'Prueba c');
INSERT INTO `us_banda_usuario` VALUES ('2', 'rreyr', 'ryery');

-- ----------------------------
-- Table structure for us_estado_usuario
-- ----------------------------
DROP TABLE IF EXISTS `us_estado_usuario`;
CREATE TABLE `us_estado_usuario` (
  `CS_ESTADO_ID` int(4) NOT NULL AUTO_INCREMENT,
  `DS_NOMBRE_ESTADO` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `DS_DESCRIPCION_ESTADO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`CS_ESTADO_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of us_estado_usuario
-- ----------------------------
INSERT INTO `us_estado_usuario` VALUES ('1', 'Activo', 'Activo');
INSERT INTO `us_estado_usuario` VALUES ('2', 'Inactivo', 'Inactivo');

-- ----------------------------
-- Table structure for us_tipo_documento
-- ----------------------------
DROP TABLE IF EXISTS `us_tipo_documento`;
CREATE TABLE `us_tipo_documento` (
  `CS_TIPO_DOCUMENTO_ID` int(4) NOT NULL AUTO_INCREMENT,
  `DS_NOMBRE_TIPO_DOCUMENTO` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `DS_DESCRIPCION_TIPO_DOCUMENTO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`CS_TIPO_DOCUMENTO_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of us_tipo_documento
-- ----------------------------
INSERT INTO `us_tipo_documento` VALUES ('1', 'Cédula Ciudadanía', 'Cédula Ciudadanía');
INSERT INTO `us_tipo_documento` VALUES ('2', 'Tarjeta Identidad', 'Tarjeta Identidad');
INSERT INTO `us_tipo_documento` VALUES ('3', 'Pasaporte', 'Pasaporte');
INSERT INTO `us_tipo_documento` VALUES ('4', 'Cédula Extranjera ', 'Cédula Extranjera');

-- ----------------------------
-- Table structure for us_tipo_usuario
-- ----------------------------
DROP TABLE IF EXISTS `us_tipo_usuario`;
CREATE TABLE `us_tipo_usuario` (
  `CS_TIPO_USUARIO` int(4) NOT NULL AUTO_INCREMENT,
  `DS_NOMBRE_TIPO_USUARIO` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `DS_DESCRIPCION_TIPO_USUARIO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NM_PORCENTAJE_INCENTIVO` double(4,0) NOT NULL,
  PRIMARY KEY (`CS_TIPO_USUARIO`) USING BTREE,
  KEY `FK_INCENTIVO` (`NM_PORCENTAJE_INCENTIVO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of us_tipo_usuario
-- ----------------------------
INSERT INTO `us_tipo_usuario` VALUES ('1', 'Administrador', 'Administrador', '1');
INSERT INTO `us_tipo_usuario` VALUES ('2', 'Banda', 'Banda', '2');
INSERT INTO `us_tipo_usuario` VALUES ('3', 'Usuario Normal', 'Usario Normal', '3');
INSERT INTO `us_tipo_usuario` VALUES ('4', 'Docente', 'que dicta clases', '4');
INSERT INTO `us_tipo_usuario` VALUES ('5', 'Cliente', 'Clientes que asisten al establecimiento', '1');

-- ----------------------------
-- Table structure for us_usuario
-- ----------------------------
DROP TABLE IF EXISTS `us_usuario`;
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
  PRIMARY KEY (`NM_DOCUMENTO_ID`) USING BTREE,
  KEY `FK_TIPO_USUARIO` (`CS_TIPO_USUARIO_ID`) USING BTREE,
  KEY `FK_ESTADO` (`CS_ESTADO_ID`) USING BTREE,
  KEY `FK_TIPO_DOCUMENTO` (`CS_TIPO_DOCUMENTO_ID`) USING BTREE,
  CONSTRAINT `FK_ESTADO` FOREIGN KEY (`CS_ESTADO_ID`) REFERENCES `us_estado_usuario` (`CS_ESTADO_ID`),
  CONSTRAINT `FK_TIPO_DOCUMENTO` FOREIGN KEY (`CS_TIPO_DOCUMENTO_ID`) REFERENCES `us_tipo_documento` (`CS_TIPO_DOCUMENTO_ID`),
  CONSTRAINT `FK_TIPO_USUARIO` FOREIGN KEY (`CS_TIPO_USUARIO_ID`) REFERENCES `us_tipo_usuario` (`CS_TIPO_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of us_usuario
-- ----------------------------
INSERT INTO `us_usuario` VALUES ('34610553', '1', 'diana', 'viveros', '3214697', '3214636790', 'edinson_gallego23152@elpoli.edu.co', null, '$2y$10$YNINJCyPd7V1ezeFMw9YDuc6of0j3PxG/U7toUD/qQAx7OGzcnaP2', '4', '1', '2018-08-28 15:31:00', '0', '0');
INSERT INTO `us_usuario` VALUES ('35611553', '1', 'jairo', 'ortiz', '1200000', '8452530125', 'jairo@gmail.com', null, '$2y$10$DUbb22PcZE3R0wvwv/SZzO9ef9PIBsg6W8b10YQ5O.OjBAEZnJU2.', '2', '2', '2018-09-06 12:00:14', '0', '0');
INSERT INTO `us_usuario` VALUES ('36610553', '1', 'jhon', 'valencia', '7896325', '8965635632', 'jhon@gmail.com', null, '$2y$10$6sZZ9FGEIaWYF10ZLeB40eR838NfAPd2fMzvMMgzyMve4yKRiBPWe', '2', '1', '2018-09-06 13:43:35', '0', '0');
INSERT INTO `us_usuario` VALUES ('43101104', '1', 'nidia', 'valencia', '3127899', '3127852212', 'edigahe77@hotmail.com', null, '$2y$10$Mo3BAL/l6V3aH9UxdupiY.0jRJ1dWrpwaFRAlBG8FSif2VA56xQl.', '2', '1', '2018-08-25 11:15:21', '0', '0');
INSERT INTO `us_usuario` VALUES ('94501690', '1', 'edinson', 'gallego', '3216366', '3216367908', 'edigahe77@gmail.com', null, '$2y$10$SMl8JxTiwCRtboFbK6yepu9fjmrps9gBAyg8nOmCqp6PfRRorUXo.', '1', '1', '2018-08-25 11:10:33', '0', '0');
INSERT INTO `us_usuario` VALUES ('95501690', '1', 'juan', 'acevedo', '7896366', '1521521255', 'juan@gmail.com', null, '$2y$10$IUQ0n8aZ4WmdByRAiF9HJec4kTxkHP26mXgyar0cBf4RW0xOzXNMq', '2', '2', '2018-09-06 15:03:01', '0', '0');
INSERT INTO `us_usuario` VALUES ('123456789', '2', 'ana', 'herrera', '4545632', '2563254896', 'ana@gmail.com', null, '$2y$10$nuKTZucQxy7mbMvoQt2TtOwwc9vRNZ8NjmqMIpjSMV1mfdzIOBwom', '2', '1', '2018-09-06 03:50:32', '0', '0');
INSERT INTO `us_usuario` VALUES ('324343333', '1', 'pepe', 'dfsadf', '2342343', '3232432234', 'ososcar@fasdf.com', null, '$2y$10$Gj8Zas7zys..mmXtvvTzMua6eOeg8zjcIIIFNNFGoEUb1Kn0vrVm6', '2', '2', '2018-09-06 13:41:14', '0', '0');
INSERT INTO `us_usuario` VALUES ('789623778', '1', 'pedro', 'perez', '12369', '789632', 'pedro@gmail.com', null, '$2y$10$29aWCUIkJ5mb8KKOevJLXuBiqiL5I8KhdGREpxJDkPOOOswp5eE7C', '1', '2', '2018-09-06 18:15:44', '0', '0');
INSERT INTO `us_usuario` VALUES ('982345456', '1', 'edinson', 'herrera', '7896152', '5634565625', 'edi@gmail.com', null, '$2y$10$4Mn3cUh8c3y09VI8FJ/lHedNHQDs1jG6XKKA4ZvB9e3YbyFJd8NcO', '4', '2', '2018-09-06 18:11:48', '0', '0');
INSERT INTO `us_usuario` VALUES ('987412212', '1', 'fghjk', 'cvvbnm', '5623048', '9865320765', 'ediha@gmail.com', null, '$2y$10$sYK47RC1LPsQwBIACyv79.M9l5SkHKwPnj9uBzqtUzPsW/OGj1Itq', '4', '2', '2018-09-06 19:33:20', '0', '0');
INSERT INTO `us_usuario` VALUES ('1152188863', '1', 'Oscar', 'Mesa', '5804661', '3012280744', 'oscarmesa.elpoli@gmail.com', null, '$2y$10$3sTTtL17ShNLWimjwm5f6ehtn3YcfJW5BRC3aT0hSWQd4fdfWEFGi', '1', '1', '2018-09-10 19:01:51', '0', '0');
INSERT INTO `us_usuario` VALUES ('1152204758', '1', 'santiago', 'betancur', '6666666', '6666666666', 'sbetancur859@gmail.com', null, '$2y$10$32AbUlynEMogC8aG/NEk6OtxD6hlD.QUjkZRWnv.C8ye3zCt87PGG', '1', '1', '2018-08-25 13:59:36', '0', '0');
INSERT INTO `us_usuario` VALUES ('2147483647', '1', 'Diego', 'Mejia', '5555555', '5555555555', '555@gmail.com', null, '$2y$10$doEZ4hYMaAxgWZiPdyyIX.hMT3HQwLWT3xAIcuA3YCBeGzKGIcGRC', '1', '2', '2018-09-06 16:14:52', '0', '1');
INSERT INTO `us_usuario` VALUES ('5435843958', '3', 'asdfasdf', 'sadfsdfasdf', '2313333', '3432423333', 'oscar@gmailc.om', null, '$2y$10$sJqVbpfYBnNs482CdCgJYeRDiRXxI5mjkDP7ZjAyvwVFnPK5hOQK.', '4', '2', '2018-09-07 16:10:45', '0', '0');
INSERT INTO `us_usuario` VALUES ('324234234324234', '1', 'carlos', 'landa', '2343243', '2342343243', 'jaime12321@gmail.com', '', '$2y$10$8VExBHrLnMWQAxRdcCNpZ.napTbLqxh.psPj6ziJshwuMQGe9DcXG', '4', '2', '2018-09-24 20:16:13', '0', '0');
INSERT INTO `us_usuario` VALUES ('454385345849838', '2', 'asdfh', 'dfjsf', '3423333', '3333333333', 'fdfasfsd@gmail.com', 'calle falsa 1234', '$2y$10$sOLpMBBizGbLn/M9hLBlQeHv.uBdg1iKM64wjgWgGbIP/bOL27xAG', '2', '2', '2018-09-07 16:09:12', '0', '0');
INSERT INTO `us_usuario` VALUES ('877777777777777', '1', 'sdfasdf', 'adfgdgsdfg', '5555555', '5555555555', 'asdfasdf@gmail.com', null, '$2y$10$lHEjTLDk4BoEshMS7ebJHuvQDeDCpwRd5E3HXMOdWRR8ycIc3maZW', '1', '2', '2018-09-07 16:44:43', '0', '1');
INSERT INTO `us_usuario` VALUES ('996954695469456', '2', 'dfgksdfgksdkfgsdfkgs', 'dskjfskf', '3432423', '4234234234', '4535345@gmail.com', null, '$2y$10$f0VW.aYOb2.nMcEkAoZVteW7MYUTWSoJr8tTEcKnFE6Ct2CdPwDZ6', '2', '2', '2018-09-07 16:13:32', '0', '1');
INSERT INTO `us_usuario` VALUES ('999999999999999', '1', 'Diego', 'Mejia', '5555555', '5555555555', '555@gmail.com', 'calle 1234', '$2y$10$hxmzv4AJN4G7pJQntHvEdOtIqRwj0/JIoFRaXjZY5I6HO5K27az7W', '1', '2', '2018-09-07 16:35:21', '0', '0');
