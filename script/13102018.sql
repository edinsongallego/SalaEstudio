/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : salaestudiodb

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-10-13 12:39:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for currencies
-- ----------------------------
DROP TABLE IF EXISTS `currencies`;
CREATE TABLE `currencies` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL ,
`symbol`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`precision`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL ,
`thousand_separator`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL ,
`decimal_separator`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL ,
`code`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=17

;

-- ----------------------------
-- Records of currencies
-- ----------------------------
BEGIN;
INSERT INTO `currencies` VALUES ('1', 'US Dollar', '$', '2', ',', '.', 'USD'), ('2', 'Libra Esterlina', '&pound;', '2', ',', '.', 'GBP'), ('3', 'Euro', 'â‚¬', '2', '.', ',', 'EUR'), ('4', 'South African Rand', 'R', '2', '.', ',', 'ZAR'), ('5', 'Danish Krone', 'kr ', '2', '.', ',', 'DKK'), ('6', 'Israeli Shekel', 'NIS ', '2', ',', '.', 'ILS'), ('7', 'Swedish Krona', 'kr ', '2', '.', ',', 'SEK'), ('8', 'Kenyan Shilling', 'KSh ', '2', ',', '.', 'KES'), ('9', 'Canadian Dollar', 'C$', '2', ',', '.', 'CAD'), ('10', 'Philippine Peso', 'P ', '2', ',', '.', 'PHP'), ('11', 'Indian Rupee', 'Rs. ', '2', ',', '.', 'INR'), ('12', 'Australian Dollar', '$', '2', ',', '.', 'AUD'), ('13', 'Singapore Dollar', 'SGD ', '2', ',', '.', 'SGD'), ('14', 'Norske Kroner', 'kr ', '2', '.', ',', 'NOK'), ('15', 'New Zealand Dollar', '$', '2', ',', '.', 'NZD'), ('16', 'Vietnamese Dong', 'VND ', '0', '.', ',', 'VND');
COMMIT;

-- ----------------------------
-- Table structure for events
-- ----------------------------
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`title`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`color`  varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`start`  datetime NOT NULL ,
`end`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=19

;

