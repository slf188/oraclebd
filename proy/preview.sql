-- Type package declaration
create or replace package PDTypes  
as
    TYPE ref_cursor IS REF CURSOR;
end;
/

-- Integrity package declaration
create or replace package IntegrityPackage AS
 procedure InitNestLevel;
 function GetNestLevel return number;
 procedure NextNestLevel;
 procedure PreviousNestLevel;
 end IntegrityPackage;
/

-- Integrity package definition
create or replace package body IntegrityPackage AS
 NestLevel number;

-- Procedure to initialize the trigger nest level
 procedure InitNestLevel is
 begin
 NestLevel := 0;
 end;


-- Function to return the trigger nest level
 function GetNestLevel return number is
 begin
 if NestLevel is null then
     NestLevel := 0;
 end if;
 return(NestLevel);
 end;

-- Procedure to increase the trigger nest level
 procedure NextNestLevel is
 begin
 if NestLevel is null then
     NestLevel := 0;
 end if;
 NestLevel := NestLevel + 1;
 end;

-- Procedure to decrease the trigger nest level
 procedure PreviousNestLevel is
 begin
 NestLevel := NestLevel - 1;
 end;

 end IntegrityPackage;
/


drop trigger TDB_CONGRESO
/

drop trigger TUB_CONGRESO
/

drop trigger TDB_DESCRIPTOR
/

drop trigger TUB_DESCRIPTOR
/

drop trigger TIB_DESCRIPTOR_LINEA
/

drop trigger TUB_DESCRIPTOR_LINEA
/

drop trigger TDB_INVESTIGACION
/

drop trigger TUB_INVESTIGACION
/

drop trigger TDB_LINEA_INVESTIGACION
/

drop trigger TIB_LINEA_INVESTIGACION
/

drop trigger TUB_LINEA_INVESTIGACION
/

drop trigger TDB_PROFESOR
/

drop trigger TIB_PROFESOR
/

drop trigger TUB_PROFESOR
/

drop trigger TIB_PROFESOR_INVESTIGACION
/

drop trigger TUB_PROFESOR_INVESTIGACION
/

drop trigger TIB_PROFESOR_LINEA
/

drop trigger TUB_PROFESOR_LINEA
/

drop trigger TIB_PROFESOR_PUBLICACION
/

drop trigger TUB_PROFESOR_PUBLICACION
/

drop trigger TDB_PUBLICACION
/

drop trigger TIB_PUBLICACION
/

drop trigger TUB_PUBLICACION
/

drop trigger TIB_PUBLICACION_CONGRESO
/

drop trigger TUB_PUBLICACION_CONGRESO
/

drop trigger TIB_PUBLICACION_REVISTA
/

drop trigger TUB_PUBLICACION_REVISTA
/

drop trigger TDB_REVISTA
/

drop trigger TUB_REVISTA
/

drop table CONGRESO cascade constraints
/

drop table DESCRIPTOR cascade constraints
/

drop index DESCRIPTOR_ESTA_DESCRIPTOR_LIN
/

drop index LINEA_ABARCA_DESCRIPTOR_LINEA_
/

drop table DESCRIPTOR_LINEA cascade constraints
/

drop table INVESTIGACION cascade constraints
/

drop index PUBLICACION_INCLUYE_LINEA_INVE
/

drop table LINEA_INVESTIGACION cascade constraints
/

drop index PROFESOR_SUPERVISA_PROFESOR_FK
/

drop table PROFESOR cascade constraints
/

drop index INVESTIGACION_TIENE_PROFESOR_I
/

drop index PROFESOR_TIENE_PROFESOR_INVEST
/

drop table PROFESOR_INVESTIGACION cascade constraints
/

drop index LINEA_ESTA_PROFESOR_LINEA_FK
/

drop index PROFESOR_DISPONE_PROFESOR_LINE
/

drop table PROFESOR_LINEA cascade constraints
/

drop index PUBLICACION_ESTA_PUBLICACION_P
/

drop index PROFESOR_EFECTUA_PROFESOR_PUBL
/

drop table PROFESOR_PUBLICACION cascade constraints
/

drop index INVESTIGACION_CONTIENE_PUBLICA
/

drop table PUBLICACION cascade constraints
/

drop index CONGRESO_REALIZA_PUBLICACION_C
/

drop index PUBLICACION_POSEE_PUBLICACION_
/

drop table PUBLICACION_CONGRESO cascade constraints
/

drop index REVISTA_HACE_PUBLICACION_REVIS
/

drop index PUBLICACION_TIENE_PUBLICACION_
/

drop table PUBLICACION_REVISTA cascade constraints
/

drop table REVISTA cascade constraints
/

/*==============================================================*/
/* Table: CONGRESO                                              */
/*==============================================================*/
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
   tablespace DATOSG1
/

/*==============================================================*/
/* Table: DESCRIPTOR                                            */
/*==============================================================*/
create table DESCRIPTOR (
   DESC_ID              VARCHAR2(8)           not null,
   DESC_NOMBRE          VARCHAR2(64),
   constraint PK_DESCRIPTOR primary key (DESC_ID)
)
   tablespace DATOSG1
/

/*==============================================================*/
/* Table: DESCRIPTOR_LINEA                                      */
/*==============================================================*/
create table DESCRIPTOR_LINEA (
   DESC_ID              VARCHAR2(8)           not null,
   LNINV_ID             VARCHAR2(8)           not null
)
   tablespace DATOSG1
/

/*==============================================================*/
/* Index: LINEA_ABARCA_DESCRIPTOR_LINEA_                        */
/*==============================================================*/
create index LINEA_ABARCA_DESCRIPTOR_LINEA_ on DESCRIPTOR_LINEA (
   LNINV_ID ASC
)
tablespace INDICESG1
/

/*==============================================================*/
/* Index: DESCRIPTOR_ESTA_DESCRIPTOR_LIN                        */
/*==============================================================*/
create index DESCRIPTOR_ESTA_DESCRIPTOR_LIN on DESCRIPTOR_LINEA (
   DESC_ID ASC
)
tablespace INDICESG1
/

/*==============================================================*/
/* Table: INVESTIGACION                                         */
/*==============================================================*/
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
   tablespace DATOSG1
/

/*==============================================================*/
/* Table: LINEA_INVESTIGACION                                   */
/*==============================================================*/
create table LINEA_INVESTIGACION (
   LNINV_ID             VARCHAR2(8)           not null,
   PUB_ID               INTEGER               not null,
   LNINV_NOMBRE         VARCHAR2(10),
   constraint PK_LINEA_INVESTIGACION primary key (LNINV_ID)
)
   tablespace DATOSG1
/

/*==============================================================*/
/* Index: PUBLICACION_INCLUYE_LINEA_INVE                        */
/*==============================================================*/
create index PUBLICACION_INCLUYE_LINEA_INVE on LINEA_INVESTIGACION (
   PUB_ID ASC
)
tablespace INDICESG1
/

/*==============================================================*/
/* Table: PROFESOR                                              */
/*==============================================================*/
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
   tablespace DATOSG1
/

/*==============================================================*/
/* Index: PROFESOR_SUPERVISA_PROFESOR_FK                        */
/*==============================================================*/
create index PROFESOR_SUPERVISA_PROFESOR_FK on PROFESOR (
   PRO_PRF_ID ASC
)
tablespace INDICESG1
/

/*==============================================================*/
/* Table: PROFESOR_INVESTIGACION                                */
/*==============================================================*/
create table PROFESOR_INVESTIGACION (
   PRF_ID               VARCHAR2(8)           not null,
   INV_ID               VARCHAR2(8)           not null,
   PRFINV_FECHA_INICIO  DATE,
   PRFINV_FECHA_FIN     DATE,
   PRFINV_ES_LIDER      NUMBER
)
   tablespace DATOSG1
/

