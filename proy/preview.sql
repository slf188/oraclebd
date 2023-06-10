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

drop trigger TDB_INVESTIGACION
/

drop trigger TIB_INVESTIGACION
/

drop trigger TUB_INVESTIGACION
/

drop trigger TDB_PROFESOR
/

drop trigger TUB_PROFESOR
/

drop trigger TIB_PROFESOR_INVESTIGACION
/

drop trigger TUB_PROFESOR_INVESTIGACION
/

drop trigger TDB_PUBLICACION
/

drop trigger TIB_PUBLICACION
/

drop trigger TUB_PUBLICACION
/

drop trigger TDB_REVISTA
/

drop trigger TUB_REVISTA
/

drop trigger TDB_SUPERVISOR
/

drop trigger TUB_SUPERVISOR
/

drop table CONGRESO cascade constraints
/

drop table INVESTIGACION cascade constraints
/

drop index PUBLICACION_INCLUYE_LINEA_INVE
/

drop table LINEA_INVESTIGACION cascade constraints
/

drop table PROFESOR cascade constraints
/

drop index INVESTIGACION_TIENE_PROFESOR_I
/

drop index PROFESOR_TIENE_PROFESOR_INVEST
/

drop table PROFESOR_INVESTIGACION cascade constraints
/

drop index CONGRESO_PRODUCE_PUBLICACION_F
/

drop index REVISTA_PUBLICA_PUBLICACION_FK
/

drop index INVESTIGACION_CONTIENE_PUBLICA
/

drop table PUBLICACION cascade constraints
/

drop table REVISTA cascade constraints
/

