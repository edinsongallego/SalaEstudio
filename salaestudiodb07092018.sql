/*
 Navicat Premium Data Transfer

 Source Server         : LOCAL
 Source Server Type    : MySQL
 Source Server Version : 100134
 Source Host           : localhost:3306
 Source Schema         : salaestudiodb

 Target Server Type    : MySQL
 Target Server Version : 100134
 File Encoding         : 65001

 Date: 07/09/2018 18:47:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes`  (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telefono_cliente` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email_cliente` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `direccion_cliente` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status_cliente` tinyint(4) NOT NULL,
  `date_added` datetime(0) NOT NULL,
  PRIMARY KEY (`id_cliente`) USING BTREE,
  UNIQUE INDEX `codigo_producto`(`nombre_cliente`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO `clientes` VALUES (1, 'Alex', '1234567', 'alexasd@gmail.com', 'Calle Sol', 1, '2018-05-20 20:01:29');

-- ----------------------------
-- Table structure for currencies
-- ----------------------------
DROP TABLE IF EXISTS `currencies`;
CREATE TABLE `currencies`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `precision` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `thousand_separator` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `decimal_separator` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of currencies
-- ----------------------------
INSERT INTO `currencies` VALUES (1, 'US Dollar', '$', '2', ',', '.', 'USD');
INSERT INTO `currencies` VALUES (2, 'Libra Esterlina', '&pound;', '2', ',', '.', 'GBP');
INSERT INTO `currencies` VALUES (3, 'Euro', 'â‚¬', '2', '.', ',', 'EUR');
INSERT INTO `currencies` VALUES (4, 'South African Rand', 'R', '2', '.', ',', 'ZAR');
INSERT INTO `currencies` VALUES (5, 'Danish Krone', 'kr ', '2', '.', ',', 'DKK');
INSERT INTO `currencies` VALUES (6, 'Israeli Shekel', 'NIS ', '2', ',', '.', 'ILS');
INSERT INTO `currencies` VALUES (7, 'Swedish Krona', 'kr ', '2', '.', ',', 'SEK');
INSERT INTO `currencies` VALUES (8, 'Kenyan Shilling', 'KSh ', '2', ',', '.', 'KES');
INSERT INTO `currencies` VALUES (9, 'Canadian Dollar', 'C$', '2', ',', '.', 'CAD');
INSERT INTO `currencies` VALUES (10, 'Philippine Peso', 'P ', '2', ',', '.', 'PHP');
INSERT INTO `currencies` VALUES (11, 'Indian Rupee', 'Rs. ', '2', ',', '.', 'INR');
INSERT INTO `currencies` VALUES (12, 'Australian Dollar', '$', '2', ',', '.', 'AUD');
INSERT INTO `currencies` VALUES (13, 'Singapore Dollar', 'SGD ', '2', ',', '.', 'SGD');
INSERT INTO `currencies` VALUES (14, 'Norske Kroner', 'kr ', '2', '.', ',', 'NOK');
INSERT INTO `currencies` VALUES (15, 'New Zealand Dollar', '$', '2', ',', '.', 'NZD');
INSERT INTO `currencies` VALUES (16, 'Vietnamese Dong', 'VND ', '0', '.', ',', 'VND');
INSERT INTO `currencies` VALUES (17, 'Swiss Franc', 'CHF ', '2', '\'', '.', 'CHF');
INSERT INTO `currencies` VALUES (18, 'Quetzal Guatemalteco', 'Q', '2', ',', '.', 'GTQ');
INSERT INTO `currencies` VALUES (19, 'Malaysian Ringgit', 'RM', '2', ',', '.', 'MYR');
INSERT INTO `currencies` VALUES (20, 'Real Brasile&ntilde;o', 'R$', '2', '.', ',', 'BRL');
INSERT INTO `currencies` VALUES (21, 'Thai Baht', 'THB ', '2', ',', '.', 'THB');
INSERT INTO `currencies` VALUES (22, 'Nigerian Naira', 'NGN ', '2', ',', '.', 'NGN');
INSERT INTO `currencies` VALUES (23, 'Peso Argentino', '$', '2', '.', ',', 'ARS');
INSERT INTO `currencies` VALUES (24, 'Bangladeshi Taka', 'Tk', '2', ',', '.', 'BDT');
INSERT INTO `currencies` VALUES (25, 'United Arab Emirates Dirham', 'DH ', '2', ',', '.', 'AED');
INSERT INTO `currencies` VALUES (26, 'Hong Kong Dollar', '$', '2', ',', '.', 'HKD');
INSERT INTO `currencies` VALUES (27, 'Indonesian Rupiah', 'Rp', '2', ',', '.', 'IDR');
INSERT INTO `currencies` VALUES (28, 'Peso Mexicano', '$', '2', ',', '.', 'MXN');
INSERT INTO `currencies` VALUES (29, 'Egyptian Pound', '&pound;', '2', ',', '.', 'EGP');
INSERT INTO `currencies` VALUES (30, 'Peso Colombiano', '$', '2', '.', ',', 'COP');
INSERT INTO `currencies` VALUES (31, 'West African Franc', 'CFA ', '2', ',', '.', 'XOF');
INSERT INTO `currencies` VALUES (32, 'Chinese Renminbi', 'RMB ', '2', ',', '.', 'CNY');

-- ----------------------------
-- Table structure for detalle_factura
-- ----------------------------
DROP TABLE IF EXISTS `detalle_factura`;
CREATE TABLE `detalle_factura`  (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `numero_factura` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` double NOT NULL,
  PRIMARY KEY (`id_detalle`) USING BTREE,
  INDEX `numero_cotizacion`(`numero_factura`, `id_producto`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for events
-- ----------------------------
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `color` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start` datetime(0) NOT NULL,
  `end` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of events
-- ----------------------------
INSERT INTO `events` VALUES (18, 'Reserva Banda ppi', '#008000', '2017-12-10 00:00:00', '2017-12-11 00:00:00');

-- ----------------------------
-- Table structure for facturas
-- ----------------------------
DROP TABLE IF EXISTS `facturas`;
CREATE TABLE `facturas`  (
  `id_factura` int(11) NOT NULL AUTO_INCREMENT,
  `numero_factura` int(11) NOT NULL,
  `fecha_factura` datetime(0) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `condiciones` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `total_venta` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `estado_factura` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_factura`) USING BTREE,
  UNIQUE INDEX `numero_cotizacion`(`numero_factura`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ft_factura
-- ----------------------------
DROP TABLE IF EXISTS `ft_factura`;
CREATE TABLE `ft_factura`  (
  `CS_FACTURA_ID` int(6) NOT NULL AUTO_INCREMENT,
  `DS_CODIGO_FACTURA` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `NM_DOCUMENTO_ID` int(11) NOT NULL,
  `DS_NOTAS_FACTURA` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `NM_PRECIO_SUBTOTAL` double NOT NULL,
  `NM_PRECIO_TOTAL` double NOT NULL,
  `DT_FECHA_CREACION` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CS_FACTURA_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ft_factura_detalle
-- ----------------------------
DROP TABLE IF EXISTS `ft_factura_detalle`;
CREATE TABLE `ft_factura_detalle`  (
  `CS_FACTURA_ID` int(6) NOT NULL,
  `NM_CANTIDAD_COMPRA` int(4) NOT NULL,
  `CS_PRODUCTO_ID` int(6) NOT NULL,
  `NM_PRECIO_TOTAL_PRODUCTO` double NOT NULL,
  INDEX `FK_FACTURA`(`CS_FACTURA_ID`) USING BTREE,
  INDEX `FK_PRODUTO`(`CS_PRODUCTO_ID`) USING BTREE,
  CONSTRAINT `FK_FACTURA` FOREIGN KEY (`CS_FACTURA_ID`) REFERENCES `ft_factura` (`CS_FACTURA_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PRODUTO` FOREIGN KEY (`CS_PRODUCTO_ID`) REFERENCES `tp_producto` (`CS_PRODUCTO_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for perfil
-- ----------------------------
DROP TABLE IF EXISTS `perfil`;
CREATE TABLE `perfil`  (
  `id_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_perfil`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of perfil
-- ----------------------------
INSERT INTO `perfil` VALUES (1, 'Administrador');
INSERT INTO `perfil` VALUES (2, 'Usuario');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_producto` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nombre_producto` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status_producto` tinyint(4) NOT NULL,
  `date_added` datetime(0) NOT NULL,
  `precio_producto` double NOT NULL,
  PRIMARY KEY (`id_producto`) USING BTREE,
  UNIQUE INDEX `codigo_producto`(`codigo_producto`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (2, '122', 'Gaseosa', 1, '2018-05-20 23:13:55', 2000);

-- ----------------------------
-- Table structure for rs_multas_reserva
-- ----------------------------
DROP TABLE IF EXISTS `rs_multas_reserva`;
CREATE TABLE `rs_multas_reserva`  (
  `CS_MULTA_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CS_RESERVA_ID` int(6) NOT NULL,
  `NM_VALOR_MULTA_SALA` double NOT NULL,
  `DS_ESTADO` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`CS_MULTA_ID`) USING BTREE,
  INDEX `FK_RESERVA`(`CS_RESERVA_ID`) USING BTREE,
  CONSTRAINT `FK_RESERVA` FOREIGN KEY (`CS_RESERVA_ID`) REFERENCES `rs_reserva_sala` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rs_reserva_sala
-- ----------------------------
DROP TABLE IF EXISTS `rs_reserva_sala`;
CREATE TABLE `rs_reserva_sala`  (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `documento` bigint(20) NOT NULL,
  `sala` int(4) NOT NULL,
  `start` datetime(0) NULL DEFAULT NULL,
  `end` datetime(0) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DS_ESTADO` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DT_FECHA_CREACION` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_USUARIO`(`documento`) USING BTREE,
  INDEX `FK_SALA`(`sala`) USING BTREE,
  CONSTRAINT `FK_SALA` FOREIGN KEY (`sala`) REFERENCES `rs_sala` (`CS_SALA_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_USUARIO` FOREIGN KEY (`documento`) REFERENCES `us_usuario` (`NM_DOCUMENTO_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of rs_reserva_sala
-- ----------------------------
INSERT INTO `rs_reserva_sala` VALUES (2, 43101104, 1, '2018-08-09 02:15:00', '2018-08-09 02:50:00', 'con audifonos', 'Activo', '2018-08-25 11:17:25');
INSERT INTO `rs_reserva_sala` VALUES (5, 43101104, 1, '2018-08-10 03:30:00', '2018-08-10 09:50:00', 'con audifono', 'Activo', '2018-08-27 12:48:59');
INSERT INTO `rs_reserva_sala` VALUES (6, 94501690, 1, '2018-08-10 04:25:00', '2018-08-10 05:40:00', 'con guitarra', 'Activo', '2018-08-27 12:50:33');
INSERT INTO `rs_reserva_sala` VALUES (8, 94501690, 1, '2018-08-27 03:25:00', '2018-08-27 05:20:00', 'olg', 'Activo', '2018-08-27 19:21:27');
INSERT INTO `rs_reserva_sala` VALUES (9, 34610553, 1, '2018-08-28 05:25:00', '2018-08-28 08:35:00', 'con bajo', 'Activo', '2018-08-28 15:33:21');
INSERT INTO `rs_reserva_sala` VALUES (10, 34610553, 1, '2018-08-28 08:55:00', '2018-08-28 09:55:00', 'con guitarra', 'Activo', '2018-08-28 15:36:24');
INSERT INTO `rs_reserva_sala` VALUES (11, 43101104, 1, '2018-08-28 04:15:00', '2018-08-28 04:55:00', 'con audifonos', 'Activo', '2018-08-28 15:38:06');
INSERT INTO `rs_reserva_sala` VALUES (35, 94501690, 1, '2018-08-29 03:20:00', '2018-08-29 04:30:00', 'ghjklÃ±', 'Activo', '2018-08-28 19:45:29');
INSERT INTO `rs_reserva_sala` VALUES (36, 34610553, 1, '2018-08-30 03:50:00', '2018-08-30 04:15:00', 'dfgbhnjmk', 'Activo', '2018-08-28 19:48:50');
INSERT INTO `rs_reserva_sala` VALUES (37, 94501690, 2, '2018-09-03 03:20:00', '2018-09-03 04:30:00', 'con  microfonos', 'Activo', '2018-09-02 11:09:15');
INSERT INTO `rs_reserva_sala` VALUES (38, 35611553, 1, '2018-09-08 03:25:00', '2018-09-08 05:35:00', 'con audifonos', 'Activo', '2018-09-07 14:47:27');
INSERT INTO `rs_reserva_sala` VALUES (39, 43101104, 1, '2018-09-08 03:00:00', '2018-09-08 03:20:00', 'lkjhygf', 'Activo', '2018-09-07 15:03:39');

-- ----------------------------
-- Table structure for rs_sala
-- ----------------------------
DROP TABLE IF EXISTS `rs_sala`;
CREATE TABLE `rs_sala`  (
  `CS_SALA_ID` int(4) NOT NULL AUTO_INCREMENT,
  `DS_NOMBRE_SALA` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `DS_DESCRIPCION_SALA` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `NM_VALOR_HORA_SALA` double NOT NULL,
  `NM_CAPACIDAD_SALA` int(4) NOT NULL,
  PRIMARY KEY (`CS_SALA_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of rs_sala
-- ----------------------------
INSERT INTO `rs_sala` VALUES (1, 'Sala 1', 'sala con guitarra', 42000, 8);
INSERT INTO `rs_sala` VALUES (2, 'Sala 2', 'Sala 2', 45000, 12);

-- ----------------------------
-- Table structure for tmp
-- ----------------------------
DROP TABLE IF EXISTS `tmp`;
CREATE TABLE `tmp`  (
  `id_tmp` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `cantidad_tmp` int(11) NOT NULL,
  `precio_tmp` double(8, 2) NULL DEFAULT NULL,
  `session_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tmp`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tp_inventario_producto
-- ----------------------------
DROP TABLE IF EXISTS `tp_inventario_producto`;
CREATE TABLE `tp_inventario_producto`  (
  `CS_INVENTARIO_ID` int(6) NOT NULL AUTO_INCREMENT,
  `CS_PRODUCTO_ID` int(6) NOT NULL,
  `NM_CANTIDAD_INVENTARIO` int(4) NOT NULL,
  `NM_PRECIO_UNITARIO_COMPRA` double NOT NULL,
  `NM_PRECIO_UNITARIO_VENTA` double NOT NULL,
  `CS_VENDEDOR_PRODUCTO_ID` int(6) NOT NULL,
  `DT_FECHA_CREACION` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CS_INVENTARIO_ID`) USING BTREE,
  INDEX `FK_PRODUCTO`(`CS_PRODUCTO_ID`) USING BTREE,
  INDEX `FK_VENDEDOR`(`CS_VENDEDOR_PRODUCTO_ID`) USING BTREE,
  CONSTRAINT `FK_PRODUCTO` FOREIGN KEY (`CS_PRODUCTO_ID`) REFERENCES `tp_producto` (`CS_PRODUCTO_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_VENDEDOR` FOREIGN KEY (`CS_VENDEDOR_PRODUCTO_ID`) REFERENCES `tp_vendedor_producto` (`CS_VENDEDOR_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tp_producto
-- ----------------------------
DROP TABLE IF EXISTS `tp_producto`;
CREATE TABLE `tp_producto`  (
  `CS_PRODUCTO_ID` int(6) NOT NULL AUTO_INCREMENT,
  `DS_CODIGO_PRODUCTO` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `DS_NOMBRE_PRODUCTO` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `DS_DESCRIPCION_PRODUCTO` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `NM_PRESENTACION_PRODUCTO` int(10) NOT NULL,
  `FK_UNIDAD` int(6) NOT NULL,
  `DT_FECHA_CREACION` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CS_PRODUCTO_ID`) USING BTREE,
  INDEX `FK_UNIDAD`(`FK_UNIDAD`) USING BTREE,
  CONSTRAINT `FK_UNIDAD` FOREIGN KEY (`FK_UNIDAD`) REFERENCES `tp_unidad_medida_producto` (`CS_UNIDAD_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tp_unidad_medida_producto
-- ----------------------------
DROP TABLE IF EXISTS `tp_unidad_medida_producto`;
CREATE TABLE `tp_unidad_medida_producto`  (
  `CS_UNIDAD_ID` int(6) NOT NULL,
  `DS_NOMBRE_UNIDAD` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `DS_DESCRIPCION_UNIDAD` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CS_UNIDAD_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tp_vendedor_producto
-- ----------------------------
DROP TABLE IF EXISTS `tp_vendedor_producto`;
CREATE TABLE `tp_vendedor_producto`  (
  `CS_VENDEDOR_ID` int(6) NOT NULL AUTO_INCREMENT,
  `DS_NOMBRE_VENDEDOR` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `DS_DESCRIPCION_VENDEDOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CS_VENDEDOR_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for us_banda_detalle_usuario
-- ----------------------------
DROP TABLE IF EXISTS `us_banda_detalle_usuario`;
CREATE TABLE `us_banda_detalle_usuario`  (
  `CS_BANDA_ID` bigint(20) NULL DEFAULT NULL,
  `NM_DOCUMENTO_ID` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of us_banda_detalle_usuario
-- ----------------------------
INSERT INTO `us_banda_detalle_usuario` VALUES (1, 1);
INSERT INTO `us_banda_detalle_usuario` VALUES (13123, 13123);

-- ----------------------------
-- Table structure for us_banda_usuario
-- ----------------------------
DROP TABLE IF EXISTS `us_banda_usuario`;
CREATE TABLE `us_banda_usuario`  (
  `CS_BANDA_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DS_NOMBRE_BANDA` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_contacto_banda` int(11) NOT NULL,
  `DS_DESCRIPCION_BANDA` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CS_BANDA_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 555555555555556 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of us_banda_usuario
-- ----------------------------
INSERT INTO `us_banda_usuario` VALUES (13123, 'PPI Prueba', 13123, 'Bnada de rock');
INSERT INTO `us_banda_usuario` VALUES (12345678, 'orelma', 12345678, 'orelma');
INSERT INTO `us_banda_usuario` VALUES (14563226, 'asdfgh', 14563226, 'asdfg');
INSERT INTO `us_banda_usuario` VALUES (24896326, 'swderftgh', 24896326, 'asdfgh');
INSERT INTO `us_banda_usuario` VALUES (43110985, 'calidad', 43110985, 'salsa');
INSERT INTO `us_banda_usuario` VALUES (44610553, 'los chamos2', 44610553, 'trio');
INSERT INTO `us_banda_usuario` VALUES (64896321, 'los beatles', 64896321, 'vbnm,');
INSERT INTO `us_banda_usuario` VALUES (98741236, 'asdf', 98741236, 'asdf');
INSERT INTO `us_banda_usuario` VALUES (123697412, 'dfghj', 123697412, 'vbnm,');
INSERT INTO `us_banda_usuario` VALUES (321458963, 'tolosas', 321458963, 'kjhgfd');
INSERT INTO `us_banda_usuario` VALUES (2147483647, 'los tesos', 2147483647, 'sol ');
INSERT INTO `us_banda_usuario` VALUES (555555555555555, 'dskfaskdf', 2147483647, 'aksdfkasdjfkajsdfjaskdf');

-- ----------------------------
-- Table structure for us_contactos_banda_usuario
-- ----------------------------
DROP TABLE IF EXISTS `us_contactos_banda_usuario`;
CREATE TABLE `us_contactos_banda_usuario`  (
  `NM_DOCUMENTO_CONTACTO_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CS_TIPO_DOCUMENTO_ID` int(4) NOT NULL,
  `DS_NOMBRE_CONTACTO` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `DS_APELLIDO_CONTACTO` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `DS_CORREO_CONTACTO` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`NM_DOCUMENTO_CONTACTO_ID`) USING BTREE,
  INDEX `FK_TIPO_DOCUMENTO_CONTACTO`(`CS_TIPO_DOCUMENTO_ID`) USING BTREE,
  CONSTRAINT `FK_TIPO_DOCUMENTO_CONTACTO` FOREIGN KEY (`CS_TIPO_DOCUMENTO_ID`) REFERENCES `us_tipo_documento` (`CS_TIPO_DOCUMENTO_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 555555555555556 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of us_contactos_banda_usuario
-- ----------------------------
INSERT INTO `us_contactos_banda_usuario` VALUES (123123, 1, 'Alexander', 'Chalarca Caro', 'asd@gmail.com');
INSERT INTO `us_contactos_banda_usuario` VALUES (1231564, 1, 'rbd', 'rbd', 'rbd@sd.com');
INSERT INTO `us_contactos_banda_usuario` VALUES (12345678, 1, 'orelma', 'orelma', 'orelma@gmail.com');
INSERT INTO `us_contactos_banda_usuario` VALUES (14563226, 2, 'maria', 'flores', 'maria@gmail.com');
INSERT INTO `us_contactos_banda_usuario` VALUES (24896326, 1, 'asdfghj', 'asdfgh', 'asdfg@hotmail.com');
INSERT INTO `us_contactos_banda_usuario` VALUES (43101553, 1, 'ertyu', 'ertyui', 'ed@gmail.com');
INSERT INTO `us_contactos_banda_usuario` VALUES (43110985, 1, 'marta', 'acecas', 'marta@gmail.com');
INSERT INTO `us_contactos_banda_usuario` VALUES (44610553, 1, 'marcela', 'galindo', 'egalindo@hotmail.com');
INSERT INTO `us_contactos_banda_usuario` VALUES (64896321, 1, 'felipe', 'aguilar', 'pipe@gmail.com');
INSERT INTO `us_contactos_banda_usuario` VALUES (94501690, 1, 'Edinson', 'Gallego', 'edg@gmail.com');
INSERT INTO `us_contactos_banda_usuario` VALUES (98741236, 1, 'sdfghj', 'asdfvgbhedfg', 'asdfg@gmail.com');
INSERT INTO `us_contactos_banda_usuario` VALUES (123697412, 1, 'qwertyui', 'fghjk', 'sdfghjk@gmail.com');
INSERT INTO `us_contactos_banda_usuario` VALUES (321458963, 1, 'kljhgfdsa', 'awsedrftgyhujik', 'tolosa@gmail.com');
INSERT INTO `us_contactos_banda_usuario` VALUES (1017238239, 1, 'Alexander', 'Chalarca Caro', 'desarrollo@kubbox.com');
INSERT INTO `us_contactos_banda_usuario` VALUES (2147483647, 1, 'builes', 'gsaa', 'edg@gmail.com');
INSERT INTO `us_contactos_banda_usuario` VALUES (555555555555555, 1, 'klgksdg', 'fdgsdgf', 'gsdfg@gmail.com');

-- ----------------------------
-- Table structure for us_estado_usuario
-- ----------------------------
DROP TABLE IF EXISTS `us_estado_usuario`;
CREATE TABLE `us_estado_usuario`  (
  `CS_ESTADO_ID` int(4) NOT NULL AUTO_INCREMENT,
  `DS_NOMBRE_ESTADO` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `DS_DESCRIPCION_ESTADO` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CS_ESTADO_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of us_estado_usuario
-- ----------------------------
INSERT INTO `us_estado_usuario` VALUES (1, 'Activo', 'Activo');
INSERT INTO `us_estado_usuario` VALUES (2, 'Inactivo', 'Inactivo');

-- ----------------------------
-- Table structure for us_incentivo_tipo_usuario
-- ----------------------------
DROP TABLE IF EXISTS `us_incentivo_tipo_usuario`;
CREATE TABLE `us_incentivo_tipo_usuario`  (
  `CS_INCENTIVO_ID` int(4) NOT NULL AUTO_INCREMENT,
  `DS_NOMBRE_INCENTIVO` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `DS_DESCRIPCION_INCENTIVO` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `NM_VALOR_PORCENTAJE_INCENTIVO` double NOT NULL,
  PRIMARY KEY (`CS_INCENTIVO_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of us_incentivo_tipo_usuario
-- ----------------------------
INSERT INTO `us_incentivo_tipo_usuario` VALUES (1, 'Admin', 'Administrador', 100);
INSERT INTO `us_incentivo_tipo_usuario` VALUES (2, 'Banda', 'Banda', 50);
INSERT INTO `us_incentivo_tipo_usuario` VALUES (3, 'Normal', 'Normal', 30);
INSERT INTO `us_incentivo_tipo_usuario` VALUES (4, 'Docente', 'Se aplica descuento del 20 %', 20);

-- ----------------------------
-- Table structure for us_tipo_documento
-- ----------------------------
DROP TABLE IF EXISTS `us_tipo_documento`;
CREATE TABLE `us_tipo_documento`  (
  `CS_TIPO_DOCUMENTO_ID` int(4) NOT NULL AUTO_INCREMENT,
  `DS_NOMBRE_TIPO_DOCUMENTO` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `DS_DESCRIPCION_TIPO_DOCUMENTO` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CS_TIPO_DOCUMENTO_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of us_tipo_documento
-- ----------------------------
INSERT INTO `us_tipo_documento` VALUES (1, 'Cédula Ciudadanía', 'Cédula Ciudadanía');
INSERT INTO `us_tipo_documento` VALUES (2, 'Tarjeta Identidad', 'Tarjeta Identidad');
INSERT INTO `us_tipo_documento` VALUES (3, 'Pasaporte', 'Pasaporte');
INSERT INTO `us_tipo_documento` VALUES (4, 'Cédula Extranjera ', 'Cédula Extranjera');

-- ----------------------------
-- Table structure for us_tipo_usuario
-- ----------------------------
DROP TABLE IF EXISTS `us_tipo_usuario`;
CREATE TABLE `us_tipo_usuario`  (
  `CS_TIPO_USUARIO` int(4) NOT NULL AUTO_INCREMENT,
  `DS_NOMBRE_TIPO_USUARIO` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `DS_DESCRIPCION_TIPO_USUARIO` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `CS_INCENTIVO_ID` int(4) NOT NULL,
  PRIMARY KEY (`CS_TIPO_USUARIO`) USING BTREE,
  INDEX `FK_INCENTIVO`(`CS_INCENTIVO_ID`) USING BTREE,
  CONSTRAINT `FK_INCENTIVO` FOREIGN KEY (`CS_INCENTIVO_ID`) REFERENCES `us_incentivo_tipo_usuario` (`CS_INCENTIVO_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of us_tipo_usuario
-- ----------------------------
INSERT INTO `us_tipo_usuario` VALUES (1, 'Administrador', 'Administrador', 1);
INSERT INTO `us_tipo_usuario` VALUES (2, 'Banda', 'Banda', 2);
INSERT INTO `us_tipo_usuario` VALUES (3, 'Usuario Normal', 'Usario Normal', 3);
INSERT INTO `us_tipo_usuario` VALUES (4, 'Docente', 'que dicta clases', 4);

-- ----------------------------
-- Table structure for us_usuario
-- ----------------------------
DROP TABLE IF EXISTS `us_usuario`;
CREATE TABLE `us_usuario`  (
  `NM_DOCUMENTO_ID` bigint(20) NOT NULL,
  `CS_TIPO_DOCUMENTO_ID` int(4) NOT NULL,
  `DS_NOMBRES_USUARIO` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `DS_APELLIDOS_USUARIO` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `NM_TELEFONO` int(7) NULL DEFAULT NULL,
  `NM_CELULAR` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `DS_CORREO` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `DS_CONTRASENA` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `CS_TIPO_USUARIO_ID` int(4) NOT NULL,
  `CS_ESTADO_ID` int(4) NOT NULL,
  `DT_FECHA_CREACION` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RESTAURAR_CONTRASENA` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`NM_DOCUMENTO_ID`) USING BTREE,
  INDEX `FK_TIPO_USUARIO`(`CS_TIPO_USUARIO_ID`) USING BTREE,
  INDEX `FK_ESTADO`(`CS_ESTADO_ID`) USING BTREE,
  INDEX `FK_TIPO_DOCUMENTO`(`CS_TIPO_DOCUMENTO_ID`) USING BTREE,
  CONSTRAINT `FK_ESTADO` FOREIGN KEY (`CS_ESTADO_ID`) REFERENCES `us_estado_usuario` (`CS_ESTADO_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_TIPO_DOCUMENTO` FOREIGN KEY (`CS_TIPO_DOCUMENTO_ID`) REFERENCES `us_tipo_documento` (`CS_TIPO_DOCUMENTO_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_TIPO_USUARIO` FOREIGN KEY (`CS_TIPO_USUARIO_ID`) REFERENCES `us_tipo_usuario` (`CS_TIPO_USUARIO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of us_usuario
-- ----------------------------
INSERT INTO `us_usuario` VALUES (34610553, 1, 'diana', 'viveros', 3214697, '3214636790', 'edinson_gallego23152@elpoli.edu.co', '$2y$10$YNINJCyPd7V1ezeFMw9YDuc6of0j3PxG/U7toUD/qQAx7OGzcnaP2', 4, 1, '2018-08-28 15:31:00', 0);
INSERT INTO `us_usuario` VALUES (35611553, 1, 'jairo', 'ortiz', 1200000, '8452530125', 'jairo@gmail.com', '$2y$10$DUbb22PcZE3R0wvwv/SZzO9ef9PIBsg6W8b10YQ5O.OjBAEZnJU2.', 2, 2, '2018-09-06 12:00:14', 0);
INSERT INTO `us_usuario` VALUES (36610553, 1, 'jhon', 'valencia', 7896325, '8965635632', 'jhon@gmail.com', '$2y$10$6sZZ9FGEIaWYF10ZLeB40eR838NfAPd2fMzvMMgzyMve4yKRiBPWe', 2, 1, '2018-09-06 13:43:35', 0);
INSERT INTO `us_usuario` VALUES (43101104, 1, 'nidia', 'valencia', 3127899, '3127852212', 'edigahe77@hotmail.com', '$2y$10$Mo3BAL/l6V3aH9UxdupiY.0jRJ1dWrpwaFRAlBG8FSif2VA56xQl.', 2, 1, '2018-08-25 11:15:21', 0);
INSERT INTO `us_usuario` VALUES (94501690, 1, 'edinson', 'gallego', 3216366, '3216367908', 'edigahe77@gmail.com', '$2y$10$SMl8JxTiwCRtboFbK6yepu9fjmrps9gBAyg8nOmCqp6PfRRorUXo.', 1, 1, '2018-08-25 11:10:33', 0);
INSERT INTO `us_usuario` VALUES (95501690, 1, 'juan', 'acevedo', 7896366, '1521521255', 'juan@gmail.com', '$2y$10$IUQ0n8aZ4WmdByRAiF9HJec4kTxkHP26mXgyar0cBf4RW0xOzXNMq', 2, 2, '2018-09-06 15:03:01', 0);
INSERT INTO `us_usuario` VALUES (123456789, 2, 'ana', 'herrera', 4545632, '2563254896', 'ana@gmail.com', '$2y$10$nuKTZucQxy7mbMvoQt2TtOwwc9vRNZ8NjmqMIpjSMV1mfdzIOBwom', 2, 1, '2018-09-06 03:50:32', 0);
INSERT INTO `us_usuario` VALUES (324343333, 1, 'pepe', 'dfsadf', 2342343, '3232432234', 'ososcar@fasdf.com', '$2y$10$Gj8Zas7zys..mmXtvvTzMua6eOeg8zjcIIIFNNFGoEUb1Kn0vrVm6', 2, 2, '2018-09-06 13:41:14', 0);
INSERT INTO `us_usuario` VALUES (789623778, 1, 'pedro', 'perez', 12369, '789632', 'pedro@gmail.com', '$2y$10$29aWCUIkJ5mb8KKOevJLXuBiqiL5I8KhdGREpxJDkPOOOswp5eE7C', 1, 2, '2018-09-06 18:15:44', 0);
INSERT INTO `us_usuario` VALUES (982345456, 1, 'edinson', 'herrera', 7896152, '5634565625', 'edi@gmail.com', '$2y$10$4Mn3cUh8c3y09VI8FJ/lHedNHQDs1jG6XKKA4ZvB9e3YbyFJd8NcO', 4, 2, '2018-09-06 18:11:48', 0);
INSERT INTO `us_usuario` VALUES (987412212, 1, 'fghjk', 'cvvbnm', 5623048, '9865320765', 'ediha@gmail.com', '$2y$10$sYK47RC1LPsQwBIACyv79.M9l5SkHKwPnj9uBzqtUzPsW/OGj1Itq', 4, 2, '2018-09-06 19:33:20', 0);
INSERT INTO `us_usuario` VALUES (1152204758, 1, 'santiago', 'betancur', 6666666, '6666666666', 'sbetancur859@gmail.com', '$2y$10$32AbUlynEMogC8aG/NEk6OtxD6hlD.QUjkZRWnv.C8ye3zCt87PGG', 1, 1, '2018-08-25 13:59:36', 0);
INSERT INTO `us_usuario` VALUES (2147483647, 1, 'FEWDSQ', 'FEWDSA', 251486, '231546896', 'DE@GMAIL.COM', '$2y$10$doEZ4hYMaAxgWZiPdyyIX.hMT3HQwLWT3xAIcuA3YCBeGzKGIcGRC', 1, 2, '2018-09-06 16:14:52', 0);
INSERT INTO `us_usuario` VALUES (5435843958, 3, 'asdfasdf', 'sadfsdfasdf', 2313333, '3432423333', 'oscar@gmailc.om', '$2y$10$sJqVbpfYBnNs482CdCgJYeRDiRXxI5mjkDP7ZjAyvwVFnPK5hOQK.', 4, 2, '2018-09-07 16:10:45', 0);
INSERT INTO `us_usuario` VALUES (454385345849838, 2, 'asdfh', 'dfjsf', 3423333, '3333333333', 'fdfasfsd@gmail.com', '$2y$10$sOLpMBBizGbLn/M9hLBlQeHv.uBdg1iKM64wjgWgGbIP/bOL27xAG', 2, 2, '2018-09-07 16:09:12', 0);
INSERT INTO `us_usuario` VALUES (877777777777777, 1, 'sdfasdf', 'adfgdgsdfg', 5555555, '5555555555', 'asdfasdf@gmail.com', '$2y$10$lHEjTLDk4BoEshMS7ebJHuvQDeDCpwRd5E3HXMOdWRR8ycIc3maZW', 1, 2, '2018-09-07 16:44:43', 0);
INSERT INTO `us_usuario` VALUES (996954695469456, 2, 'dfgksdfgksdkfgsdfkgs', 'dskjfskf', 3432423, '4234234234', '4535345@gmail.com', '$2y$10$f0VW.aYOb2.nMcEkAoZVteW7MYUTWSoJr8tTEcKnFE6Ct2CdPwDZ6', 2, 2, '2018-09-07 16:13:32', 0);
INSERT INTO `us_usuario` VALUES (999999999999999, 1, 'jjjjjjjj', 'jjjjj', 5555555, '5555555555', '555@gmail.com', '$2y$10$hxmzv4AJN4G7pJQntHvEdOtIqRwj0/JIoFRaXjZY5I6HO5K27az7W', 1, 2, '2018-09-07 16:35:21', 0);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'auto incrementing user_id of each user, unique index',
  `firstname` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'user\'s name, unique',
  `user_password_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'user\'s password in salted and hashed format',
  `user_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'user\'s email, unique',
  `id_perfil` int(11) NOT NULL,
  `date_added` datetime(0) NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `user_name`(`user_name`) USING BTREE,
  UNIQUE INDEX `user_email`(`user_email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'user data' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Edinson', 'Gallego', 'edinson', '$2y$10$ghzIntu0DDpa3FQsHF7P5uoqlXqVQfev8L0QUgGGgHAQunqpe1gG2', 'edigahe77@gmail.com', 1, '2018-05-24 08:19:54');
INSERT INTO `users` VALUES (2, 'santiago', 'betancourt', 'santiago', '$2y$10$JidBywLyCCN.LOu/.WxWMOosJrMq1LhG9XDoFI/RctFuVGo4.WNyW', 'santiago2@hotmail.com', 1, '2018-05-27 17:42:34');
INSERT INTO `users` VALUES (12, 'camilo', 'gutierrez', 'camilo', '$2y$10$fbMktTPBINeorreMvm9tK.TVAiaLqBHbJw.FqndhfXa/Zrlaf6ApS', 'camilo10@hotmail.com', 2, '2018-05-27 17:56:00');

SET FOREIGN_KEY_CHECKS = 1;