/*==============================================================*/
/* Index: PROFESOR_TIENE_PROFESOR_INVEST                        */
/*==============================================================*/
create index PROFESOR_TIENE_PROFESOR_INVEST on PROFESOR_INVESTIGACION (
   PRF_ID ASC
)
tablespace INDICESG1
/

/*==============================================================*/
/* Index: INVESTIGACION_TIENE_PROFESOR_I                        */
/*==============================================================*/
create index INVESTIGACION_TIENE_PROFESOR_I on PROFESOR_INVESTIGACION (
   INV_ID ASC
)
tablespace INDICESG1
/

/*==============================================================*/
/* Table: PROFESOR_LINEA                                        */
/*==============================================================*/
create table PROFESOR_LINEA (
   PRF_ID               VARCHAR2(8)           not null,
   LNINV_ID             VARCHAR2(8)           not null
)
   tablespace DATOSG1
/

/*==============================================================*/
/* Index: PROFESOR_DISPONE_PROFESOR_LINE                        */
/*==============================================================*/
create index PROFESOR_DISPONE_PROFESOR_LINE on PROFESOR_LINEA (
   PRF_ID ASC
)
tablespace INDICESG1
/

/*==============================================================*/
/* Index: LINEA_ESTA_PROFESOR_LINEA_FK                          */
/*==============================================================*/
create index LINEA_ESTA_PROFESOR_LINEA_FK on PROFESOR_LINEA (
   LNINV_ID ASC
)
tablespace INDICESG1
/

/*==============================================================*/
/* Table: PROFESOR_PUBLICACION                                  */
/*==============================================================*/
create table PROFESOR_PUBLICACION (
   PUB_ID               INTEGER               not null,
   PRF_ID               VARCHAR2(8)           not null
)
   tablespace DATOSG1
/

/*==============================================================*/
/* Index: PROFESOR_EFECTUA_PROFESOR_PUBL                        */
/*==============================================================*/
create index PROFESOR_EFECTUA_PROFESOR_PUBL on PROFESOR_PUBLICACION (
   PRF_ID ASC
)
tablespace INDICESG1
/

/*==============================================================*/
/* Index: PUBLICACION_ESTA_PUBLICACION_P                        */
/*==============================================================*/
create index PUBLICACION_ESTA_PUBLICACION_P on PROFESOR_PUBLICACION (
   PUB_ID ASC
)
tablespace INDICESG1
/

/*==============================================================*/
/* Table: PUBLICACION                                           */
/*==============================================================*/
create table PUBLICACION (
   PUB_ID               INTEGER               not null,
   INV_ID               VARCHAR2(8)           not null,
   PUB_TITULO           VARCHAR2(40),
   constraint PK_PUBLICACION primary key (PUB_ID)
)
   tablespace DATOSG1
/

/*==============================================================*/
/* Index: INVESTIGACION_CONTIENE_PUBLICA                        */
/*==============================================================*/
create index INVESTIGACION_CONTIENE_PUBLICA on PUBLICACION (
   INV_ID ASC
)
tablespace INDICESG1
/

/*==============================================================*/
/* Table: PUBLICACION_CONGRESO                                  */
/*==============================================================*/
create table PUBLICACION_CONGRESO (
   CON_ID               VARCHAR2(8)           not null,
   PUB_ID               INTEGER               not null
)
   tablespace DATOSG1
/

/*==============================================================*/
/* Index: PUBLICACION_POSEE_PUBLICACION_                        */
/*==============================================================*/
create index PUBLICACION_POSEE_PUBLICACION_ on PUBLICACION_CONGRESO (
   PUB_ID ASC
)
tablespace INDICESG1
/

/*==============================================================*/
/* Index: CONGRESO_REALIZA_PUBLICACION_C                        */
/*==============================================================*/
create index CONGRESO_REALIZA_PUBLICACION_C on PUBLICACION_CONGRESO (
   CON_ID ASC
)
tablespace INDICESG1
/

/*==============================================================*/
/* Table: PUBLICACION_REVISTA                                   */
/*==============================================================*/
create table PUBLICACION_REVISTA (
   PUB_ID               INTEGER               not null,
   REV_ID               VARCHAR2(8)           not null,
   PUBREV_PAG_INICIO    INTEGER,
   PUBREV_PAG_FIN       INTEGER
)
   tablespace DATOSG1
/

/*==============================================================*/
/* Index: PUBLICACION_TIENE_PUBLICACION_                        */
/*==============================================================*/
create index PUBLICACION_TIENE_PUBLICACION_ on PUBLICACION_REVISTA (
   PUB_ID ASC
)
tablespace INDICESG1
/

/*==============================================================*/
/* Index: REVISTA_HACE_PUBLICACION_REVIS                        */
/*==============================================================*/
create index REVISTA_HACE_PUBLICACION_REVIS on PUBLICACION_REVISTA (
   REV_ID ASC
)
tablespace INDICESG1
/

/*==============================================================*/
/* Table: REVISTA                                               */
/*==============================================================*/
create table REVISTA (
   REV_ID               VARCHAR2(8)           not null,
   REV_NOMBRE           VARCHAR2(30),
   REV_EDITORIAL        VARCHAR2(40),
   REV_VOLUMEN          INTEGER,
   REV_NUMERO           INTEGER,
   constraint PK_REVISTA primary key (REV_ID)
)
   tablespace DATOSG1
/


create trigger TDB_CONGRESO before delete
on CONGRESO for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of DeleteParentRestrict constraint for "PUBLICACION_CONGRESO"
    cursor cfk1_publicacion_congreso(var_con_id varchar) is
       select 1
       from   PUBLICACION_CONGRESO
       where  CON_ID = var_con_id
        and   var_con_id is not null;

begin
    --  Cannot delete parent "CONGRESO" if children still exist in "PUBLICACION_CONGRESO"
    open  cfk1_publicacion_congreso(:old.CON_ID);
    fetch cfk1_publicacion_congreso into dummy;
    found := cfk1_publicacion_congreso%FOUND;
    close cfk1_publicacion_congreso;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "PUBLICACION_CONGRESO". Cannot delete parent "CONGRESO".';
       raise integrity_error;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_CONGRESO before update
of CON_ID
on CONGRESO for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of UpdateParentRestrict constraint for "PUBLICACION_CONGRESO"
    cursor cfk1_publicacion_congreso(var_con_id varchar) is
       select 1
       from   PUBLICACION_CONGRESO
       where  CON_ID = var_con_id
        and   var_con_id is not null;

begin
    --  Cannot modify parent code in "CONGRESO" if children still exist in "PUBLICACION_CONGRESO"
    if (updating('CON_ID') and :old.CON_ID != :new.CON_ID) then
       open  cfk1_publicacion_congreso(:old.CON_ID);
       fetch cfk1_publicacion_congreso into dummy;
       found := cfk1_publicacion_congreso%FOUND;
       close cfk1_publicacion_congreso;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "PUBLICACION_CONGRESO". Cannot modify parent code in "CONGRESO".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TDB_DESCRIPTOR before delete
on DESCRIPTOR for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of DeleteParentRestrict constraint for "DESCRIPTOR_LINEA"
    cursor cfk1_descriptor_linea(var_desc_id varchar) is
       select 1
       from   DESCRIPTOR_LINEA
       where  DESC_ID = var_desc_id
        and   var_desc_id is not null;

begin
    --  Cannot delete parent "DESCRIPTOR" if children still exist in "DESCRIPTOR_LINEA"
    open  cfk1_descriptor_linea(:old.DESC_ID);
    fetch cfk1_descriptor_linea into dummy;
    found := cfk1_descriptor_linea%FOUND;
    close cfk1_descriptor_linea;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "DESCRIPTOR_LINEA". Cannot delete parent "DESCRIPTOR".';
       raise integrity_error;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_DESCRIPTOR before update
