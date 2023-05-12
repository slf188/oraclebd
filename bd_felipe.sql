select * from tab;

-- empresa
insert into EMPRESA values ('EMP-01', 'Ecuafields', 'Palora', 'ecuafields.com', 'Empresa');

-- sucursales
insert into sucursal values ('S-1', 'EMP-01', '111', 'Uno');
insert into sucursal values ('S-2', 'EMP-01', '222', 'Dos');
insert into sucursal values ('S-3', 'EMP-01', '333', 'Tres');
insert into sucursal values ('S-4', 'EMP-01', '444', 'Cuatro');
insert into sucursal values ('S-5', 'EMP-01', '555', 'Cinco');

-- 1 bodega por cada sucursal
insert into bodega values ('B-1', 'S-1', 'Primera dir', '1');
insert into bodega values ('B-2', 'S-2', 'Segunda dir', '2');
insert into bodega values ('B-3', 'S-3', 'Tercera dir', '3');
insert into bodega values ('B-4', 'S-4', 'Cuarta dir', '4');
insert into bodega values ('B-5', 'S-5', 'Quinta dir', '5');

-- cliente sucursal-1
insert into cliente values ('1', 'S-1', 'Felipe', 'Dir Felipe');
insert into cliente values ('2', 'S-1', 'Marcelo', 'Dir Marcelo');
insert into cliente values ('3', 'S-1', 'Jose', 'Dir Jose');
insert into cliente values ('4', 'S-1', 'Antonio', 'Dir Antonio');
insert into cliente values ('5', 'S-1', 'Marco', 'Dir Marco');
insert into cliente values ('6', 'S-1', 'Evelyn', 'Dir Evelyn');
insert into cliente values ('7', 'S-1', 'Gabriela', 'Dir Gabriela');
insert into cliente values ('8', 'S-1', 'Joselyn', 'Dir Joselyn');
insert into cliente values ('9', 'S-1', 'Sebastian', 'Dir Sebastian');
insert into cliente values ('10', 'S-1', 'Alejandra', 'Dir Alejandra');
insert into cliente values ('11', 'S-1', 'Monica', 'Dir Monica');
insert into cliente values ('12', 'S-1', 'David', 'Dir David');
insert into cliente values ('13', 'S-1', 'Camila', 'Dir Camila');
insert into cliente values ('14', 'S-1', 'Mishel', 'Dir Mishel');
insert into cliente values ('15', 'S-1', 'Nicolas', 'Dir Nicolas');
insert into cliente values ('16', 'S-1', 'Alejandro', 'Dir Alejandro');
insert into cliente values ('17', 'S-1', 'Fernando', 'Dir Fernando');
insert into cliente values ('18', 'S-1', 'Fernanda', 'Dir Fernanda');
insert into cliente values ('19', 'S-1', 'Ariel', 'Dir Ariel');
insert into cliente values ('20', 'S-1', 'Cristian', 'Dir Cristian');
insert into cliente values ('21', 'S-1', 'Cristina', 'Dir Cristina');
insert into cliente values ('22', 'S-1', 'Isabela', 'Dir Isabela');
insert into cliente values ('23', 'S-1', 'Maria', 'Dir Maria');
insert into cliente values ('24', 'S-1', 'Mario', 'Dir Mario');
insert into cliente values ('25', 'S-1', 'Luigi', 'Dir Luigi');
insert into cliente values ('26', 'S-1', 'Browser', 'Dir Browser');
insert into cliente values ('27', 'S-1', 'Peach', 'Dir Peach');
insert into cliente values ('28', 'S-1', 'Toad', 'Dir Toad');
insert into cliente values ('29', 'S-1', 'Oden', 'Dir Oden');
insert into cliente values ('30', 'S-1', 'Luffy', 'Dir Luffy');
-- cliente sucursal-2
INSERT INTO cliente values ('31', 'S-2', 'Zoro', 'Dir Zoro');
INSERT INTO cliente values ('32', 'S-2', 'Nami', 'Dir Nami');
INSERT INTO cliente values ('33', 'S-2', 'Sanji', 'Dir Sanji');
INSERT INTO cliente values ('34', 'S-2', 'Usopp', 'Dir Usopp');
INSERT INTO cliente values ('35', 'S-2', 'Robin', 'Dir Robin');
INSERT INTO cliente values ('36', 'S-2', 'Franky', 'Dir Franky');
INSERT INTO cliente values ('37', 'S-2', 'Brook', 'Dir Brook');
INSERT INTO cliente values ('38', 'S-2', 'Chopper', 'Dir Chopper');
INSERT INTO cliente values ('39', 'S-2', 'Roger', 'Dir Roger');
INSERT INTO cliente values ('40', 'S-2', 'Shanks', 'Dir Shanks');
INSERT INTO cliente values ('41', 'S-2', 'Kaido', 'Dir Kaido');
INSERT INTO cliente values ('42', 'S-2', 'King', 'Dir King');
INSERT INTO cliente values ('43', 'S-2', 'Queen', 'Dir Queen');
INSERT INTO cliente values ('44', 'S-2', 'Jack', 'Dir Jack');
INSERT INTO cliente values ('45', 'S-2', 'Jinbe', 'Dir Jinbe');
INSERT INTO cliente values ('46', 'S-2', 'Carlos', 'Dir Carlos');
INSERT INTO cliente values ('47', 'S-2', 'Dragon', 'Dir Dragon');
INSERT INTO cliente values ('48', 'S-2', 'Sabo', 'Dir Sabo');
INSERT INTO cliente values ('49', 'S-2', 'Ace', 'Dir Ace');
INSERT INTO cliente values ('50', 'S-2', 'Benn', 'Dir Benn');
INSERT INTO cliente values ('51', 'S-2', 'Law', 'Dir Law');
INSERT INTO cliente values ('52', 'S-2', 'Kizaru', 'Dir Kizaru');
INSERT INTO cliente values ('53', 'S-2', 'Borsalino', 'Dir Borsalino');
INSERT INTO cliente values ('54', 'S-2', 'Akainu', 'Dir Akainu');
INSERT INTO cliente values ('55', 'S-2', 'Sakazuki', 'Dir Sakasuki');
INSERT INTO cliente values ('56', 'S-2', 'Aokiji', 'Dir Aokiji');
INSERT INTO cliente values ('57', 'S-2', 'Ivan', 'Dir Ivan');
INSERT INTO cliente values ('58', 'S-2', 'Doflamingo', 'Dir Doflamingo');
INSERT INTO cliente values ('59', 'S-2', 'Crocodile', 'Dir Crocodile');
INSERT INTO cliente values ('60', 'S-2', 'Kuzan', 'Dir Kuzan');
-- cliente sucursal-3
INSERT INTO cliente VALUES ('61', 'S-3', 'Goku', 'Dir Goku');
INSERT INTO cliente VALUES ('62', 'S-3', 'Vegeta', 'Dir Vegeta');
INSERT INTO cliente VALUES ('63', 'S-3', 'Gohan', 'Dir Gohan');
INSERT INTO cliente VALUES ('64', 'S-3', 'Piccolo', 'Dir Piccolo');
INSERT INTO cliente VALUES ('65', 'S-3', 'Krillin', 'Dir Krillin');
INSERT INTO cliente VALUES ('66', 'S-3', 'Tien', 'Dir Tien');
INSERT INTO cliente VALUES ('67', 'S-3', 'Yamcha', 'Dir Yamcha');
INSERT INTO cliente VALUES ('68', 'S-3', 'Chiaotzu', 'Dir Chiaotzu');
INSERT INTO cliente VALUES ('69', 'S-3', 'Trunks', 'Dir Trunks');
INSERT INTO cliente VALUES ('70', 'S-3', 'Goten', 'Dir Goten');
INSERT INTO cliente VALUES ('71', 'S-3', 'Bulma', 'Dir Bulma');
INSERT INTO cliente VALUES ('72', 'S-3', 'Chi-Chi', 'Dir Chi-Chi');
INSERT INTO cliente VALUES ('73', 'S-3', 'Master Roshi', 'Dir Master Roshi');
INSERT INTO cliente VALUES ('74', 'S-3', 'Android 18', 'Dir Android 18');
INSERT INTO cliente VALUES ('75', 'S-3', 'Android 17', 'Dir Android 17');
INSERT INTO cliente VALUES ('76', 'S-3', 'Android 16', 'Dir Android 16');
INSERT INTO cliente VALUES ('77', 'S-3', 'Cell', 'Dir Cell');
INSERT INTO cliente VALUES ('78', 'S-3', 'Frieza', 'Dir Frieza');
INSERT INTO cliente VALUES ('79', 'S-3', 'Majin Buu', 'Dir Majin Buu');
INSERT INTO cliente VALUES ('80', 'S-3', 'Beerus', 'Dir Beerus');
INSERT INTO cliente VALUES ('81', 'S-3', 'Whis', 'Dir Whis');
INSERT INTO cliente VALUES ('82', 'S-3', 'Zamasu', 'Dir Zamasu');
INSERT INTO cliente VALUES ('83', 'S-3', 'Hit', 'Dir Hit');
INSERT INTO cliente VALUES ('84', 'S-3', 'Jiren', 'Dir Jiren');
INSERT INTO cliente VALUES ('85', 'S-3', 'Cabba', 'Dir Cabba');
INSERT INTO cliente VALUES ('86', 'S-3', 'Kale', 'Dir Kale');
INSERT INTO cliente VALUES ('87', 'S-3', 'Caulifla', 'Dir Caulifla');
INSERT INTO cliente VALUES ('88', 'S-3', 'Toppo', 'Dir Toppo');
INSERT INTO cliente VALUES ('89', 'S-3', 'Vegito', 'Dir Vegito');
INSERT INTO cliente VALUES ('90', 'S-3', 'Gogeta', 'Dir Gogeta');
-- cliente sucursal-4
INSERT INTO cliente VALUES ('91', 'S-4', 'Light Yagami', 'Dir Light Yagami');
INSERT INTO cliente VALUES ('92', 'S-4', 'L Lawliet', 'Dir L Lawliet');
INSERT INTO cliente VALUES ('93', 'S-4', 'Misa Amane', 'Dir Misa Amane');
INSERT INTO cliente VALUES ('94', 'S-4', 'Ryuk', 'Dir Ryuk');
INSERT INTO cliente VALUES ('95', 'S-4', 'Rem', 'Dir Rem');
INSERT INTO cliente VALUES ('96', 'S-4', 'Near', 'Dir Near');
INSERT INTO cliente VALUES ('97', 'S-4', 'Mello', 'Dir Mello');
INSERT INTO cliente VALUES ('98', 'S-4', 'Teru Mikami', 'Dir Teru Mikami');
INSERT INTO cliente VALUES ('99', 'S-4', 'Soichiro Yagami', 'Dir Soichiro Yagami');
INSERT INTO cliente VALUES ('100', 'S-4', 'Sayu Yagami', 'Dir Sayu Yagami');
INSERT INTO cliente VALUES ('101', 'S-4', 'Naomi Misora', 'Dir Naomi Misora');
INSERT INTO cliente VALUES ('102', 'S-4', 'Matt', 'Dir Matt');
INSERT INTO cliente VALUES ('103', 'S-4', 'Mello', 'Dir Mello');
INSERT INTO cliente VALUES ('104', 'S-4', 'Halle Lidner', 'Dir Halle Lidner');
INSERT INTO cliente VALUES ('105', 'S-4', 'Roger Ruvie', 'Dir Roger Ruvie');
INSERT INTO cliente VALUES ('106', 'S-4', 'Anthony Rester', 'Dir Anthony Rester');
INSERT INTO cliente VALUES ('107', 'S-4', 'Beyond Birthday', 'Dir Beyond Birthday');
INSERT INTO cliente VALUES ('108', 'S-4', 'Mihael Keehl', 'Dir Mihael Keehl');
INSERT INTO cliente VALUES ('109', 'S-4', 'Kyosuke Higuchi', 'Dir Kyosuke Higuchi');
INSERT INTO cliente VALUES ('110', 'S-4', 'Takada Kiyomi', 'Dir Takada Kiyomi');
INSERT INTO cliente VALUES ('111', 'S-4', 'Hideki Ide', 'Dir Hideki Ide');
INSERT INTO cliente VALUES ('112', 'S-4', 'Shuichi Aizawa', 'Dir Shuichi Aizawa');
INSERT INTO cliente VALUES ('113', 'S-4', 'Kanzo Mogi', 'Dir Kanzo Mogi');
INSERT INTO cliente VALUES ('114', 'S-4', 'Sachiko Yagami', 'Dir Sachiko Yagami');
INSERT INTO cliente VALUES ('115', 'S-4', 'Raye Penber', 'Dir Raye Penber');
INSERT INTO cliente VALUES ('116', 'S-4', 'Wedy', 'Dir Wedy');
INSERT INTO cliente VALUES ('117', 'S-4', 'Hal Lidner', 'Dir Hal Lidner');
INSERT INTO cliente VALUES ('118', 'S-4', 'Reiji Namikawa', 'Dir Reiji Namikawa');
INSERT INTO cliente VALUES ('119', 'S-4', 'Shingo Mido', 'Dir Shingo Mido');
INSERT INTO cliente VALUES ('120', 'S-4', 'Shinzo', 'Dir Shinzo');
-- cliente sucursal-5
INSERT INTO cliente VALUES ('121', 'S-5', 'Naruto Uzumaki', 'Dir Naruto Uzumaki');
INSERT INTO cliente VALUES ('122', 'S-5', 'Sasuke Uchiha', 'Dir Sasuke Uchiha');
INSERT INTO cliente VALUES ('123', 'S-5', 'Sakura Haruno', 'Dir Sakura Haruno');
INSERT INTO cliente VALUES ('124', 'S-5', 'Kakashi Hatake', 'Dir Kakashi Hatake');
INSERT INTO cliente VALUES ('125', 'S-5', 'Shikamaru Nara', 'Dir Shikamaru Nara');
INSERT INTO cliente VALUES ('126', 'S-5', 'Hinata Hyuga', 'Dir Hinata Hyuga');
INSERT INTO cliente VALUES ('127', 'S-5', 'Rock Lee', 'Dir Rock Lee');
INSERT INTO cliente VALUES ('128', 'S-5', 'Neji Hyuga', 'Dir Neji Hyuga');
INSERT INTO cliente VALUES ('129', 'S-5', 'Gaara', 'Dir Gaara');
INSERT INTO cliente VALUES ('130', 'S-5', 'Kiba Inuzuka', 'Dir Kiba Inuzuka');
INSERT INTO cliente VALUES ('131', 'S-5', 'Akamaru', 'Dir Akamaru');
INSERT INTO cliente VALUES ('132', 'S-5', 'Tenten', 'Dir Tenten');
INSERT INTO cliente VALUES ('133', 'S-5', 'Ino Yamanaka', 'Dir Ino Yamanaka');
INSERT INTO cliente VALUES ('134', 'S-5', 'Choji Akimichi', 'Dir Choji Akimichi');
INSERT INTO cliente VALUES ('135', 'S-5', 'Tsunade', 'Dir Tsunade');
INSERT INTO cliente VALUES ('136', 'S-5', 'Jiraiya', 'Dir Jiraiya');
INSERT INTO cliente VALUES ('137', 'S-5', 'Orochimaru', 'Dir Orochimaru');
INSERT INTO cliente VALUES ('138', 'S-5', 'Kabuto Yakushi', 'Dir Kabuto Yakushi');
INSERT INTO cliente VALUES ('139', 'S-5', 'Itachi Uchiha', 'Dir Itachi Uchiha');
INSERT INTO cliente VALUES ('140', 'S-5', 'Deidara', 'Dir Deidara');
INSERT INTO cliente VALUES ('141', 'S-5', 'Sasori', 'Dir Sasori');
INSERT INTO cliente VALUES ('142', 'S-5', 'Hidan', 'Dir Hidan');
INSERT INTO cliente VALUES ('143', 'S-5', 'Kakuzu', 'Dir Kakuzu');
INSERT INTO cliente VALUES ('144', 'S-5', 'Pain', 'Dir Pain');
INSERT INTO cliente VALUES ('145', 'S-5', 'Konan', 'Dir Konan');
INSERT INTO cliente VALUES ('146', 'S-5', 'Zabuza Momochi', 'Dir Zabuza Momochi');
INSERT INTO cliente VALUES ('147', 'S-5', 'Haku', 'Dir Haku');
INSERT INTO cliente VALUES ('148', 'S-5', 'Kimimaro', 'Dir Kimimaro');
INSERT INTO cliente VALUES ('149', 'S-5', 'Kurenai Yuhi', 'Dir Kurenai Yuhi');
INSERT INTO cliente VALUES ('150', 'S-5', 'Ichigo', 'Dir Ichigo');

