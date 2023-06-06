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

create table PROFESOR (
   PRF_ID               VARCHAR2(8)           not null,
   PRO_PRF_ID           VARCHAR2(8),
   PRF_NOMBRES          VARCHAR2(64),
   PRF_APELLIDOS        VARCHAR2(64),
   PRF_NUM_DESPACHO     INTEGER,
   PRF_TELEFONO         VARCHAR2(15),
   PRF_TITULACION       VARCHAR2(40),
   constraint PK_PROFESOR primary key (PRF_ID)
)

create table PROFESOR_INVESTIGACION (
   PRF_ID               VARCHAR2(8)           not null,
   INV_ID               VARCHAR2(8)           not null,
   PRFINV_FECHA_INICIO  DATE,
   PRFINV_FECHA_FIN     DATE,
   PRFINV_ES_LIDER      NUMBER
)

create table PROFESOR_LINEA (
   PRF_ID               VARCHAR2(8)           not null,
   LNINV_ID             VARCHAR2(8)           not null
)

create table PROFESOR_PUBLICACION (
   PUB_ID               INTEGER               not null,
   PRF_ID               VARCHAR2(8)           not null
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
insert into congreso values ('1', 'con1', 'nacional',

desc descriptor; 
-- 2 atri

desc descriptor_linea; 
-- 2 atri

desc investigacion; 
-- 8 atri

desc linea_investigacion;
-- 3

desc profesor; 
-- 7

desc profesor_investigacion; 
-- 5

desc profesor_linea; 
-- 2

desc profesor_publicacion; 
-- 2

desc publicacion; 
-- 3

desc publicacion_congreso; 
-- 2

desc publicacion_revista; 
-- 4

desc revista;
-- 5
insert into revista values ('1', 'c1', 'ed1', 1, 1);
insert into revista values ('2', 'c1', 'ed1', 1, 1);