of DESC_ID
on DESCRIPTOR for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of UpdateParentRestrict constraint for "DESCRIPTOR_LINEA"
    cursor cfk1_descriptor_linea(var_desc_id varchar) is
       select 1
       from   DESCRIPTOR_LINEA
       where  DESC_ID = var_desc_id
        and   var_desc_id is not null;

begin
    --  Cannot modify parent code in "DESCRIPTOR" if children still exist in "DESCRIPTOR_LINEA"
    if (updating('DESC_ID') and :old.DESC_ID != :new.DESC_ID) then
       open  cfk1_descriptor_linea(:old.DESC_ID);
       fetch cfk1_descriptor_linea into dummy;
       found := cfk1_descriptor_linea%FOUND;
       close cfk1_descriptor_linea;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "DESCRIPTOR_LINEA". Cannot modify parent code in "DESCRIPTOR".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TIB_DESCRIPTOR_LINEA before insert
on DESCRIPTOR_LINEA for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of InsertChildParentExist constraint for the parent "LINEA_INVESTIGACION"
    cursor cpk1_descriptor_linea(var_lninv_id varchar) is
       select 1
       from   LINEA_INVESTIGACION
       where  LNINV_ID = var_lninv_id
        and   var_lninv_id is not null;
    --  Declaration of InsertChildParentExist constraint for the parent "DESCRIPTOR"
    cursor cpk2_descriptor_linea(var_desc_id varchar) is
       select 1
       from   DESCRIPTOR
       where  DESC_ID = var_desc_id
        and   var_desc_id is not null;

begin
    --  Parent "LINEA_INVESTIGACION" must exist when inserting a child in "DESCRIPTOR_LINEA"
    if :new.LNINV_ID is not null then
       open  cpk1_descriptor_linea(:new.LNINV_ID);
       fetch cpk1_descriptor_linea into dummy;
       found := cpk1_descriptor_linea%FOUND;
       close cpk1_descriptor_linea;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "LINEA_INVESTIGACION". Cannot create child in "DESCRIPTOR_LINEA".';
          raise integrity_error;
       end if;
    end if;

    --  Parent "DESCRIPTOR" must exist when inserting a child in "DESCRIPTOR_LINEA"
    if :new.DESC_ID is not null then
       open  cpk2_descriptor_linea(:new.DESC_ID);
       fetch cpk2_descriptor_linea into dummy;
       found := cpk2_descriptor_linea%FOUND;
       close cpk2_descriptor_linea;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "DESCRIPTOR". Cannot create child in "DESCRIPTOR_LINEA".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_DESCRIPTOR_LINEA before update
of DESC_ID,
   LNINV_ID
on DESCRIPTOR_LINEA for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    seq NUMBER;
    --  Declaration of UpdateChildParentExist constraint for the parent "LINEA_INVESTIGACION"
    cursor cpk1_descriptor_linea(var_lninv_id varchar) is
       select 1
       from   LINEA_INVESTIGACION
       where  LNINV_ID = var_lninv_id
        and   var_lninv_id is not null;
    --  Declaration of UpdateChildParentExist constraint for the parent "DESCRIPTOR"
    cursor cpk2_descriptor_linea(var_desc_id varchar) is
       select 1
       from   DESCRIPTOR
       where  DESC_ID = var_desc_id
        and   var_desc_id is not null;

begin
    seq := IntegrityPackage.GetNestLevel;
    --  Parent "LINEA_INVESTIGACION" must exist when updating a child in "DESCRIPTOR_LINEA"
    if (:new.LNINV_ID is not null) and (seq = 0) then
       open  cpk1_descriptor_linea(:new.LNINV_ID);
       fetch cpk1_descriptor_linea into dummy;
       found := cpk1_descriptor_linea%FOUND;
       close cpk1_descriptor_linea;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "LINEA_INVESTIGACION". Cannot update child in "DESCRIPTOR_LINEA".';
          raise integrity_error;
       end if;
    end if;

    --  Parent "DESCRIPTOR" must exist when updating a child in "DESCRIPTOR_LINEA"
    if (:new.DESC_ID is not null) and (seq = 0) then
       open  cpk2_descriptor_linea(:new.DESC_ID);
       fetch cpk2_descriptor_linea into dummy;
       found := cpk2_descriptor_linea%FOUND;
       close cpk2_descriptor_linea;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "DESCRIPTOR". Cannot update child in "DESCRIPTOR_LINEA".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TDB_INVESTIGACION before delete
on INVESTIGACION for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of DeleteParentRestrict constraint for "PROFESOR_INVESTIGACION"
    cursor cfk1_profesor_investigacion(var_inv_id varchar) is
       select 1
       from   PROFESOR_INVESTIGACION
       where  INV_ID = var_inv_id
        and   var_inv_id is not null;
    --  Declaration of DeleteParentRestrict constraint for "PUBLICACION"
    cursor cfk2_publicacion(var_inv_id varchar) is
       select 1
       from   PUBLICACION
       where  INV_ID = var_inv_id
        and   var_inv_id is not null;

begin
    --  Cannot delete parent "INVESTIGACION" if children still exist in "PROFESOR_INVESTIGACION"
    open  cfk1_profesor_investigacion(:old.INV_ID);
    fetch cfk1_profesor_investigacion into dummy;
    found := cfk1_profesor_investigacion%FOUND;
    close cfk1_profesor_investigacion;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "PROFESOR_INVESTIGACION". Cannot delete parent "INVESTIGACION".';
       raise integrity_error;
    end if;

    --  Cannot delete parent "INVESTIGACION" if children still exist in "PUBLICACION"
    open  cfk2_publicacion(:old.INV_ID);
    fetch cfk2_publicacion into dummy;
    found := cfk2_publicacion%FOUND;
    close cfk2_publicacion;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "PUBLICACION". Cannot delete parent "INVESTIGACION".';
       raise integrity_error;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_INVESTIGACION before update
of INV_ID
on INVESTIGACION for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of UpdateParentRestrict constraint for "PROFESOR_INVESTIGACION"
    cursor cfk1_profesor_investigacion(var_inv_id varchar) is
       select 1
       from   PROFESOR_INVESTIGACION
       where  INV_ID = var_inv_id
        and   var_inv_id is not null;
    --  Declaration of UpdateParentRestrict constraint for "PUBLICACION"
    cursor cfk2_publicacion(var_inv_id varchar) is
       select 1
       from   PUBLICACION
       where  INV_ID = var_inv_id
        and   var_inv_id is not null;

begin
    --  Cannot modify parent code in "INVESTIGACION" if children still exist in "PROFESOR_INVESTIGACION"
    if (updating('INV_ID') and :old.INV_ID != :new.INV_ID) then
       open  cfk1_profesor_investigacion(:old.INV_ID);
       fetch cfk1_profesor_investigacion into dummy;
       found := cfk1_profesor_investigacion%FOUND;
       close cfk1_profesor_investigacion;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "PROFESOR_INVESTIGACION". Cannot modify parent code in "INVESTIGACION".';
          raise integrity_error;
       end if;
    end if;

    --  Cannot modify parent code in "INVESTIGACION" if children still exist in "PUBLICACION"
    if (updating('INV_ID') and :old.INV_ID != :new.INV_ID) then
       open  cfk2_publicacion(:old.INV_ID);
       fetch cfk2_publicacion into dummy;
       found := cfk2_publicacion%FOUND;
       close cfk2_publicacion;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "PUBLICACION". Cannot modify parent code in "INVESTIGACION".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TDB_LINEA_INVESTIGACION before delete
on LINEA_INVESTIGACION for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of DeleteParentRestrict constraint for "DESCRIPTOR_LINEA"
    cursor cfk1_descriptor_linea(var_lninv_id varchar) is
       select 1
       from   DESCRIPTOR_LINEA
       where  LNINV_ID = var_lninv_id
        and   var_lninv_id is not null;
    --  Declaration of DeleteParentRestrict constraint for "PROFESOR_LINEA"
    cursor cfk2_profesor_linea(var_lninv_id varchar) is
       select 1
       from   PROFESOR_LINEA
       where  LNINV_ID = var_lninv_id
        and   var_lninv_id is not null;

