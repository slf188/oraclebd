-- empresa
insert into EMPRESA values ('EMP-01', 'Ecuafields', 'Palora', 'ecuafields.com', 'Empresa');

-- SUCURSALes
insert into SUCURSAL values ('S-1', 'EMP-01', '111', 'Uno');
insert into SUCURSAL values ('S-2', 'EMP-01', '222', 'Dos');
insert into SUCURSAL values ('S-3', 'EMP-01', '333', 'Tres');
insert into SUCURSAL values ('S-4', 'EMP-01', '444', 'Cuatro');
insert into SUCURSAL values ('S-5', 'EMP-01', '555', 'Cinco');

-- 1 BODEGA por cada SUCURSAL
insert into BODEGA values ('B-1', 'S-1', 'Primera dir', '1');
insert into BODEGA values ('B-2', 'S-2', 'Segunda dir', '2');
insert into BODEGA values ('B-3', 'S-3', 'Tercera dir', '3');
insert into BODEGA values ('B-4', 'S-4', 'Cuarta dir', '4');
insert into BODEGA values ('B-5', 'S-5', 'Quinta dir', '5');

-- CLIENTE SUCURSAL-1
insert into CLIENTE values ('1', 'S-1', 'Felipe', 'Dir Felipe');
insert into CLIENTE values ('2', 'S-1', 'Marcelo', 'Dir Marcelo');
insert into CLIENTE values ('3', 'S-1', 'Jose', 'Dir Jose');
insert into CLIENTE values ('4', 'S-1', 'Antonio', 'Dir Antonio');
insert into CLIENTE values ('5', 'S-1', 'Marco', 'Dir Marco');
insert into CLIENTE values ('6', 'S-1', 'Evelyn', 'Dir Evelyn');
insert into CLIENTE values ('7', 'S-1', 'Gabriela', 'Dir Gabriela');
insert into CLIENTE values ('8', 'S-1', 'Joselyn', 'Dir Joselyn');
insert into CLIENTE values ('9', 'S-1', 'Sebastian', 'Dir Sebastian');
insert into CLIENTE values ('10', 'S-1', 'Alejandra', 'Dir Alejandra');
insert into CLIENTE values ('11', 'S-1', 'Monica', 'Dir Monica');
insert into CLIENTE values ('12', 'S-1', 'David', 'Dir David');
insert into CLIENTE values ('13', 'S-1', 'Camila', 'Dir Camila');
insert into CLIENTE values ('14', 'S-1', 'Mishel', 'Dir Mishel');
insert into CLIENTE values ('15', 'S-1', 'Nicolas', 'Dir Nicolas');
insert into CLIENTE values ('16', 'S-1', 'Alejandro', 'Dir Alejandro');
insert into CLIENTE values ('17', 'S-1', 'Fernando', 'Dir Fernando');
insert into CLIENTE values ('18', 'S-1', 'Fernanda', 'Dir Fernanda');
insert into CLIENTE values ('19', 'S-1', 'Ariel', 'Dir Ariel');
insert into CLIENTE values ('20', 'S-1', 'Cristian', 'Dir Cristian');
insert into CLIENTE values ('21', 'S-1', 'Cristina', 'Dir Cristina');
insert into CLIENTE values ('22', 'S-1', 'Isabela', 'Dir Isabela');
insert into CLIENTE values ('23', 'S-1', 'Maria', 'Dir Maria');
insert into CLIENTE values ('24', 'S-1', 'Mario', 'Dir Mario');
insert into CLIENTE values ('25', 'S-1', 'Luigi', 'Dir Luigi');
insert into CLIENTE values ('26', 'S-1', 'Browser', 'Dir Browser');
insert into CLIENTE values ('27', 'S-1', 'Peach', 'Dir Peach');
insert into CLIENTE values ('28', 'S-1', 'Toad', 'Dir Toad');
insert into CLIENTE values ('29', 'S-1', 'Oden', 'Dir Oden');
insert into CLIENTE values ('30', 'S-1', 'Luffy', 'Dir Luffy');
-- CLIENTE SUCURSAL-2
INSERT INTO CLIENTE values ('31', 'S-2', 'Zoro', 'Dir Zoro');
INSERT INTO CLIENTE values ('32', 'S-2', 'Nami', 'Dir Nami');
INSERT INTO CLIENTE values ('33', 'S-2', 'Sanji', 'Dir Sanji');
INSERT INTO CLIENTE values ('34', 'S-2', 'Usopp', 'Dir Usopp');
INSERT INTO CLIENTE values ('35', 'S-2', 'Robin', 'Dir Robin');
INSERT INTO CLIENTE values ('36', 'S-2', 'Franky', 'Dir Franky');
INSERT INTO CLIENTE values ('37', 'S-2', 'Brook', 'Dir Brook');
INSERT INTO CLIENTE values ('38', 'S-2', 'Chopper', 'Dir Chopper');
INSERT INTO CLIENTE values ('39', 'S-2', 'Roger', 'Dir Roger');
INSERT INTO CLIENTE values ('40', 'S-2', 'Shanks', 'Dir Shanks');
INSERT INTO CLIENTE values ('41', 'S-2', 'Kaido', 'Dir Kaido');
INSERT INTO CLIENTE values ('42', 'S-2', 'King', 'Dir King');
INSERT INTO CLIENTE values ('43', 'S-2', 'Queen', 'Dir Queen');
INSERT INTO CLIENTE values ('44', 'S-2', 'Jack', 'Dir Jack');
INSERT INTO CLIENTE values ('45', 'S-2', 'Jinbe', 'Dir Jinbe');
INSERT INTO CLIENTE values ('46', 'S-2', 'Carlos', 'Dir Carlos');
INSERT INTO CLIENTE values ('47', 'S-2', 'Dragon', 'Dir Dragon');
INSERT INTO CLIENTE values ('48', 'S-2', 'Sabo', 'Dir Sabo');
INSERT INTO CLIENTE values ('49', 'S-2', 'Ace', 'Dir Ace');
INSERT INTO CLIENTE values ('50', 'S-2', 'Benn', 'Dir Benn');
INSERT INTO CLIENTE values ('51', 'S-2', 'Law', 'Dir Law');
INSERT INTO CLIENTE values ('52', 'S-2', 'Kizaru', 'Dir Kizaru');
INSERT INTO CLIENTE values ('53', 'S-2', 'Borsalino', 'Dir Borsalino');
INSERT INTO CLIENTE values ('54', 'S-2', 'Akainu', 'Dir Akainu');
INSERT INTO CLIENTE values ('55', 'S-2', 'Sakazuki', 'Dir Sakasuki');
INSERT INTO CLIENTE values ('56', 'S-2', 'Aokiji', 'Dir Aokiji');
INSERT INTO CLIENTE values ('57', 'S-2', 'Ivan', 'Dir Ivan');
INSERT INTO CLIENTE values ('58', 'S-2', 'Doflamingo', 'Dir Doflamingo');
INSERT INTO CLIENTE values ('59', 'S-2', 'Crocodile', 'Dir Crocodile');
INSERT INTO CLIENTE values ('60', 'S-2', 'Kuzan', 'Dir Kuzan');
-- CLIENTE SUCURSAL-3
INSERT INTO CLIENTE VALUES ('61', 'S-3', 'Goku', 'Dir Goku');
INSERT INTO CLIENTE VALUES ('62', 'S-3', 'Vegeta', 'Dir Vegeta');
INSERT INTO CLIENTE VALUES ('63', 'S-3', 'Gohan', 'Dir Gohan');
INSERT INTO CLIENTE VALUES ('64', 'S-3', 'Piccolo', 'Dir Piccolo');
INSERT INTO CLIENTE VALUES ('65', 'S-3', 'Krillin', 'Dir Krillin');
INSERT INTO CLIENTE VALUES ('66', 'S-3', 'Tien', 'Dir Tien');
INSERT INTO CLIENTE VALUES ('67', 'S-3', 'Yamcha', 'Dir Yamcha');
INSERT INTO CLIENTE VALUES ('68', 'S-3', 'Chiaotzu', 'Dir Chiaotzu');
INSERT INTO CLIENTE VALUES ('69', 'S-3', 'Trunks', 'Dir Trunks');
INSERT INTO CLIENTE VALUES ('70', 'S-3', 'Goten', 'Dir Goten');
INSERT INTO CLIENTE VALUES ('71', 'S-3', 'Bulma', 'Dir Bulma');
INSERT INTO CLIENTE VALUES ('72', 'S-3', 'Chi-Chi', 'Dir Chi-Chi');
INSERT INTO CLIENTE VALUES ('73', 'S-3', 'Master Roshi', 'Dir Master Roshi');
INSERT INTO CLIENTE VALUES ('74', 'S-3', 'Android 18', 'Dir Android 18');
INSERT INTO CLIENTE VALUES ('75', 'S-3', 'Android 17', 'Dir Android 17');
INSERT INTO CLIENTE VALUES ('76', 'S-3', 'Android 16', 'Dir Android 16');
INSERT INTO CLIENTE VALUES ('77', 'S-3', 'Cell', 'Dir Cell');
INSERT INTO CLIENTE VALUES ('78', 'S-3', 'Frieza', 'Dir Frieza');
INSERT INTO CLIENTE VALUES ('79', 'S-3', 'Majin Buu', 'Dir Majin Buu');
INSERT INTO CLIENTE VALUES ('80', 'S-3', 'Beerus', 'Dir Beerus');
INSERT INTO CLIENTE VALUES ('81', 'S-3', 'Whis', 'Dir Whis');
INSERT INTO CLIENTE VALUES ('82', 'S-3', 'Zamasu', 'Dir Zamasu');
INSERT INTO CLIENTE VALUES ('83', 'S-3', 'Hit', 'Dir Hit');
INSERT INTO CLIENTE VALUES ('84', 'S-3', 'Jiren', 'Dir Jiren');
INSERT INTO CLIENTE VALUES ('85', 'S-3', 'Cabba', 'Dir Cabba');
INSERT INTO CLIENTE VALUES ('86', 'S-3', 'Kale', 'Dir Kale');
INSERT INTO CLIENTE VALUES ('87', 'S-3', 'Caulifla', 'Dir Caulifla');
INSERT INTO CLIENTE VALUES ('88', 'S-3', 'Toppo', 'Dir Toppo');
INSERT INTO CLIENTE VALUES ('89', 'S-3', 'Vegito', 'Dir Vegito');
INSERT INTO CLIENTE VALUES ('90', 'S-3', 'Gogeta', 'Dir Gogeta');
-- CLIENTE SUCURSAL-4
INSERT INTO CLIENTE VALUES ('91', 'S-4', 'Light Yagami', 'Dir Light Yagami');
INSERT INTO CLIENTE VALUES ('92', 'S-4', 'L Lawliet', 'Dir L Lawliet');
INSERT INTO CLIENTE VALUES ('93', 'S-4', 'Misa Amane', 'Dir Misa Amane');
INSERT INTO CLIENTE VALUES ('94', 'S-4', 'Ryuk', 'Dir Ryuk');
INSERT INTO CLIENTE VALUES ('95', 'S-4', 'Rem', 'Dir Rem');
INSERT INTO CLIENTE VALUES ('96', 'S-4', 'Near', 'Dir Near');
INSERT INTO CLIENTE VALUES ('97', 'S-4', 'Mello', 'Dir Mello');
INSERT INTO CLIENTE VALUES ('98', 'S-4', 'Teru Mikami', 'Dir Teru Mikami');
INSERT INTO CLIENTE VALUES ('99', 'S-4', 'Soichiro Yagami', 'Dir Soichiro Yagami');
INSERT INTO CLIENTE VALUES ('100', 'S-4', 'Sayu Yagami', 'Dir Sayu Yagami');
INSERT INTO CLIENTE VALUES ('101', 'S-4', 'Naomi Misora', 'Dir Naomi Misora');
INSERT INTO CLIENTE VALUES ('102', 'S-4', 'Matt', 'Dir Matt');
INSERT INTO CLIENTE VALUES ('103', 'S-4', 'Mello', 'Dir Mello');
INSERT INTO CLIENTE VALUES ('104', 'S-4', 'Halle Lidner', 'Dir Halle Lidner');
INSERT INTO CLIENTE VALUES ('105', 'S-4', 'Roger Ruvie', 'Dir Roger Ruvie');
INSERT INTO CLIENTE VALUES ('106', 'S-4', 'Anthony Rester', 'Dir Anthony Rester');
INSERT INTO CLIENTE VALUES ('107', 'S-4', 'Beyond Birthday', 'Dir Beyond Birthday');
INSERT INTO CLIENTE VALUES ('108', 'S-4', 'Mihael Keehl', 'Dir Mihael Keehl');
INSERT INTO CLIENTE VALUES ('109', 'S-4', 'Kyosuke Higuchi', 'Dir Kyosuke Higuchi');
INSERT INTO CLIENTE VALUES ('110', 'S-4', 'Takada Kiyomi', 'Dir Takada Kiyomi');
INSERT INTO CLIENTE VALUES ('111', 'S-4', 'Hideki Ide', 'Dir Hideki Ide');
INSERT INTO CLIENTE VALUES ('112', 'S-4', 'Shuichi Aizawa', 'Dir Shuichi Aizawa');
INSERT INTO CLIENTE VALUES ('113', 'S-4', 'Kanzo Mogi', 'Dir Kanzo Mogi');
INSERT INTO CLIENTE VALUES ('114', 'S-4', 'Sachiko Yagami', 'Dir Sachiko Yagami');
INSERT INTO CLIENTE VALUES ('115', 'S-4', 'Raye Penber', 'Dir Raye Penber');
INSERT INTO CLIENTE VALUES ('116', 'S-4', 'Wedy', 'Dir Wedy');
INSERT INTO CLIENTE VALUES ('117', 'S-4', 'Hal Lidner', 'Dir Hal Lidner');
INSERT INTO CLIENTE VALUES ('118', 'S-4', 'Reiji Namikawa', 'Dir Reiji Namikawa');
INSERT INTO CLIENTE VALUES ('119', 'S-4', 'Shingo Mido', 'Dir Shingo Mido');
INSERT INTO CLIENTE VALUES ('120', 'S-4', 'Shinzo', 'Dir Shinzo');
-- CLIENTE SUCURSAL-5
INSERT INTO CLIENTE VALUES ('121', 'S-5', 'Naruto Uzumaki', 'Dir Naruto Uzumaki');
INSERT INTO CLIENTE VALUES ('122', 'S-5', 'Sasuke Uchiha', 'Dir Sasuke Uchiha');
INSERT INTO CLIENTE VALUES ('123', 'S-5', 'Sakura Haruno', 'Dir Sakura Haruno');
INSERT INTO CLIENTE VALUES ('124', 'S-5', 'Kakashi Hatake', 'Dir Kakashi Hatake');
INSERT INTO CLIENTE VALUES ('125', 'S-5', 'Shikamaru Nara', 'Dir Shikamaru Nara');
INSERT INTO CLIENTE VALUES ('126', 'S-5', 'Hinata Hyuga', 'Dir Hinata Hyuga');
INSERT INTO CLIENTE VALUES ('127', 'S-5', 'Rock Lee', 'Dir Rock Lee');
INSERT INTO CLIENTE VALUES ('128', 'S-5', 'Neji Hyuga', 'Dir Neji Hyuga');
INSERT INTO CLIENTE VALUES ('129', 'S-5', 'Gaara', 'Dir Gaara');
INSERT INTO CLIENTE VALUES ('130', 'S-5', 'Kiba Inuzuka', 'Dir Kiba Inuzuka');
INSERT INTO CLIENTE VALUES ('131', 'S-5', 'Akamaru', 'Dir Akamaru');
INSERT INTO CLIENTE VALUES ('132', 'S-5', 'Tenten', 'Dir Tenten');
INSERT INTO CLIENTE VALUES ('133', 'S-5', 'Ino Yamanaka', 'Dir Ino Yamanaka');
INSERT INTO CLIENTE VALUES ('134', 'S-5', 'Choji Akimichi', 'Dir Choji Akimichi');
INSERT INTO CLIENTE VALUES ('135', 'S-5', 'Tsunade', 'Dir Tsunade');
INSERT INTO CLIENTE VALUES ('136', 'S-5', 'Jiraiya', 'Dir Jiraiya');
INSERT INTO CLIENTE VALUES ('137', 'S-5', 'Orochimaru', 'Dir Orochimaru');
INSERT INTO CLIENTE VALUES ('138', 'S-5', 'Kabuto Yakushi', 'Dir Kabuto Yakushi');
INSERT INTO CLIENTE VALUES ('139', 'S-5', 'Itachi Uchiha', 'Dir Itachi Uchiha');
INSERT INTO CLIENTE VALUES ('140', 'S-5', 'Deidara', 'Dir Deidara');
INSERT INTO CLIENTE VALUES ('141', 'S-5', 'Sasori', 'Dir Sasori');
INSERT INTO CLIENTE VALUES ('142', 'S-5', 'Hidan', 'Dir Hidan');
INSERT INTO CLIENTE VALUES ('143', 'S-5', 'Kakuzu', 'Dir Kakuzu');
INSERT INTO CLIENTE VALUES ('144', 'S-5', 'Pain', 'Dir Pain');
INSERT INTO CLIENTE VALUES ('145', 'S-5', 'Konan', 'Dir Konan');
INSERT INTO CLIENTE VALUES ('146', 'S-5', 'Zabuza Momochi', 'Dir Zabuza Momochi');
INSERT INTO CLIENTE VALUES ('147', 'S-5', 'Haku', 'Dir Haku');
INSERT INTO CLIENTE VALUES ('148', 'S-5', 'Kimimaro', 'Dir Kimimaro');
INSERT INTO CLIENTE VALUES ('149', 'S-5', 'Kurenai Yuhi', 'Dir Kurenai Yuhi');
INSERT INTO CLIENTE VALUES ('150', 'S-5', 'Ichigo', 'Dir Ichigo');