-- 5 tipo producto
insert into tipo_producto values (1, 'alimento');
insert into tipo_producto values (2, 'textil');
insert into tipo_producto values (3, 'calzado');
insert into tipo_producto values (4, 'electrodomesticos');
insert into tipo_producto values (5, 'hogar');

-- 30 productos, pertenecen a cada tipo
-- tipo1 alimento
desc producto;
insert into producto values ('Prod1', 1, 'Al1', 'Alimento 1', 1, 'Alimento');
insert into producto values ('Prod2', 1, 'Al2', 'Alimento 2', 2, 'Alimento');
insert into producto values ('Prod3', 1, 'Al3', 'Alimento 3', 3, 'Alimento');
insert into producto values ('Prod4', 1, 'Al4', 'Alimento 4', 4, 'Alimento');
insert into producto values ('Prod5', 1, 'Al5', 'Alimento 5', 5, 'Alimento');
insert into producto values ('Prod6', 1, 'Al6', 'Alimento 6', 6, 'Alimento');
-- tipo textil
insert into producto values ('Prod7', 2, 'Tex1', 'Textil 1', 7, 'Textil');
insert into producto values ('Prod8', 2, 'Tex2', 'Textil 2', 8, 'Textil');
insert into producto values ('Prod9', 2, 'Tex3', 'Textil 3', 9, 'Textil');
insert into producto values ('Prod10', 2, 'Tex4', 'Textil 4', 10, 'Textil');
insert into producto values ('Prod11', 2, 'Tex5', 'Textil 5', 11, 'Textil');
insert into producto values ('Prod12', 2, 'Tex6', 'Textil 6', 12, 'Textil');
-- tipo calzado
insert into producto values ('Prod13', 3, 'Cal1', 'Calzado 1', 13, 'Calzado');
insert into producto values ('Prod14', 3, 'Cal2', 'Calzado 2', 14, 'Calzado');
insert into producto values ('Prod15', 3, 'Cal3', 'Calzado 3', 15, 'Calzado');
insert into producto values ('Prod16', 3, 'Cal4', 'Calzado 4', 16, 'Calzado');
insert into producto values ('Prod17', 3, 'Cal5', 'Calzado 5', 17, 'Calzado');
insert into producto values ('Prod18', 3, 'Cal6', 'Calzado 6', 18, 'Calzado');
-- tipo electrodomestico
insert into producto values ('Prod19', 4, 'Elec1', 'Elec 1', 19, 'Electrodomestico');
insert into producto values ('Prod20', 4, 'Elec2', 'Elec 2', 20, 'Electrodomestico');
insert into producto values ('Prod21', 4, 'Elec3', 'Elec 3', 21, 'Electrodomestico');
insert into producto values ('Prod22', 4, 'Elec4', 'Elec 4', 22, 'Electrodomestico');
insert into producto values ('Prod23', 4, 'Elec5', 'Elec 5', 23, 'Electrodomestico');
insert into producto values ('Prod24', 4, 'Elec6', 'Elec 6', 24, 'Electrodomestico');
-- tipo hogar
insert into producto values ('Prod25', 5, 'Hogar1', 'Hogar 1', 25, 'Hogar');
insert into producto values ('Prod26', 5, 'Hogar2', 'Hogar 2', 26, 'Hogar');
insert into producto values ('Prod27', 5, 'Hogar3', 'Hogar 3', 27, 'Hogar');
insert into producto values ('Prod28', 5, 'Hogar4', 'Hogar 4', 28, 'Hogar');
insert into producto values ('Prod29', 5, 'Hogar5', 'Hogar 5', 29, 'Hogar');
insert into producto values ('Prod30', 5, 'Hogar6', 'Hogar 6', 30, 'Hogar');