begin
    --  Cannot delete parent "LINEA_INVESTIGACION" if children still exist in "DESCRIPTOR_LINEA"
    open  cfk1_descriptor_linea(:old.LNINV_ID);
    fetch cfk1_descriptor_linea into dummy;
    found := cfk1_descriptor_linea%FOUND;
    close cfk1_descriptor_linea;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "DESCRIPTOR_LINEA". Cannot delete parent "LINEA_INVESTIGACION".';
       raise integrity_error;
    end if;

    --  Cannot delete parent "LINEA_INVESTIGACION" if children still exist in "PROFESOR_LINEA"
    open  cfk2_profesor_linea(:old.LNINV_ID);
    fetch cfk2_profesor_linea into dummy;
    found := cfk2_profesor_linea%FOUND;
    close cfk2_profesor_linea;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "PROFESOR_LINEA". Cannot delete parent "LINEA_INVESTIGACION".';
       raise integrity_error;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TIB_LINEA_INVESTIGACION before insert
on LINEA_INVESTIGACION for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of InsertChildParentExist constraint for the parent "PUBLICACION"
    cursor cpk1_linea_investigacion(var_pub_id integer) is
       select 1
       from   PUBLICACION
       where  PUB_ID = var_pub_id
        and   var_pub_id is not null;

begin
    --  Parent "PUBLICACION" must exist when inserting a child in "LINEA_INVESTIGACION"
    if :new.PUB_ID is not null then
       open  cpk1_linea_investigacion(:new.PUB_ID);
       fetch cpk1_linea_investigacion into dummy;
       found := cpk1_linea_investigacion%FOUND;
       close cpk1_linea_investigacion;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "PUBLICACION". Cannot create child in "LINEA_INVESTIGACION".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_LINEA_INVESTIGACION before update
of LNINV_ID,
   PUB_ID
on LINEA_INVESTIGACION for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    seq NUMBER;
    --  Declaration of UpdateChildParentExist constraint for the parent "PUBLICACION"
    cursor cpk1_linea_investigacion(var_pub_id integer) is
       select 1
       from   PUBLICACION
       where  PUB_ID = var_pub_id
        and   var_pub_id is not null;
    --  Declaration of UpdateParentRestrict constraint for "DESCRIPTOR_LINEA"
    cursor cfk1_descriptor_linea(var_lninv_id varchar) is
       select 1
       from   DESCRIPTOR_LINEA
       where  LNINV_ID = var_lninv_id
        and   var_lninv_id is not null;
    --  Declaration of UpdateParentRestrict constraint for "PROFESOR_LINEA"
    cursor cfk2_profesor_linea(var_lninv_id varchar) is
       select 1
       from   PROFESOR_LINEA
       where  LNINV_ID = var_lninv_id
        and   var_lninv_id is not null;

begin
    seq := IntegrityPackage.GetNestLevel;
    --  Parent "PUBLICACION" must exist when updating a child in "LINEA_INVESTIGACION"
    if (:new.PUB_ID is not null) and (seq = 0) then
       open  cpk1_linea_investigacion(:new.PUB_ID);
       fetch cpk1_linea_investigacion into dummy;
       found := cpk1_linea_investigacion%FOUND;
       close cpk1_linea_investigacion;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "PUBLICACION". Cannot update child in "LINEA_INVESTIGACION".';
          raise integrity_error;
       end if;
    end if;

    --  Cannot modify parent code in "LINEA_INVESTIGACION" if children still exist in "DESCRIPTOR_LINEA"
    if (updating('LNINV_ID') and :old.LNINV_ID != :new.LNINV_ID) then
       open  cfk1_descriptor_linea(:old.LNINV_ID);
       fetch cfk1_descriptor_linea into dummy;
       found := cfk1_descriptor_linea%FOUND;
       close cfk1_descriptor_linea;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "DESCRIPTOR_LINEA". Cannot modify parent code in "LINEA_INVESTIGACION".';
          raise integrity_error;
       end if;
    end if;

    --  Cannot modify parent code in "LINEA_INVESTIGACION" if children still exist in "PROFESOR_LINEA"
    if (updating('LNINV_ID') and :old.LNINV_ID != :new.LNINV_ID) then
       open  cfk2_profesor_linea(:old.LNINV_ID);
       fetch cfk2_profesor_linea into dummy;
       found := cfk2_profesor_linea%FOUND;
       close cfk2_profesor_linea;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "PROFESOR_LINEA". Cannot modify parent code in "LINEA_INVESTIGACION".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TDB_PROFESOR before delete
on PROFESOR for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of DeleteParentRestrict constraint for "PROFESOR_INVESTIGACION"
    cursor cfk1_profesor_investigacion(var_prf_id varchar) is
       select 1
       from   PROFESOR_INVESTIGACION
       where  PRF_ID = var_prf_id
        and   var_prf_id is not null;
    --  Declaration of DeleteParentRestrict constraint for "PROFESOR_LINEA"
    cursor cfk2_profesor_linea(var_prf_id varchar) is
       select 1
       from   PROFESOR_LINEA
       where  PRF_ID = var_prf_id
        and   var_prf_id is not null;
    --  Declaration of DeleteParentRestrict constraint for "PROFESOR_PUBLICACION"
    cursor cfk3_profesor_publicacion(var_prf_id varchar) is
       select 1
       from   PROFESOR_PUBLICACION
       where  PRF_ID = var_prf_id
        and   var_prf_id is not null;
    --  Declaration of DeleteParentRestrict constraint for "PROFESOR"
    cursor cfk4_profesor(var_prf_id varchar) is
       select 1
       from   PROFESOR
       where  PRO_PRF_ID = var_prf_id
        and   var_prf_id is not null;

begin
    --  Cannot delete parent "PROFESOR" if children still exist in "PROFESOR_INVESTIGACION"
    open  cfk1_profesor_investigacion(:old.PRF_ID);
    fetch cfk1_profesor_investigacion into dummy;
    found := cfk1_profesor_investigacion%FOUND;
    close cfk1_profesor_investigacion;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "PROFESOR_INVESTIGACION". Cannot delete parent "PROFESOR".';
       raise integrity_error;
    end if;

    --  Cannot delete parent "PROFESOR" if children still exist in "PROFESOR_LINEA"
    open  cfk2_profesor_linea(:old.PRF_ID);
    fetch cfk2_profesor_linea into dummy;
    found := cfk2_profesor_linea%FOUND;
    close cfk2_profesor_linea;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "PROFESOR_LINEA". Cannot delete parent "PROFESOR".';
       raise integrity_error;
    end if;

    --  Cannot delete parent "PROFESOR" if children still exist in "PROFESOR_PUBLICACION"
    open  cfk3_profesor_publicacion(:old.PRF_ID);
    fetch cfk3_profesor_publicacion into dummy;
    found := cfk3_profesor_publicacion%FOUND;
    close cfk3_profesor_publicacion;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "PROFESOR_PUBLICACION". Cannot delete parent "PROFESOR".';
       raise integrity_error;
    end if;

    --  Cannot delete parent "PROFESOR" if children still exist in "PROFESOR"
    open  cfk4_profesor(:old.PRF_ID);
    fetch cfk4_profesor into dummy;
    found := cfk4_profesor%FOUND;
    close cfk4_profesor;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "PROFESOR". Cannot delete parent "PROFESOR".';
       raise integrity_error;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TIB_PROFESOR before insert
on PROFESOR for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of InsertChildParentExist constraint for the parent "PROFESOR"
    cursor cpk1_profesor(var_pro_prf_id varchar) is
       select 1
       from   PROFESOR
       where  PRF_ID = var_pro_prf_id
        and   var_pro_prf_id is not null;