-- 5 tipo PRODUCTO
insert into TIPO_PRODUCTO values (1, 'alimento');
insert into TIPO_PRODUCTO values (2, 'textil');
insert into TIPO_PRODUCTO values (3, 'calzado');
insert into TIPO_PRODUCTO values (4, 'electrodomesticos');
insert into TIPO_PRODUCTO values (5, 'hogar');

-- 30 PRODUCTOs, pertenecen a cada tipo
-- tipo1 alimento
insert into PRODUCTO values ('Prod1', 1, 'Al1', 'Alimento 1', 1, 'Alimento');
insert into PRODUCTO values ('Prod2', 1, 'Al2', 'Alimento 2', 2, 'Alimento');
insert into PRODUCTO values ('Prod3', 1, 'Al3', 'Alimento 3', 3, 'Alimento');
insert into PRODUCTO values ('Prod4', 1, 'Al4', 'Alimento 4', 4, 'Alimento');
insert into PRODUCTO values ('Prod5', 1, 'Al5', 'Alimento 5', 5, 'Alimento');
insert into PRODUCTO values ('Prod6', 1, 'Al6', 'Alimento 6', 6, 'Alimento');
-- tipo textil
insert into PRODUCTO values ('Prod7', 2, 'Tex1', 'Textil 1', 7, 'Textil');
insert into PRODUCTO values ('Prod8', 2, 'Tex2', 'Textil 2', 8, 'Textil');
insert into PRODUCTO values ('Prod9', 2, 'Tex3', 'Textil 3', 9, 'Textil');
insert into PRODUCTO values ('Prod10', 2, 'Tex4', 'Textil 4', 10, 'Textil');
insert into PRODUCTO values ('Prod11', 2, 'Tex5', 'Textil 5', 11, 'Textil');
insert into PRODUCTO values ('Prod12', 2, 'Tex6', 'Textil 6', 12, 'Textil');
-- tipo calzado
insert into PRODUCTO values ('Prod13', 3, 'Cal1', 'Calzado 1', 13, 'Calzado');
insert into PRODUCTO values ('Prod14', 3, 'Cal2', 'Calzado 2', 14, 'Calzado');
insert into PRODUCTO values ('Prod15', 3, 'Cal3', 'Calzado 3', 15, 'Calzado');
insert into PRODUCTO values ('Prod16', 3, 'Cal4', 'Calzado 4', 16, 'Calzado');
insert into PRODUCTO values ('Prod17', 3, 'Cal5', 'Calzado 5', 17, 'Calzado');
insert into PRODUCTO values ('Prod18', 3, 'Cal6', 'Calzado 6', 18, 'Calzado');
-- tipo electrodomestico
insert into PRODUCTO values ('Prod19', 4, 'Elec1', 'Elec 1', 19, 'Electrodomestico');
insert into PRODUCTO values ('Prod20', 4, 'Elec2', 'Elec 2', 20, 'Electrodomestico');
insert into PRODUCTO values ('Prod21', 4, 'Elec3', 'Elec 3', 21, 'Electrodomestico');
insert into PRODUCTO values ('Prod22', 4, 'Elec4', 'Elec 4', 22, 'Electrodomestico');
insert into PRODUCTO values ('Prod23', 4, 'Elec5', 'Elec 5', 23, 'Electrodomestico');
insert into PRODUCTO values ('Prod24', 4, 'Elec6', 'Elec 6', 24, 'Electrodomestico');
-- tipo hogar
insert into PRODUCTO values ('Prod25', 5, 'Hogar1', 'Hogar 1', 25, 'Hogar');
insert into PRODUCTO values ('Prod26', 5, 'Hogar2', 'Hogar 2', 26, 'Hogar');
insert into PRODUCTO values ('Prod27', 5, 'Hogar3', 'Hogar 3', 27, 'Hogar');
insert into PRODUCTO values ('Prod28', 5, 'Hogar4', 'Hogar 4', 28, 'Hogar');
insert into PRODUCTO values ('Prod29', 5, 'Hogar5', 'Hogar 5', 29, 'Hogar');
insert into PRODUCTO values ('Prod30', 5, 'Hogar6', 'Hogar 6', 30, 'Hogar');