-- 10 proveedores
insert into proveedor values ('PRV-1', 'EMP-01', 'Prov uno');
insert into proveedor values ('PRV-2', 'EMP-01', 'Prov dos');
insert into proveedor values ('PRV-3', 'EMP-01', 'Prov tres');
insert into proveedor values ('PRV-4', 'EMP-01', 'Prov cuatro');
insert into proveedor values ('PRV-5', 'EMP-01', 'Prov cinco');
insert into proveedor values ('PRV-6', 'EMP-01', 'Prov seis');
insert into proveedor values ('PRV-7', 'EMP-01', 'Prov siete');
insert into proveedor values ('PRV-8', 'EMP-01', 'Prov ocho');
insert into proveedor values ('PRV-9', 'EMP-01', 'Prov nueve');
insert into proveedor values ('PRV-10', 'EMP-01', 'Prov diez');

--- c proveedor con 10 productos e.g. proveedor producto
-- prv1
insert into proveedor_producto values ('Prod2', 'PRV-1');
insert into proveedor_producto values ('Prod3', 'PRV-1');
insert into proveedor_producto values ('Prod4', 'PRV-1');
insert into proveedor_producto values ('Prod5', 'PRV-1');
insert into proveedor_producto values ('Prod6', 'PRV-1');
insert into proveedor_producto values ('Prod7', 'PRV-1');
insert into proveedor_producto values ('Prod8', 'PRV-1');
insert into proveedor_producto values ('Prod9', 'PRV-1');
insert into proveedor_producto values ('Prod10', 'PRV-1');
insert into proveedor_producto values ('Prod11', 'PRV-1');
-- prv2
insert into proveedor_producto values ('Prod1', 'PRV-2');
insert into proveedor_producto values ('Prod2', 'PRV-2');
insert into proveedor_producto values ('Prod3', 'PRV-2');
insert into proveedor_producto values ('Prod4', 'PRV-2');
insert into proveedor_producto values ('Prod5', 'PRV-2');
insert into proveedor_producto values ('Prod6', 'PRV-2');
insert into proveedor_producto values ('Prod7', 'PRV-2');
insert into proveedor_producto values ('Prod8', 'PRV-2');
insert into proveedor_producto values ('Prod9', 'PRV-2');
insert into proveedor_producto values ('Prod10', 'PRV-2');
-- prv3
insert into proveedor_producto values ('Prod12', 'PRV-3');
insert into proveedor_producto values ('Prod13', 'PRV-3');
insert into proveedor_producto values ('Prod14', 'PRV-3');
insert into proveedor_producto values ('Prod15', 'PRV-3');
insert into proveedor_producto values ('Prod16', 'PRV-3');
insert into proveedor_producto values ('Prod17', 'PRV-3');
insert into proveedor_producto values ('Prod18', 'PRV-3');
insert into proveedor_producto values ('Prod19', 'PRV-3');
insert into proveedor_producto values ('Prod20', 'PRV-3');
insert into proveedor_producto values ('Prod21', 'PRV-3');
-- Proveedor 4
insert into proveedor_producto values ('Prod1', 'PRV-4');
insert into proveedor_producto values ('Prod2', 'PRV-4');
insert into proveedor_producto values ('Prod3', 'PRV-4');
insert into proveedor_producto values ('Prod4', 'PRV-4');
insert into proveedor_producto values ('Prod5', 'PRV-4');
insert into proveedor_producto values ('Prod6', 'PRV-4');
insert into proveedor_producto values ('Prod7', 'PRV-4');
insert into proveedor_producto values ('Prod8', 'PRV-4');
insert into proveedor_producto values ('Prod9', 'PRV-4');
insert into proveedor_producto values ('Prod10', 'PRV-4');
-- Proveedor 5
insert into proveedor_producto values ('Prod11', 'PRV-5');
insert into proveedor_producto values ('Prod12', 'PRV-5');
insert into proveedor_producto values ('Prod13', 'PRV-5');
insert into proveedor_producto values ('Prod14', 'PRV-5');
insert into proveedor_producto values ('Prod15', 'PRV-5');
insert into proveedor_producto values ('Prod16', 'PRV-5');
insert into proveedor_producto values ('Prod17', 'PRV-5');
insert into proveedor_producto values ('Prod18', 'PRV-5');
insert into proveedor_producto values ('Prod19', 'PRV-5');
insert into proveedor_producto values ('Prod20', 'PRV-5');
-- Proveedor 6
insert into proveedor_producto values ('Prod21', 'PRV-6');
insert into proveedor_producto values ('Prod22', 'PRV-6');
insert into proveedor_producto values ('Prod23', 'PRV-6');
insert into proveedor_producto values ('Prod24', 'PRV-6');
insert into proveedor_producto values ('Prod25', 'PRV-6');
insert into proveedor_producto values ('Prod26', 'PRV-6');
insert into proveedor_producto values ('Prod27', 'PRV-6');
insert into proveedor_producto values ('Prod28', 'PRV-6');
insert into proveedor_producto values ('Prod29', 'PRV-6');
insert into proveedor_producto values ('Prod30', 'PRV-6');
-- Proveedor 7
insert into proveedor_producto values ('Prod1', 'PRV-7');
insert into proveedor_producto values ('Prod2', 'PRV-7');
insert into proveedor_producto values ('Prod3', 'PRV-7');
insert into proveedor_producto values ('Prod4', 'PRV-7');
insert into proveedor_producto values ('Prod5', 'PRV-7');
insert into proveedor_producto values ('Prod6', 'PRV-7');
insert into proveedor_producto values ('Prod7', 'PRV-7');
insert into proveedor_producto values ('Prod8', 'PRV-7');
insert into proveedor_producto values ('Prod9', 'PRV-7');
insert into proveedor_producto values ('Prod10', 'PRV-7');
-- Proveedor 8
insert into proveedor_producto values ('Prod1', 'PRV-8');
insert into proveedor_producto values ('Prod2', 'PRV-8');
insert into proveedor_producto values ('Prod3', 'PRV-8');
insert into proveedor_producto values ('Prod4', 'PRV-8');
insert into proveedor_producto values ('Prod5', 'PRV-8');
insert into proveedor_producto values ('Prod6', 'PRV-8');
insert into proveedor_producto values ('Prod7', 'PRV-8');
insert into proveedor_producto values ('Prod8', 'PRV-8');
insert into proveedor_producto values ('Prod9', 'PRV-8');
insert into proveedor_producto values ('Prod10', 'PRV-8');