begin
    --  Parent "PROFESOR" must exist when inserting a child in "PROFESOR"
    if :new.PRO_PRF_ID is not null then
       open  cpk1_profesor(:new.PRO_PRF_ID);
       fetch cpk1_profesor into dummy;
       found := cpk1_profesor%FOUND;
       close cpk1_profesor;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "PROFESOR". Cannot create child in "PROFESOR".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_PROFESOR before update
of PRF_ID,
   PRO_PRF_ID
on PROFESOR for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    seq NUMBER;
    --  Declaration of UpdateChildParentExist constraint for the parent "PROFESOR"
    cursor cpk1_profesor(var_pro_prf_id varchar) is
       select 1
       from   PROFESOR
       where  PRF_ID = var_pro_prf_id
        and   var_pro_prf_id is not null;
    --  Declaration of UpdateParentRestrict constraint for "PROFESOR_INVESTIGACION"
    cursor cfk1_profesor_investigacion(var_prf_id varchar) is
       select 1
       from   PROFESOR_INVESTIGACION
       where  PRF_ID = var_prf_id
        and   var_prf_id is not null;
    --  Declaration of UpdateParentRestrict constraint for "PROFESOR_LINEA"
    cursor cfk2_profesor_linea(var_prf_id varchar) is
       select 1
       from   PROFESOR_LINEA
       where  PRF_ID = var_prf_id
        and   var_prf_id is not null;
    --  Declaration of UpdateParentRestrict constraint for "PROFESOR_PUBLICACION"
    cursor cfk3_profesor_publicacion(var_prf_id varchar) is
       select 1
       from   PROFESOR_PUBLICACION
       where  PRF_ID = var_prf_id
        and   var_prf_id is not null;
    --  Declaration of UpdateParentRestrict constraint for "PROFESOR"
    cursor cfk4_profesor(var_prf_id varchar) is
       select 1
       from   PROFESOR
       where  PRO_PRF_ID = var_prf_id
        and   var_prf_id is not null;

begin
    seq := IntegrityPackage.GetNestLevel;
    --  Parent "PROFESOR" must exist when updating a child in "PROFESOR"
    if (:new.PRO_PRF_ID is not null) and (seq = 0) then
       open  cpk1_profesor(:new.PRO_PRF_ID);
       fetch cpk1_profesor into dummy;
       found := cpk1_profesor%FOUND;
       close cpk1_profesor;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "PROFESOR". Cannot update child in "PROFESOR".';
          raise integrity_error;
       end if;
    end if;

    --  Cannot modify parent code in "PROFESOR" if children still exist in "PROFESOR_INVESTIGACION"
    if (updating('PRF_ID') and :old.PRF_ID != :new.PRF_ID) then
       open  cfk1_profesor_investigacion(:old.PRF_ID);
       fetch cfk1_profesor_investigacion into dummy;
       found := cfk1_profesor_investigacion%FOUND;
       close cfk1_profesor_investigacion;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "PROFESOR_INVESTIGACION". Cannot modify parent code in "PROFESOR".';
          raise integrity_error;
       end if;
    end if;

    --  Cannot modify parent code in "PROFESOR" if children still exist in "PROFESOR_LINEA"
    if (updating('PRF_ID') and :old.PRF_ID != :new.PRF_ID) then
       open  cfk2_profesor_linea(:old.PRF_ID);
       fetch cfk2_profesor_linea into dummy;
       found := cfk2_profesor_linea%FOUND;
       close cfk2_profesor_linea;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "PROFESOR_LINEA". Cannot modify parent code in "PROFESOR".';
          raise integrity_error;
       end if;
    end if;

    --  Cannot modify parent code in "PROFESOR" if children still exist in "PROFESOR_PUBLICACION"
    if (updating('PRF_ID') and :old.PRF_ID != :new.PRF_ID) then
       open  cfk3_profesor_publicacion(:old.PRF_ID);
       fetch cfk3_profesor_publicacion into dummy;
       found := cfk3_profesor_publicacion%FOUND;
       close cfk3_profesor_publicacion;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "PROFESOR_PUBLICACION". Cannot modify parent code in "PROFESOR".';
          raise integrity_error;
       end if;
    end if;

    --  Cannot modify parent code in "PROFESOR" if children still exist in "PROFESOR"
    if (updating('PRF_ID') and :old.PRF_ID != :new.PRF_ID) then
       open  cfk4_profesor(:old.PRF_ID);
       fetch cfk4_profesor into dummy;
       found := cfk4_profesor%FOUND;
       close cfk4_profesor;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "PROFESOR". Cannot modify parent code in "PROFESOR".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TIB_PROFESOR_INVESTIGACION before insert
on PROFESOR_INVESTIGACION for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of InsertChildParentExist constraint for the parent "PROFESOR"
    cursor cpk1_profesor_investigacion(var_prf_id varchar) is
       select 1
       from   PROFESOR
       where  PRF_ID = var_prf_id
        and   var_prf_id is not null;
    --  Declaration of InsertChildParentExist constraint for the parent "INVESTIGACION"
    cursor cpk2_profesor_investigacion(var_inv_id varchar) is
       select 1
       from   INVESTIGACION
       where  INV_ID = var_inv_id
        and   var_inv_id is not null;

begin
    --  Parent "PROFESOR" must exist when inserting a child in "PROFESOR_INVESTIGACION"
    if :new.PRF_ID is not null then
       open  cpk1_profesor_investigacion(:new.PRF_ID);
       fetch cpk1_profesor_investigacion into dummy;
       found := cpk1_profesor_investigacion%FOUND;
       close cpk1_profesor_investigacion;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "PROFESOR". Cannot create child in "PROFESOR_INVESTIGACION".';
          raise integrity_error;
       end if;
    end if;

    --  Parent "INVESTIGACION" must exist when inserting a child in "PROFESOR_INVESTIGACION"
    if :new.INV_ID is not null then
       open  cpk2_profesor_investigacion(:new.INV_ID);
       fetch cpk2_profesor_investigacion into dummy;
       found := cpk2_profesor_investigacion%FOUND;
       close cpk2_profesor_investigacion;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "INVESTIGACION". Cannot create child in "PROFESOR_INVESTIGACION".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_PROFESOR_INVESTIGACION before update
of PRF_ID,
   INV_ID,
   PRFINV_ES_LIDER
on PROFESOR_INVESTIGACION for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    seq NUMBER;
    --  Declaration of UpdateChildParentExist constraint for the parent "PROFESOR"
    cursor cpk1_profesor_investigacion(var_prf_id varchar) is
       select 1
       from   PROFESOR
       where  PRF_ID = var_prf_id
        and   var_prf_id is not null;
    --  Declaration of UpdateChildParentExist constraint for the parent "INVESTIGACION"
    cursor cpk2_profesor_investigacion(var_inv_id varchar) is
       select 1
       from   INVESTIGACION
       where  INV_ID = var_inv_id
        and   var_inv_id is not null;

begin
    --  Non modifiable column "PRFINV_ES_LIDER" cannot be modified
    if updating('PRFINV_ES_LIDER') and :old.PRFINV_ES_LIDER != :new.PRFINV_ES_LIDER then
       errno  := -20001;
       errmsg := 'Non modifiable column "PRFINV_ES_LIDER" cannot be modified.';
       raise integrity_error;
    end if;

    seq := IntegrityPackage.GetNestLevel;
    --  Parent "PROFESOR" must exist when updating a child in "PROFESOR_INVESTIGACION"
    if (:new.PRF_ID is not null) and (seq = 0) then
       open  cpk1_profesor_investigacion(:new.PRF_ID);
       fetch cpk1_profesor_investigacion into dummy;
       found := cpk1_profesor_investigacion%FOUND;
       close cpk1_profesor_investigacion;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "PROFESOR". Cannot update child in "PROFESOR_INVESTIGACION".';
          raise integrity_error;
       end if;
    end if;

    --  Parent "INVESTIGACION" must exist when updating a child in "PROFESOR_INVESTIGACION"
    if (:new.INV_ID is not null) and (seq = 0) then
       open  cpk2_profesor_investigacion(:new.INV_ID);
       fetch cpk2_profesor_investigacion into dummy;
       found := cpk2_profesor_investigacion%FOUND;
       close cpk2_profesor_investigacion;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "INVESTIGACION". Cannot update child in "PROFESOR_INVESTIGACION".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TIB_PROFESOR_LINEA before insert