-- 10 PROVEEDORes
insert into PROVEEDOR values ('PRV-1', 'EMP-01', 'Prov uno');
insert into PROVEEDOR values ('PRV-2', 'EMP-01', 'Prov dos');
insert into PROVEEDOR values ('PRV-3', 'EMP-01', 'Prov tres');
insert into PROVEEDOR values ('PRV-4', 'EMP-01', 'Prov cuatro');
insert into PROVEEDOR values ('PRV-5', 'EMP-01', 'Prov cinco');
insert into PROVEEDOR values ('PRV-6', 'EMP-01', 'Prov seis');
insert into PROVEEDOR values ('PRV-7', 'EMP-01', 'Prov siete');
insert into PROVEEDOR values ('PRV-8', 'EMP-01', 'Prov ocho');
insert into PROVEEDOR values ('PRV-9', 'EMP-01', 'Prov nueve');
insert into PROVEEDOR values ('PRV-10', 'EMP-01', 'Prov diez');

--- c PROVEEDOR con 10 PRODUCTOs e.g. PROVEEDOR PRODUCTO
-- prv1
insert into PROVEEDOR_PRODUCTO values ('Prod2', 'PRV-1');
insert into PROVEEDOR_PRODUCTO values ('Prod3', 'PRV-1');
insert into PROVEEDOR_PRODUCTO values ('Prod4', 'PRV-1');
insert into PROVEEDOR_PRODUCTO values ('Prod5', 'PRV-1');
insert into PROVEEDOR_PRODUCTO values ('Prod6', 'PRV-1');
insert into PROVEEDOR_PRODUCTO values ('Prod7', 'PRV-1');
insert into PROVEEDOR_PRODUCTO values ('Prod8', 'PRV-1');
insert into PROVEEDOR_PRODUCTO values ('Prod9', 'PRV-1');
insert into PROVEEDOR_PRODUCTO values ('Prod10', 'PRV-1');
insert into PROVEEDOR_PRODUCTO values ('Prod11', 'PRV-1');
-- prv2
insert into PROVEEDOR_PRODUCTO values ('Prod1', 'PRV-2');
insert into PROVEEDOR_PRODUCTO values ('Prod2', 'PRV-2');
insert into PROVEEDOR_PRODUCTO values ('Prod3', 'PRV-2');
insert into PROVEEDOR_PRODUCTO values ('Prod4', 'PRV-2');
insert into PROVEEDOR_PRODUCTO values ('Prod5', 'PRV-2');
insert into PROVEEDOR_PRODUCTO values ('Prod6', 'PRV-2');
insert into PROVEEDOR_PRODUCTO values ('Prod7', 'PRV-2');
insert into PROVEEDOR_PRODUCTO values ('Prod8', 'PRV-2');
insert into PROVEEDOR_PRODUCTO values ('Prod9', 'PRV-2');
insert into PROVEEDOR_PRODUCTO values ('Prod10', 'PRV-2');
-- prv3
insert into PROVEEDOR_PRODUCTO values ('Prod12', 'PRV-3');
insert into PROVEEDOR_PRODUCTO values ('Prod13', 'PRV-3');
insert into PROVEEDOR_PRODUCTO values ('Prod14', 'PRV-3');
insert into PROVEEDOR_PRODUCTO values ('Prod15', 'PRV-3');
insert into PROVEEDOR_PRODUCTO values ('Prod16', 'PRV-3');
insert into PROVEEDOR_PRODUCTO values ('Prod17', 'PRV-3');
insert into PROVEEDOR_PRODUCTO values ('Prod18', 'PRV-3');
insert into PROVEEDOR_PRODUCTO values ('Prod19', 'PRV-3');
insert into PROVEEDOR_PRODUCTO values ('Prod20', 'PRV-3');
insert into PROVEEDOR_PRODUCTO values ('Prod21', 'PRV-3');
-- PROVEEDOR 4
insert into PROVEEDOR_PRODUCTO values ('Prod1', 'PRV-4');
insert into PROVEEDOR_PRODUCTO values ('Prod2', 'PRV-4');
insert into PROVEEDOR_PRODUCTO values ('Prod3', 'PRV-4');
insert into PROVEEDOR_PRODUCTO values ('Prod4', 'PRV-4');
insert into PROVEEDOR_PRODUCTO values ('Prod5', 'PRV-4');
insert into PROVEEDOR_PRODUCTO values ('Prod6', 'PRV-4');
insert into PROVEEDOR_PRODUCTO values ('Prod7', 'PRV-4');
insert into PROVEEDOR_PRODUCTO values ('Prod8', 'PRV-4');
insert into PROVEEDOR_PRODUCTO values ('Prod9', 'PRV-4');
insert into PROVEEDOR_PRODUCTO values ('Prod10', 'PRV-4');
-- PROVEEDOR 5
insert into PROVEEDOR_PRODUCTO values ('Prod11', 'PRV-5');
insert into PROVEEDOR_PRODUCTO values ('Prod12', 'PRV-5');
insert into PROVEEDOR_PRODUCTO values ('Prod13', 'PRV-5');
insert into PROVEEDOR_PRODUCTO values ('Prod14', 'PRV-5');
insert into PROVEEDOR_PRODUCTO values ('Prod15', 'PRV-5');
insert into PROVEEDOR_PRODUCTO values ('Prod16', 'PRV-5');
insert into PROVEEDOR_PRODUCTO values ('Prod17', 'PRV-5');
insert into PROVEEDOR_PRODUCTO values ('Prod18', 'PRV-5');
insert into PROVEEDOR_PRODUCTO values ('Prod19', 'PRV-5');
insert into PROVEEDOR_PRODUCTO values ('Prod20', 'PRV-5');
-- PROVEEDOR 6
insert into PROVEEDOR_PRODUCTO values ('Prod21', 'PRV-6');
insert into PROVEEDOR_PRODUCTO values ('Prod22', 'PRV-6');
insert into PROVEEDOR_PRODUCTO values ('Prod23', 'PRV-6');
insert into PROVEEDOR_PRODUCTO values ('Prod24', 'PRV-6');
insert into PROVEEDOR_PRODUCTO values ('Prod25', 'PRV-6');
insert into PROVEEDOR_PRODUCTO values ('Prod26', 'PRV-6');
insert into PROVEEDOR_PRODUCTO values ('Prod27', 'PRV-6');
insert into PROVEEDOR_PRODUCTO values ('Prod28', 'PRV-6');
insert into PROVEEDOR_PRODUCTO values ('Prod29', 'PRV-6');
insert into PROVEEDOR_PRODUCTO values ('Prod30', 'PRV-6');
-- PROVEEDOR 7
insert into PROVEEDOR_PRODUCTO values ('Prod1', 'PRV-7');
insert into PROVEEDOR_PRODUCTO values ('Prod2', 'PRV-7');
insert into PROVEEDOR_PRODUCTO values ('Prod3', 'PRV-7');
insert into PROVEEDOR_PRODUCTO values ('Prod4', 'PRV-7');
insert into PROVEEDOR_PRODUCTO values ('Prod5', 'PRV-7');
insert into PROVEEDOR_PRODUCTO values ('Prod6', 'PRV-7');
insert into PROVEEDOR_PRODUCTO values ('Prod7', 'PRV-7');
insert into PROVEEDOR_PRODUCTO values ('Prod8', 'PRV-7');
insert into PROVEEDOR_PRODUCTO values ('Prod9', 'PRV-7');
insert into PROVEEDOR_PRODUCTO values ('Prod10', 'PRV-7');
-- PROVEEDOR 8
insert into PROVEEDOR_PRODUCTO values ('Prod1', 'PRV-8');
insert into PROVEEDOR_PRODUCTO values ('Prod2', 'PRV-8');
insert into PROVEEDOR_PRODUCTO values ('Prod3', 'PRV-8');
insert into PROVEEDOR_PRODUCTO values ('Prod4', 'PRV-8');
insert into PROVEEDOR_PRODUCTO values ('Prod5', 'PRV-8');
insert into PROVEEDOR_PRODUCTO values ('Prod6', 'PRV-8');
insert into PROVEEDOR_PRODUCTO values ('Prod7', 'PRV-8');
insert into PROVEEDOR_PRODUCTO values ('Prod8', 'PRV-8');
insert into PROVEEDOR_PRODUCTO values ('Prod9', 'PRV-8');
insert into PROVEEDOR_PRODUCTO values ('Prod10', 'PRV-8');

