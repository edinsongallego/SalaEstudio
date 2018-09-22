/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : salaestudiodb

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-09-21 19:36:09
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
AUTO_INCREMENT=33

;

-- ----------------------------
-- Records of currencies
-- ----------------------------
BEGIN;
INSERT INTO `currencies` VALUES ('1', 'US Dollar', '$', '2', ',', '.', 'USD'), ('2', 'Libra Esterlina', '&pound;', '2', ',', '.', 'GBP'), ('3', 'Euro', 'â‚¬', '2', '.', ',', 'EUR'), ('4', 'South African Rand', 'R', '2', '.', ',', 'ZAR'), ('5', 'Danish Krone', 'kr ', '2', '.', ',', 'DKK'), ('6', 'Israeli Shekel', 'NIS ', '2', ',', '.', 'ILS'), ('7', 'Swedish Krona', 'kr ', '2', '.', ',', 'SEK'), ('8', 'Kenyan Shilling', 'KSh ', '2', ',', '.', 'KES'), ('9', 'Canadian Dollar', 'C$', '2', ',', '.', 'CAD'), ('10', 'Philippine Peso', 'P ', '2', ',', '.', 'PHP'), ('11', 'Indian Rupee', 'Rs. ', '2', ',', '.', 'INR'), ('12', 'Australian Dollar', '$', '2', ',', '.', 'AUD'), ('13', 'Singapore Dollar', 'SGD ', '2', ',', '.', 'SGD'), ('14', 'Norske Kroner', 'kr ', '2', '.', ',', 'NOK'), ('15', 'New Zealand Dollar', '$', '2', ',', '.', 'NZD'), ('16', 'Vietnamese Dong', 'VND ', '0', '.', ',', 'VND'), ('17', 'Swiss Franc', 'CHF ', '2', '\'', '.', 'CHF'), ('18', 'Quetzal Guatemalteco', 'Q', '2', ',', '.', 'GTQ'), ('19', 'Malaysian Ringgit', 'RM', '2', ',', '.', 'MYR'), ('20', 'Real Brasile&ntilde;o', 'R$', '2', '.', ',', 'BRL'), ('21', 'Thai Baht', 'THB ', '2', ',', '.', 'THB'), ('22', 'Nigerian Naira', 'NGN ', '2', ',', '.', 'NGN'), ('23', 'Peso Argentino', '$', '2', '.', ',', 'ARS'), ('24', 'Bangladeshi Taka', 'Tk', '2', ',', '.', 'BDT'), ('25', 'United Arab Emirates Dirham', 'DH ', '2', ',', '.', 'AED'), ('26', 'Hong Kong Dollar', '$', '2', ',', '.', 'HKD'), ('27', 'Indonesian Rupiah', 'Rp', '2', ',', '.', 'IDR'), ('28', 'Peso Mexicano', '$', '2', ',', '.', 'MXN'), ('29', 'Egyptian Pound', '&pound;', '2', ',', '.', 'EGP'), ('30', 'Peso Colombiano', '$', '2', '.', ',', 'COP'), ('31', 'West African Franc', 'CFA ', '2', ',', '.', 'XOF'), ('32', 'Chinese Renminbi', 'RMB ', '2', ',', '.', 'CNY');
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
`NM_PRECIO_TOTAL`  double NOT NULL ,
`NM_PRECIO_IVA`  double NULL DEFAULT NULL ,
`DT_FECHA_CREACION`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`NM_CLIENTE_ID`  bigint(20) NULL DEFAULT NULL ,
`DS_CLIENTE`  varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL ,
`ID_ESTADO`  int(5) NOT NULL DEFAULT 1 ,
`ID_FORMA_PAGO`  int(5) NULL DEFAULT 1 ,
PRIMARY KEY (`CS_FACTURA_ID`),
FOREIGN KEY (`NM_CLIENTE_ID`) REFERENCES `us_usuario` (`NM_DOCUMENTO_ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (`ID_ESTADO`) REFERENCES `ft_estado` (`ID_ESTADO`) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (`ID_FORMA_PAGO`) REFERENCES `ft_forma_pago` (`ID_FORMA_PAGO`) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (`NM_VENDEDOR_ID`) REFERENCES `us_usuario` (`NM_DOCUMENTO_ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
INDEX `FK_CLIENTE_FACTURA` (`NM_CLIENTE_ID`) USING BTREE ,
INDEX `FK_VENDDOR_FACTURA` (`NM_VENDEDOR_ID`) USING BTREE ,
INDEX `FK_ESTADO_FAC` (`ID_ESTADO`) USING BTREE ,
INDEX `FK_MEDIO_PAGO` (`ID_FORMA_PAGO`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_spanish_ci
AUTO_INCREMENT=42

;

-- ----------------------------
-- Records of ft_factura
-- ----------------------------
BEGIN;
INSERT INTO `ft_factura` VALUES ('1', '0000000001', '1152188863', 'asdfasdf', '135000', '156600', '21600', '2018-09-16 06:28:31', '36610553', '', '1', '1'), ('2', '0000000001', '1152188863', 'asdfasdf', '135000', '156600', '21600', '2018-09-16 06:57:15', '36610553', '', '1', '1'), ('3', '0000000001', '1152188863', 'asdfasdf', '135000', '156600', '21600', '2018-09-16 06:58:17', '36610553', '', '1', '1'), ('4', '0000000004', '1152188863', 'prueba jajajaj', '135000', '156600', '21600', '2018-09-16 06:59:20', '35611553', '', '1', '1'), ('5', '0000000004', '1152188863', 'prueba jajajaj', '135000', '156600', '21600', '2018-09-16 06:59:58', '35611553', '', '1', '1'), ('6', '0000000006', '1152188863', '', '90000', '104400', '14400', '2018-09-16 10:10:24', '43101104', '', '1', '1'), ('7', '0000000007', '1152188863', 'sdafasdf', '90000', '104400', '14400', '2018-09-16 10:11:14', '35611553', '', '1', '1'), ('8', '0000000008', '1152188863', 'sdfsadf', '135000', '156600', '21600', '2018-09-16 10:25:43', '95501690', '', '1', '1'), ('20', '0000000009', '1152188863', '', '135000', '156600', '21600', '2018-09-16 10:43:32', null, 'cami lo pere', '1', '1'), ('21', '0000000009', '1152188863', '', '135000', '156600', '21600', '2018-09-16 10:46:24', null, 'cami lo pere', '1', '1'), ('22', '0000000022', '1152188863', 'Ã±jkh', '360000', '417600', '57600', '2018-09-17 03:01:36', '36610553', '', '1', '1'), ('23', '0000000023', '1152188863', 'esta es una prueba mas real', '135000', '156600', '21600', '2018-09-17 04:29:12', '36610553', '', '1', '1'), ('24', '0000000024', '1152188863', '', '90000', '104400', '14400', '2018-09-18 01:24:11', null, 'parra andrea jajajaja', '1', '1'), ('25', '0000000025', '1152188863', '', '90000', '104400', '14400', '2018-09-18 02:56:17', '43101104', '', '1', '1'), ('26', '0000000026', '1152188863', 'prueba', '90000', '104400', '14400', '2018-09-18 03:00:04', '95501690', '', '1', '1'), ('27', '0000000027', '1152188863', '', '135000', '156600', '21600', '2018-09-18 03:02:10', '36610553', '', '1', '1'), ('28', 'ZW00000028', '1152188863', 'esta es una pruyeba', '45000', '52200', '7200', '2018-09-18 03:04:17', null, 'carlos diego', '1', '1'), ('29', '0000000028', '1152188863', 'prueba pendiente de pago', '135000', '156600', '21600', '2018-09-18 03:13:07', '2147483647', '', '1', '1'), ('30', 'Q000000003', '1152188863', 'prueb', '135000', '156600', '21600', '2018-09-18 03:16:52', '95501690', '', '1', '1'), ('31', 'Q0000000030', '1152188863', 'sdaf', '90000', '104400', '14400', '2018-09-18 03:22:55', '36610553', '', '1', '1'), ('32', 'WB0000000032', '1152188863', 'dfasdf', '135000', '156600', '21600', '2018-09-18 03:24:33', '43101104', '', '1', '1'), ('33', '0000000033', '1152188863', 'sad', '135000', '156600', '21600', '2018-09-18 03:25:23', '95501690', '', '1', '1'), ('34', '0DFS000000034', '1152188863', '', '135000', '156600', '21600', '2018-09-18 03:26:24', '36610553', '', '1', '1'), ('35', 'F000000035', '1152188863', 'dsafd', '45000', '52200', '7200', '2018-09-18 03:27:35', '94501690', '', '1', '1'), ('36', '0000000036', '1152188863', 'sdfas', '135000', '156600', '21600', '2018-09-18 06:01:47', '35611553', '', '1', '1'), ('37', '0000000037', '1152188863', 'este señor debe.', '90000', '104400', '14400', '2018-09-18 11:50:58', '36610553', '', '1', '1'), ('38', '0000000038', '1152188863', '', '90000', '104400', '14400', '2018-09-18 07:08:32', '36610553', '', '1', '1'), ('39', '0000000039', '1152188863', '', '90000', '104400', '14400', '2018-09-19 03:11:47', null, 'pepe guama', '1', '1'), ('40', '0000000040', '1152188863', '', '45000', '52200', '7200', '2018-09-19 03:20:58', null, 'joseph ortiz', '1', '1'), ('41', '0000000041', '1152188863', '', '250000', '290000', '40000', '2018-09-21 06:45:45', null, 'juan perez', '2', '1');
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
AUTO_INCREMENT=24

;

-- ----------------------------
-- Records of ft_factura_detalle
-- ----------------------------
BEGIN;
INSERT INTO `ft_factura_detalle` VALUES ('3', '21', '3', '2', '135000', '45000'), ('4', '22', '8', '2', '360000', '45000'), ('5', '23', '3', '2', '135000', '45000'), ('6', '24', '2', '2', '90000', '45000'), ('7', '25', '2', '2', '90000', '45000'), ('8', '26', '2', '2', '90000', '45000'), ('9', '27', '3', '2', '135000', '45000'), ('10', '28', '1', '2', '45000', '45000'), ('11', '29', '3', '2', '135000', '45000'), ('12', '30', '3', '2', '135000', '45000'), ('13', '31', '2', '2', '90000', '45000'), ('14', '32', '3', '2', '135000', '45000'), ('15', '33', '3', '2', '135000', '45000'), ('16', '34', '3', '2', '135000', '45000'), ('17', '35', '1', '2', '45000', '45000'), ('18', '36', '3', '2', '135000', '45000'), ('19', '37', '2', '2', '90000', '45000'), ('20', '38', '2', '2', '90000', '45000'), ('21', '39', '2', '2', '90000', '45000'), ('22', '40', '1', '2', '45000', '45000'), ('23', '41', '10', '2', '250000', '25000');
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
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of rs_multas_reserva
-- ----------------------------
BEGIN;
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
PRIMARY KEY (`id`),
FOREIGN KEY (`sala`) REFERENCES `rs_sala` (`CS_SALA_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`documento`) REFERENCES `us_usuario` (`NM_DOCUMENTO_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `FK_USUARIO` (`documento`) USING BTREE ,
INDEX `FK_SALA` (`sala`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=40

;

-- ----------------------------
-- Records of rs_reserva_sala
-- ----------------------------
BEGIN;
INSERT INTO `rs_reserva_sala` VALUES ('2', '43101104', '1', '2018-08-09 02:15:00', '2018-08-09 02:50:00', 'con audifonos', 'Activo', '2018-08-25 11:17:25'), ('5', '43101104', '1', '2018-08-10 03:30:00', '2018-08-10 09:50:00', 'con audifono', 'Activo', '2018-08-27 12:48:59'), ('6', '94501690', '1', '2018-08-10 04:25:00', '2018-08-10 05:40:00', 'con guitarra', 'Activo', '2018-08-27 12:50:33'), ('8', '94501690', '1', '2018-08-27 03:25:00', '2018-08-27 05:20:00', 'olg', 'Activo', '2018-08-27 19:21:27'), ('9', '34610553', '1', '2018-08-28 05:25:00', '2018-08-28 08:35:00', 'con bajo', 'Activo', '2018-08-28 15:33:21'), ('10', '34610553', '1', '2018-08-28 08:55:00', '2018-08-28 09:55:00', 'con guitarra', 'Activo', '2018-08-28 15:36:24'), ('11', '43101104', '1', '2018-08-28 04:15:00', '2018-08-28 04:55:00', 'con audifonos', 'Activo', '2018-08-28 15:38:06'), ('35', '94501690', '1', '2018-08-29 03:20:00', '2018-08-29 04:30:00', 'ghjklÃ±', 'Activo', '2018-08-28 19:45:29'), ('36', '34610553', '1', '2018-08-30 03:50:00', '2018-08-30 04:15:00', 'dfgbhnjmk', 'Activo', '2018-08-28 19:48:50'), ('37', '94501690', '2', '2018-09-03 03:20:00', '2018-09-03 04:30:00', 'con  microfonos', 'Activo', '2018-09-02 11:09:15'), ('38', '35611553', '1', '2018-09-08 03:25:00', '2018-09-08 05:35:00', 'con audifonos', 'Activo', '2018-09-07 14:47:27'), ('39', '43101104', '1', '2018-09-08 03:00:00', '2018-09-08 03:20:00', 'lkjhygf', 'Activo', '2018-09-07 15:03:39');
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
AUTO_INCREMENT=15

;

-- ----------------------------
-- Records of tp_inventario_producto
-- ----------------------------
BEGIN;
INSERT INTO `tp_inventario_producto` VALUES ('3', '2', '10', '1', '2018-09-14 16:59:52', '3000'), ('4', '2', '10', '1', '2018-09-14 17:48:34', '3000'), ('7', '1', '3', '3', '2018-09-21 14:51:26', '800'), ('8', '2', '3', '2', '2018-09-21 14:58:19', '1000'), ('9', '3', '20', '2', '2018-09-21 15:00:20', '1900'), ('10', '2', '20', '1', '2018-09-21 15:01:19', '1900'), ('11', '3', '2', '2', '2018-09-21 15:06:18', '300'), ('12', '2', '2', '1', '2018-09-21 15:07:45', '200'), ('13', '3', '40', '2', '2018-09-21 15:09:47', '2000'), ('14', '2', '5', '1', '2018-09-21 18:43:53', '3233');
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
AUTO_INCREMENT=5

;

-- ----------------------------
-- Records of tp_producto
-- ----------------------------
BEGIN;
INSERT INTO `tp_producto` VALUES ('1', 'WQP', 'Galletas saltin', 'esta es casi una prueba  a ver si lo guarda', '0', '1', '2018-09-13 18:20:16', '1', '900', '200', '1'), ('2', 'WBVF', 'Aguardiente', 'Aguardiente antioqueÃ±o, guarito para la gente. ', '0', '1', '2018-09-13 19:11:13', '1', '45000', '599', '0'), ('3', 'POWE', 'Cigarrillos boston', 'Caja de cigarillos boston ligth', '0', '2', '2018-09-13 22:09:07', '1', '3000', '400', '0'), ('4', 'SALA', 'Sala reserva', 'Sala que reserva el usuario', '0', '3', '2018-09-21 19:30:12', '1', '4000', '4000', '0');
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
AUTO_INCREMENT=4

;

-- ----------------------------
-- Records of tp_unidad_medida_producto
-- ----------------------------
BEGIN;
INSERT INTO `tp_unidad_medida_producto` VALUES ('1', 'LTR', 'Litro'), ('2', 'Caja', 'Cajetilla'), ('3', 'Unidad', 'Und');
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
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of us_banda_usuario
-- ----------------------------
BEGIN;
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
`CS_INCENTIVO_ID`  int(4) NOT NULL ,
PRIMARY KEY (`CS_TIPO_USUARIO`),
FOREIGN KEY (`CS_INCENTIVO_ID`) REFERENCES `us_incentivo_tipo_usuario` (`CS_INCENTIVO_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `FK_INCENTIVO` (`CS_INCENTIVO_ID`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_spanish_ci
AUTO_INCREMENT=6

;

-- ----------------------------
-- Records of us_tipo_usuario
-- ----------------------------
BEGIN;
INSERT INTO `us_tipo_usuario` VALUES ('1', 'Administrador', 'Administrador', '1'), ('2', 'Banda', 'Banda', '2'), ('3', 'Usuario Normal', 'Usario Normal', '3'), ('4', 'Docente', 'que dicta clases', '4'), ('5', 'Cliente', 'Clientes que asisten al establecimiento', '1');
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
INSERT INTO `us_usuario` VALUES ('34610553', '1', 'diana', 'viveros', '3214697', '3214636790', 'edinson_gallego23152@elpoli.edu.co', null, '$2y$10$YNINJCyPd7V1ezeFMw9YDuc6of0j3PxG/U7toUD/qQAx7OGzcnaP2', '4', '1', '2018-08-28 15:31:00', '0'), ('35611553', '1', 'jairo', 'ortiz', '1200000', '8452530125', 'jairo@gmail.com', null, '$2y$10$DUbb22PcZE3R0wvwv/SZzO9ef9PIBsg6W8b10YQ5O.OjBAEZnJU2.', '2', '2', '2018-09-06 12:00:14', '0'), ('36610553', '1', 'jhon', 'valencia', '7896325', '8965635632', 'jhon@gmail.com', null, '$2y$10$6sZZ9FGEIaWYF10ZLeB40eR838NfAPd2fMzvMMgzyMve4yKRiBPWe', '2', '1', '2018-09-06 13:43:35', '0'), ('43101104', '1', 'nidia', 'valencia', '3127899', '3127852212', 'edigahe77@hotmail.com', null, '$2y$10$Mo3BAL/l6V3aH9UxdupiY.0jRJ1dWrpwaFRAlBG8FSif2VA56xQl.', '2', '1', '2018-08-25 11:15:21', '0'), ('94501690', '1', 'edinson', 'gallego', '3216366', '3216367908', 'edigahe77@gmail.com', null, '$2y$10$SMl8JxTiwCRtboFbK6yepu9fjmrps9gBAyg8nOmCqp6PfRRorUXo.', '1', '1', '2018-08-25 11:10:33', '0'), ('95501690', '1', 'juan', 'acevedo', '7896366', '1521521255', 'juan@gmail.com', null, '$2y$10$IUQ0n8aZ4WmdByRAiF9HJec4kTxkHP26mXgyar0cBf4RW0xOzXNMq', '2', '2', '2018-09-06 15:03:01', '0'), ('123456789', '2', 'ana', 'herrera', '4545632', '2563254896', 'ana@gmail.com', null, '$2y$10$nuKTZucQxy7mbMvoQt2TtOwwc9vRNZ8NjmqMIpjSMV1mfdzIOBwom', '2', '1', '2018-09-06 03:50:32', '0'), ('324343333', '1', 'pepe', 'dfsadf', '2342343', '3232432234', 'ososcar@fasdf.com', null, '$2y$10$Gj8Zas7zys..mmXtvvTzMua6eOeg8zjcIIIFNNFGoEUb1Kn0vrVm6', '2', '2', '2018-09-06 13:41:14', '0'), ('789623778', '1', 'pedro', 'perez', '12369', '789632', 'pedro@gmail.com', null, '$2y$10$29aWCUIkJ5mb8KKOevJLXuBiqiL5I8KhdGREpxJDkPOOOswp5eE7C', '1', '2', '2018-09-06 18:15:44', '0'), ('982345456', '1', 'edinson', 'herrera', '7896152', '5634565625', 'edi@gmail.com', null, '$2y$10$4Mn3cUh8c3y09VI8FJ/lHedNHQDs1jG6XKKA4ZvB9e3YbyFJd8NcO', '4', '2', '2018-09-06 18:11:48', '0'), ('987412212', '1', 'fghjk', 'cvvbnm', '5623048', '9865320765', 'ediha@gmail.com', null, '$2y$10$sYK47RC1LPsQwBIACyv79.M9l5SkHKwPnj9uBzqtUzPsW/OGj1Itq', '4', '2', '2018-09-06 19:33:20', '0'), ('1152188863', '1', 'Oscar', 'Mesa', '5804661', '3012280744', 'oscarmesa.elpoli@gmail.com', null, '$2y$10$3sTTtL17ShNLWimjwm5f6ehtn3YcfJW5BRC3aT0hSWQd4fdfWEFGi', '1', '1', '2018-09-10 19:01:51', '0'), ('1152204758', '1', 'santiago', 'betancur', '6666666', '6666666666', 'sbetancur859@gmail.com', null, '$2y$10$32AbUlynEMogC8aG/NEk6OtxD6hlD.QUjkZRWnv.C8ye3zCt87PGG', '1', '1', '2018-08-25 13:59:36', '0'), ('2147483647', '1', 'FEWDSQ', 'FEWDSA', '251486', '231546896', 'DE@GMAIL.COM', null, '$2y$10$doEZ4hYMaAxgWZiPdyyIX.hMT3HQwLWT3xAIcuA3YCBeGzKGIcGRC', '1', '2', '2018-09-06 16:14:52', '0'), ('5435843958', '3', 'asdfasdf', 'sadfsdfasdf', '2313333', '3432423333', 'oscar@gmailc.om', null, '$2y$10$sJqVbpfYBnNs482CdCgJYeRDiRXxI5mjkDP7ZjAyvwVFnPK5hOQK.', '4', '2', '2018-09-07 16:10:45', '0'), ('454385345849838', '2', 'asdfh', 'dfjsf', '3423333', '3333333333', 'fdfasfsd@gmail.com', null, '$2y$10$sOLpMBBizGbLn/M9hLBlQeHv.uBdg1iKM64wjgWgGbIP/bOL27xAG', '2', '2', '2018-09-07 16:09:12', '0'), ('877777777777777', '1', 'sdfasdf', 'adfgdgsdfg', '5555555', '5555555555', 'asdfasdf@gmail.com', null, '$2y$10$lHEjTLDk4BoEshMS7ebJHuvQDeDCpwRd5E3HXMOdWRR8ycIc3maZW', '1', '2', '2018-09-07 16:44:43', '0'), ('996954695469456', '2', 'dfgksdfgksdkfgsdfkgs', 'dskjfskf', '3432423', '4234234234', '4535345@gmail.com', null, '$2y$10$f0VW.aYOb2.nMcEkAoZVteW7MYUTWSoJr8tTEcKnFE6Ct2CdPwDZ6', '2', '2', '2018-09-07 16:13:32', '0'), ('999999999999999', '1', 'jjjjjjjj', 'jjjjj', '5555555', '5555555555', '555@gmail.com', null, '$2y$10$hxmzv4AJN4G7pJQntHvEdOtIqRwj0/JIoFRaXjZY5I6HO5K27az7W', '1', '2', '2018-09-07 16:35:21', '0');
COMMIT;

-- ----------------------------
-- Auto increment value for currencies
-- ----------------------------
ALTER TABLE `currencies` AUTO_INCREMENT=33;

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
ALTER TABLE `ft_factura` AUTO_INCREMENT=42;

-- ----------------------------
-- Auto increment value for ft_factura_detalle
-- ----------------------------
ALTER TABLE `ft_factura_detalle` AUTO_INCREMENT=24;

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
ALTER TABLE `rs_multas_reserva` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for rs_reserva_sala
-- ----------------------------
ALTER TABLE `rs_reserva_sala` AUTO_INCREMENT=40;

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
ALTER TABLE `tp_inventario_producto` AUTO_INCREMENT=15;

-- ----------------------------
-- Auto increment value for tp_producto
-- ----------------------------
ALTER TABLE `tp_producto` AUTO_INCREMENT=5;

-- ----------------------------
-- Auto increment value for tp_unidad_medida_producto
-- ----------------------------
ALTER TABLE `tp_unidad_medida_producto` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for tp_vendedor_producto
-- ----------------------------
ALTER TABLE `tp_vendedor_producto` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for us_banda_usuario
-- ----------------------------
ALTER TABLE `us_banda_usuario` AUTO_INCREMENT=1;

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