on PROFESOR_LINEA for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of InsertChildParentExist constraint for the parent "PROFESOR"
    cursor cpk1_profesor_linea(var_prf_id varchar) is
       select 1
       from   PROFESOR
       where  PRF_ID = var_prf_id
        and   var_prf_id is not null;
    --  Declaration of InsertChildParentExist constraint for the parent "LINEA_INVESTIGACION"
    cursor cpk2_profesor_linea(var_lninv_id varchar) is
       select 1
       from   LINEA_INVESTIGACION
       where  LNINV_ID = var_lninv_id
        and   var_lninv_id is not null;

begin
    --  Parent "PROFESOR" must exist when inserting a child in "PROFESOR_LINEA"
    if :new.PRF_ID is not null then
       open  cpk1_profesor_linea(:new.PRF_ID);
       fetch cpk1_profesor_linea into dummy;
       found := cpk1_profesor_linea%FOUND;
       close cpk1_profesor_linea;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "PROFESOR". Cannot create child in "PROFESOR_LINEA".';
          raise integrity_error;
       end if;
    end if;

    --  Parent "LINEA_INVESTIGACION" must exist when inserting a child in "PROFESOR_LINEA"
    if :new.LNINV_ID is not null then
       open  cpk2_profesor_linea(:new.LNINV_ID);
       fetch cpk2_profesor_linea into dummy;
       found := cpk2_profesor_linea%FOUND;
       close cpk2_profesor_linea;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "LINEA_INVESTIGACION". Cannot create child in "PROFESOR_LINEA".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_PROFESOR_LINEA before update
of PRF_ID,
   LNINV_ID
on PROFESOR_LINEA for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    seq NUMBER;
    --  Declaration of UpdateChildParentExist constraint for the parent "PROFESOR"
    cursor cpk1_profesor_linea(var_prf_id varchar) is
       select 1
       from   PROFESOR
       where  PRF_ID = var_prf_id
        and   var_prf_id is not null;
    --  Declaration of UpdateChildParentExist constraint for the parent "LINEA_INVESTIGACION"
    cursor cpk2_profesor_linea(var_lninv_id varchar) is
       select 1
       from   LINEA_INVESTIGACION
       where  LNINV_ID = var_lninv_id
        and   var_lninv_id is not null;

begin
    seq := IntegrityPackage.GetNestLevel;
    --  Parent "PROFESOR" must exist when updating a child in "PROFESOR_LINEA"
    if (:new.PRF_ID is not null) and (seq = 0) then
       open  cpk1_profesor_linea(:new.PRF_ID);
       fetch cpk1_profesor_linea into dummy;
       found := cpk1_profesor_linea%FOUND;
       close cpk1_profesor_linea;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "PROFESOR". Cannot update child in "PROFESOR_LINEA".';
          raise integrity_error;
       end if;
    end if;

    --  Parent "LINEA_INVESTIGACION" must exist when updating a child in "PROFESOR_LINEA"
    if (:new.LNINV_ID is not null) and (seq = 0) then
       open  cpk2_profesor_linea(:new.LNINV_ID);
       fetch cpk2_profesor_linea into dummy;
       found := cpk2_profesor_linea%FOUND;
       close cpk2_profesor_linea;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "LINEA_INVESTIGACION". Cannot update child in "PROFESOR_LINEA".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TIB_PROFESOR_PUBLICACION before insert
on PROFESOR_PUBLICACION for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of InsertChildParentExist constraint for the parent "PROFESOR"
    cursor cpk1_profesor_publicacion(var_prf_id varchar) is
       select 1
       from   PROFESOR
       where  PRF_ID = var_prf_id
        and   var_prf_id is not null;
    --  Declaration of InsertChildParentExist constraint for the parent "PUBLICACION"
    cursor cpk2_profesor_publicacion(var_pub_id integer) is
       select 1
       from   PUBLICACION
       where  PUB_ID = var_pub_id
        and   var_pub_id is not null;

begin
    --  Parent "PROFESOR" must exist when inserting a child in "PROFESOR_PUBLICACION"
    if :new.PRF_ID is not null then
       open  cpk1_profesor_publicacion(:new.PRF_ID);
       fetch cpk1_profesor_publicacion into dummy;
       found := cpk1_profesor_publicacion%FOUND;
       close cpk1_profesor_publicacion;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "PROFESOR". Cannot create child in "PROFESOR_PUBLICACION".';
          raise integrity_error;
       end if;
    end if;

    --  Parent "PUBLICACION" must exist when inserting a child in "PROFESOR_PUBLICACION"
    if :new.PUB_ID is not null then
       open  cpk2_profesor_publicacion(:new.PUB_ID);
       fetch cpk2_profesor_publicacion into dummy;
       found := cpk2_profesor_publicacion%FOUND;
       close cpk2_profesor_publicacion;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "PUBLICACION". Cannot create child in "PROFESOR_PUBLICACION".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_PROFESOR_PUBLICACION before update
of PUB_ID,
   PRF_ID
on PROFESOR_PUBLICACION for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    seq NUMBER;
    --  Declaration of UpdateChildParentExist constraint for the parent "PROFESOR"
    cursor cpk1_profesor_publicacion(var_prf_id varchar) is
       select 1
       from   PROFESOR
       where  PRF_ID = var_prf_id
        and   var_prf_id is not null;
    --  Declaration of UpdateChildParentExist constraint for the parent "PUBLICACION"
    cursor cpk2_profesor_publicacion(var_pub_id integer) is
       select 1
       from   PUBLICACION
       where  PUB_ID = var_pub_id
        and   var_pub_id is not null;

begin
    seq := IntegrityPackage.GetNestLevel;
    --  Parent "PROFESOR" must exist when updating a child in "PROFESOR_PUBLICACION"
    if (:new.PRF_ID is not null) and (seq = 0) then
       open  cpk1_profesor_publicacion(:new.PRF_ID);
       fetch cpk1_profesor_publicacion into dummy;
       found := cpk1_profesor_publicacion%FOUND;
       close cpk1_profesor_publicacion;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "PROFESOR". Cannot update child in "PROFESOR_PUBLICACION".';
          raise integrity_error;
       end if;
    end if;

    --  Parent "PUBLICACION" must exist when updating a child in "PROFESOR_PUBLICACION"
    if (:new.PUB_ID is not null) and (seq = 0) then
       open  cpk2_profesor_publicacion(:new.PUB_ID);
       fetch cpk2_profesor_publicacion into dummy;
       found := cpk2_profesor_publicacion%FOUND;
       close cpk2_profesor_publicacion;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "PUBLICACION". Cannot update child in "PROFESOR_PUBLICACION".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TDB_PUBLICACION before delete