-- ----------------------------
-- Records of events
-- ----------------------------
BEGIN;
INSERT INTO `events` VALUES ('18', 'Reserva Banda ppi', '#008000', '2017-12-10 00:00:00', '2017-12-11 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for ft_estado
-- ----------------------------
DROP TABLE IF EXISTS `ft_estado`;
CREATE TABLE `ft_estado` (
`ID_ESTADO`  int(5) NOT NULL AUTO_INCREMENT ,
`DES_ESTADO`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`ID_ESTADO`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=3

;

-- ----------------------------
-- Records of ft_estado
-- ----------------------------
BEGIN;
INSERT INTO `ft_estado` VALUES ('1', 'Pagado'), ('2', 'Pendiente de pago');
COMMIT;

-- ----------------------------
-- Table structure for ft_factura
-- ----------------------------
DROP TABLE IF EXISTS `ft_factura`;
CREATE TABLE `ft_factura` (
`CS_FACTURA_ID`  int(6) NOT NULL AUTO_INCREMENT ,
`DS_CODIGO_FACTURA`  varchar(40) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL ,
`NM_VENDEDOR_ID`  bigint(20) NOT NULL ,
`DS_NOTAS_FACTURA`  varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL ,
`NM_PRECIO_SUBTOTAL`  double NOT NULL ,
`NM_PRECIO_DESCUENTO`  double NULL DEFAULT 0 ,
`NM_PRECIO_TOTAL`  double NOT NULL ,
`NM_PRECIO_IVA`  double NULL DEFAULT NULL ,
`DT_FECHA_CREACION`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`NM_CLIENTE_ID`  bigint(20) NULL DEFAULT NULL ,
`DS_CLIENTE`  varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL ,
`ID_ESTADO`  int(5) NOT NULL DEFAULT 1 ,
`ID_FORMA_PAGO`  int(5) NULL DEFAULT NULL ,
`NM_PORCENTAJE_DESCUENTO`  int(3) NULL DEFAULT 0 ,
`ID_RESERVA`  int(6) NULL DEFAULT NULL ,
PRIMARY KEY (`CS_FACTURA_ID`),
FOREIGN KEY (`NM_CLIENTE_ID`) REFERENCES `us_usuario` (`NM_DOCUMENTO_ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (`ID_ESTADO`) REFERENCES `ft_estado` (`ID_ESTADO`) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (`ID_FORMA_PAGO`) REFERENCES `ft_forma_pago` (`ID_FORMA_PAGO`) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (`NM_VENDEDOR_ID`) REFERENCES `us_usuario` (`NM_DOCUMENTO_ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (`ID_RESERVA`) REFERENCES `rs_reserva_sala` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `FK_CLIENTE_FACTURA` (`NM_CLIENTE_ID`) USING BTREE ,
INDEX `FK_VENDDOR_FACTURA` (`NM_VENDEDOR_ID`) USING BTREE ,
INDEX `FK_ESTADO_FAC` (`ID_ESTADO`) USING BTREE ,
INDEX `FK_MEDIO_PAGO` (`ID_FORMA_PAGO`) USING BTREE ,
INDEX `ID_RESERVA` (`ID_RESERVA`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_spanish_ci
AUTO_INCREMENT=59

;

-- ----------------------------
-- Records of ft_factura
-- ----------------------------
BEGIN;
INSERT INTO `ft_factura` VALUES ('1', '0000000001', '1152188863', 'asdfasdf', '135000', '0', '156600', '21600', '2018-09-16 06:28:31', '36610553', '', '1', '1', '0', null), ('2', '0000000001', '1152188863', 'asdfasdf', '135000', '0', '156600', '21600', '2018-09-16 06:57:15', '36610553', '', '1', '1', '0', null), ('3', '0000000001', '1152188863', 'asdfasdf', '135000', '0', '156600', '21600', '2018-09-16 06:58:17', '36610553', '', '1', '1', '0', null), ('4', '0000000004', '1152188863', 'prueba jajajaj', '135000', '0', '156600', '21600', '2018-09-16 06:59:20', '35611553', '', '1', '1', '0', null), ('5', '0000000004', '1152188863', 'prueba jajajaj', '135000', '0', '156600', '21600', '2018-09-16 06:59:58', '35611553', '', '1', '1', '0', null), ('6', '0000000006', '1152188863', '', '90000', '0', '104400', '14400', '2018-09-16 10:10:24', '43101104', '', '1', '1', '0', null), ('7', '0000000007', '1152188863', 'sdafasdf', '90000', '0', '104400', '14400', '2018-09-16 10:11:14', '35611553', '', '1', '1', '0', null), ('8', '0000000008', '1152188863', 'sdfsadf', '135000', '0', '156600', '21600', '2018-09-16 10:25:43', '95501690', '', '1', '1', '0', null), ('20', '0000000009', '1152188863', '', '135000', '0', '156600', '21600', '2018-09-16 10:43:32', null, 'cami lo pere', '1', '1', '0', null), ('21', '0000000009', '1152188863', '', '135000', '0', '156600', '21600', '2018-09-16 10:46:24', null, 'cami lo pere', '1', '1', '0', null), ('22', '0000000022', '1152188863', 'Ã±jkh', '360000', '0', '417600', '57600', '2018-09-17 03:01:36', '36610553', '', '1', '1', '0', null), ('23', '0000000023', '1152188863', 'esta es una prueba mas real', '135000', '0', '156600', '21600', '2018-09-17 04:29:12', '36610553', '', '1', '1', '0', null), ('24', '0000000024', '1152188863', '', '90000', '0', '104400', '14400', '2018-09-18 01:24:11', null, 'parra andrea jajajaja', '1', '1', '0', null), ('25', '0000000025', '1152188863', '', '90000', '0', '104400', '14400', '2018-09-18 02:56:17', '43101104', '', '1', '1', '0', null), ('26', '0000000026', '1152188863', 'prueba', '90000', '0', '104400', '14400', '2018-09-18 03:00:04', '95501690', '', '1', '1', '0', null), ('27', '0000000027', '1152188863', '', '135000', '0', '156600', '21600', '2018-09-18 03:02:10', '36610553', '', '1', '1', '0', null), ('28', 'ZW00000028', '1152188863', 'esta es una pruyeba', '45000', '0', '52200', '7200', '2018-09-18 03:04:17', null, 'carlos diego', '1', '1', '0', null), ('29', '0000000028', '1152188863', 'prueba pendiente de pago', '135000', '0', '156600', '21600', '2018-09-18 03:13:07', '2147483647', '', '1', '1', '0', null), ('30', 'Q000000003', '1152188863', 'prueb', '135000', '0', '156600', '21600', '2018-09-18 03:16:52', '95501690', '', '1', '1', '0', null), ('31', 'Q0000000030', '1152188863', 'sdaf', '90000', '0', '104400', '14400', '2018-09-18 03:22:55', '36610553', '', '1', '1', '0', null), ('32', 'WB0000000032', '1152188863', 'dfasdf', '135000', '0', '156600', '21600', '2018-09-18 03:24:33', '43101104', '', '1', '1', '0', null), ('33', '0000000033', '1152188863', 'sad', '135000', '0', '156600', '21600', '2018-09-18 03:25:23', '95501690', '', '1', '1', '0', null), ('34', '0DFS000000034', '1152188863', '', '135000', '0', '156600', '21600', '2018-09-18 03:26:24', '36610553', '', '1', '1', '0', null), ('35', 'F000000035', '1152188863', 'dsafd', '45000', '0', '52200', '7200', '2018-09-18 03:27:35', '94501690', '', '1', '1', '0', null), ('36', '0000000036', '1152188863', 'sdfas', '135000', '0', '156600', '21600', '2018-09-18 06:01:47', '35611553', '', '1', '1', '0', null), ('37', '0000000037', '1152188863', 'este señor debe.', '90000', '0', '104400', '14400', '2018-09-18 11:50:58', '36610553', '', '1', '1', '0', null), ('38', '0000000038', '1152188863', '', '90000', '0', '104400', '14400', '2018-09-18 07:08:32', '36610553', '', '1', '1', '0', null), ('39', '0000000039', '1152188863', '', '90000', '0', '104400', '14400', '2018-09-19 03:11:47', null, 'pepe guama', '1', '1', '0', null), ('40', '0000000040', '1152188863', '', '45000', '0', '52200', '7200', '2018-09-19 03:20:58', null, 'joseph ortiz', '1', '1', '0', null), ('41', '0000000041', '1152188863', '', '250000', '0', '290000', '40000', '2018-09-21 06:45:45', null, 'juan perez', '1', '1', '0', null), ('42', '0000000042', '1152188863', 'prueba', '3000', '0', '3480', '480', '2018-09-24 07:34:33', '1152188863', '', '1', '1', '0', null), ('43', '0000000043', '1152188863', 'prueba', '90000', '0', '104400', '14400', '2018-09-25 09:06:59', '999999999999999', '', '1', '1', '0', null), ('44', '0000000044', '1152188863', 'prueba', '105000', '0', '121800', '16800', '2018-09-25 09:07:47', '999999999999999', '', '1', '1', '0', null), ('45', '0000000045', '1152188863', 'quedo pendiente', '45000', '1800', '50400', '7200', '2018-09-25 12:50:33', '34610553', '', '1', '1', '4', null), ('46', '0000000046', '1152188863', 'SE LE VENDE NO SE QUE', '15000', '1500', '15900', '2400', '2018-09-25 01:14:45', null, 'PEPE LANDA', '1', '1', '10', null), ('47', '0000000047', '1152188863', '', '90000', '0', '104400', '14400', '2018-09-25 05:53:13', '34610553', '', '1', '1', '0', null), ('48', '0000000048', '1152188863', 'prueba', '6000', '0', '6960', '960', '2018-10-01 02:16:20', '35611553', '', '1', '1', '0', null), ('49', 'BA0000000049', '1152188863', 'prueba nota de la factura', '5400', '0', '6264', '864', '2018-10-04 11:10:02', '34610553', '', '1', '1', '0', null), ('50', 'HJA00000050', '1152188863', 'queda pendiente de pago', '96000', '0', '111360', '15360', '2018-10-04 11:14:45', '36610553', '', '1', null, '0', null), ('51', '0000000051', '94501690', '', '4000', '0', '4640', '640', '2018-10-11 07:13:18', '43101104', '', '2', null, '0', null), ('52', '0000000052', '1152188863', 'Sala1', '21000', '0', '24360', '3360', '2018-10-12 23:53:31', '94501690', '', '2', '1', '0', '53'), ('53', '0000000053', '1152188863', 'Sala1', '42000', '840', '47880', '6720', '2018-10-12 23:54:13', '43101104', '', '2', '1', '2', '52'), ('54', '0000000054', '1152188863', 'Sala1', '21000', '0', '24360', '3360', '2018-10-12 23:54:34', '43101104', '', '2', '1', '0', '52'), ('55', '0000000055', '1152188863', 'Sala1', '21000', '0', '24360', '3360', '2018-10-12 23:59:24', '43101104', '', '2', '1', '0', '52'), ('56', '0000000056', '1152188863', 'Sala1', '42000', '840', '47880', '6720', '2018-10-13 00:28:39', '43101104', '', '2', '1', '2', '56'), ('57', '0000000057', '1152188863', 'blalbalbalbab', '84000', '1680', '95760', '13440', '2018-10-13 01:55:03', '43101104', '', '1', '1', '2', '57'), ('58', '0000000058', '1152188863', 'Reserva hecha para la banda Pruebaaaaa en la sala1.', '210000', '4200', '239400', '33600', '2018-10-13 03:59:34', '43101104', '', '1', '1', '2', '59');
COMMIT;

-- ----------------------------
-- Table structure for ft_factura_detalle
-- ----------------------------
DROP TABLE IF EXISTS `ft_factura_detalle`;
CREATE TABLE `ft_factura_detalle` (
`NM_ID_DETALLE_FACTURA`  int(5) NOT NULL AUTO_INCREMENT ,
`CS_FACTURA_ID`  int(6) NOT NULL ,
`NM_CANTIDAD_COMPRA`  int(4) NOT NULL ,
`CS_PRODUCTO_ID`  int(6) NOT NULL ,
`NM_PRECIO_TOTAL_PRODUCTO`  double NOT NULL ,
`NM_PRECIO_UNITARIO`  double NULL DEFAULT NULL ,
PRIMARY KEY (`NM_ID_DETALLE_FACTURA`),
FOREIGN KEY (`CS_FACTURA_ID`) REFERENCES `ft_factura` (`CS_FACTURA_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`CS_PRODUCTO_ID`) REFERENCES `tp_producto` (`CS_PRODUCTO_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `FK_FACTURA` (`CS_FACTURA_ID`) USING BTREE ,
INDEX `FK_PRODUTO` (`CS_PRODUCTO_ID`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_spanish_ci
AUTO_INCREMENT=43

;

-- ----------------------------
-- Records of ft_factura_detalle
-- ----------------------------
BEGIN;
INSERT INTO `ft_factura_detalle` VALUES ('35', '51', '2', '34', '4000', '2000'), ('37', '53', '1', '4', '47880', '42000'), ('40', '56', '1', '4', '47880', '42000'), ('41', '57', '1', '4', '95760', '42000'), ('42', '58', '1', '4', '239400', '42000');
COMMIT;

-- ----------------------------
-- Table structure for ft_forma_pago
-- ----------------------------
DROP TABLE IF EXISTS `ft_forma_pago`;
CREATE TABLE `ft_forma_pago` (
`ID_FORMA_PAGO`  int(5) NOT NULL AUTO_INCREMENT ,
`DES_FORMA_PAGO`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`ID_FORMA_PAGO`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=3

;

-- ----------------------------
-- Records of ft_forma_pago
-- ----------------------------
BEGIN;
INSERT INTO `ft_forma_pago` VALUES ('1', 'Efectivo'), ('2', 'Crédito');
COMMIT;

-- ----------------------------
-- Table structure for perfil
-- ----------------------------
DROP TABLE IF EXISTS `perfil`;
CREATE TABLE `perfil` (
`id_perfil`  int(11) NOT NULL AUTO_INCREMENT ,
`nombre`  varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
PRIMARY KEY (`id_perfil`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=3

;

-- ----------------------------
-- Records of perfil
-- ----------------------------
BEGIN;
INSERT INTO `perfil` VALUES ('1', 'Administrador'), ('2', 'Usuario');
COMMIT;

-- ----------------------------
-- Table structure for rs_multas_reserva
-- ----------------------------
DROP TABLE IF EXISTS `rs_multas_reserva`;
CREATE TABLE `rs_multas_reserva` (
`CS_MULTA_ID`  bigint(20) NOT NULL AUTO_INCREMENT ,
`CS_RESERVA_ID`  int(6) NOT NULL ,
`NM_VALOR_MULTA_SALA`  double NOT NULL ,
`DS_ESTADO`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`CS_MULTA_ID`),
FOREIGN KEY (`CS_RESERVA_ID`) REFERENCES `rs_reserva_sala` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `FK_RESERVA` (`CS_RESERVA_ID`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=4

;

-- ----------------------------
-- Records of rs_multas_reserva
-- ----------------------------
BEGIN;
INSERT INTO `rs_multas_reserva` VALUES ('1', '53', '24360', '1'), ('2', '52', '24360', '1'), ('3', '52', '24360', '1');
COMMIT;

-- ----------------------------
-- Table structure for rs_reserva_sala
-- ----------------------------
DROP TABLE IF EXISTS `rs_reserva_sala`;
CREATE TABLE `rs_reserva_sala` (
`id`  int(6) NOT NULL AUTO_INCREMENT ,
`documento`  bigint(20) NOT NULL ,
`sala`  int(4) NOT NULL ,
`start`  datetime NULL DEFAULT NULL ,
`end`  datetime NULL DEFAULT NULL ,
`title`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`DS_ESTADO`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`DT_FECHA_CREACION`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`color`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`id_banda`  int(5) NULL DEFAULT NULL ,
`descripcion`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`id_banda`) REFERENCES `us_banda_usuario` (`CS_BANDA_ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (`sala`) REFERENCES `rs_sala` (`CS_SALA_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`documento`) REFERENCES `us_usuario` (`NM_DOCUMENTO_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `FK_USUARIO` (`documento`) USING BTREE ,
INDEX `FK_SALA` (`sala`) USING BTREE ,
INDEX `FK_BANDA_RESEVA` (`id_banda`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=60

;

-- ----------------------------
-- Records of rs_reserva_sala
-- ----------------------------
BEGIN;
INSERT INTO `rs_reserva_sala` VALUES ('2', '43101104', '1', '2018-08-09 02:15:00', '2018-08-09 02:50:00', 'con audifonos', 'Activo', '2018-08-25 11:17:25', null, null, null), ('5', '43101104', '1', '2018-08-10 03:30:00', '2018-08-10 09:50:00', 'con audifono', 'Activo', '2018-08-27 12:48:59', null, null, null), ('6', '94501690', '1', '2018-08-10 04:25:00', '2018-08-10 05:40:00', 'con guitarra', 'Activo', '2018-08-27 12:50:33', null, null, null), ('8', '94501690', '1', '2018-08-27 03:25:00', '2018-08-27 05:20:00', 'olg', 'Activo', '2018-08-27 19:21:27', null, null, null), ('9', '34610553', '1', '2018-08-28 05:25:00', '2018-08-28 08:35:00', 'con bajo', 'Activo', '2018-08-28 15:33:21', null, null, null), ('10', '34610553', '1', '2018-08-28 08:55:00', '2018-08-28 09:55:00', 'con guitarra', 'Activo', '2018-08-28 15:36:24', null, null, null), ('11', '43101104', '1', '2018-08-28 04:15:00', '2018-08-28 04:55:00', 'con audifonos', 'Activo', '2018-08-28 15:38:06', null, null, null), ('35', '94501690', '1', '2018-08-29 03:20:00', '2018-08-29 04:30:00', 'ghjklÃ±', 'Activo', '2018-08-28 19:45:29', null, null, null), ('36', '34610553', '1', '2018-08-30 03:50:00', '2018-08-30 04:15:00', 'dfgbhnjmk', 'Activo', '2018-08-28 19:48:50', null, null, null), ('37', '94501690', '2', '2018-09-03 03:20:00', '2018-09-03 04:30:00', 'con  microfonos', 'Activo', '2018-09-02 11:09:15', null, null, null), ('38', '35611553', '1', '2018-09-08 03:25:00', '2018-09-08 05:35:00', 'con audifonos', 'Activo', '2018-09-07 14:47:27', null, null, null), ('39', '43101104', '1', '2018-09-08 03:00:00', '2018-09-08 03:20:00', 'lkjhygf', 'Activo', '2018-09-07 15:03:39', null, null, null), ('40', '94501690', '1', '2018-10-11 13:00:00', '2018-10-11 18:00:00', '\n		      	34610553 - diana viveros94501690 - edinson gallego-vaaaaaaaaaaaa', 'Activo', '2018-10-08 15:36:53', '#000000', null, null), ('41', '36610553', '1', '2018-10-12 13:00:00', '2018-10-12 15:00:00', '36610553-vaaa', 'Activo', '2018-10-08 15:58:05', '#004080', null, null), ('42', '36610553', '1', '2018-10-10 15:10:00', '2018-10-10 18:30:00', '36610553-oscar peuba', 'Activo', '2018-10-08 16:47:16', '#000000', null, null), ('43', '1152188863', '1', '2018-10-11 10:00:00', '2018-10-11 11:00:00', '10:00 - 11:001152188863 - Oscar Mesa - bueno', 'Activo', '2018-10-08 16:59:30', '#ff0000', null, null), ('44', '36610553', '1', '2018-10-12 08:00:00', '2018-10-12 09:00:00', '08:00 - 09:00 - 36610553 - jhon valencia - otra prueba mas  vamos a ver ', 'Activo', '2018-10-08 17:00:47', '#ffff00', null, null), ('45', '43101104', '1', '2018-10-11 09:05:00', '2018-10-11 09:30:00', '09:05 - 09:30 - 43101104 - nidia valencia - buena', 'Activo', '2018-10-08 17:03:07', '#ff0000', null, null), ('46', '1152188863', '1', '2018-10-12 17:00:00', '2018-10-12 19:00:00', '17:00 - 19:00 - 1152188863 - Oscar Mesa - esaa es una prueab', 'Activo', '2018-10-08 17:04:20', '#ff0000', null, null), ('47', '36610553', '2', '2018-10-11 13:10:00', '2018-10-11 14:00:00', '13:10 - 14:00 - 36610553 - jhon valencia - vanmos a ver ', 'Activo', '2018-10-08 17:21:10', null, null, null), ('48', '123456789', '2', '2018-10-11 11:31:00', '2018-10-11 12:00:00', '11:31 - 12:00 - 123456789 - ana herrera -   jkkhkjnnmnkjjjjjjjjjjkb', 'Activo', '2018-10-08 20:33:48', null, null, null), ('49', '94501690', '2', '2018-10-09 10:45:00', '2018-10-09 17:30:00', '10:45 - 17:30 - 94501690 - edinson gallego - this is a prueba', 'Activo', '2018-10-08 20:35:12', null, null, null), ('50', '43101104', '1', '2018-10-12 10:00:00', '2018-10-12 11:00:00', '43101104 - nidia valencia - ptreaf', 'Activo', '2018-10-09 12:59:10', '#008040', null, null), ('52', '43101104', '1', '2018-10-13 13:00:00', '2018-10-13 14:00:00', '43101104 - nidia valencia - prueba', 'Activo', '2018-10-12 19:12:02', '#000000', '2', null), ('53', '94501690', '1', '2018-10-13 09:00:00', '2018-10-13 10:00:00', '94501690 - edinson gallego - sdsd', 'Activo', '2018-10-12 21:54:14', '#0080c0', '2', 'sdsd'), ('54', '94501690', '1', '2018-10-13 10:00:00', '2018-10-13 12:00:00', '94501690 - edinson gallego - esta es una prueba va vavvavavavav', 'Activo', '2018-10-13 00:15:16', '#f90606', '2', 'esta es una prueba va vavvavavavav'), ('55', '43101104', '1', '2018-10-13 15:00:00', '2018-10-13 17:00:00', '43101104 - nidia valencia - esta es una prueba blablabla ', 'Activo', '2018-10-13 00:19:53', '#ff0080', '2', 'esta es una prueba blablabla '), ('56', '43101104', '1', '2018-10-13 17:05:00', '2018-10-13 18:55:00', '43101104 - nidia valencia - una prueba mas', 'Activo', '2018-10-13 00:28:33', '#5482fa', '2', 'una prueba mas'), ('57', '43101104', '1', '2018-10-15 09:00:00', '2018-10-15 11:00:00', '43101104 - nidia valencia - prueba en factura', 'Activo', '2018-10-13 01:54:54', '#000000', '2', 'prueba en factura'), ('58', '1152188863', '1', '2018-10-15 13:00:00', '2018-10-15 15:00:00', '1152188863 - Oscar Mesa - esta es la descripcion', 'Activo', '2018-10-13 03:55:34', '#000000', '2', 'esta es la descripcion'), ('59', '43101104', '1', '2018-10-16 13:00:00', '2018-10-16 18:00:00', '43101104 - nidia valencia - jummmmm vamos es a entrenar', 'Activo', '2018-10-13 03:58:33', '#382fe6', '2', 'jummmmm vamos es a entrenar');
COMMIT;

-- ----------------------------
-- Table structure for rs_sala
-- ----------------------------
DROP TABLE IF EXISTS `rs_sala`;
CREATE TABLE `rs_sala` (
`CS_SALA_ID`  int(4) NOT NULL AUTO_INCREMENT ,
`DS_NOMBRE_SALA`  varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL ,
`DS_DESCRIPCION_SALA`  varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL ,
`NM_VALOR_HORA_SALA`  double NOT NULL ,
`NM_CAPACIDAD_SALA`  int(4) NOT NULL ,
PRIMARY KEY (`CS_SALA_ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_spanish_ci
AUTO_INCREMENT=3

;

-- ----------------------------
-- Records of rs_sala
-- ----------------------------
BEGIN;
INSERT INTO `rs_sala` VALUES ('1', 'Sala 1', 'sala con guitarra', '42000', '8'), ('2', 'Sala 2', 'Sala 2', '45000', '12');
COMMIT;

-- ----------------------------
-- Table structure for tmp
-- ----------------------------
DROP TABLE IF EXISTS `tmp`;
CREATE TABLE `tmp` (
`id_tmp`  int(11) NOT NULL AUTO_INCREMENT ,
`id_producto`  int(11) NOT NULL ,
`cantidad_tmp`  int(11) NOT NULL ,
`precio_tmp`  double(8,2) NULL DEFAULT NULL ,
`session_id`  varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL ,
PRIMARY KEY (`id_tmp`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_unicode_ci
AUTO_INCREMENT=7

;

-- ----------------------------
-- Records of tmp
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tp_inventario_producto
-- ----------------------------
DROP TABLE IF EXISTS `tp_inventario_producto`;
CREATE TABLE `tp_inventario_producto` (
`CS_INVENTARIO_ID`  int(6) NOT NULL AUTO_INCREMENT ,
`CS_PRODUCTO_ID`  int(6) NOT NULL ,
`NM_CANTIDAD_INVENTARIO`  int(4) NOT NULL ,
`CS_VENDEDOR_PRODUCTO_ID`  int(6) NOT NULL ,
`DT_FECHA_CREACION`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`NM_PRECIO_UNITARIO_COMPRA`  double NOT NULL ,
PRIMARY KEY (`CS_INVENTARIO_ID`),
FOREIGN KEY (`CS_PRODUCTO_ID`) REFERENCES `tp_producto` (`CS_PRODUCTO_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`CS_VENDEDOR_PRODUCTO_ID`) REFERENCES `tp_vendedor_producto` (`CS_VENDEDOR_ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
INDEX `FK_PRODUCTO` (`CS_PRODUCTO_ID`) USING BTREE ,
INDEX `FK_VENDEDOR` (`CS_VENDEDOR_PRODUCTO_ID`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_spanish_ci
AUTO_INCREMENT=25

;

-- ----------------------------
-- Records of tp_inventario_producto
-- ----------------------------
BEGIN;
INSERT INTO `tp_inventario_producto` VALUES ('16', '6', '10', '1', '2018-10-11 18:45:19', '1500'), ('17', '34', '8', '1', '2018-10-11 19:10:45', '850'), ('18', '6', '30', '2', '2018-10-11 19:25:07', '1513'), ('19', '7', '30', '2', '2018-10-11 19:25:22', '1796'), ('20', '8', '23', '3', '2018-10-11 19:25:46', '1197'), ('21', '9', '30', '2', '2018-10-11 19:26:04', '1513'), ('22', '10', '25', '2', '2018-10-11 19:26:22', '1513'), ('23', '11', '30', '1', '2018-10-11 19:26:38', '600'), ('24', '12', '25', '2', '2018-10-11 19:26:59', '1100');
COMMIT;

-- ----------------------------
-- Table structure for tp_producto
-- ----------------------------
DROP TABLE IF EXISTS `tp_producto`;
CREATE TABLE `tp_producto` (
`CS_PRODUCTO_ID`  int(6) NOT NULL AUTO_INCREMENT ,
`DS_CODIGO_PRODUCTO`  varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL ,
`DS_NOMBRE_PRODUCTO`  varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL ,
`DS_DESCRIPCION_PRODUCTO`  varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL ,
`NM_PRESENTACION_PRODUCTO`  int(10) NOT NULL ,
`FK_UNIDAD`  int(6) NOT NULL ,
`DT_FECHA_CREACION`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`NM_ESTADO`  int(1) NULL DEFAULT NULL ,
`DB_PRECIO_VENTA_UND`  double NULL DEFAULT NULL ,
`NM_PRECIO_UNITARIO_COMPRA_UND`  varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL ,
`NM_ELIMINADO`  int(1) NULL DEFAULT 0 ,
PRIMARY KEY (`CS_PRODUCTO_ID`),
FOREIGN KEY (`FK_UNIDAD`) REFERENCES `tp_unidad_medida_producto` (`CS_UNIDAD_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `FK_UNIDAD` (`FK_UNIDAD`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_spanish_ci
AUTO_INCREMENT=36

;

-- ----------------------------
-- Records of tp_producto
-- ----------------------------
BEGIN;
INSERT INTO `tp_producto` VALUES ('1', 'WQP', 'Galletas saltin', 'esta es casi una prueba  a ver si lo guarda', '0', '1', '2018-09-13 18:20:16', '1', '900', '200', '1'), ('4', 'SALA', 'Sala reserva', 'Sala que reserva el usuario', '0', '3', '2018-09-21 19:30:12', '1', '4000', '4000', '0'), ('6', 'C001', 'AGUILA', 'BOTELLA RETORNABLE', '0', '5', '2018-10-08 12:51:44', '1', '3000', '1513', '0'), ('7', 'C002', 'CLUB COLOMBIA', 'BOTELLA RETORNABLE', '0', '5', '2018-10-08 12:51:44', '1', '3500', '1796', '0'), ('8', 'C003', 'COSTEÑITA', 'BOTELLA RETORNABLE', '0', '5', '2018-10-08 12:51:45', '1', '2500', '1197', '0'), ('9', 'C004', 'PILSEN', 'BOTELLA RETORNABLE', '0', '5', '2018-10-08 12:51:46', '1', '3000', '1513', '0'), ('10', 'C005', 'POKER', 'BOTELLA RETORNABLE', '0', '5', '2018-10-08 12:51:46', '1', '3000', '1513', '0'), ('11', 'B001', 'AGUA RENACER', 'PET 600ML', '0', '5', '2018-10-08 12:51:46', '1', '2000', '600', '0'), ('12', 'B002', 'COCACOLA 250', 'PET 250ML', '0', '5', '2018-10-08 12:51:46', '1', '2000', '1100', '0'), ('13', 'B003', 'GREEN', 'VIDRIO 370ML', '0', '5', '2018-10-08 12:51:46', '1', '4000', '2700', '0'), ('14', 'B004', 'JUGO HIT', 'TETRA PACK 200ML', '0', '5', '2018-10-08 12:51:46', '1', '2000', '884', '0'), ('15', 'B006', 'MR TEA', 'VIDRIO 300ML', '0', '5', '2018-10-08 12:51:46', '1', '2000', '1083', '0'), ('16', 'B007', 'PONY MALTA', 'BOTELLA RETORNABLE', '0', '5', '2018-10-08 12:51:46', '1', '2000', '1105', '0'), ('17', 'M001', 'CHEESETRIS', '', '0', '4', '2018-10-08 12:51:46', '1', '2000', '925', '0'), ('18', 'M002', 'CHEETOS', '', '0', '4', '2018-10-08 12:51:46', '1', '1500', '446', '0'), ('19', 'M003', 'CHOCLITOS', '', '0', '4', '2018-10-08 12:51:47', '1', '1500', '576', '0'), ('20', 'M004', 'CHOCOLATINA JET', '', '0', '4', '2018-10-08 12:51:47', '1', '600', '345', '0'), ('21', 'M005', 'CHOCORRAMO', 'GRANDE', '0', '4', '2018-10-08 12:51:47', '1', '2000', '1410', '0'), ('22', 'M006', 'CHOKIS', '', '0', '4', '2018-10-08 12:51:47', '1', '1500', '756', '0'), ('23', 'M007', 'DETODITO', '', '0', '4', '2018-10-08 12:51:47', '1', '2500', '1500', '0'), ('24', 'M008', 'DORITOS', '', '0', '4', '2018-10-08 12:51:47', '1', '2000', '990', '0'), ('25', 'M009', 'GALLETAS FESTIVAL', '', '0', '4', '2018-10-08 12:51:47', '1', '1500', '740', '0'), ('26', 'M010', 'MANIMOTO', '', '0', '4', '2018-10-08 12:51:47', '1', '1500', '820', '0'), ('27', 'M011', 'PAPITAS LA REINA', '', '0', '4', '2018-10-08 12:51:47', '1', '2000', '839', '0'), ('28', 'M012', 'PLATANITOS', '', '0', '4', '2018-10-08 12:51:48', '1', '2000', '913', '0'), ('29', 'M013', 'ROSQUITAS', '', '0', '4', '2018-10-08 12:51:48', '1', '2000', '806', '0'), ('30', 'M014', 'TOSTACOS', '', '0', '4', '2018-10-08 12:51:48', '1', '1500', '583', '0'), ('31', 'M015', 'MAIZITOS', '', '0', '4', '2018-10-08 12:51:48', '1', '1500', '583', '0'), ('32', 'M016', 'MANI LA ESPECIAL', '', '0', '4', '2018-10-08 12:51:48', '1', '3000', '1550', '0'), ('33', 'M017', 'GALLETAS TOSH', '', '0', '4', '2018-10-08 12:51:48', '1', '1500', '850', '0'), ('34', 'M018', 'WAFER JET', 'Galleta de 22 gramos', '0', '4', '2018-10-08 12:51:48', '1', '2000', '850', '0'), ('35', 'M019', 'WAFER JET', '', '0', '4', '2018-10-11 19:18:10', '1', '2000', '600', '0');
COMMIT;

-- ----------------------------
-- Table structure for tp_unidad_medida_producto
-- ----------------------------
DROP TABLE IF EXISTS `tp_unidad_medida_producto`;
CREATE TABLE `tp_unidad_medida_producto` (
`CS_UNIDAD_ID`  int(6) NOT NULL AUTO_INCREMENT ,
`DS_NOMBRE_UNIDAD`  varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL ,
`DS_DESCRIPCION_UNIDAD`  varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`CS_UNIDAD_ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_spanish_ci
AUTO_INCREMENT=6

;

-- ----------------------------
-- Records of tp_unidad_medida_producto
-- ----------------------------
BEGIN;
INSERT INTO `tp_unidad_medida_producto` VALUES ('1', 'LTR', 'Litro'), ('2', 'Caja', 'Cajetilla'), ('3', 'Unidad', 'Und'), ('4', 'Gr', 'Gramos'), ('5', 'ML', 'MiliLitros');
COMMIT;

-- ----------------------------
-- Table structure for tp_vendedor_producto
-- ----------------------------
DROP TABLE IF EXISTS `tp_vendedor_producto`;
CREATE TABLE `tp_vendedor_producto` (
`CS_VENDEDOR_ID`  int(6) NOT NULL AUTO_INCREMENT ,
`DS_NOMBRE_VENDEDOR`  varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL ,
`DS_DESCRIPCION_VENDEDOR`  varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`CS_VENDEDOR_ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_spanish_ci
AUTO_INCREMENT=4

;

-- ----------------------------
-- Records of tp_vendedor_producto
-- ----------------------------
BEGIN;
INSERT INTO `tp_vendedor_producto` VALUES ('1', 'Exito', 'Exito del poblado'), ('2', 'Consumo', 'Consumo de la america'), ('3', 'De uno', 'De uno de la vegas');
COMMIT;

-- ----------------------------
-- Table structure for us_banda_detalle_usuario
-- ----------------------------
DROP TABLE IF EXISTS `us_banda_detalle_usuario`;
CREATE TABLE `us_banda_detalle_usuario` (
`CS_BANDA_ID`  int(5) NULL DEFAULT NULL ,
`NM_DOCUMENTO_ID`  bigint(20) NULL DEFAULT NULL ,
`ES_LIDER`  int(1) NULL DEFAULT 0 ,
FOREIGN KEY (`CS_BANDA_ID`) REFERENCES `us_banda_usuario` (`CS_BANDA_ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (`NM_DOCUMENTO_ID`) REFERENCES `us_usuario` (`NM_DOCUMENTO_ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
INDEX `FK_CS_BANDA_ID_USUARIO` (`CS_BANDA_ID`) USING BTREE ,
INDEX `FK_NM_DOCUMENTO_ID_USUARIO` (`NM_DOCUMENTO_ID`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of us_banda_detalle_usuario
-- ----------------------------
BEGIN;
INSERT INTO `us_banda_detalle_usuario` VALUES ('1', '35611553', '1'), ('1', '95501690', '0'), ('1', '36610553', '0'), ('1', '982345456', '0'), ('1', '564353453454', '0'), ('1', '345345435345345', '0'), ('2', '43101104', '1'), ('2', '1152188863', '0'), ('2', '1152204758', '0');
COMMIT;

-- ----------------------------
-- Table structure for us_banda_usuario
-- ----------------------------
DROP TABLE IF EXISTS `us_banda_usuario`;
CREATE TABLE `us_banda_usuario` (
`CS_BANDA_ID`  int(5) NOT NULL AUTO_INCREMENT ,
`DS_NOMBRE_BANDA`  varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL ,
`DS_DESCRIPCION_BANDA`  varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`CS_BANDA_ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=3

;

-- ----------------------------
-- Records of us_banda_usuario
-- ----------------------------
BEGIN;
INSERT INTO `us_banda_usuario` VALUES ('1', 'Prueba C', 'Prueba c'), ('2', 'Pruebaaaaa', 'Prueba 1234');
COMMIT;

-- ----------------------------
-- Table structure for us_estado_usuario
-- ----------------------------
DROP TABLE IF EXISTS `us_estado_usuario`;
CREATE TABLE `us_estado_usuario` (
`CS_ESTADO_ID`  int(4) NOT NULL AUTO_INCREMENT ,
`DS_NOMBRE_ESTADO`  varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL ,
`DS_DESCRIPCION_ESTADO`  varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`CS_ESTADO_ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_spanish_ci
AUTO_INCREMENT=3

;

-- ----------------------------
-- Records of us_estado_usuario
-- ----------------------------
BEGIN;
INSERT INTO `us_estado_usuario` VALUES ('1', 'Activo', 'Activo'), ('2', 'Inactivo', 'Inactivo');
COMMIT;

-- ----------------------------
-- Table structure for us_incentivo_tipo_usuario
-- ----------------------------
DROP TABLE IF EXISTS `us_incentivo_tipo_usuario`;
CREATE TABLE `us_incentivo_tipo_usuario` (
`CS_INCENTIVO_ID`  int(4) NOT NULL AUTO_INCREMENT ,
`DS_NOMBRE_INCENTIVO`  varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL ,
`DS_DESCRIPCION_INCENTIVO`  varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL ,
`NM_VALOR_PORCENTAJE_INCENTIVO`  double NOT NULL ,
PRIMARY KEY (`CS_INCENTIVO_ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_spanish_ci
AUTO_INCREMENT=5

;

-- ----------------------------
-- Records of us_incentivo_tipo_usuario
-- ----------------------------
BEGIN;
INSERT INTO `us_incentivo_tipo_usuario` VALUES ('1', 'Admin', 'Administrador', '100'), ('2', 'Banda', 'Banda', '50'), ('3', 'Normal', 'Normal', '30'), ('4', 'Docente', 'Se aplica descuento del 20 %', '20');
COMMIT;

-- ----------------------------
-- Table structure for us_tipo_documento
-- ----------------------------
DROP TABLE IF EXISTS `us_tipo_documento`;
CREATE TABLE `us_tipo_documento` (
`CS_TIPO_DOCUMENTO_ID`  int(4) NOT NULL AUTO_INCREMENT ,
`DS_NOMBRE_TIPO_DOCUMENTO`  varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL ,
`DS_DESCRIPCION_TIPO_DOCUMENTO`  varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`CS_TIPO_DOCUMENTO_ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_spanish_ci
AUTO_INCREMENT=5

;

-- ----------------------------
-- Records of us_tipo_documento
-- ----------------------------
BEGIN;
INSERT INTO `us_tipo_documento` VALUES ('1', 'Cédula Ciudadanía', 'Cédula Ciudadanía'), ('2', 'Tarjeta Identidad', 'Tarjeta Identidad'), ('3', 'Pasaporte', 'Pasaporte'), ('4', 'Cédula Extranjera ', 'Cédula Extranjera');
COMMIT;

-- ----------------------------
-- Table structure for us_tipo_usuario
-- ----------------------------
DROP TABLE IF EXISTS `us_tipo_usuario`;
CREATE TABLE `us_tipo_usuario` (
`CS_TIPO_USUARIO`  int(4) NOT NULL AUTO_INCREMENT ,
`DS_NOMBRE_TIPO_USUARIO`  varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL ,
`DS_DESCRIPCION_TIPO_USUARIO`  varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL ,
`NM_PORCENTAJE_INCENTIVO`  double(4,0) NOT NULL ,
PRIMARY KEY (`CS_TIPO_USUARIO`),
INDEX `FK_INCENTIVO` (`NM_PORCENTAJE_INCENTIVO`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_spanish_ci
AUTO_INCREMENT=6

;

-- ----------------------------
-- Records of us_tipo_usuario
-- ----------------------------
BEGIN;
INSERT INTO `us_tipo_usuario` VALUES ('1', 'Administrador', 'Administrador', '1'), ('2', 'Banda', 'Banda', '2'), ('3', 'Usuario Normal', 'Usario Normal', '20'), ('4', 'Docente', 'que dicta clases', '20'), ('5', 'Cliente', 'Clientes que asisten al establecimiento', '1');
COMMIT;

-- ----------------------------
-- Table structure for us_usuario
-- ----------------------------
DROP TABLE IF EXISTS `us_usuario`;
CREATE TABLE `us_usuario` (
`NM_DOCUMENTO_ID`  bigint(20) NOT NULL ,
`CS_TIPO_DOCUMENTO_ID`  int(4) NOT NULL ,
`DS_NOMBRES_USUARIO`  varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL ,
`DS_APELLIDOS_USUARIO`  varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL ,
`NM_TELEFONO`  int(7) NULL DEFAULT NULL ,
`NM_CELULAR`  varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL ,
`DS_CORREO`  varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL ,
`DS_DIRECCION`  varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL ,
`DS_CONTRASENA`  varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL ,
`CS_TIPO_USUARIO_ID`  int(4) NOT NULL ,
`CS_ESTADO_ID`  int(4) NOT NULL ,
`DT_FECHA_CREACION`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`RESTAURAR_CONTRASENA`  int(1) NOT NULL DEFAULT 0 ,
`NM_ELIMINADO`  int(1) NULL DEFAULT 0 ,
`ENVIO_CORREO_ACTIVACION`  int(1) NULL DEFAULT 0 ,
PRIMARY KEY (`NM_DOCUMENTO_ID`),
FOREIGN KEY (`CS_ESTADO_ID`) REFERENCES `us_estado_usuario` (`CS_ESTADO_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`CS_TIPO_DOCUMENTO_ID`) REFERENCES `us_tipo_documento` (`CS_TIPO_DOCUMENTO_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`CS_TIPO_USUARIO_ID`) REFERENCES `us_tipo_usuario` (`CS_TIPO_USUARIO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `FK_TIPO_USUARIO` (`CS_TIPO_USUARIO_ID`) USING BTREE ,
INDEX `FK_ESTADO` (`CS_ESTADO_ID`) USING BTREE ,
INDEX `FK_TIPO_DOCUMENTO` (`CS_TIPO_DOCUMENTO_ID`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_spanish_ci

;

-- ----------------------------
-- Records of us_usuario
-- ----------------------------
BEGIN;
INSERT INTO `us_usuario` VALUES ('34610553', '1', 'diana', 'viveros', '3214697', '3214636790', 'edinson_gallego23152@elpoli.edu.co', null, '$2y$10$YNINJCyPd7V1ezeFMw9YDuc6of0j3PxG/U7toUD/qQAx7OGzcnaP2', '4', '1', '2018-08-28 15:31:00', '0', '0', '0'), ('35611553', '1', 'jairo', 'ortiz', '1200000', '8452530125', 'jairo@gmail.com', null, '$2y$10$DUbb22PcZE3R0wvwv/SZzO9ef9PIBsg6W8b10YQ5O.OjBAEZnJU2.', '2', '2', '2018-09-06 12:00:14', '0', '1', '0'), ('36610553', '1', 'jhon', 'valencia', '7896325', '8965635632', 'jhon@gmail.com', null, '$2y$10$6sZZ9FGEIaWYF10ZLeB40eR838NfAPd2fMzvMMgzyMve4yKRiBPWe', '2', '1', '2018-09-06 13:43:35', '0', '1', '0'), ('43101104', '1', 'nidia', 'valencia', '3127899', '3127852212', 'oscar_mesa24092@elpoli.edu.co', '', '$2y$10$Mo3BAL/l6V3aH9UxdupiY.0jRJ1dWrpwaFRAlBG8FSif2VA56xQl.', '2', '1', '2018-08-25 11:15:21', '0', '0', '1'), ('94501690', '1', 'edinson', 'gallego', '3216366', '3216367908', 'edigahe77@gmail.com', null, '$2y$10$SMl8JxTiwCRtboFbK6yepu9fjmrps9gBAyg8nOmCqp6PfRRorUXo.', '2', '1', '2018-08-25 11:10:33', '0', '0', '0'), ('95501690', '1', 'juan', 'acevedo', '7896366', '1521521255', 'juan@gmail.com', null, '$2y$10$IUQ0n8aZ4WmdByRAiF9HJec4kTxkHP26mXgyar0cBf4RW0xOzXNMq', '2', '2', '2018-09-06 15:03:01', '0', '1', '0'), ('123456789', '2', 'ana', 'herrera', '4545632', '2563254896', 'ana@gmail.com', null, '$2y$10$nuKTZucQxy7mbMvoQt2TtOwwc9vRNZ8NjmqMIpjSMV1mfdzIOBwom', '2', '1', '2018-09-06 03:50:32', '0', '1', '0'), ('324343333', '1', 'pepe', 'dfsadf', '2342343', '3232432234', 'ososcar@fasdf.com', null, '$2y$10$Gj8Zas7zys..mmXtvvTzMua6eOeg8zjcIIIFNNFGoEUb1Kn0vrVm6', '2', '2', '2018-09-06 13:41:14', '0', '1', '0'), ('789623778', '1', 'pedro', 'perez', '12369', '789632', 'pedro@gmail.com', null, '$2y$10$29aWCUIkJ5mb8KKOevJLXuBiqiL5I8KhdGREpxJDkPOOOswp5eE7C', '2', '2', '2018-09-06 18:15:44', '0', '1', '0'), ('982345456', '1', 'edinson', 'herrera', '7896152', '5634565625', 'edi@gmail.com', null, '$2y$10$4Mn3cUh8c3y09VI8FJ/lHedNHQDs1jG6XKKA4ZvB9e3YbyFJd8NcO', '4', '2', '2018-09-06 18:11:48', '0', '1', '0'), ('987412212', '1', 'fghjk', 'cvvbnm', '5623048', '9865320765', 'ediha@gmail.com', null, '$2y$10$sYK47RC1LPsQwBIACyv79.M9l5SkHKwPnj9uBzqtUzPsW/OGj1Itq', '4', '2', '2018-09-06 19:33:20', '0', '1', '0'), ('1152188863', '1', 'Oscar', 'Mesa', '5804661', '3012280744', 'oscarmesa.elpoli@gmail.com', null, '$2y$10$3sTTtL17ShNLWimjwm5f6ehtn3YcfJW5BRC3aT0hSWQd4fdfWEFGi', '1', '1', '2018-09-10 19:01:51', '0', '0', '0'), ('1152204758', '1', 'santiago', 'betancur', '6666666', '6666666666', 'poliaulink@gmail.com', '', '$2y$10$32AbUlynEMogC8aG/NEk6OtxD6hlD.QUjkZRWnv.C8ye3zCt87PGG', '2', '1', '2018-08-25 13:59:36', '0', '0', '1'), ('2147483647', '1', 'Diego', 'Mejia', '5555555', '5555555555', '555@gmail.com', null, '$2y$10$doEZ4hYMaAxgWZiPdyyIX.hMT3HQwLWT3xAIcuA3YCBeGzKGIcGRC', '2', '2', '2018-09-06 16:14:52', '0', '1', '0'), ('5435843958', '3', 'asdfasdf', 'sadfsdfasdf', '2313333', '3432423333', 'oscar@gmailc.om', null, '$2y$10$sJqVbpfYBnNs482CdCgJYeRDiRXxI5mjkDP7ZjAyvwVFnPK5hOQK.', '4', '2', '2018-09-07 16:10:45', '0', '1', '0'), ('23123213123', '1', 'calitos', 'pepo', '2131232', '1232131233', 'carlos234@gmail.com', 'calle 123', '$2y$10$NNxohVe2CN8H2K3q/YV0/OjiRQjEHcQNWhiI0/h8kR7u3h3DzGx26', '2', '2', '2018-09-25 15:52:06', '0', '1', '0'), ('564353453454', '4', 'pepito', 'perez', '2342342', '3242343243', 'pepoooo@gmail.com', 'callle 324324', '$2y$10$8QR9XCFgNWawPScSAxu1Du5TL1GNgeR3ENbbzIFa/ygKTedztVFkC', '3', '2', '2018-10-11 15:03:20', '0', '1', '0'), ('111111111111111', '1', 'ana', 'mesa', '2314324', '2342342342', 'anamesa@gmail.com', 'calle 23123', '$2y$10$hjFasakxrStDbXiIxLFWSeH0ztgbEnZFDYeva19JuOQ9kVNEoNclW', '2', '2', '2018-09-25 15:54:48', '0', '1', '0'), ('234324234234234', '1', 'pepito', 'asdfasdf', '3242342', '2342342343', 'casd@ksdfasdf.com', 'afsdfasdf', '$2y$10$1VUVzKMgemAJCyJ7Q1gM3urBp2yy5b1R5a2ZdzSHgSa6sVXcJlW3e', '3', '2', '2018-10-11 15:05:04', '0', '1', '0'), ('324123412341234', '1', 'carlos', 'mesa', '3242342', '3242234234', 'pepito@gmaill.com', 'calere', '$2y$10$jHabhAQwKyDOeeMzqvYMce9JxPDzGWXmEwMuXHsA5EEQ2Ns5c1gCG', '2', '2', '2018-10-11 14:59:11', '0', '1', '0'), ('324234234324234', '1', 'carlos', 'landa', '2343243', '2342343243', 'jaime12321@gmail.com', '', '$2y$10$8VExBHrLnMWQAxRdcCNpZ.napTbLqxh.psPj6ziJshwuMQGe9DcXG', '4', '2', '2018-09-24 20:16:13', '0', '1', '0'), ('345345435345345', '1', 'sdafasfdasdasdf', 'sadfsdfasdfasdfasdf', '2342342', '3423432423', '234324@fmaol.com', 'cale', '$2y$10$FtlayZDyNC8YFTamZR4A6umMlOgG41BJZBoFS/spKWhIOeVggNogK', '3', '2', '2018-10-11 15:08:17', '0', '1', '0'), ('432423432423423', '3', 'ewsadf', 'asdf', '2321312', '1231232342', 'pepe@gmail.com', 'calle 123', '$2y$10$0VWFYnJ4J4N.64HJ4exALej1.VfzNV66PhY3.WfvyEs1AQTlYEmoq', '2', '2', '2018-10-11 14:55:17', '0', '1', '0'), ('454385345849838', '2', 'asdfh', 'dfjsf', '3423333', '3333333333', 'oscar_mesa24092@elpoli.edu.co', 'calle falsa 1234', '$2y$10$sOLpMBBizGbLn/M9hLBlQeHv.uBdg1iKM64wjgWgGbIP/bOL27xAG', '2', '1', '2018-09-07 16:09:12', '0', '1', '1'), ('877777777777777', '1', 'sdfasdf', 'adfgdgsdfg', '5555555', '5555555555', 'asdfasdf@gmail.com', null, '$2y$10$lHEjTLDk4BoEshMS7ebJHuvQDeDCpwRd5E3HXMOdWRR8ycIc3maZW', '2', '2', '2018-09-07 16:44:43', '0', '1', '0'), ('996954695469456', '2', 'dfgksdfgksdkfgsdfkgs', 'dskjfskf', '3432423', '4234234234', '4535345@gmail.com', null, '$2y$10$f0VW.aYOb2.nMcEkAoZVteW7MYUTWSoJr8tTEcKnFE6Ct2CdPwDZ6', '2', '2', '2018-09-07 16:13:32', '0', '1', '0'), ('999999999999999', '1', 'Diego', 'Mejia', '5555555', '5555555555', '555@gmail.com', 'calle 1234', '$2y$10$hxmzv4AJN4G7pJQntHvEdOtIqRwj0/JIoFRaXjZY5I6HO5K27az7W', '2', '2', '2018-09-07 16:35:21', '0', '1', '0');
COMMIT;

-- ----------------------------
-- Auto increment value for currencies
-- ----------------------------
ALTER TABLE `currencies` AUTO_INCREMENT=17;

-- ----------------------------
-- Auto increment value for events
-- ----------------------------
ALTER TABLE `events` AUTO_INCREMENT=19;

-- ----------------------------
-- Auto increment value for ft_estado
-- ----------------------------
ALTER TABLE `ft_estado` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for ft_factura
-- ----------------------------
ALTER TABLE `ft_factura` AUTO_INCREMENT=59;

-- ----------------------------
-- Auto increment value for ft_factura_detalle
-- ----------------------------
ALTER TABLE `ft_factura_detalle` AUTO_INCREMENT=43;

-- ----------------------------
-- Auto increment value for ft_forma_pago
-- ----------------------------
ALTER TABLE `ft_forma_pago` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for perfil
-- ----------------------------
ALTER TABLE `perfil` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for rs_multas_reserva
-- ----------------------------
ALTER TABLE `rs_multas_reserva` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for rs_reserva_sala
-- ----------------------------
ALTER TABLE `rs_reserva_sala` AUTO_INCREMENT=60;

-- ----------------------------
-- Auto increment value for rs_sala
-- ----------------------------
ALTER TABLE `rs_sala` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for tmp
-- ----------------------------
ALTER TABLE `tmp` AUTO_INCREMENT=7;

-- ----------------------------
-- Auto increment value for tp_inventario_producto
-- ----------------------------
ALTER TABLE `tp_inventario_producto` AUTO_INCREMENT=25;

-- ----------------------------
-- Auto increment value for tp_producto
-- ----------------------------
ALTER TABLE `tp_producto` AUTO_INCREMENT=36;

-- ----------------------------
-- Auto increment value for tp_unidad_medida_producto
-- ----------------------------
ALTER TABLE `tp_unidad_medida_producto` AUTO_INCREMENT=6;

-- ----------------------------
-- Auto increment value for tp_vendedor_producto
-- ----------------------------
ALTER TABLE `tp_vendedor_producto` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for us_banda_usuario
-- ----------------------------
ALTER TABLE `us_banda_usuario` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for us_estado_usuario
-- ----------------------------
ALTER TABLE `us_estado_usuario` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for us_incentivo_tipo_usuario
-- ----------------------------
ALTER TABLE `us_incentivo_tipo_usuario` AUTO_INCREMENT=5;

-- ----------------------------
-- Auto increment value for us_tipo_documento
-- ----------------------------
ALTER TABLE `us_tipo_documento` AUTO_INCREMENT=5;

-- ----------------------------
-- Auto increment value for us_tipo_usuario
-- ----------------------------
ALTER TABLE `us_tipo_usuario` AUTO_INCREMENT=6;