-- PROVEEDOR 9
insert into PROVEEDOR_PRODUCTO values ('Prod11', 'PRV-9');
insert into PROVEEDOR_PRODUCTO values ('Prod12', 'PRV-9');
insert into PROVEEDOR_PRODUCTO values ('Prod13', 'PRV-9');
insert into PROVEEDOR_PRODUCTO values ('Prod14', 'PRV-9');
insert into PROVEEDOR_PRODUCTO values ('Prod15', 'PRV-9');
insert into PROVEEDOR_PRODUCTO values ('Prod16', 'PRV-9');
insert into PROVEEDOR_PRODUCTO values ('Prod17', 'PRV-9');
insert into PROVEEDOR_PRODUCTO values ('Prod18', 'PRV-9');
insert into PROVEEDOR_PRODUCTO values ('Prod19', 'PRV-9');
insert into PROVEEDOR_PRODUCTO values ('Prod20', 'PRV-9');

-- PROVEEDOR 10
insert into PROVEEDOR_PRODUCTO values ('Prod21', 'PRV-10');
insert into PROVEEDOR_PRODUCTO values ('Prod22', 'PRV-10');
insert into PROVEEDOR_PRODUCTO values ('Prod23', 'PRV-10');
insert into PROVEEDOR_PRODUCTO values ('Prod24', 'PRV-10');
insert into PROVEEDOR_PRODUCTO values ('Prod25', 'PRV-10');
insert into PROVEEDOR_PRODUCTO values ('Prod26', 'PRV-10');
insert into PROVEEDOR_PRODUCTO values ('Prod27', 'PRV-10');
insert into PROVEEDOR_PRODUCTO values ('Prod28', 'PRV-10');
insert into PROVEEDOR_PRODUCTO values ('Prod29', 'PRV-10');
insert into PROVEEDOR_PRODUCTO values ('Prod30', 'PRV-10');