-- Proveedor 9
insert into proveedor_producto values ('Prod11', 'PRV-9');
insert into proveedor_producto values ('Prod12', 'PRV-9');
insert into proveedor_producto values ('Prod13', 'PRV-9');
insert into proveedor_producto values ('Prod14', 'PRV-9');
insert into proveedor_producto values ('Prod15', 'PRV-9');
insert into proveedor_producto values ('Prod16', 'PRV-9');
insert into proveedor_producto values ('Prod17', 'PRV-9');
insert into proveedor_producto values ('Prod18', 'PRV-9');
insert into proveedor_producto values ('Prod19', 'PRV-9');
insert into proveedor_producto values ('Prod20', 'PRV-9');

-- Proveedor 10
insert into proveedor_producto values ('Prod21', 'PRV-10');
insert into proveedor_producto values ('Prod22', 'PRV-10');
insert into proveedor_producto values ('Prod23', 'PRV-10');
insert into proveedor_producto values ('Prod24', 'PRV-10');
insert into proveedor_producto values ('Prod25', 'PRV-10');
insert into proveedor_producto values ('Prod26', 'PRV-10');
insert into proveedor_producto values ('Prod27', 'PRV-10');
insert into proveedor_producto values ('Prod28', 'PRV-10');
insert into proveedor_producto values ('Prod29', 'PRV-10');
insert into proveedor_producto values ('Prod30', 'PRV-10');