on PUBLICACION for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of DeleteParentRestrict constraint for "PUBLICACION_CONGRESO"
    cursor cfk1_publicacion_congreso(var_pub_id integer) is
       select 1
       from   PUBLICACION_CONGRESO
       where  PUB_ID = var_pub_id
        and   var_pub_id is not null;
    --  Declaration of DeleteParentRestrict constraint for "PUBLICACION_REVISTA"
    cursor cfk2_publicacion_revista(var_pub_id integer) is
       select 1
       from   PUBLICACION_REVISTA
       where  PUB_ID = var_pub_id
        and   var_pub_id is not null;
    --  Declaration of DeleteParentRestrict constraint for "LINEA_INVESTIGACION"
    cursor cfk3_linea_investigacion(var_pub_id integer) is
       select 1
       from   LINEA_INVESTIGACION
       where  PUB_ID = var_pub_id
        and   var_pub_id is not null;
    --  Declaration of DeleteParentRestrict constraint for "PROFESOR_PUBLICACION"
    cursor cfk4_profesor_publicacion(var_pub_id integer) is
       select 1
       from   PROFESOR_PUBLICACION
       where  PUB_ID = var_pub_id
        and   var_pub_id is not null;

begin
    --  Cannot delete parent "PUBLICACION" if children still exist in "PUBLICACION_CONGRESO"
    open  cfk1_publicacion_congreso(:old.PUB_ID);
    fetch cfk1_publicacion_congreso into dummy;
    found := cfk1_publicacion_congreso%FOUND;
    close cfk1_publicacion_congreso;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "PUBLICACION_CONGRESO". Cannot delete parent "PUBLICACION".';
       raise integrity_error;
    end if;

    --  Cannot delete parent "PUBLICACION" if children still exist in "PUBLICACION_REVISTA"
    open  cfk2_publicacion_revista(:old.PUB_ID);
    fetch cfk2_publicacion_revista into dummy;
    found := cfk2_publicacion_revista%FOUND;
    close cfk2_publicacion_revista;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "PUBLICACION_REVISTA". Cannot delete parent "PUBLICACION".';
       raise integrity_error;
    end if;

    --  Cannot delete parent "PUBLICACION" if children still exist in "LINEA_INVESTIGACION"
    open  cfk3_linea_investigacion(:old.PUB_ID);
    fetch cfk3_linea_investigacion into dummy;
    found := cfk3_linea_investigacion%FOUND;
    close cfk3_linea_investigacion;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "LINEA_INVESTIGACION". Cannot delete parent "PUBLICACION".';
       raise integrity_error;
    end if;

    --  Cannot delete parent "PUBLICACION" if children still exist in "PROFESOR_PUBLICACION"
    open  cfk4_profesor_publicacion(:old.PUB_ID);
    fetch cfk4_profesor_publicacion into dummy;
    found := cfk4_profesor_publicacion%FOUND;
    close cfk4_profesor_publicacion;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "PROFESOR_PUBLICACION". Cannot delete parent "PUBLICACION".';
       raise integrity_error;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TIB_PUBLICACION before insert
on PUBLICACION for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of InsertChildParentExist constraint for the parent "INVESTIGACION"
    cursor cpk1_publicacion(var_inv_id varchar) is
       select 1
       from   INVESTIGACION
       where  INV_ID = var_inv_id
        and   var_inv_id is not null;

begin
    --  Parent "INVESTIGACION" must exist when inserting a child in "PUBLICACION"
    if :new.INV_ID is not null then
       open  cpk1_publicacion(:new.INV_ID);
       fetch cpk1_publicacion into dummy;
       found := cpk1_publicacion%FOUND;
       close cpk1_publicacion;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "INVESTIGACION". Cannot create child in "PUBLICACION".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_PUBLICACION before update
of PUB_ID,
   INV_ID
on PUBLICACION for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    seq NUMBER;
    --  Declaration of UpdateChildParentExist constraint for the parent "INVESTIGACION"
    cursor cpk1_publicacion(var_inv_id varchar) is
       select 1
       from   INVESTIGACION
       where  INV_ID = var_inv_id
        and   var_inv_id is not null;
    --  Declaration of UpdateParentRestrict constraint for "PUBLICACION_CONGRESO"
    cursor cfk1_publicacion_congreso(var_pub_id integer) is
       select 1
       from   PUBLICACION_CONGRESO
       where  PUB_ID = var_pub_id
        and   var_pub_id is not null;
    --  Declaration of UpdateParentRestrict constraint for "PUBLICACION_REVISTA"
    cursor cfk2_publicacion_revista(var_pub_id integer) is
       select 1
       from   PUBLICACION_REVISTA
       where  PUB_ID = var_pub_id
        and   var_pub_id is not null;
    --  Declaration of UpdateParentRestrict constraint for "LINEA_INVESTIGACION"
    cursor cfk3_linea_investigacion(var_pub_id integer) is
       select 1
       from   LINEA_INVESTIGACION
       where  PUB_ID = var_pub_id
        and   var_pub_id is not null;
    --  Declaration of UpdateParentRestrict constraint for "PROFESOR_PUBLICACION"
    cursor cfk4_profesor_publicacion(var_pub_id integer) is
       select 1
       from   PROFESOR_PUBLICACION
       where  PUB_ID = var_pub_id
        and   var_pub_id is not null;

begin
    seq := IntegrityPackage.GetNestLevel;
    --  Parent "INVESTIGACION" must exist when updating a child in "PUBLICACION"
    if (:new.INV_ID is not null) and (seq = 0) then
       open  cpk1_publicacion(:new.INV_ID);
       fetch cpk1_publicacion into dummy;
       found := cpk1_publicacion%FOUND;
       close cpk1_publicacion;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "INVESTIGACION". Cannot update child in "PUBLICACION".';
          raise integrity_error;
       end if;
    end if;

    --  Cannot modify parent code in "PUBLICACION" if children still exist in "PUBLICACION_CONGRESO"
    if (updating('PUB_ID') and :old.PUB_ID != :new.PUB_ID) then
       open  cfk1_publicacion_congreso(:old.PUB_ID);
       fetch cfk1_publicacion_congreso into dummy;
       found := cfk1_publicacion_congreso%FOUND;
       close cfk1_publicacion_congreso;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "PUBLICACION_CONGRESO". Cannot modify parent code in "PUBLICACION".';
          raise integrity_error;
       end if;
    end if;

    --  Cannot modify parent code in "PUBLICACION" if children still exist in "PUBLICACION_REVISTA"
    if (updating('PUB_ID') and :old.PUB_ID != :new.PUB_ID) then
       open  cfk2_publicacion_revista(:old.PUB_ID);
       fetch cfk2_publicacion_revista into dummy;
       found := cfk2_publicacion_revista%FOUND;
       close cfk2_publicacion_revista;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "PUBLICACION_REVISTA". Cannot modify parent code in "PUBLICACION".';
          raise integrity_error;
       end if;
    end if;

    --  Cannot modify parent code in "PUBLICACION" if children still exist in "LINEA_INVESTIGACION"
    if (updating('PUB_ID') and :old.PUB_ID != :new.PUB_ID) then
       open  cfk3_linea_investigacion(:old.PUB_ID);
       fetch cfk3_linea_investigacion into dummy;
       found := cfk3_linea_investigacion%FOUND;
       close cfk3_linea_investigacion;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "LINEA_INVESTIGACION". Cannot modify parent code in "PUBLICACION".';
          raise integrity_error;
       end if;
    end if;

    --  Cannot modify parent code in "PUBLICACION" if children still exist in "PROFESOR_PUBLICACION"
    if (updating('PUB_ID') and :old.PUB_ID != :new.PUB_ID) then
       open  cfk4_profesor_publicacion(:old.PUB_ID);
       fetch cfk4_profesor_publicacion into dummy;
       found := cfk4_profesor_publicacion%FOUND;
       close cfk4_profesor_publicacion;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "PROFESOR_PUBLICACION". Cannot modify parent code in "PUBLICACION".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TIB_PUBLICACION_CONGRESO before insert
