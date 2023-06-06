create table CONGRESO (
   CON_ID               VARCHAR2(8)           not null,
   CON_NOMBRE           VARCHAR2(64),
   CON_TIPO             VARCHAR2(30),
   CON_FECHA_INICIO     DATE,
   CON_FECHA_FIN        DATE,
   CON_LUGAR_CELEBRACION VARCHAR2(50),
   CON_PAIS             VARCHAR2(50),
   CON_EDITORIAL        VARCHAR2(30),
   constraint PK_CONGRESO primary key (CON_ID)
)

create table DESCRIPTOR (
   DESC_ID              VARCHAR2(8)           not null,
   DESC_NOMBRE          VARCHAR2(64),
   constraint PK_DESCRIPTOR primary key (DESC_ID)
)

create table DESCRIPTOR_LINEA (
   DESC_ID              VARCHAR2(8)           not null,
   LNINV_ID             VARCHAR2(8)           not null
)

create table INVESTIGACION (
   INV_ID               VARCHAR2(8)           not null,
   INV_NOMBRE           VARCHAR2(64),
   INV_ACRONIMO         VARCHAR2(10),
   INV_DESCRIPCION      VARCHAR2(200),
   INV_FINANCIADOR      VARCHAR2(64),
   INV_PRESUPUESTO      NUMBER(12,4),
   INV_FECHA_INICIO     DATE,
   INV_FECHA_FIN        DATE,
   constraint PK_INVESTIGACION primary key (INV_ID)
)

create table LINEA_INVESTIGACION (
   LNINV_ID             VARCHAR2(8)           not null,
   PUB_ID               INTEGER               not null,
   LNINV_NOMBRE         VARCHAR2(10),
   constraint PK_LINEA_INVESTIGACION primary key (LNINV_ID)
)

create table PUBLICACION (
   PUB_ID               INTEGER               not null,
   INV_ID               VARCHAR2(8)           not null,
   PUB_TITULO           VARCHAR2(40),
   constraint PK_PUBLICACION primary key (PUB_ID)
)

create table PUBLICACION_CONGRESO (
   CON_ID               VARCHAR2(8)           not null,
   PUB_ID               INTEGER               not null
)

create table PUBLICACION_REVISTA (
   PUB_ID               INTEGER               not null,
   REV_ID               VARCHAR2(8)           not null,
   PUBREV_PAG_INICIO    INTEGER,
   PUBREV_PAG_FIN       INTEGER
)

create table REVISTA (
   REV_ID               VARCHAR2(8)           not null,
   REV_NOMBRE           VARCHAR2(30),
   REV_EDITORIAL        VARCHAR2(40),
   REV_VOLUMEN          INTEGER,
   REV_NUMERO           INTEGER,
   constraint PK_REVISTA primary key (REV_ID)
)

-- 6 atri
desc congreso; 
-- tipo nacional o internacional
insert into congreso values ('1', 'con1', 'nacional', to_date('06/06/2022', 'dd/mm/yyyy'), to_date('08/06/2023', 'dd/mm/yyyy'), 'Madrid', 'España', 'ed1');
insert into congreso values ('2', 'con2', 'internacional', to_date('05/05/2022', 'dd/mm/yyyy'), to_date('05/05/2023', 'dd/mm/yyyy'), 'Valencia', 'España', 'ed2');

desc descriptor; 
-- 2 atri
insert into descriptor values ('1', 'desc1');
insert into descriptor values ('2', 'desc2');

desc descriptor_linea; 
-- 2 atri
insert into descriptor_linea values ('1', '1');
insert into descriptor_linea values ('2', '2');

desc investigacion; 
-- 8 atri
insert into investigacion values ('1', 'inv1', 'acr1', 'desc1', 'fin1', 1000, to_date('01/01/2022', 'dd/mm/yyyy'), to_date('01/01/2023', 'dd/mm/yyyy'));
insert into investigacion values ('2', 'inv2', 'acr2', 'desc2', 'fin2', 2000, to_date('02/02/2022', 'dd/mm/yyyy'), to_date('02/02/2023', 'dd/mm/yyyy'));

desc linea_investigacion;
-- 3
insert into linea_investigacion values ('1', 1, 'lin1');
insert into linea_investigacion values ('2', 2, 'lin2');

desc publicacion; 
-- 3
insert into publicacion values (1, '1', 'pub1');
insert into publicacion values (2, '2', 'pub2');

desc publicacion_congreso; 
-- 2
insert into publicacion_congreso values ('1', 1);
insert into publicacion_congreso values ('2', 2);

desc publicacion_revista; 
-- 4
insert into publicacion_revista values (1, '1', 1, 2);
insert into publicacion_revista values (2, '2', 3, 4);

desc revista;
-- 5
insert into revista values ('1', 'rev1', 'edi1', 1, 1);
insert into revista values ('2', 'rev2', 'edi2', 2, 2);

-- selects
select * from congreso;
select * from descriptor;
select * from descriptor_linea;
select * from investigacion;
select * from linea_investigacion;
select * from publicacion;
select * from publicacion_congreso; 
select * from publicacion_revista;
select * from revista; 