-- 5 promociones
desc promocion;
insert into promocion values (1, 'promo 1', to_date(2022, 'YYYY'), to_date(2023, 'YYYY'), 10);
insert into promocion values (2, 'promo 2', to_date(2022, 'YYYY'), to_date(2023, 'YYYY'), 20);
insert into promocion values (3, 'promo 3', to_date(2022, 'YYYY'), to_date(2023, 'YYYY'), 30);
insert into promocion values (4, 'promo 4', to_date(2022, 'YYYY'), to_date(2023, 'YYYY'), 40);
insert into promocion values (5, 'promo 5', to_date(2022, 'YYYY'), to_date(2023, 'YYYY'), 50);

-- 10 facturas
insert into factura values ('FAC-1', '1', 'S-1', 10);
insert into factura values ('FAC-2', '31', 'S-2', 20);
insert into factura values ('FAC-3', '61', 'S-3', 30);
insert into factura values ('FAC-4', '94', 'S-4', 40);
insert into factura values ('FAC-5', '122', 'S-5', 50);
insert into factura values ('FAC-6', '25', 'S-1', 60);
insert into factura values ('FAC-7', '40', 'S-2', 70);
insert into factura values ('FAC-8', '45', 'S-2', 80);
insert into factura values ('FAC-9', '56', 'S-2', 90);
insert into factura values ('FAC-10', '62', 'S-3', 100);

