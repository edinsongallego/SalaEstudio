/*
Navicat MySQL Data Transfer

Source Server         : local1
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : salaestudiodb

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2019-01-25 16:53:33
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

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
  `ID_FORMA_PAGO` int(5) DEFAULT NULL,
  `NM_PORCENTAJE_DESCUENTO` int(3) DEFAULT '0',
  `ID_RESERVA` int(6) DEFAULT NULL,
  PRIMARY KEY (`CS_FACTURA_ID`) USING BTREE,
  KEY `FK_CLIENTE_FACTURA` (`NM_CLIENTE_ID`),
  KEY `FK_VENDDOR_FACTURA` (`NM_VENDEDOR_ID`),
  KEY `FK_ESTADO_FAC` (`ID_ESTADO`),
  KEY `FK_MEDIO_PAGO` (`ID_FORMA_PAGO`),
  KEY `ID_RESERVA` (`ID_RESERVA`),
  CONSTRAINT `FK_CLIENTE_FACTURA` FOREIGN KEY (`NM_CLIENTE_ID`) REFERENCES `us_usuario` (`NM_DOCUMENTO_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ESTADO_FAC` FOREIGN KEY (`ID_ESTADO`) REFERENCES `ft_estado` (`ID_ESTADO`) ON UPDATE CASCADE,
  CONSTRAINT `FK_MEDIO_PAGO` FOREIGN KEY (`ID_FORMA_PAGO`) REFERENCES `ft_forma_pago` (`ID_FORMA_PAGO`) ON UPDATE CASCADE,
  CONSTRAINT `FK_VENDDOR_FACTURA` FOREIGN KEY (`NM_VENDEDOR_ID`) REFERENCES `us_usuario` (`NM_DOCUMENTO_ID`) ON UPDATE CASCADE,
  CONSTRAINT `ft_factura_ibfk_1` FOREIGN KEY (`ID_RESERVA`) REFERENCES `rs_reserva_sala` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ft_factura
-- ----------------------------
INSERT INTO `ft_factura` VALUES ('1', '0000000001', '1152188863', 'asdfasdf', '135000', '0', '156600', '21600', '2018-09-16 06:28:31', '36610553', '', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('2', '0000000001', '1152188863', 'asdfasdf', '135000', '0', '156600', '21600', '2018-09-16 06:57:15', '36610553', '', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('3', '0000000001', '1152188863', 'asdfasdf', '135000', '0', '156600', '21600', '2018-09-16 06:58:17', '36610553', '', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('4', '0000000004', '1152188863', 'prueba jajajaj', '135000', '0', '156600', '21600', '2018-09-16 06:59:20', '35611553', '', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('5', '0000000004', '1152188863', 'prueba jajajaj', '135000', '0', '156600', '21600', '2018-09-16 06:59:58', '35611553', '', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('6', '0000000006', '1152188863', '', '90000', '0', '104400', '14400', '2018-09-16 10:10:24', '43101104', '', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('7', '0000000007', '1152188863', 'sdafasdf', '90000', '0', '104400', '14400', '2018-09-16 10:11:14', '35611553', '', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('8', '0000000008', '1152188863', 'sdfsadf', '135000', '0', '156600', '21600', '2018-09-16 10:25:43', '95501690', '', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('20', '0000000009', '1152188863', '', '135000', '0', '156600', '21600', '2018-09-16 10:43:32', null, 'cami lo pere', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('21', '0000000009', '1152188863', '', '135000', '0', '156600', '21600', '2018-09-16 10:46:24', null, 'cami lo pere', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('22', '0000000022', '1152188863', 'Ã±jkh', '360000', '0', '417600', '57600', '2018-09-17 03:01:36', '36610553', '', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('23', '0000000023', '1152188863', 'esta es una prueba mas real', '135000', '0', '156600', '21600', '2018-09-17 04:29:12', '36610553', '', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('24', '0000000024', '1152188863', '', '90000', '0', '104400', '14400', '2018-09-18 01:24:11', null, 'parra andrea jajajaja', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('25', '0000000025', '1152188863', '', '90000', '0', '104400', '14400', '2018-09-18 02:56:17', '43101104', '', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('26', '0000000026', '1152188863', 'prueba', '90000', '0', '104400', '14400', '2018-09-18 03:00:04', '95501690', '', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('27', '0000000027', '1152188863', '', '135000', '0', '156600', '21600', '2018-09-18 03:02:10', '36610553', '', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('28', 'ZW00000028', '1152188863', 'esta es una pruyeba', '45000', '0', '52200', '7200', '2018-09-18 03:04:17', null, 'carlos diego', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('29', '0000000028', '1152188863', 'prueba pendiente de pago', '135000', '0', '156600', '21600', '2018-09-18 03:13:07', '2147483647', '', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('30', 'Q000000003', '1152188863', 'prueb', '135000', '0', '156600', '21600', '2018-09-18 03:16:52', '95501690', '', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('31', 'Q0000000030', '1152188863', 'sdaf', '90000', '0', '104400', '14400', '2018-09-18 03:22:55', '36610553', '', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('32', 'WB0000000032', '1152188863', 'dfasdf', '135000', '0', '156600', '21600', '2018-09-18 03:24:33', '43101104', '', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('33', '0000000033', '1152188863', 'sad', '135000', '0', '156600', '21600', '2018-09-18 03:25:23', '95501690', '', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('34', '0DFS000000034', '1152188863', '', '135000', '0', '156600', '21600', '2018-09-18 03:26:24', '36610553', '', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('35', 'F000000035', '1152188863', 'dsafd', '45000', '0', '52200', '7200', '2018-09-18 03:27:35', '94501690', '', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('36', '0000000036', '1152188863', 'sdfas', '135000', '0', '156600', '21600', '2018-09-18 06:01:47', '35611553', '', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('37', '0000000037', '1152188863', 'este señor debe.', '90000', '0', '104400', '14400', '2018-09-18 11:50:58', '36610553', '', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('38', '0000000038', '1152188863', '', '90000', '0', '104400', '14400', '2018-09-18 07:08:32', '36610553', '', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('39', '0000000039', '1152188863', '', '90000', '0', '104400', '14400', '2018-09-19 03:11:47', null, 'pepe guama', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('40', '0000000040', '1152188863', '', '45000', '0', '52200', '7200', '2018-09-19 03:20:58', null, 'joseph ortiz', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('41', '0000000041', '1152188863', '', '250000', '0', '290000', '40000', '2018-09-21 06:45:45', null, 'juan perez', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('42', '0000000042', '1152188863', 'prueba', '3000', '0', '3480', '480', '2018-09-24 07:34:33', '1152188863', '', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('43', '0000000043', '1152188863', 'prueba', '90000', '0', '104400', '14400', '2018-09-25 09:06:59', '999999999999999', '', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('44', '0000000044', '1152188863', 'prueba', '105000', '0', '121800', '16800', '2018-09-25 09:07:47', '999999999999999', '', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('45', '0000000045', '1152188863', 'quedo pendiente', '45000', '1800', '50400', '7200', '2018-09-25 12:50:33', '34610553', '', '1', '1', '4', null);
INSERT INTO `ft_factura` VALUES ('46', '0000000046', '1152188863', 'SE LE VENDE NO SE QUE', '15000', '1500', '15900', '2400', '2018-09-25 01:14:45', null, 'PEPE LANDA', '1', '1', '10', null);
INSERT INTO `ft_factura` VALUES ('47', '0000000047', '1152188863', '', '90000', '0', '104400', '14400', '2018-09-25 05:53:13', '34610553', '', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('48', '0000000048', '1152188863', 'prueba', '6000', '0', '6960', '960', '2018-10-01 02:16:20', '35611553', '', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('49', 'BA0000000049', '1152188863', 'prueba nota de la factura', '5400', '0', '6264', '864', '2018-10-04 11:10:02', '34610553', '', '1', '1', '0', null);
INSERT INTO `ft_factura` VALUES ('50', 'HJA00000050', '1152188863', 'queda pendiente de pago', '96000', '0', '111360', '15360', '2018-10-04 11:14:45', '36610553', '', '1', null, '0', null);
INSERT INTO `ft_factura` VALUES ('51', '0000000051', '94501690', '', '4000', '0', '4640', '640', '2018-10-11 07:13:18', '43101104', '', '2', null, '0', null);
INSERT INTO `ft_factura` VALUES ('52', '0000000052', '1152188863', 'Sala1', '21000', '0', '24360', '3360', '2018-10-12 23:53:31', '94501690', '', '2', '1', '0', '53');
INSERT INTO `ft_factura` VALUES ('53', '0000000053', '1152188863', 'Sala1', '42000', '840', '47880', '6720', '2018-10-12 23:54:13', '43101104', '', '2', '1', '2', '52');
INSERT INTO `ft_factura` VALUES ('54', '0000000054', '1152188863', 'Sala1', '21000', '0', '24360', '3360', '2018-10-12 23:54:34', '43101104', '', '2', '1', '0', '52');
INSERT INTO `ft_factura` VALUES ('55', '0000000055', '1152188863', 'Sala1', '21000', '0', '24360', '3360', '2018-10-12 23:59:24', '43101104', '', '2', '1', '0', '52');
INSERT INTO `ft_factura` VALUES ('56', '0000000056', '1152188863', 'Sala1', '42000', '840', '47880', '6720', '2018-10-13 00:28:39', '43101104', '', '2', '1', '2', '56');
INSERT INTO `ft_factura` VALUES ('57', '0000000057', '1152188863', 'blalbalbalbab', '84000', '1680', '95760', '13440', '2018-10-13 01:55:03', '43101104', '', '1', '1', '2', '57');
INSERT INTO `ft_factura` VALUES ('58', '0000000058', '1152188863', 'Reserva hecha para la banda Pruebaaaaa en la sala1.', '210000', '4200', '239400', '33600', '2018-10-13 03:59:34', '43101104', '', '1', '1', '2', '59');
INSERT INTO `ft_factura` VALUES ('59', '0000000059', '1152188863', '', '6000', '0', '6960', '960', '2018-11-06 01:02:47', '43101104', '', '1', null, '0', null);
INSERT INTO `ft_factura` VALUES ('60', '0000000060', '1152188863', '', '6000', '0', '6960', '960', '2018-11-06 10:42:13', '356115533', '', '1', null, '0', null);
INSERT INTO `ft_factura` VALUES ('61', '0000000061', '1152188863', 'Reserva hecha para la banda  en la sala1.', '0', '0', '0', '0', '2018-11-09 13:52:34', '34610553', '', '2', '1', '20', '78');
INSERT INTO `ft_factura` VALUES ('62', '0000000062', '1152188863', 'Sala1', '0', '0', '0', '0', '2018-11-09 13:52:54', '34610553', '', '2', '1', '0', '79');

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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ft_factura_detalle
-- ----------------------------
INSERT INTO `ft_factura_detalle` VALUES ('35', '51', '2', '34', '4000', '2000');
INSERT INTO `ft_factura_detalle` VALUES ('37', '53', '1', '4', '47880', '42000');
INSERT INTO `ft_factura_detalle` VALUES ('40', '56', '1', '4', '47880', '42000');
INSERT INTO `ft_factura_detalle` VALUES ('41', '57', '1', '4', '95760', '42000');
INSERT INTO `ft_factura_detalle` VALUES ('42', '58', '1', '4', '239400', '42000');
INSERT INTO `ft_factura_detalle` VALUES ('43', '59', '2', '6', '6000', '3000');
INSERT INTO `ft_factura_detalle` VALUES ('44', '60', '2', '6', '6000', '3000');
INSERT INTO `ft_factura_detalle` VALUES ('45', '61', '1', '4', '0', '42000');

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
-- Table structure for rs_instrumentos
-- ----------------------------
DROP TABLE IF EXISTS `rs_instrumentos`;
CREATE TABLE `rs_instrumentos` (
  `ID_INSTRUMENTO` int(5) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `ID_TIPO_INSTRUMENTO` int(5) DEFAULT NULL,
  PRIMARY KEY (`ID_INSTRUMENTO`),
  KEY `FKTIPOINSTRUMENTO` (`ID_TIPO_INSTRUMENTO`),
  CONSTRAINT `FKTIPOINSTRUMENTO` FOREIGN KEY (`ID_TIPO_INSTRUMENTO`) REFERENCES `tp_instrumento` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rs_instrumentos
-- ----------------------------
INSERT INTO `rs_instrumentos` VALUES ('1', 'Acordeón', '1');
INSERT INTO `rs_instrumentos` VALUES ('2', 'Armónica', '1');
INSERT INTO `rs_instrumentos` VALUES ('3', 'Arpa', '2');
INSERT INTO `rs_instrumentos` VALUES ('4', 'Bajo', '2');
INSERT INTO `rs_instrumentos` VALUES ('5', 'Batería', '3');
INSERT INTO `rs_instrumentos` VALUES ('6', 'Campana', '3');
INSERT INTO `rs_instrumentos` VALUES ('7', 'Clarín', '1');
INSERT INTO `rs_instrumentos` VALUES ('8', 'Flauta', '1');
INSERT INTO `rs_instrumentos` VALUES ('9', 'Maracas', '3');
INSERT INTO `rs_instrumentos` VALUES ('10', 'Órgano', '1');
INSERT INTO `rs_instrumentos` VALUES ('11', 'Pandereta', '3');
INSERT INTO `rs_instrumentos` VALUES ('12', 'Piano', '3');
INSERT INTO `rs_instrumentos` VALUES ('13', 'Saxofón', '1');
INSERT INTO `rs_instrumentos` VALUES ('14', 'Tambor', '3');
INSERT INTO `rs_instrumentos` VALUES ('15', 'Teclado', '3');
INSERT INTO `rs_instrumentos` VALUES ('16', 'Triángulo', '3');
INSERT INTO `rs_instrumentos` VALUES ('17', 'Trompeta', '1');
INSERT INTO `rs_instrumentos` VALUES ('18', 'Trombón', '1');
INSERT INTO `rs_instrumentos` VALUES ('19', 'Tuba', '1');
INSERT INTO `rs_instrumentos` VALUES ('20', 'Ukelele', '3');
INSERT INTO `rs_instrumentos` VALUES ('21', 'Viola', '2');
INSERT INTO `rs_instrumentos` VALUES ('22', 'Violín', '2');
INSERT INTO `rs_instrumentos` VALUES ('23', 'Xilófono', '2');
INSERT INTO `rs_instrumentos` VALUES ('24', 'Zambomba', '2');
INSERT INTO `rs_instrumentos` VALUES ('25', 'Guitarra', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of rs_multas_reserva
-- ----------------------------
INSERT INTO `rs_multas_reserva` VALUES ('1', '53', '24360', '1');
INSERT INTO `rs_multas_reserva` VALUES ('2', '52', '24360', '1');
INSERT INTO `rs_multas_reserva` VALUES ('3', '52', '24360', '1');
INSERT INTO `rs_multas_reserva` VALUES ('4', '79', '0', '1');

-- ----------------------------
-- Table structure for rs_reserva_instrumentos
-- ----------------------------
DROP TABLE IF EXISTS `rs_reserva_instrumentos`;
CREATE TABLE `rs_reserva_instrumentos` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `ID_RESERVA` int(5) NOT NULL,
  `ID_INSTRUMENTO` int(5) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UQ_INSTRUMENTO_RESERVA` (`ID_RESERVA`,`ID_INSTRUMENTO`) USING HASH,
  KEY `FK_INSTRUMENTOS` (`ID_INSTRUMENTO`),
  CONSTRAINT `FK_INSTRUMENTOS` FOREIGN KEY (`ID_INSTRUMENTO`) REFERENCES `rs_instrumentos` (`ID_INSTRUMENTO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RESERVA_INSTRUMENTOS` FOREIGN KEY (`ID_RESERVA`) REFERENCES `rs_reserva_sala` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rs_reserva_instrumentos
-- ----------------------------
INSERT INTO `rs_reserva_instrumentos` VALUES ('1', '61', '2');
INSERT INTO `rs_reserva_instrumentos` VALUES ('4', '61', '8');
INSERT INTO `rs_reserva_instrumentos` VALUES ('2', '61', '10');
INSERT INTO `rs_reserva_instrumentos` VALUES ('3', '61', '17');
INSERT INTO `rs_reserva_instrumentos` VALUES ('5', '62', '2');
INSERT INTO `rs_reserva_instrumentos` VALUES ('8', '62', '8');
INSERT INTO `rs_reserva_instrumentos` VALUES ('6', '62', '10');
INSERT INTO `rs_reserva_instrumentos` VALUES ('7', '62', '17');
INSERT INTO `rs_reserva_instrumentos` VALUES ('9', '63', '2');
INSERT INTO `rs_reserva_instrumentos` VALUES ('12', '63', '8');
INSERT INTO `rs_reserva_instrumentos` VALUES ('10', '63', '10');
INSERT INTO `rs_reserva_instrumentos` VALUES ('11', '63', '17');
INSERT INTO `rs_reserva_instrumentos` VALUES ('13', '64', '7');
INSERT INTO `rs_reserva_instrumentos` VALUES ('14', '64', '25');
INSERT INTO `rs_reserva_instrumentos` VALUES ('15', '65', '1');
INSERT INTO `rs_reserva_instrumentos` VALUES ('16', '65', '3');
INSERT INTO `rs_reserva_instrumentos` VALUES ('20', '80', '2');
INSERT INTO `rs_reserva_instrumentos` VALUES ('21', '81', '2');
INSERT INTO `rs_reserva_instrumentos` VALUES ('22', '81', '3');
INSERT INTO `rs_reserva_instrumentos` VALUES ('23', '82', '2');
INSERT INTO `rs_reserva_instrumentos` VALUES ('24', '82', '4');
INSERT INTO `rs_reserva_instrumentos` VALUES ('25', '83', '1');
INSERT INTO `rs_reserva_instrumentos` VALUES ('26', '83', '4');
INSERT INTO `rs_reserva_instrumentos` VALUES ('27', '84', '1');
INSERT INTO `rs_reserva_instrumentos` VALUES ('28', '85', '2');
INSERT INTO `rs_reserva_instrumentos` VALUES ('29', '85', '4');
INSERT INTO `rs_reserva_instrumentos` VALUES ('30', '85', '13');
INSERT INTO `rs_reserva_instrumentos` VALUES ('31', '86', '2');
INSERT INTO `rs_reserva_instrumentos` VALUES ('32', '86', '4');
INSERT INTO `rs_reserva_instrumentos` VALUES ('33', '86', '13');
INSERT INTO `rs_reserva_instrumentos` VALUES ('34', '87', '2');
INSERT INTO `rs_reserva_instrumentos` VALUES ('35', '88', '3');
INSERT INTO `rs_reserva_instrumentos` VALUES ('36', '89', '2');
INSERT INTO `rs_reserva_instrumentos` VALUES ('37', '90', '4');

-- ----------------------------
-- Table structure for rs_reserva_sala
-- ----------------------------
DROP TABLE IF EXISTS `rs_reserva_sala`;
CREATE TABLE `rs_reserva_sala` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `documento` bigint(20) NOT NULL,
  `sala` int(4) NOT NULL,
  `start` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `DS_ESTADO` varchar(10) NOT NULL,
  `DT_FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `color` varchar(10) DEFAULT NULL,
  `id_banda` int(5) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_USUARIO` (`documento`) USING BTREE,
  KEY `FK_SALA` (`sala`) USING BTREE,
  KEY `FK_BANDA_RESEVA` (`id_banda`),
  CONSTRAINT `FK_BANDA_RESEVA` FOREIGN KEY (`id_banda`) REFERENCES `us_banda_usuario` (`CS_BANDA_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SALA` FOREIGN KEY (`sala`) REFERENCES `rs_sala` (`CS_SALA_ID`),
  CONSTRAINT `FK_USUARIO` FOREIGN KEY (`documento`) REFERENCES `us_usuario` (`NM_DOCUMENTO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of rs_reserva_sala
-- ----------------------------
INSERT INTO `rs_reserva_sala` VALUES ('2', '43101104', '1', '2018-08-09 02:15:00', '2018-11-06 17:22:00', 'con audifonos', 'Activo', '2018-08-25 11:17:25', null, null, null);
INSERT INTO `rs_reserva_sala` VALUES ('5', '43101104', '1', '2018-08-10 03:30:00', '2018-08-10 09:50:00', 'con audifono', 'Activo', '2018-08-27 12:48:59', null, null, null);
INSERT INTO `rs_reserva_sala` VALUES ('6', '94501690', '1', '2018-08-10 04:25:00', '2018-08-10 05:40:00', 'con guitarra', 'Activo', '2019-08-27 12:50:33', null, null, null);
INSERT INTO `rs_reserva_sala` VALUES ('8', '94501690', '1', '2018-08-27 03:25:00', '2018-08-27 05:20:00', 'olg', 'Activo', '2018-08-27 19:21:27', null, null, null);
INSERT INTO `rs_reserva_sala` VALUES ('9', '34610553', '1', '2018-08-28 05:25:00', '2018-08-28 08:35:00', 'con bajo', 'Activo', '2018-08-28 15:33:21', null, null, null);
INSERT INTO `rs_reserva_sala` VALUES ('10', '34610553', '1', '2018-08-28 08:55:00', '2018-08-28 09:55:00', 'con guitarra', 'Activo', '2018-08-28 15:36:24', null, null, null);
INSERT INTO `rs_reserva_sala` VALUES ('11', '43101104', '1', '2018-08-28 04:15:00', '2018-08-28 04:55:00', 'con audifonos', 'Activo', '2018-08-28 15:38:06', null, null, null);
INSERT INTO `rs_reserva_sala` VALUES ('35', '94501690', '1', '2018-08-29 03:20:00', '2018-08-29 04:30:00', 'ghjklÃ±', 'Activo', '2018-08-28 19:45:29', null, null, null);
INSERT INTO `rs_reserva_sala` VALUES ('36', '34610553', '1', '2018-08-30 03:50:00', '2018-08-30 04:15:00', 'dfgbhnjmk', 'Activo', '2018-08-28 19:48:50', null, null, null);
INSERT INTO `rs_reserva_sala` VALUES ('37', '94501690', '2', '2018-09-03 03:20:00', '2018-09-03 04:30:00', 'con  microfonos', 'Activo', '2018-09-02 11:09:15', null, null, null);
INSERT INTO `rs_reserva_sala` VALUES ('38', '35611553', '1', '2018-09-08 03:25:00', '2018-09-08 05:35:00', 'con audifonos', 'Activo', '2018-09-07 14:47:27', null, null, null);
INSERT INTO `rs_reserva_sala` VALUES ('39', '43101104', '1', '2018-09-08 03:00:00', '2018-09-08 03:20:00', 'lkjhygf', 'Activo', '2018-09-07 15:03:39', null, null, null);
INSERT INTO `rs_reserva_sala` VALUES ('40', '94501690', '1', '2018-10-11 13:00:00', '2018-10-11 18:00:00', '\n		      	34610553 - diana viveros94501690 - edinson gallego-vaaaaaaaaaaaa', 'Activo', '2018-10-08 15:36:53', '#000000', null, null);
INSERT INTO `rs_reserva_sala` VALUES ('41', '36610553', '1', '2018-10-12 13:00:00', '2018-10-12 15:00:00', '36610553-vaaa', 'Activo', '2018-10-08 15:58:05', '#004080', null, null);
INSERT INTO `rs_reserva_sala` VALUES ('42', '36610553', '1', '2018-10-10 15:10:00', '2018-10-10 18:30:00', '36610553-oscar peuba', 'Activo', '2018-10-08 16:47:16', '#000000', null, null);
INSERT INTO `rs_reserva_sala` VALUES ('43', '1152188863', '1', '2018-10-11 10:00:00', '2018-10-11 11:00:00', '10:00 - 11:001152188863 - Oscar Mesa - bueno', 'Activo', '2018-10-08 16:59:30', '#ff0000', null, null);
INSERT INTO `rs_reserva_sala` VALUES ('44', '36610553', '1', '2018-10-12 08:00:00', '2018-10-12 09:00:00', '08:00 - 09:00 - 36610553 - jhon valencia - otra prueba mas  vamos a ver ', 'Activo', '2018-10-08 17:00:47', '#ffff00', null, null);
INSERT INTO `rs_reserva_sala` VALUES ('45', '43101104', '1', '2018-10-11 09:05:00', '2018-10-11 09:30:00', '09:05 - 09:30 - 43101104 - nidia valencia - buena', 'Activo', '2018-10-08 17:03:07', '#ff0000', null, null);
INSERT INTO `rs_reserva_sala` VALUES ('46', '1152188863', '1', '2018-10-12 17:00:00', '2018-10-12 19:00:00', '17:00 - 19:00 - 1152188863 - Oscar Mesa - esaa es una prueab', 'Activo', '2018-10-08 17:04:20', '#ff0000', null, null);
INSERT INTO `rs_reserva_sala` VALUES ('47', '36610553', '2', '2018-10-11 13:10:00', '2018-10-11 14:00:00', '13:10 - 14:00 - 36610553 - jhon valencia - vanmos a ver ', 'Activo', '2018-10-08 17:21:10', null, null, null);
INSERT INTO `rs_reserva_sala` VALUES ('48', '123456789', '2', '2018-10-11 11:31:00', '2018-10-11 12:00:00', '11:31 - 12:00 - 123456789 - ana herrera -   jkkhkjnnmnkjjjjjjjjjjkb', 'Activo', '2018-10-08 20:33:48', null, null, null);
INSERT INTO `rs_reserva_sala` VALUES ('49', '94501690', '2', '2018-10-09 10:45:00', '2018-10-09 17:30:00', '10:45 - 17:30 - 94501690 - edinson gallego - this is a prueba', 'Activo', '2018-10-08 20:35:12', null, null, null);
INSERT INTO `rs_reserva_sala` VALUES ('50', '43101104', '1', '2018-10-12 10:00:00', '2018-10-12 11:00:00', '43101104 - nidia valencia - ptreaf', 'Activo', '2018-10-09 12:59:10', '#008040', null, null);
INSERT INTO `rs_reserva_sala` VALUES ('52', '43101104', '1', '2018-10-13 13:00:00', '2018-10-13 14:00:00', '43101104 - nidia valencia - prueba', 'Activo', '2018-10-12 19:12:02', '#000000', '2', null);
INSERT INTO `rs_reserva_sala` VALUES ('53', '94501690', '1', '2018-10-13 09:00:00', '2018-10-13 10:00:00', '94501690 - edinson gallego - sdsd', 'Activo', '2018-10-12 21:54:14', '#0080c0', '2', 'sdsd');
INSERT INTO `rs_reserva_sala` VALUES ('54', '94501690', '1', '2018-10-13 10:00:00', '2018-10-13 12:00:00', '94501690 - edinson gallego - esta es una prueba va vavvavavavav', 'Activo', '2018-10-13 00:15:16', '#f90606', '2', 'esta es una prueba va vavvavavavav');
INSERT INTO `rs_reserva_sala` VALUES ('55', '43101104', '1', '2018-10-13 15:00:00', '2018-10-13 17:00:00', '43101104 - nidia valencia - esta es una prueba blablabla ', 'Activo', '2018-10-13 00:19:53', '#ff0080', '2', 'esta es una prueba blablabla ');
INSERT INTO `rs_reserva_sala` VALUES ('56', '43101104', '1', '2018-10-13 17:05:00', '2018-10-13 18:55:00', '43101104 - nidia valencia - una prueba mas', 'Activo', '2018-10-13 00:28:33', '#5482fa', '2', 'una prueba mas');
INSERT INTO `rs_reserva_sala` VALUES ('57', '43101104', '1', '2018-10-15 09:00:00', '2018-10-15 11:00:00', '43101104 - nidia valencia - prueba en factura', 'Activo', '2018-10-13 01:54:54', '#000000', '2', 'prueba en factura');
INSERT INTO `rs_reserva_sala` VALUES ('58', '1152188863', '1', '2018-10-15 13:00:00', '2018-10-15 15:00:00', '1152188863 - Oscar Mesa - esta es la descripcion', 'Activo', '2018-10-13 03:55:34', '#000000', '2', 'esta es la descripcion');
INSERT INTO `rs_reserva_sala` VALUES ('59', '43101104', '1', '2018-10-16 13:00:00', '2018-10-16 18:00:00', '43101104 - nidia valencia - jummmmm vamos es a entrenar', 'Activo', '2018-10-13 03:58:33', '#382fe6', '2', 'jummmmm vamos es a entrenar');
INSERT INTO `rs_reserva_sala` VALUES ('60', '1152188863', '1', '2018-10-24 14:30:00', '2018-10-24 15:30:00', '1152188863 - Oscar Mesa - sdfasdf', 'Activo', '2018-10-24 13:03:48', '#000000', '2', 'sdfasdf');
INSERT INTO `rs_reserva_sala` VALUES ('61', '1152188863', '1', '2018-10-24 15:35:00', '2018-10-24 16:00:00', '1152188863 - Oscar Mesa - afasdfa', 'Activo', '2018-10-24 13:41:29', '#ff0000', '2', 'afasdfa');
INSERT INTO `rs_reserva_sala` VALUES ('62', '1152188863', '1', '2018-10-24 16:10:00', '2018-10-24 16:55:00', '1152188863 - Oscar Mesa - uta', 'Activo', '2018-10-24 13:44:26', '#8ddd22', '2', 'uta');
INSERT INTO `rs_reserva_sala` VALUES ('63', '1152188863', '1', '2018-10-24 16:57:00', '2018-10-24 18:00:00', '1152188863 - Oscar Mesa - jjhhhjhhjkh', 'Activo', '2018-10-24 13:47:02', '#2803fc', '2', 'jjhhhjhhjkh');
INSERT INTO `rs_reserva_sala` VALUES ('64', '1152188863', '1', '2018-10-25 17:45:00', '2018-10-25 20:00:00', '1152188863 - Oscar Mesa - bla bla ', 'Activo', '2018-10-24 14:34:27', '#0000ff', '2', 'bla bla ');
INSERT INTO `rs_reserva_sala` VALUES ('65', '1152188863', '2', '2018-10-26 10:00:00', '2018-10-26 12:00:00', '1152188863 - Oscar Mesa - ', 'Activo', '2018-10-26 04:08:34', '#000000', '2', '');
INSERT INTO `rs_reserva_sala` VALUES ('78', '34610553', '1', '2018-11-09 14:30:00', '2018-11-09 15:00:00', '34610553 - diana viveros - ', 'Activo', '2018-11-09 13:39:06', '#ff8000', null, '');
INSERT INTO `rs_reserva_sala` VALUES ('79', '34610553', '1', '2018-11-09 15:00:00', '2018-11-09 15:30:00', '34610553 - diana viveros - ', 'Activo', '2018-11-09 13:40:36', '#0222fd', null, '');
INSERT INTO `rs_reserva_sala` VALUES ('80', '1152188863', '1', '2018-11-09 15:30:00', '2018-11-09 16:00:00', '1152188863 - Oscar Mesa - bla', 'Activo', '2018-11-09 13:41:20', '#0222fd', null, 'bla');
INSERT INTO `rs_reserva_sala` VALUES ('81', '43101104', '2', '2018-11-23 12:30:00', '2018-11-23 14:30:00', '43101104 - nidia valencia - jajajajajaja', 'Activo', '2018-11-22 12:21:07', '#64739b', '3', 'jajajajajaja');
INSERT INTO `rs_reserva_sala` VALUES ('82', '43101104', '1', '2018-12-15 11:00:00', '2018-12-15 14:00:00', '43101104 - nidia valencia - tales', 'Activo', '2018-12-13 16:54:47', '#ff8000', '3', 'tales');
INSERT INTO `rs_reserva_sala` VALUES ('83', '94501690', '1', '2018-12-20 09:30:00', '2018-12-20 11:00:00', '94501690 - edinson gallego - dasdfasdf', 'Activo', '2018-12-17 18:40:10', '#ff8000', '6', 'dasdfasdf');
INSERT INTO `rs_reserva_sala` VALUES ('84', '1152188863', '1', '2018-12-20 10:00:00', '2018-12-20 12:00:00', '1152188863 - Oscar Mesa - jkjhkjjhk', 'Activo', '2018-12-17 18:44:27', '#ff8000', '2', 'jkjhkjjhk');
INSERT INTO `rs_reserva_sala` VALUES ('85', '43101104', '1', '2018-12-20 11:00:00', '2018-12-20 12:00:00', '43101104 - nidia valencia - dasdfasdf', 'Activo', '2018-12-17 20:07:40', '#ff8000', '3', 'dasdfasdf');
INSERT INTO `rs_reserva_sala` VALUES ('86', '43101104', '1', '2018-12-20 08:00:00', '2018-12-20 09:00:00', '43101104 - nidia valencia - dasdfasdf', 'Activo', '2018-12-17 20:28:56', '#ff8000', '3', 'dasdfasdf');
INSERT INTO `rs_reserva_sala` VALUES ('87', '94501690', '1', '2018-12-20 12:00:00', '2018-12-20 14:00:00', '94501690 - edinson gallego -  kj', 'Activo', '2018-12-17 20:31:19', '#ff8000', '5', ' kj');
INSERT INTO `rs_reserva_sala` VALUES ('88', '43101104', '1', '2018-12-21 09:00:00', '2018-12-21 12:30:00', '43101104 - nidia valencia -  jj', 'Activo', '2018-12-17 20:32:06', '#ff8000', '3', ' jj');
INSERT INTO `rs_reserva_sala` VALUES ('89', '34610553', '1', '2018-12-21 10:30:00', '2018-12-21 12:00:00', '34610553 - diana viveros - jjh', 'Activo', '2018-12-17 20:32:39', '#ff8000', '3', 'jjh');
INSERT INTO `rs_reserva_sala` VALUES ('90', '43101104', '1', '2018-12-21 12:00:00', '2018-12-21 14:00:00', '43101104 - nidia valencia - sdfasdf', 'Activo', '2018-12-17 20:41:11', '#ff8000', '3', 'sdfasdf');
INSERT INTO `rs_reserva_sala` VALUES ('91', '94501690', '1', '2018-12-19 09:00:00', '2018-12-19 12:00:00', '94501690 - edinson gallego - jhhj', 'Activo', '2018-12-19 08:55:52', '#ff8000', '5', 'jhhj');

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
  `NM_ELIMINADO` int(1) DEFAULT '0' COMMENT '0=no/1=si',
  PRIMARY KEY (`CS_SALA_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of rs_sala
-- ----------------------------
INSERT INTO `rs_sala` VALUES ('1', 'Sala 1', 'sala con guitarra', '42000', '8', '0');
INSERT INTO `rs_sala` VALUES ('2', 'Sala 2', 'Sala 2', '45000', '12000', '0');
INSERT INTO `rs_sala` VALUES ('3', 'pepe lalo', 'éééeéééeóoóóoóññññ', '300', '20', '0');
INSERT INTO `rs_sala` VALUES ('4', 'ñññññéééeé´´i', 'dasfsdfñññéééé\r\n', '32', '32', '1');

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
-- Table structure for tp_instrumento
-- ----------------------------
DROP TABLE IF EXISTS `tp_instrumento`;
CREATE TABLE `tp_instrumento` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_instrumento
-- ----------------------------
INSERT INTO `tp_instrumento` VALUES ('1', 'Viento');
INSERT INTO `tp_instrumento` VALUES ('2', 'Cuerda');
INSERT INTO `tp_instrumento` VALUES ('3', 'Percusión');

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tp_inventario_producto
-- ----------------------------
INSERT INTO `tp_inventario_producto` VALUES ('16', '6', '10', '1', '2018-10-11 18:45:19', '1500');
INSERT INTO `tp_inventario_producto` VALUES ('17', '34', '8', '1', '2018-10-11 19:10:45', '850');
INSERT INTO `tp_inventario_producto` VALUES ('18', '6', '26', '2', '2018-10-11 19:25:07', '1513');
INSERT INTO `tp_inventario_producto` VALUES ('19', '7', '30', '2', '2018-10-11 19:25:22', '1796');
INSERT INTO `tp_inventario_producto` VALUES ('20', '8', '23', '3', '2018-10-11 19:25:46', '1197');
INSERT INTO `tp_inventario_producto` VALUES ('21', '9', '30', '2', '2018-10-11 19:26:04', '1513');
INSERT INTO `tp_inventario_producto` VALUES ('22', '10', '25', '2', '2018-10-11 19:26:22', '1513');
INSERT INTO `tp_inventario_producto` VALUES ('23', '11', '30', '1', '2018-10-11 19:26:38', '600');
INSERT INTO `tp_inventario_producto` VALUES ('24', '12', '25', '2', '2018-10-11 19:26:59', '1100');
INSERT INTO `tp_inventario_producto` VALUES ('25', '7', '23', '2', '2018-11-05 23:29:54', '18900');
INSERT INTO `tp_inventario_producto` VALUES ('26', '8', '3', '2', '2018-11-05 23:44:12', '1400');
INSERT INTO `tp_inventario_producto` VALUES ('27', '14', '8', '2', '2018-11-07 04:02:50', '884');
INSERT INTO `tp_inventario_producto` VALUES ('28', '7', '9', '1', '2018-11-07 04:03:12', '1796');
INSERT INTO `tp_inventario_producto` VALUES ('29', '8', '9', '2', '2018-12-13 02:09:58', '1197');

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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tp_producto
-- ----------------------------
INSERT INTO `tp_producto` VALUES ('1', 'WQP', 'Galletas saltin', 'esta es casi una prueba  a ver si lo guarda', '0', '1', '2018-09-13 18:20:16', '1', '900', '200', '1');
INSERT INTO `tp_producto` VALUES ('4', 'SALA', 'Sala reserva', 'Sala que reserva el usuario', '0', '3', '2018-09-21 19:30:12', '1', '4000', '4000', '0');
INSERT INTO `tp_producto` VALUES ('5', 'MULTA', 'MULTA', 'MULTA', '0', '3', '2018-09-21 19:30:12', '1', '0', '0', '0');
INSERT INTO `tp_producto` VALUES ('6', 'C001', 'AGUILA', 'BOTELLA RETORNABLE', '0', '5', '2018-10-08 12:51:44', '1', '3000', '1513', '0');
INSERT INTO `tp_producto` VALUES ('7', 'C002', 'CLUB COLOMBIA', 'BOTELLA RETORNABLE', '0', '5', '2018-10-08 12:51:44', '1', '3500', '1796', '0');
INSERT INTO `tp_producto` VALUES ('8', 'C003', 'COSTEÑITA', 'BOTELLA RETORNABLE', '0', '5', '2018-10-08 12:51:45', '1', '2500', '1197', '0');
INSERT INTO `tp_producto` VALUES ('9', 'C004', 'PILSEN', 'BOTELLA RETORNABLE', '0', '5', '2018-10-08 12:51:46', '1', '3000', '1513', '0');
INSERT INTO `tp_producto` VALUES ('10', 'C005', 'POKER', 'BOTELLA RETORNABLE', '0', '5', '2018-10-08 12:51:46', '1', '3000', '1513', '0');
INSERT INTO `tp_producto` VALUES ('11', 'B001', 'AGUA RENACER', 'PET 600ML', '0', '5', '2018-10-08 12:51:46', '1', '2000', '600', '0');
INSERT INTO `tp_producto` VALUES ('12', 'B002', 'COCACOLA 250', 'PET 250ML', '0', '5', '2018-10-08 12:51:46', '1', '2000', '1100', '0');
INSERT INTO `tp_producto` VALUES ('13', 'B003', 'GREEN', 'VIDRIO 370ML', '0', '5', '2018-10-08 12:51:46', '1', '4000', '2700', '0');
INSERT INTO `tp_producto` VALUES ('14', 'B004', 'JUGO HIT', 'TETRA PACK 200ML', '0', '5', '2018-10-08 12:51:46', '1', '2000', '884', '0');
INSERT INTO `tp_producto` VALUES ('15', 'B006', 'MR TEA', 'VIDRIO 300ML', '0', '5', '2018-10-08 12:51:46', '1', '2000', '1083', '0');
INSERT INTO `tp_producto` VALUES ('16', 'B007', 'PONY MALTA', 'BOTELLA RETORNABLE', '0', '5', '2018-10-08 12:51:46', '1', '2000', '1105', '0');
INSERT INTO `tp_producto` VALUES ('17', 'M001', 'CHEESETRIS', '', '0', '4', '2018-10-08 12:51:46', '1', '2000', '925', '0');
INSERT INTO `tp_producto` VALUES ('18', 'M002', 'CHEETOS', '', '0', '4', '2018-10-08 12:51:46', '1', '1500', '446', '0');
INSERT INTO `tp_producto` VALUES ('19', 'M003', 'CHOCLITOS', '', '0', '4', '2018-10-08 12:51:47', '1', '1500', '576', '0');
INSERT INTO `tp_producto` VALUES ('20', 'M004', 'CHOCOLATINA JET', '', '0', '4', '2018-10-08 12:51:47', '1', '600', '345', '0');
INSERT INTO `tp_producto` VALUES ('21', 'M005', 'CHOCORRAMO', 'GRANDE', '0', '4', '2018-10-08 12:51:47', '1', '2000', '1410', '0');
INSERT INTO `tp_producto` VALUES ('22', 'M006', 'CHOKIS', '', '0', '4', '2018-10-08 12:51:47', '1', '1500', '756', '0');
INSERT INTO `tp_producto` VALUES ('23', 'M007', 'DETODITO', '', '0', '4', '2018-10-08 12:51:47', '1', '2500', '1500', '0');
INSERT INTO `tp_producto` VALUES ('24', 'M008', 'DORITOS', '', '0', '4', '2018-10-08 12:51:47', '1', '2000', '990', '0');
INSERT INTO `tp_producto` VALUES ('25', 'M009', 'GALLETAS FESTIVAL', '', '0', '4', '2018-10-08 12:51:47', '1', '1500', '740', '0');
INSERT INTO `tp_producto` VALUES ('26', 'M010', 'MANIMOTO', '', '0', '4', '2018-10-08 12:51:47', '1', '1500', '820', '0');
INSERT INTO `tp_producto` VALUES ('27', 'M011', 'PAPITAS LA REINA', '', '0', '4', '2018-10-08 12:51:47', '1', '2000', '839', '0');
INSERT INTO `tp_producto` VALUES ('28', 'M012', 'PLATANITOS', '', '0', '4', '2018-10-08 12:51:48', '1', '2000', '913', '0');
INSERT INTO `tp_producto` VALUES ('29', 'M013', 'ROSQUITAS', '', '0', '4', '2018-10-08 12:51:48', '1', '2000', '806', '0');
INSERT INTO `tp_producto` VALUES ('30', 'M014', 'TOSTACOS', '', '0', '4', '2018-10-08 12:51:48', '1', '1500', '583', '0');
INSERT INTO `tp_producto` VALUES ('31', 'M015', 'MAIZITOS', '', '0', '4', '2018-10-08 12:51:48', '1', '1500', '583', '0');
INSERT INTO `tp_producto` VALUES ('32', 'M016', 'MANI LA ESPECIAL', '', '0', '4', '2018-10-08 12:51:48', '1', '3000', '1550', '0');
INSERT INTO `tp_producto` VALUES ('33', 'M017', 'GALLETAS TOSH', '', '0', '4', '2018-10-08 12:51:48', '1', '1500', '850', '0');
INSERT INTO `tp_producto` VALUES ('34', 'M018', 'asfkadsfdas', 'Galleta de 22 gramos', '0', '4', '2018-10-08 12:51:48', '1', '2000', '850', '0');
INSERT INTO `tp_producto` VALUES ('35', 'M019', 'WAFER JET', '', '0', '4', '2018-10-11 19:18:10', '1', '98.8', '3.344432', '0');
INSERT INTO `tp_producto` VALUES ('36', '233', 'prueba producto', 'esta es una prueba!!!!', '0', '1', '2018-11-07 03:25:01', '1', '3000', '2400', '1');
INSERT INTO `tp_producto` VALUES ('37', 'iiuui', ' bnbmnb', '987', '0', '2', '2018-11-08 11:32:00', '1', '9', '2.3', '0');
INSERT INTO `tp_producto` VALUES ('38', 'M0198', 'tales', 'que vuelta', '0', '4', '2018-12-13 12:10:24', '1', '200', '3999', '0');
INSERT INTO `tp_producto` VALUES ('39', 'M01', 'éééééááááa´´ií´´iiíííí´ññññ', 'que vuelta ome .......adsfa sdfads ', '0', '2', '2018-12-13 12:11:33', '1', '3990', '4000', '0');

-- ----------------------------
-- Table structure for tp_unidad_medida_producto
-- ----------------------------
DROP TABLE IF EXISTS `tp_unidad_medida_producto`;
CREATE TABLE `tp_unidad_medida_producto` (
  `CS_UNIDAD_ID` int(6) NOT NULL AUTO_INCREMENT,
  `DS_NOMBRE_UNIDAD` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `DS_DESCRIPCION_UNIDAD` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`CS_UNIDAD_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tp_unidad_medida_producto
-- ----------------------------
INSERT INTO `tp_unidad_medida_producto` VALUES ('1', 'LTR', 'Litro');
INSERT INTO `tp_unidad_medida_producto` VALUES ('2', 'Caja', 'Cajetilla');
INSERT INTO `tp_unidad_medida_producto` VALUES ('3', 'Unidad', 'Und');
INSERT INTO `tp_unidad_medida_producto` VALUES ('4', 'Gr', 'Gramos');
INSERT INTO `tp_unidad_medida_producto` VALUES ('5', 'ML', 'MiliLitros');

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
INSERT INTO `us_banda_detalle_usuario` VALUES ('1', '43101104', '1');
INSERT INTO `us_banda_detalle_usuario` VALUES ('1', '95501690', '0');
INSERT INTO `us_banda_detalle_usuario` VALUES ('1', '36610553', '0');
INSERT INTO `us_banda_detalle_usuario` VALUES ('1', '982345456', '0');
INSERT INTO `us_banda_detalle_usuario` VALUES ('1', '564353453454', '0');
INSERT INTO `us_banda_detalle_usuario` VALUES ('1', '345345435345345', '0');
INSERT INTO `us_banda_detalle_usuario` VALUES ('1', '123123213123123', '0');
INSERT INTO `us_banda_detalle_usuario` VALUES ('1', '94501690333', '0');
INSERT INTO `us_banda_detalle_usuario` VALUES ('1', '452345243523452', '0');
INSERT INTO `us_banda_detalle_usuario` VALUES ('2', '1152188863', '1');
INSERT INTO `us_banda_detalle_usuario` VALUES ('2', '34610553', '0');
INSERT INTO `us_banda_detalle_usuario` VALUES ('4', '43101104', '1');
INSERT INTO `us_banda_detalle_usuario` VALUES ('4', '94501690', '0');
INSERT INTO `us_banda_detalle_usuario` VALUES ('4', '94501690333', '0');
INSERT INTO `us_banda_detalle_usuario` VALUES ('2', '897887879', '0');
INSERT INTO `us_banda_detalle_usuario` VALUES ('5', '12453', '1');
INSERT INTO `us_banda_detalle_usuario` VALUES ('5', '94501690', '0');
INSERT INTO `us_banda_detalle_usuario` VALUES ('5', '34610553', '0');
INSERT INTO `us_banda_detalle_usuario` VALUES ('3', '43101104', '1');
INSERT INTO `us_banda_detalle_usuario` VALUES ('3', '34610553', '0');
INSERT INTO `us_banda_detalle_usuario` VALUES ('3', '356115533', '0');
INSERT INTO `us_banda_detalle_usuario` VALUES ('3', '94501690', '0');
INSERT INTO `us_banda_detalle_usuario` VALUES ('6', '43101104', '1');
INSERT INTO `us_banda_detalle_usuario` VALUES ('6', '94501690', '0');
INSERT INTO `us_banda_detalle_usuario` VALUES ('6', '12312', '0');
INSERT INTO `us_banda_detalle_usuario` VALUES ('6', '1152204758', '0');

-- ----------------------------
-- Table structure for us_banda_usuario
-- ----------------------------
DROP TABLE IF EXISTS `us_banda_usuario`;
CREATE TABLE `us_banda_usuario` (
  `CS_BANDA_ID` int(5) NOT NULL AUTO_INCREMENT,
  `DS_NOMBRE_BANDA` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `DS_DESCRIPCION_BANDA` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `ESTADO` enum('inactivo','activo') DEFAULT 'activo',
  PRIMARY KEY (`CS_BANDA_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of us_banda_usuario
-- ----------------------------
INSERT INTO `us_banda_usuario` VALUES ('1', 'Prueba C', 'Prueba c', 'inactivo');
INSERT INTO `us_banda_usuario` VALUES ('2', 'Pruebaaaaa', 'uuuuuuuuuuuu', 'activo');
INSERT INTO `us_banda_usuario` VALUES ('3', 'PRW', 'no se', 'activo');
INSERT INTO `us_banda_usuario` VALUES ('4', 'jkjk', 'kjkj', 'inactivo');
INSERT INTO `us_banda_usuario` VALUES ('5', 'asdfasdf', 'sdfasdf', 'activo');
INSERT INTO `us_banda_usuario` VALUES ('6', 'pepe grill', 'no se', 'activo');

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
-- Table structure for us_incentivo_tipo_usuario
-- ----------------------------
DROP TABLE IF EXISTS `us_incentivo_tipo_usuario`;
CREATE TABLE `us_incentivo_tipo_usuario` (
  `CS_INCENTIVO_ID` int(4) NOT NULL AUTO_INCREMENT,
  `DS_NOMBRE_INCENTIVO` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `DS_DESCRIPCION_INCENTIVO` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NM_VALOR_PORCENTAJE_INCENTIVO` double NOT NULL,
  PRIMARY KEY (`CS_INCENTIVO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of us_incentivo_tipo_usuario
-- ----------------------------
INSERT INTO `us_incentivo_tipo_usuario` VALUES ('1', 'Admin', 'Administrador', '100');
INSERT INTO `us_incentivo_tipo_usuario` VALUES ('2', 'Banda', 'Banda', '50');
INSERT INTO `us_incentivo_tipo_usuario` VALUES ('3', 'Normal', 'Normal', '30');
INSERT INTO `us_incentivo_tipo_usuario` VALUES ('4', 'Docente', 'Se aplica descuento del 20 %', '20');

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
INSERT INTO `us_tipo_usuario` VALUES ('3', 'Usuario Normal', 'Usario Normal', '20');
INSERT INTO `us_tipo_usuario` VALUES ('4', 'Docente', 'que dicta clases', '20');
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
  `ENVIO_CORREO_ACTIVACION` int(1) DEFAULT '0',
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
INSERT INTO `us_usuario` VALUES ('12312', '1', 'Cárlos ñañañañañ', 'áááwéééééíí', '2280744', '2342343444', 'pepeeeee@gmail.con', 'cra 95 # 48D 58', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '4', '2', '2018-12-13 01:52:29', '0', '0', '1');
INSERT INTO `us_usuario` VALUES ('12453', '2', 'pepito', 'perez', '3234423', '3243532423', 'juan@del.com', 'calle 2334', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '3', '2', '2018-11-06 12:55:22', '0', '0', '1');
INSERT INTO `us_usuario` VALUES ('34610553', '1', 'diana', 'viveros', '3214697', '3214636790', 'edinson_gallego23152@prueba.edu.cx', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '4', '1', '2018-08-28 15:31:00', '0', '0', '1');
INSERT INTO `us_usuario` VALUES ('35611553', '1', 'jairo', 'ortiz', '1200000', '8452530125', 'jairo@gmail.com', null, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '3', '2', '2018-09-06 12:00:14', '0', '1', '0');
INSERT INTO `us_usuario` VALUES ('36610553', '1', 'jhon', 'valencia', '7896325', '8965635632', 'jhon@gmail.com', null, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '3', '1', '2018-09-06 13:43:35', '0', '1', '0');
INSERT INTO `us_usuario` VALUES ('43101104', '1', 'nidia', 'valencia', '3127899', '3127852212', 'nidia123@elpoli.edu.co', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '3', '1', '2018-08-25 11:15:21', '0', '0', '1');
INSERT INTO `us_usuario` VALUES ('94501690', '1', 'edinson', 'gallego', '3216366', '3216367908', 'edigahe77@gmail.com', null, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '3', '1', '2018-08-25 11:10:33', '0', '0', '0');
INSERT INTO `us_usuario` VALUES ('95501690', '1', 'juan', 'acevedo', '7896366', '1521521255', 'juan@gmail.com', null, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '3', '2', '2018-09-06 15:03:01', '0', '1', '0');
INSERT INTO `us_usuario` VALUES ('123456789', '2', 'ana', 'herrera', '4545632', '2563254896', 'ana@gmail.com', null, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '3', '1', '2018-09-06 03:50:32', '0', '1', '0');
INSERT INTO `us_usuario` VALUES ('323432423', '2', 'pepe', 'juarea', '3242343', '3243242342', 'oscarmesa.elpsssoli@gmail.com', 'calle 123', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '3', '2', '2018-11-06 12:58:41', '0', '0', '1');
INSERT INTO `us_usuario` VALUES ('324343333', '1', 'pepe', 'dfsadf', '2342343', '3232432234', 'ososcar@fasdf.com', null, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '3', '2', '2018-09-06 13:41:14', '0', '1', '0');
INSERT INTO `us_usuario` VALUES ('356115453', '1', 'carlos bab ', 'pepito perez', '3242342', '3243243243', 'jairwwwo@gmail.com', 'calle 13', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '3', '2', '2018-10-16 14:04:30', '0', '0', '1');
INSERT INTO `us_usuario` VALUES ('356115533', '1', 'calos ', 'pedrada', '3242343', '3242342342', 'jairo3333@gmail.com', 'calle 1234', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '1', '1', '2018-10-17 02:37:57', '0', '0', '1');
INSERT INTO `us_usuario` VALUES ('789623778', '1', 'pedro', 'perez', '12369', '789632', 'pedro@gmail.com', null, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '3', '2', '2018-09-06 18:15:44', '0', '1', '0');
INSERT INTO `us_usuario` VALUES ('897887879', '2', 'ááááeééééiíííííímanow..', 'talesáádsdf', '3242342', '3423412341', '4123@gmail.com', 'cra 95 # 48D 58', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '4', '2', '2018-12-13 01:59:05', '0', '0', '0');
INSERT INTO `us_usuario` VALUES ('982345456', '1', 'edinson', 'herrera', '7896152', '5634565625', 'edi@gmail.com', null, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '4', '2', '2018-09-06 18:11:48', '0', '1', '0');
INSERT INTO `us_usuario` VALUES ('987412212', '1', 'fghjk', 'cvvbnm', '5623048', '9865320765', 'ediha@gmail.com', null, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '4', '2', '2018-09-06 19:33:20', '0', '1', '0');
INSERT INTO `us_usuario` VALUES ('1152188863', '1', 'Oscar', 'Mesa', '5804661', '3012280744', 'oscarmesa.elpoli@gmail.com', null, '0ce23e5802655d180e1f9ef7e1461da2bfc5347d', '1', '1', '2018-09-10 19:01:51', '1', '0', '0');
INSERT INTO `us_usuario` VALUES ('1152204758', '1', 'santiago', 'betancur', '6666666', '6666666666', 'poliaulink@gmail.com', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '3', '1', '2018-08-25 13:59:36', '0', '0', '1');
INSERT INTO `us_usuario` VALUES ('2147483647', '1', 'Diego', 'Mejia', '5555555', '5555555555', '555@gmail.com', null, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '3', '2', '2018-09-06 16:14:52', '0', '1', '0');
INSERT INTO `us_usuario` VALUES ('5435843958', '3', 'asdfasdf', 'sadfsdfasdf', '2313333', '3432423333', 'oscar@gmailc.om', null, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '4', '2', '2018-09-07 16:10:45', '0', '1', '0');
INSERT INTO `us_usuario` VALUES ('23123213123', '1', 'calitos', 'pepo', '2131232', '1232131233', 'carlos234@gmail.com', 'calle 123', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '3', '2', '2018-09-25 15:52:06', '0', '1', '0');
INSERT INTO `us_usuario` VALUES ('94501690333', '1', 'dfasdf', 'asdfasdf', '3242343', '3423423432', 'edinson_galleeeeego23152@elpoli.edu.co', 'cadfasdfa', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '3', '2', '2018-10-16 12:59:06', '0', '0', '0');
INSERT INTO `us_usuario` VALUES ('564353453454', '4', 'pepito', 'perez', '2342342', '3242343243', 'pepoooo@gmail.com', 'callle 324324', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '3', '2', '2018-10-11 15:03:20', '0', '1', '0');
INSERT INTO `us_usuario` VALUES ('111111111111111', '1', 'ana', 'mesa', '2314324', '2342342342', 'anamesa@gmail.com', 'calle 23123', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '3', '2', '2018-09-25 15:54:48', '0', '1', '0');
INSERT INTO `us_usuario` VALUES ('123123213123123', '1', 'carlos perez', 'calitos pppp', '2343243', '3423423423', 'edinson_wwwgallego23152@elpoli.edu.co', 'calle 12', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '3', '2', '2018-10-16 12:55:50', '0', '1', '1');
INSERT INTO `us_usuario` VALUES ('234324234234234', '1', 'pepito', 'asdfasdf', '3242342', '2342342343', 'casd@ksdfasdf.com', 'afsdfasdf', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '3', '2', '2018-10-11 15:05:04', '0', '1', '0');
INSERT INTO `us_usuario` VALUES ('324123412341234', '1', 'carlos', 'mesa', '3242342', '3242234234', 'pepito@gmaill.com', 'calere', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '3', '2', '2018-10-11 14:59:11', '0', '1', '0');
INSERT INTO `us_usuario` VALUES ('324234234324234', '1', 'carlos', 'landa', '2343243', '2342343243', 'jaime12321@gmail.com', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '4', '2', '2018-09-24 20:16:13', '0', '1', '0');
INSERT INTO `us_usuario` VALUES ('324333233233333', '2', 'ds', 'werasdfadsf', '3334444', '2333333333', 'pepeepepe@gmail.com', 'calle 234', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '4', '2', '2018-11-05 23:19:03', '0', '1', '1');
INSERT INTO `us_usuario` VALUES ('345345435345345', '1', 'sdafasfdasdasdf', 'sadfsdfasdfasdfasdf', '2342342', '3423432423', '234324@fmaol.com', 'cale', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '3', '2', '2018-10-11 15:08:17', '0', '1', '0');
INSERT INTO `us_usuario` VALUES ('432423432423423', '3', 'ewsadf', 'asdf', '2321312', '1231232342', 'pepe@gmail.com', 'calle 123', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '3', '2', '2018-10-11 14:55:17', '0', '1', '0');
INSERT INTO `us_usuario` VALUES ('452345243523452', '1', 'pepe perez', 'aja', '3232231', '2343243432', 'vuelta22222222@gmail.com', 'calle 2234', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '3', '1', '2018-10-17 01:56:17', '0', '1', '1');
INSERT INTO `us_usuario` VALUES ('454385345849838', '2', 'asdfh', 'dfjsf', '3423333', '3333333333', 'oscar_mesa24092@elpoli.edu.co', 'calle falsa 1234', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '3', '1', '2018-09-07 16:09:12', '1', '0', '1');
INSERT INTO `us_usuario` VALUES ('877777777777777', '1', 'sdfasdf', 'adfgdgsdfg', '5555555', '5555555555', 'asdfasdf@gmail.com', null, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '3', '2', '2018-09-07 16:44:43', '0', '1', '0');
INSERT INTO `us_usuario` VALUES ('996954695469456', '2', 'dfgksdfgksdkfgsdfkgs', 'dskjfskf', '3432423', '4234234234', '4535345@gmail.com', null, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '3', '2', '2018-09-07 16:13:32', '0', '1', '0');
INSERT INTO `us_usuario` VALUES ('999999999999999', '1', 'Diego', 'Mejia', '5555555', '5555555555', '555@gmail.com', 'calle 1234', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '3', '2', '2018-09-07 16:35:21', '0', '1', '0');