drop table SUPERVISOR cascade constraints
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
/* Table: INVESTIGACION                                         */
/*==============================================================*/
create table INVESTIGACION (
   INV_ID               VARCHAR2(8)           not null,
   SUP_ID               VARCHAR2(8),
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
   LNINV_DESCRIPTORES   VARCHAR2(150),
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
/* Table: PUBLICACION                                           */
/*==============================================================*/
create table PUBLICACION (
   PUB_ID               INTEGER               not null,
   CON_ID               VARCHAR2(8)           not null,
   REV_ID               VARCHAR2(8)           not null,
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
/* Index: REVISTA_PUBLICA_PUBLICACION_FK                        */
/*==============================================================*/
create index REVISTA_PUBLICA_PUBLICACION_FK on PUBLICACION (
   REV_ID ASC
)
tablespace INDICESG1
/

/*==============================================================*/
/* Index: CONGRESO_PRODUCE_PUBLICACION_F                        */
/*==============================================================*/
create index CONGRESO_PRODUCE_PUBLICACION_F on PUBLICACION (
   CON_ID ASC
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
   REV_PAG_INICIO       INTEGER,
   REV_PAG_FIN          INTEGER,
   constraint PK_REVISTA primary key (REV_ID)
)
   tablespace DATOSG1
/

/*==============================================================*/
/* Table: SUPERVISOR                                            */
/*==============================================================*/
create table SUPERVISOR (
   SUP_ID               VARCHAR2(8)           not null,
   constraint PK_SUPERVISOR primary key (SUP_ID)
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
    --  Declaration of DeleteParentRestrict constraint for "PUBLICACION"
    cursor cfk1_publicacion(var_con_id varchar) is
       select 1
       from   PUBLICACION
       where  CON_ID = var_con_id
        and   var_con_id is not null;

begin
    --  Cannot delete parent "CONGRESO" if children still exist in "PUBLICACION"
    open  cfk1_publicacion(:old.CON_ID);
    fetch cfk1_publicacion into dummy;
    found := cfk1_publicacion%FOUND;
    close cfk1_publicacion;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "PUBLICACION". Cannot delete parent "CONGRESO".';
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
    --  Declaration of UpdateParentRestrict constraint for "PUBLICACION"
    cursor cfk1_publicacion(var_con_id varchar) is
       select 1
       from   PUBLICACION
       where  CON_ID = var_con_id
        and   var_con_id is not null;

begin
    --  Cannot modify parent code in "CONGRESO" if children still exist in "PUBLICACION"
    if (updating('CON_ID') and :old.CON_ID != :new.CON_ID) then
       open  cfk1_publicacion(:old.CON_ID);
       fetch cfk1_publicacion into dummy;
       found := cfk1_publicacion%FOUND;
       close cfk1_publicacion;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "PUBLICACION". Cannot modify parent code in "CONGRESO".';
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


create trigger TIB_INVESTIGACION before insert
on INVESTIGACION for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of InsertChildParentExist constraint for the parent "SUPERVISOR"
    cursor cpk1_investigacion(var_sup_id varchar) is
       select 1
       from   SUPERVISOR
       where  SUP_ID = var_sup_id
        and   var_sup_id is not null;

begin
    --  Parent "SUPERVISOR" must exist when inserting a child in "INVESTIGACION"
    if :new.SUP_ID is not null then
       open  cpk1_investigacion(:new.SUP_ID);
       fetch cpk1_investigacion into dummy;
       found := cpk1_investigacion%FOUND;
       close cpk1_investigacion;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "SUPERVISOR". Cannot create child in "INVESTIGACION".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_INVESTIGACION before update
of INV_ID,
   SUP_ID
on INVESTIGACION for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    seq NUMBER;
    --  Declaration of UpdateChildParentExist constraint for the parent "SUPERVISOR"
    cursor cpk1_investigacion(var_sup_id varchar) is
       select 1
       from   SUPERVISOR
       where  SUP_ID = var_sup_id
        and   var_sup_id is not null;
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
    seq := IntegrityPackage.GetNestLevel;
    --  Parent "SUPERVISOR" must exist when updating a child in "INVESTIGACION"
    if (:new.SUP_ID is not null) and (seq = 0) then
       open  cpk1_investigacion(:new.SUP_ID);
       fetch cpk1_investigacion into dummy;
       found := cpk1_investigacion%FOUND;
       close cpk1_investigacion;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "SUPERVISOR". Cannot update child in "INVESTIGACION".';
          raise integrity_error;
       end if;
    end if;

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


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_PROFESOR before update
of PRF_ID
on PROFESOR for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of UpdateParentRestrict constraint for "PROFESOR_INVESTIGACION"
    cursor cfk1_profesor_investigacion(var_prf_id varchar) is
       select 1
       from   PROFESOR_INVESTIGACION
       where  PRF_ID = var_prf_id
        and   var_prf_id is not null;

begin
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
   INV_ID
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


create trigger TDB_PUBLICACION before delete
on PUBLICACION for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of DeleteParentRestrict constraint for "LINEA_INVESTIGACION"
    cursor cfk1_linea_investigacion(var_pub_id integer) is
       select 1
       from   LINEA_INVESTIGACION
       where  PUB_ID = var_pub_id
        and   var_pub_id is not null;

begin
    --  Cannot delete parent "PUBLICACION" if children still exist in "LINEA_INVESTIGACION"
    open  cfk1_linea_investigacion(:old.PUB_ID);
    fetch cfk1_linea_investigacion into dummy;
    found := cfk1_linea_investigacion%FOUND;
    close cfk1_linea_investigacion;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "LINEA_INVESTIGACION". Cannot delete parent "PUBLICACION".';
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
    --  Declaration of InsertChildParentExist constraint for the parent "REVISTA"
    cursor cpk2_publicacion(var_rev_id varchar) is
       select 1
       from   REVISTA
       where  REV_ID = var_rev_id
        and   var_rev_id is not null;
    --  Declaration of InsertChildParentExist constraint for the parent "CONGRESO"
    cursor cpk3_publicacion(var_con_id varchar) is
       select 1
       from   CONGRESO
       where  CON_ID = var_con_id
        and   var_con_id is not null;

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

    --  Parent "REVISTA" must exist when inserting a child in "PUBLICACION"
    if :new.REV_ID is not null then
       open  cpk2_publicacion(:new.REV_ID);
       fetch cpk2_publicacion into dummy;
       found := cpk2_publicacion%FOUND;
       close cpk2_publicacion;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "REVISTA". Cannot create child in "PUBLICACION".';
          raise integrity_error;
       end if;
    end if;

    --  Parent "CONGRESO" must exist when inserting a child in "PUBLICACION"
    if :new.CON_ID is not null then
       open  cpk3_publicacion(:new.CON_ID);
       fetch cpk3_publicacion into dummy;
       found := cpk3_publicacion%FOUND;
       close cpk3_publicacion;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "CONGRESO". Cannot create child in "PUBLICACION".';
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
   CON_ID,
   REV_ID,
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
    --  Declaration of UpdateChildParentExist constraint for the parent "REVISTA"
    cursor cpk2_publicacion(var_rev_id varchar) is
       select 1
       from   REVISTA
       where  REV_ID = var_rev_id
        and   var_rev_id is not null;
    --  Declaration of UpdateChildParentExist constraint for the parent "CONGRESO"
    cursor cpk3_publicacion(var_con_id varchar) is
       select 1
       from   CONGRESO
       where  CON_ID = var_con_id
        and   var_con_id is not null;
    --  Declaration of UpdateParentRestrict constraint for "LINEA_INVESTIGACION"
    cursor cfk1_linea_investigacion(var_pub_id integer) is
       select 1
       from   LINEA_INVESTIGACION
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

    --  Parent "REVISTA" must exist when updating a child in "PUBLICACION"
    if (:new.REV_ID is not null) and (seq = 0) then
       open  cpk2_publicacion(:new.REV_ID);
       fetch cpk2_publicacion into dummy;
       found := cpk2_publicacion%FOUND;
       close cpk2_publicacion;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "REVISTA". Cannot update child in "PUBLICACION".';
          raise integrity_error;
       end if;
    end if;

    --  Parent "CONGRESO" must exist when updating a child in "PUBLICACION"
    if (:new.CON_ID is not null) and (seq = 0) then
       open  cpk3_publicacion(:new.CON_ID);
       fetch cpk3_publicacion into dummy;
       found := cpk3_publicacion%FOUND;
       close cpk3_publicacion;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "CONGRESO". Cannot update child in "PUBLICACION".';
          raise integrity_error;
       end if;
    end if;

    --  Cannot modify parent code in "PUBLICACION" if children still exist in "LINEA_INVESTIGACION"
    if (updating('PUB_ID') and :old.PUB_ID != :new.PUB_ID) then
       open  cfk1_linea_investigacion(:old.PUB_ID);
       fetch cfk1_linea_investigacion into dummy;
       found := cfk1_linea_investigacion%FOUND;
       close cfk1_linea_investigacion;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "LINEA_INVESTIGACION". Cannot modify parent code in "PUBLICACION".';
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
    --  Declaration of DeleteParentRestrict constraint for "PUBLICACION"
    cursor cfk1_publicacion(var_rev_id varchar) is
       select 1
       from   PUBLICACION
       where  REV_ID = var_rev_id
        and   var_rev_id is not null;

begin
    --  Cannot delete parent "REVISTA" if children still exist in "PUBLICACION"
    open  cfk1_publicacion(:old.REV_ID);
    fetch cfk1_publicacion into dummy;
    found := cfk1_publicacion%FOUND;
    close cfk1_publicacion;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "PUBLICACION". Cannot delete parent "REVISTA".';
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
    --  Declaration of UpdateParentRestrict constraint for "PUBLICACION"
    cursor cfk1_publicacion(var_rev_id varchar) is
       select 1
       from   PUBLICACION
       where  REV_ID = var_rev_id
        and   var_rev_id is not null;

begin
    --  Cannot modify parent code in "REVISTA" if children still exist in "PUBLICACION"
    if (updating('REV_ID') and :old.REV_ID != :new.REV_ID) then
       open  cfk1_publicacion(:old.REV_ID);
       fetch cfk1_publicacion into dummy;
       found := cfk1_publicacion%FOUND;
       close cfk1_publicacion;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "PUBLICACION". Cannot modify parent code in "REVISTA".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TDB_SUPERVISOR before delete
on SUPERVISOR for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of DeleteParentRestrict constraint for "INVESTIGACION"
    cursor cfk1_investigacion(var_sup_id varchar) is
       select 1
       from   INVESTIGACION
       where  SUP_ID = var_sup_id
        and   var_sup_id is not null;

begin
    --  Cannot delete parent "SUPERVISOR" if children still exist in "INVESTIGACION"
    open  cfk1_investigacion(:old.SUP_ID);
    fetch cfk1_investigacion into dummy;
    found := cfk1_investigacion%FOUND;
    close cfk1_investigacion;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "INVESTIGACION". Cannot delete parent "SUPERVISOR".';
       raise integrity_error;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_SUPERVISOR before update
of SUP_ID
on SUPERVISOR for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of UpdateParentRestrict constraint for "INVESTIGACION"
    cursor cfk1_investigacion(var_sup_id varchar) is
       select 1
       from   INVESTIGACION
       where  SUP_ID = var_sup_id
        and   var_sup_id is not null;

begin
    --  Cannot modify parent code in "SUPERVISOR" if children still exist in "INVESTIGACION"
    if (updating('SUP_ID') and :old.SUP_ID != :new.SUP_ID) then
       open  cfk1_investigacion(:old.SUP_ID);
       fetch cfk1_investigacion into dummy;
       found := cfk1_investigacion%FOUND;
       close cfk1_investigacion;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "INVESTIGACION". Cannot modify parent code in "SUPERVISOR".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