-- cada factura debe tener 6 productos, total 60
-- 1
insert into detalle_factura values ('Prod1', 'FAC-1');
insert into detalle_factura values ('Prod2', 'FAC-1');
insert into detalle_factura values ('Prod3', 'FAC-1');
insert into detalle_factura values ('Prod4', 'FAC-1');
insert into detalle_factura values ('Prod5', 'FAC-1');
insert into detalle_factura values ('Prod6', 'FAC-1');
-- 2
insert into detalle_factura values ('Prod7', 'FAC-2');
insert into detalle_factura values ('Prod8', 'FAC-2');
insert into detalle_factura values ('Prod9', 'FAC-2');
insert into detalle_factura values ('Prod10', 'FAC-2');
insert into detalle_factura values ('Prod11', 'FAC-2');
insert into detalle_factura values ('Prod12', 'FAC-2');
-- 3
insert into detalle_factura values ('Prod13', 'FAC-3');
insert into detalle_factura values ('Prod14', 'FAC-3');
insert into detalle_factura values ('Prod15', 'FAC-3');
insert into detalle_factura values ('Prod16', 'FAC-3');
insert into detalle_factura values ('Prod17', 'FAC-3');
insert into detalle_factura values ('Prod18', 'FAC-3');
-- 4
insert into detalle_factura values ('Prod19', 'FAC-4');
insert into detalle_factura values ('Prod20', 'FAC-4');
insert into detalle_factura values ('Prod21', 'FAC-4');
insert into detalle_factura values ('Prod22', 'FAC-4');
insert into detalle_factura values ('Prod23', 'FAC-4');
insert into detalle_factura values ('Prod24', 'FAC-4');
-- 5
insert into detalle_factura values ('Prod25', 'FAC-5');
insert into detalle_factura values ('Prod26', 'FAC-5');
insert into detalle_factura values ('Prod27', 'FAC-5');
insert into detalle_factura values ('Prod28', 'FAC-5');
insert into detalle_factura values ('Prod29', 'FAC-5');
insert into detalle_factura values ('Prod30', 'FAC-5');
-- 6
insert into detalle_factura values ('Prod1', 'FAC-6');
insert into detalle_factura values ('Prod13', 'FAC-6');
insert into detalle_factura values ('Prod23', 'FAC-6');
insert into detalle_factura values ('Prod11', 'FAC-6');
insert into detalle_factura values ('Prod10', 'FAC-6');
insert into detalle_factura values ('Prod9', 'FAC-6');
-- 7
insert into detalle_factura values ('Prod8', 'FAC-7');
insert into detalle_factura values ('Prod7', 'FAC-7');
insert into detalle_factura values ('Prod6', 'FAC-7');
insert into detalle_factura values ('Prod5', 'FAC-7');
insert into detalle_factura values ('Prod4', 'FAC-7');
insert into detalle_factura values ('Prod3', 'FAC-7');
-- 8
insert into detalle_factura values ('Prod9', 'FAC-8');
insert into detalle_factura values ('Prod8', 'FAC-8');
insert into detalle_factura values ('Prod7', 'FAC-8');
insert into detalle_factura values ('Prod6', 'FAC-8');
insert into detalle_factura values ('Prod5', 'FAC-8');
insert into detalle_factura values ('Prod4', 'FAC-8');
-- 9
insert into detalle_factura values ('Prod6', 'FAC-9');
insert into detalle_factura values ('Prod5', 'FAC-9');
insert into detalle_factura values ('Prod4', 'FAC-9');
insert into detalle_factura values ('Prod3', 'FAC-9');
insert into detalle_factura values ('Prod2', 'FAC-9');
insert into detalle_factura values ('Prod1', 'FAC-9');
-- 10
insert into detalle_factura values ('Prod16', 'FAC-10');
insert into detalle_factura values ('Prod15', 'FAC-10');
insert into detalle_factura values ('Prod14', 'FAC-10');
insert into detalle_factura values ('Prod13', 'FAC-10');
insert into detalle_factura values ('Prod12', 'FAC-10');
insert into detalle_factura values ('Prod11', 'FAC-10');