-- 5 PROMOCIONes
desc PROMOCION;
insert into PROMOCION values (1, 'promo 1', to_date(2022, 'YYYY'), to_date(2023, 'YYYY'), 10);
insert into PROMOCION values (2, 'promo 2', to_date(2022, 'YYYY'), to_date(2023, 'YYYY'), 20);
insert into PROMOCION values (3, 'promo 3', to_date(2022, 'YYYY'), to_date(2023, 'YYYY'), 30);
insert into PROMOCION values (4, 'promo 4', to_date(2022, 'YYYY'), to_date(2023, 'YYYY'), 40);
insert into PROMOCION values (5, 'promo 5', to_date(2022, 'YYYY'), to_date(2023, 'YYYY'), 50);

-- 10 FACTURAs
insert into FACTURA values ('FAC-1', '1', 'S-1', 10);
insert into FACTURA values ('FAC-2', '31', 'S-2', 20);
insert into FACTURA values ('FAC-3', '61', 'S-3', 30);
insert into FACTURA values ('FAC-4', '94', 'S-4', 40);
insert into FACTURA values ('FAC-5', '122', 'S-5', 50);
insert into FACTURA values ('FAC-6', '25', 'S-1', 60);
insert into FACTURA values ('FAC-7', '40', 'S-2', 70);
insert into FACTURA values ('FAC-8', '45', 'S-2', 80);
insert into FACTURA values ('FAC-9', '56', 'S-2', 90);
insert into FACTURA values ('FAC-10', '62', 'S-3', 100);