on PUBLICACION_CONGRESO for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of InsertChildParentExist constraint for the parent "PUBLICACION"
    cursor cpk1_publicacion_congreso(var_pub_id integer) is
       select 1
       from   PUBLICACION
       where  PUB_ID = var_pub_id
        and   var_pub_id is not null;
    --  Declaration of InsertChildParentExist constraint for the parent "CONGRESO"
    cursor cpk2_publicacion_congreso(var_con_id varchar) is
       select 1
       from   CONGRESO
       where  CON_ID = var_con_id
        and   var_con_id is not null;

begin
    --  Parent "PUBLICACION" must exist when inserting a child in "PUBLICACION_CONGRESO"
    if :new.PUB_ID is not null then
       open  cpk1_publicacion_congreso(:new.PUB_ID);
       fetch cpk1_publicacion_congreso into dummy;
       found := cpk1_publicacion_congreso%FOUND;
       close cpk1_publicacion_congreso;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "PUBLICACION". Cannot create child in "PUBLICACION_CONGRESO".';
          raise integrity_error;
       end if;
    end if;

    --  Parent "CONGRESO" must exist when inserting a child in "PUBLICACION_CONGRESO"
    if :new.CON_ID is not null then
       open  cpk2_publicacion_congreso(:new.CON_ID);
       fetch cpk2_publicacion_congreso into dummy;
       found := cpk2_publicacion_congreso%FOUND;
       close cpk2_publicacion_congreso;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "CONGRESO". Cannot create child in "PUBLICACION_CONGRESO".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_PUBLICACION_CONGRESO before update
of CON_ID,
   PUB_ID
on PUBLICACION_CONGRESO for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    seq NUMBER;
    --  Declaration of UpdateChildParentExist constraint for the parent "PUBLICACION"
    cursor cpk1_publicacion_congreso(var_pub_id integer) is
       select 1
       from   PUBLICACION
       where  PUB_ID = var_pub_id
        and   var_pub_id is not null;
    --  Declaration of UpdateChildParentExist constraint for the parent "CONGRESO"
    cursor cpk2_publicacion_congreso(var_con_id varchar) is
       select 1
       from   CONGRESO
       where  CON_ID = var_con_id
        and   var_con_id is not null;

begin
    seq := IntegrityPackage.GetNestLevel;
    --  Parent "PUBLICACION" must exist when updating a child in "PUBLICACION_CONGRESO"
    if (:new.PUB_ID is not null) and (seq = 0) then
       open  cpk1_publicacion_congreso(:new.PUB_ID);
       fetch cpk1_publicacion_congreso into dummy;
       found := cpk1_publicacion_congreso%FOUND;
       close cpk1_publicacion_congreso;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "PUBLICACION". Cannot update child in "PUBLICACION_CONGRESO".';
          raise integrity_error;
       end if;
    end if;

    --  Parent "CONGRESO" must exist when updating a child in "PUBLICACION_CONGRESO"
    if (:new.CON_ID is not null) and (seq = 0) then
       open  cpk2_publicacion_congreso(:new.CON_ID);
       fetch cpk2_publicacion_congreso into dummy;
       found := cpk2_publicacion_congreso%FOUND;
       close cpk2_publicacion_congreso;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "CONGRESO". Cannot update child in "PUBLICACION_CONGRESO".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TIB_PUBLICACION_REVISTA before insert
on PUBLICACION_REVISTA for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of InsertChildParentExist constraint for the parent "PUBLICACION"
    cursor cpk1_publicacion_revista(var_pub_id integer) is
       select 1
       from   PUBLICACION
       where  PUB_ID = var_pub_id
        and   var_pub_id is not null;
    --  Declaration of InsertChildParentExist constraint for the parent "REVISTA"
    cursor cpk2_publicacion_revista(var_rev_id varchar) is
       select 1
       from   REVISTA
       where  REV_ID = var_rev_id
        and   var_rev_id is not null;

begin
    --  Parent "PUBLICACION" must exist when inserting a child in "PUBLICACION_REVISTA"
    if :new.PUB_ID is not null then
       open  cpk1_publicacion_revista(:new.PUB_ID);
       fetch cpk1_publicacion_revista into dummy;
       found := cpk1_publicacion_revista%FOUND;
       close cpk1_publicacion_revista;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "PUBLICACION". Cannot create child in "PUBLICACION_REVISTA".';
          raise integrity_error;
       end if;
    end if;

    --  Parent "REVISTA" must exist when inserting a child in "PUBLICACION_REVISTA"
    if :new.REV_ID is not null then
       open  cpk2_publicacion_revista(:new.REV_ID);
       fetch cpk2_publicacion_revista into dummy;
       found := cpk2_publicacion_revista%FOUND;
       close cpk2_publicacion_revista;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "REVISTA". Cannot create child in "PUBLICACION_REVISTA".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_PUBLICACION_REVISTA before update
of PUB_ID,
   REV_ID
on PUBLICACION_REVISTA for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    seq NUMBER;
    --  Declaration of UpdateChildParentExist constraint for the parent "PUBLICACION"
    cursor cpk1_publicacion_revista(var_pub_id integer) is
       select 1
       from   PUBLICACION
       where  PUB_ID = var_pub_id
        and   var_pub_id is not null;
    --  Declaration of UpdateChildParentExist constraint for the parent "REVISTA"
    cursor cpk2_publicacion_revista(var_rev_id varchar) is
       select 1
       from   REVISTA
       where  REV_ID = var_rev_id
        and   var_rev_id is not null;

begin
    seq := IntegrityPackage.GetNestLevel;
    --  Parent "PUBLICACION" must exist when updating a child in "PUBLICACION_REVISTA"
    if (:new.PUB_ID is not null) and (seq = 0) then
       open  cpk1_publicacion_revista(:new.PUB_ID);
       fetch cpk1_publicacion_revista into dummy;
       found := cpk1_publicacion_revista%FOUND;
       close cpk1_publicacion_revista;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "PUBLICACION". Cannot update child in "PUBLICACION_REVISTA".';
          raise integrity_error;
       end if;
    end if;

    --  Parent "REVISTA" must exist when updating a child in "PUBLICACION_REVISTA"
    if (:new.REV_ID is not null) and (seq = 0) then
       open  cpk2_publicacion_revista(:new.REV_ID);
       fetch cpk2_publicacion_revista into dummy;
       found := cpk2_publicacion_revista%FOUND;
       close cpk2_publicacion_revista;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "REVISTA". Cannot update child in "PUBLICACION_REVISTA".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TDB_REVISTA before delete
on REVISTA for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of DeleteParentRestrict constraint for "PUBLICACION_REVISTA"
    cursor cfk1_publicacion_revista(var_rev_id varchar) is
       select 1
       from   PUBLICACION_REVISTA
       where  REV_ID = var_rev_id
        and   var_rev_id is not null;

begin
    --  Cannot delete parent "REVISTA" if children still exist in "PUBLICACION_REVISTA"
    open  cfk1_publicacion_revista(:old.REV_ID);
    fetch cfk1_publicacion_revista into dummy;
    found := cfk1_publicacion_revista%FOUND;
    close cfk1_publicacion_revista;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "PUBLICACION_REVISTA". Cannot delete parent "REVISTA".';
       raise integrity_error;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_REVISTA before update
of REV_ID
on REVISTA for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of UpdateParentRestrict constraint for "PUBLICACION_REVISTA"
    cursor cfk1_publicacion_revista(var_rev_id varchar) is
       select 1
       from   PUBLICACION_REVISTA
       where  REV_ID = var_rev_id
        and   var_rev_id is not null;

begin
    --  Cannot modify parent code in "REVISTA" if children still exist in "PUBLICACION_REVISTA"
    if (updating('REV_ID') and :old.REV_ID != :new.REV_ID) then
       open  cfk1_publicacion_revista(:old.REV_ID);
       fetch cfk1_publicacion_revista into dummy;
       found := cfk1_publicacion_revista%FOUND;
       close cfk1_publicacion_revista;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "PUBLICACION_REVISTA". Cannot modify parent code in "REVISTA".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