-- 5 orden compra
insert into orden_compra values (1, 'PRV-1', to_date('2023', 'YYYY'));
insert into orden_compra values (2, 'PRV-2', to_date('2023', 'YYYY'));
insert into orden_compra values (3, 'PRV-3', to_date('2023', 'YYYY'));
insert into orden_compra values (4, 'PRV-4', to_date('2023', 'YYYY'));
insert into orden_compra values (5, 'PRV-5', to_date('2023', 'YYYY'));

-- -- cada orden de compra con 6 productos
-- ord1
insert into orden_producto values ('Prod10', 1, 1);
insert into orden_producto values ('Prod1', 1, 2);
insert into orden_producto values ('Prod12', 1, 3);
insert into orden_producto values ('Prod15', 1, 4);
insert into orden_producto values ('Prod17', 1, 5);
insert into orden_producto values ('Prod19', 1, 6);
-- ord2
insert into orden_producto values ('Prod13', 2, 7);
insert into orden_producto values ('Prod14', 2, 8);
insert into orden_producto values ('Prod16', 2, 9);
insert into orden_producto values ('Prod18', 2, 10);
insert into orden_producto values ('Prod12', 2, 11);
insert into orden_producto values ('Prod8', 2, 12);
-- ord3
insert into orden_producto values ('Prod9', 3, 13);
insert into orden_producto values ('Prod8', 3, 14);
insert into orden_producto values ('Prod7', 3, 15);
insert into orden_producto values ('Prod6', 3, 16);
insert into orden_producto values ('Prod5', 3, 17);
insert into orden_producto values ('Prod3', 3, 18);
-- ord4
insert into orden_producto values ('Prod19', 4, 19);
insert into orden_producto values ('Prod7', 4, 20);
insert into orden_producto values ('Prod25', 4, 21);
insert into orden_producto values ('Prod26', 4, 22);
insert into orden_producto values ('Prod28', 4, 23);
insert into orden_producto values ('Prod27', 4, 24);
-- ord5
insert into orden_producto values ('Prod23', 5, 25);
insert into orden_producto values ('Prod2', 5, 26);
insert into orden_producto values ('Prod3', 5, 27);
insert into orden_producto values ('Prod30', 5, 28);
insert into orden_producto values ('Prod27', 5, 29);
insert into orden_producto values ('Prod20', 5, 30);