-- cada FACTURA debe tener 6 PRODUCTOs, total 60
-- 1
insert into DETALLE_FACTURA values ('Prod1', 'FAC-1');
insert into DETALLE_FACTURA values ('Prod2', 'FAC-1');
insert into DETALLE_FACTURA values ('Prod3', 'FAC-1');
insert into DETALLE_FACTURA values ('Prod4', 'FAC-1');
insert into DETALLE_FACTURA values ('Prod5', 'FAC-1');
insert into DETALLE_FACTURA values ('Prod6', 'FAC-1');
-- 2
insert into DETALLE_FACTURA values ('Prod7', 'FAC-2');
insert into DETALLE_FACTURA values ('Prod8', 'FAC-2');
insert into DETALLE_FACTURA values ('Prod9', 'FAC-2');
insert into DETALLE_FACTURA values ('Prod10', 'FAC-2');
insert into DETALLE_FACTURA values ('Prod11', 'FAC-2');
insert into DETALLE_FACTURA values ('Prod12', 'FAC-2');
-- 3
insert into DETALLE_FACTURA values ('Prod13', 'FAC-3');
insert into DETALLE_FACTURA values ('Prod14', 'FAC-3');
insert into DETALLE_FACTURA values ('Prod15', 'FAC-3');
insert into DETALLE_FACTURA values ('Prod16', 'FAC-3');
insert into DETALLE_FACTURA values ('Prod17', 'FAC-3');
insert into DETALLE_FACTURA values ('Prod18', 'FAC-3');
-- 4
insert into DETALLE_FACTURA values ('Prod19', 'FAC-4');
insert into DETALLE_FACTURA values ('Prod20', 'FAC-4');
insert into DETALLE_FACTURA values ('Prod21', 'FAC-4');
insert into DETALLE_FACTURA values ('Prod22', 'FAC-4');
insert into DETALLE_FACTURA values ('Prod23', 'FAC-4');
insert into DETALLE_FACTURA values ('Prod24', 'FAC-4');
-- 5
insert into DETALLE_FACTURA values ('Prod25', 'FAC-5');
insert into DETALLE_FACTURA values ('Prod26', 'FAC-5');
insert into DETALLE_FACTURA values ('Prod27', 'FAC-5');
insert into DETALLE_FACTURA values ('Prod28', 'FAC-5');
insert into DETALLE_FACTURA values ('Prod29', 'FAC-5');
insert into DETALLE_FACTURA values ('Prod30', 'FAC-5');
-- 6
insert into DETALLE_FACTURA values ('Prod1', 'FAC-6');
insert into DETALLE_FACTURA values ('Prod13', 'FAC-6');
insert into DETALLE_FACTURA values ('Prod23', 'FAC-6');
insert into DETALLE_FACTURA values ('Prod11', 'FAC-6');
insert into DETALLE_FACTURA values ('Prod10', 'FAC-6');
insert into DETALLE_FACTURA values ('Prod9', 'FAC-6');
-- 7
insert into DETALLE_FACTURA values ('Prod8', 'FAC-7');
insert into DETALLE_FACTURA values ('Prod7', 'FAC-7');
insert into DETALLE_FACTURA values ('Prod6', 'FAC-7');
insert into DETALLE_FACTURA values ('Prod5', 'FAC-7');
insert into DETALLE_FACTURA values ('Prod4', 'FAC-7');
insert into DETALLE_FACTURA values ('Prod3', 'FAC-7');
-- 8
insert into DETALLE_FACTURA values ('Prod9', 'FAC-8');
insert into DETALLE_FACTURA values ('Prod8', 'FAC-8');
insert into DETALLE_FACTURA values ('Prod7', 'FAC-8');
insert into DETALLE_FACTURA values ('Prod6', 'FAC-8');
insert into DETALLE_FACTURA values ('Prod5', 'FAC-8');
insert into DETALLE_FACTURA values ('Prod4', 'FAC-8');
-- 9
insert into DETALLE_FACTURA values ('Prod6', 'FAC-9');
insert into DETALLE_FACTURA values ('Prod5', 'FAC-9');
insert into DETALLE_FACTURA values ('Prod4', 'FAC-9');
insert into DETALLE_FACTURA values ('Prod3', 'FAC-9');
insert into DETALLE_FACTURA values ('Prod2', 'FAC-9');
insert into DETALLE_FACTURA values ('Prod1', 'FAC-9');
-- 10
insert into DETALLE_FACTURA values ('Prod16', 'FAC-10');
insert into DETALLE_FACTURA values ('Prod15', 'FAC-10');
insert into DETALLE_FACTURA values ('Prod14', 'FAC-10');
insert into DETALLE_FACTURA values ('Prod13', 'FAC-10');
insert into DETALLE_FACTURA values ('Prod12', 'FAC-10');
insert into DETALLE_FACTURA values ('Prod11', 'FAC-10');

