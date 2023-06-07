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

create table INVESTIGACION_SUPERVISOR (
   SUP_ID               VARCHAR2(8)           not null,
   INV_ID               VARCHAR2(8)           not null
)

create table LINEA_INVESTIGACION (
   LNINV_ID             VARCHAR2(8)           not null,
   PUB_ID               INTEGER               not null,
   LNINV_NOMBRE         VARCHAR2(10),
   constraint PK_LINEA_INVESTIGACION primary key (LNINV_ID)
)

create table PROFESOR (
   PRF_ID               VARCHAR2(8)           not null,
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

create table PUBLICACION (
   PUB_ID               INTEGER               not null,
   CON_ID               VARCHAR2(8)           not null,
   REV_ID               VARCHAR2(8)           not null,
   INV_ID               VARCHAR2(8)           not null,
   PUB_TITULO           VARCHAR2(40),
   constraint PK_PUBLICACION primary key (PUB_ID)
)

create table REVISTA (
   REV_ID               VARCHAR2(8)           not null,
   REV_NOMBRE           VARCHAR2(30),
   REV_EDITORIAL        VARCHAR2(40),
   REV_VOLUMEN          INTEGER,
   REV_NUMERO           INTEGER,
   REV_PAG_INICIO       INTEGER,
   REV_PAG_FIN          INTEGER,
   constraint PK_REVISTA primary key (REV_ID)
)

create table SUPERVISOR (
   SUP_ID               VARCHAR2(8)           not null,
   SUP_NOMBRE           VARCHAR2(64),
   constraint PK_SUPERVISOR primary key (SUP_ID)
)

-- 2 inserts de cada tabla
insert into congreso values ('CON-1', 'Congreso 1', 'Nacional', to_date('01/01/2023', 'dd/mm/yyyy'), to_date('02/01/2023', 'dd/mm/yyyy'), 'Madrid', 'España', 'Editorial 1');
insert into congreso values ('CON-2', 'Congreso 2', 'Internacional', to_date('03/01/2023', 'dd/mm/yyyy'), to_date('04/01/2023', 'dd/mm/yyyy'), 'Valencia', 'España', 'Editorial 2');

insert into descriptor values ('DESC-1', 'Descriptor 1');
insert into descriptor values ('DESC-2', 'Descriptor 2');

insert into investigacion values ('INV-1', 'Investigacion 1', 'INV1', 'Descripcion 1', 'Financiador 1', 1000, to_date('01/01/2023', 'dd/mm/yyyy'), to_date('02/01/2023', 'dd/mm/yyyy'));
insert into investigacion values ('INV-2', 'Investigacion 2', 'INV2', 'Descripcion 2', 'Financiador 2', 2000, to_date('03/01/2023', 'dd/mm/yyyy'), to_date('04/01/2023', 'dd/mm/yyyy'));

insert into publicacion values (1, 'CON-1', 'REV-1', 'INV-1', 'Titulo 1');
insert into publicacion values (2, 'CON-2', 'REV-2', 'INV-2', 'Titulo 2');

insert into linea_investigacion values ('LNINV-1', 1, 'Linea 1');
insert into linea_investigacion values ('LNINV-2', 2, 'Linea 2');

desc linea_investigacion;

insert into descriptor_linea values ('DESC-1', 'LNINV-1');
insert into descriptor_linea values ('DESC-2', 'LNINV-2');

insert into supervisor values ('SUP-1', 'Supervisor 1');
insert into supervisor values ('SUP-2', 'Supervisor 2');

insert into investigacion_supervisor values ('SUP-1', 'INV-1');
insert into investigacion_supervisor values ('SUP-2', 'INV-2');

insert into profesor values ('PRF-1', 'Ivan', 'Moyota', 1, '123456789', 'Matematicas');
insert into profesor values ('PRF-2', 'Patricio', 'Santillan', 2, '987654321', 'Ciencias Sociales');
insert into profesor values ('PRF-3', 'Xavier', 'Chavez', 3, '123456789', 'Quimica');

insert into profesor_investigacion values ('PRF-1', 'INV-1', to_date('01/01/2023', 'dd/mm/yyyy'), to_date('02/01/2023', 'dd/mm/yyyy'), 1);
insert into profesor_investigacion values ('PRF-2', 'INV-2', to_date('03/01/2023', 'dd/mm/yyyy'), to_date('04/01/2023', 'dd/mm/yyyy'), 0);

insert into revista values ('REV-1', 'Revista 1', 'Editorial 1', 1, 1, 1, 1);
insert into revista values ('REV-2', 'Revista 2', 'Editorial 2', 2, 2, 2, 2);