--- cada promocion con 6 productos, existen 5 promociones y 30 productos
-- 1
insert into producto_promocion values ('Prod10', 1);
insert into producto_promocion values ('Prod1', 1);
insert into producto_promocion values ('Prod12', 1);
insert into producto_promocion values ('Prod15', 1);
insert into producto_promocion values ('Prod17', 1);
insert into producto_promocion values ('Prod19', 1);
-- 2
insert into producto_promocion values ('Prod13', 2);
insert into producto_promocion values ('Prod14', 2);
insert into producto_promocion values ('Prod16', 2);
insert into producto_promocion values ('Prod18', 2);
insert into producto_promocion values ('Prod12', 2);
insert into producto_promocion values ('Prod8', 2);
-- 3
insert into producto_promocion values ('Prod9', 3);
insert into producto_promocion values ('Prod8', 3);
insert into producto_promocion values ('Prod7', 3);
insert into producto_promocion values ('Prod6', 3);
insert into producto_promocion values ('Prod5', 3);
insert into producto_promocion values ('Prod3', 3);
-- 4
insert into producto_promocion values ('Prod19', 4);
insert into producto_promocion values ('Prod7', 4);
insert into producto_promocion values ('Prod25', 4);
insert into producto_promocion values ('Prod26', 4);
insert into producto_promocion values ('Prod28', 4);
insert into producto_promocion values ('Prod27', 4);
-- 5
insert into producto_promocion values ('Prod23', 5);
insert into producto_promocion values ('Prod2', 5);
insert into producto_promocion values ('Prod3', 5);
insert into producto_promocion values ('Prod30', 5);
insert into producto_promocion values ('Prod27', 5);
insert into producto_promocion values ('Prod20', 5);