-- 5 orden compra
insert into ORDEN_COMPRA values (1, 'PRV-1', to_date('2023', 'YYYY'));
insert into ORDEN_COMPRA values (2, 'PRV-2', to_date('2023', 'YYYY'));
insert into ORDEN_COMPRA values (3, 'PRV-3', to_date('2023', 'YYYY'));
insert into ORDEN_COMPRA values (4, 'PRV-4', to_date('2023', 'YYYY'));
insert into ORDEN_COMPRA values (5, 'PRV-5', to_date('2023', 'YYYY'));

-- -- cada orden de compra con 6 PRODUCTOs
-- ord1
insert into ORDEN_PRODUCTO values ('Prod10', 1, 1);
insert into ORDEN_PRODUCTO values ('Prod1', 1, 2);
insert into ORDEN_PRODUCTO values ('Prod12', 1, 3);
insert into ORDEN_PRODUCTO values ('Prod15', 1, 4);
insert into ORDEN_PRODUCTO values ('Prod17', 1, 5);
insert into ORDEN_PRODUCTO values ('Prod19', 1, 6);
-- ord2
insert into ORDEN_PRODUCTO values ('Prod13', 2, 7);
insert into ORDEN_PRODUCTO values ('Prod14', 2, 8);
insert into ORDEN_PRODUCTO values ('Prod16', 2, 9);
insert into ORDEN_PRODUCTO values ('Prod18', 2, 10);
insert into ORDEN_PRODUCTO values ('Prod12', 2, 11);
insert into ORDEN_PRODUCTO values ('Prod8', 2, 12);
-- ord3
insert into ORDEN_PRODUCTO values ('Prod9', 3, 13);
insert into ORDEN_PRODUCTO values ('Prod8', 3, 14);
insert into ORDEN_PRODUCTO values ('Prod7', 3, 15);
insert into ORDEN_PRODUCTO values ('Prod6', 3, 16);
insert into ORDEN_PRODUCTO values ('Prod5', 3, 17);
insert into ORDEN_PRODUCTO values ('Prod3', 3, 18);
-- ord4
insert into ORDEN_PRODUCTO values ('Prod19', 4, 19);
insert into ORDEN_PRODUCTO values ('Prod7', 4, 20);
insert into ORDEN_PRODUCTO values ('Prod25', 4, 21);
insert into ORDEN_PRODUCTO values ('Prod26', 4, 22);
insert into ORDEN_PRODUCTO values ('Prod28', 4, 23);
insert into ORDEN_PRODUCTO values ('Prod27', 4, 24);
-- ord5
insert into ORDEN_PRODUCTO values ('Prod23', 5, 25);
insert into ORDEN_PRODUCTO values ('Prod2', 5, 26);
insert into ORDEN_PRODUCTO values ('Prod3', 5, 27);
insert into ORDEN_PRODUCTO values ('Prod30', 5, 28);
insert into ORDEN_PRODUCTO values ('Prod27', 5, 29);
insert into ORDEN_PRODUCTO values ('Prod20', 5, 30);

--- cada PROMOCION con 6 PRODUCTOs, existen 5 PROMOCIONes y 30 PRODUCTOs
-- 1
insert into PRODUCTO_PROMOCION values ('Prod10', 1);
insert into PRODUCTO_PROMOCION values ('Prod1', 1);
insert into PRODUCTO_PROMOCION values ('Prod12', 1);
insert into PRODUCTO_PROMOCION values ('Prod15', 1);
insert into PRODUCTO_PROMOCION values ('Prod17', 1);
insert into PRODUCTO_PROMOCION values ('Prod19', 1);
-- 2
insert into PRODUCTO_PROMOCION values ('Prod13', 2);
insert into PRODUCTO_PROMOCION values ('Prod14', 2);
insert into PRODUCTO_PROMOCION values ('Prod16', 2);
insert into PRODUCTO_PROMOCION values ('Prod18', 2);
insert into PRODUCTO_PROMOCION values ('Prod12', 2);
insert into PRODUCTO_PROMOCION values ('Prod8', 2);
-- 3
insert into PRODUCTO_PROMOCION values ('Prod9', 3);
insert into PRODUCTO_PROMOCION values ('Prod8', 3);
insert into PRODUCTO_PROMOCION values ('Prod7', 3);
insert into PRODUCTO_PROMOCION values ('Prod6', 3);
insert into PRODUCTO_PROMOCION values ('Prod5', 3);
insert into PRODUCTO_PROMOCION values ('Prod3', 3);
-- 4
insert into PRODUCTO_PROMOCION values ('Prod19', 4);
insert into PRODUCTO_PROMOCION values ('Prod7', 4);
insert into PRODUCTO_PROMOCION values ('Prod25', 4);
insert into PRODUCTO_PROMOCION values ('Prod26', 4);
insert into PRODUCTO_PROMOCION values ('Prod28', 4);
insert into PRODUCTO_PROMOCION values ('Prod27', 4);
-- 5
insert into PRODUCTO_PROMOCION values ('Prod23', 5);
insert into PRODUCTO_PROMOCION values ('Prod2', 5);
insert into PRODUCTO_PROMOCION values ('Prod3', 5);
insert into PRODUCTO_PROMOCION values ('Prod30', 5);
insert into PRODUCTO_PROMOCION values ('Prod27', 5);
insert into PRODUCTO_PROMOCION values ('Prod20', 5);
