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


drop trigger TDB_BODEGA
/

drop trigger TIB_BODEGA
/

drop trigger TUB_BODEGA
/

drop trigger TIB_BODEGA_TRANSACCION
/

drop trigger TUB_BODEGA_TRANSACCION
/

drop trigger TDB_CLIENTE
/

drop trigger TIB_CLIENTE
/

drop trigger TUB_CLIENTE
/

drop trigger TIB_DETALLE_FACTURA
/

drop trigger TUB_DETALLE_FACTURA
/

drop trigger TDB_EMPRESA
/

drop trigger TUB_EMPRESA
/

drop trigger TDB_FACTURA
/

drop trigger TIB_FACTURA
/

drop trigger TUB_FACTURA
/

drop trigger TDB_ORDEN_COMPRA
/

drop trigger TIB_ORDEN_COMPRA
/

drop trigger TUB_ORDEN_COMPRA
/

drop trigger TIB_ORDEN_PRODUCTO
/

drop trigger TUB_ORDEN_PRODUCTO
/

drop trigger TDB_PRODUCTO
/

drop trigger TIB_PRODUCTO
/

drop trigger TUB_PRODUCTO
/

drop trigger TIB_PRODUCTO_PROMOCION
/

drop trigger TUB_PRODUCTO_PROMOCION
/

drop trigger TDB_PROMOCION
/

drop trigger TUB_PROMOCION
/

drop trigger TDB_PROVEEDOR
/

drop trigger TIB_PROVEEDOR
/

drop trigger TUB_PROVEEDOR
/

drop trigger TIB_PROVEEDOR_PRODUCTO
/

drop trigger TUB_PROVEEDOR_PRODUCTO
/

drop trigger TDB_SUCURSAL
/

drop trigger TIB_SUCURSAL
/

drop trigger TUB_SUCURSAL
/

drop trigger TDB_TIPO_PRODUCTO
/

drop trigger TUB_TIPO_PRODUCTO
/

drop trigger TDB_TRANSACCION
/

drop trigger TUB_TRANSACCION
/

drop index SUCURSAL_TIENE_BODEGA_FK
/

drop table BODEGA cascade constraints
/

drop index TRANSACCION_CONTIENE_BODEGATRA
/

drop index RELATIONSHIP_18_FK
/

drop table BODEGA_TRANSACCION cascade constraints
/

drop index SUCURSAL_TIENE_CLIENTE_FK
/

drop table CLIENTE cascade constraints
/

drop index PRODUCTO_CONTIENE_DETALLEFACTU
/

drop index RELATIONSHIP_16_FK
/

drop table DETALLE_FACTURA cascade constraints
/

drop table EMPRESA cascade constraints
/

drop index SUCURSAL_POSEE_FACTURA_FK
/

drop index CLIENTE_TIENE_FACTURA_FK
/

drop table FACTURA cascade constraints
/

drop index PROVEEDOR_CONTIENE_ORDENCOMPRA
/

drop table ORDEN_COMPRA cascade constraints
/

drop index PRODUCTO_CONTIENE_ORDENPRODUCT
/

drop index RELATIONSHIP_19_FK
/

drop table ORDEN_PRODUCTO cascade constraints
/

drop index TIPOPRODUCTO_CONTIENE_PRODUCTO
/

drop table PRODUCTO cascade constraints
/

drop index PRODUCTO_CONTIENE_PROMOCIONPRO
/

drop index RELATIONSHIP_17_FK
/

drop table PRODUCTO_PROMOCION cascade constraints
/

drop table PROMOCION cascade constraints
/

drop index EMPRESA_TIENE_PROVEEDOR_FK
/

drop table PROVEEDOR cascade constraints
/

drop index PRODUCTO_CONTIENE_PROVEEDORPRO
/

drop index RELATIONSHIP_15_FK
/

drop table PROVEEDOR_PRODUCTO cascade constraints
/

drop index EMPRESA_TIENE_SUCURSAL_FK
/

drop table SUCURSAL cascade constraints
/

drop table TIPO_PRODUCTO cascade constraints
/

drop table TRANSACCION cascade constraints
/

/*==============================================================*/
/* Table: BODEGA                                                */
/*==============================================================*/
create table BODEGA (
   BOD_CODIGO           VARCHAR2(15)          not null,
   SCS_CODIGO           VARCHAR2(5),
   BOD_DIRECCION        VARCHAR2(30),
   BOD_CAPACIDAD        INTEGER,
   constraint PK_BODEGA primary key (BOD_CODIGO)
)
   tablespace DATOS
/

comment on table BODEGA is
'Tabla que almacena informacion acerca de la bodega
'
/

comment on column BODEGA.BOD_CODIGO is
'codigo de la bodega'
/

comment on column BODEGA.SCS_CODIGO is
'codigo de la sucursal'
/

comment on column BODEGA.BOD_DIRECCION is
'dirección física de la bodega'
/

comment on column BODEGA.BOD_CAPACIDAD is
'capacidad de almacenamiento de la bodega'
/

/*==============================================================*/
/* Index: SUCURSAL_TIENE_BODEGA_FK                              */
/*==============================================================*/
create index SUCURSAL_TIENE_BODEGA_FK on BODEGA (
   SCS_CODIGO ASC
)
/

/*==============================================================*/
/* Table: BODEGA_TRANSACCION                                    */
/*==============================================================*/
create table BODEGA_TRANSACCION (
   TRS_CODIGO           VARCHAR2(8)           not null,
   BOD_CODIGO           VARCHAR2(15)          not null,
   constraint PK_BODEGA_TRANSACCION primary key (TRS_CODIGO, BOD_CODIGO)
)
   tablespace DATOS
/

comment on table BODEGA_TRANSACCION is
'Tabla que almacena informacion acerca de la transaccion en la bodega'
/

comment on column BODEGA_TRANSACCION.TRS_CODIGO is
'codigo de transaccion'
/

comment on column BODEGA_TRANSACCION.BOD_CODIGO is
'codigo de bodega'
/

/*==============================================================*/
/* Index: RELATIONSHIP_18_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_18_FK on BODEGA_TRANSACCION (
   BOD_CODIGO ASC
)
/

/*==============================================================*/
/* Index: TRANSACCION_CONTIENE_BODEGATRA                        */
/*==============================================================*/
create index TRANSACCION_CONTIENE_BODEGATRA on BODEGA_TRANSACCION (
   TRS_CODIGO ASC
)
/

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   CLI_CI_RUC           VARCHAR2(1024)        not null,
   SCS_CODIGO           VARCHAR2(5),
   CLI_NOMBRE           VARCHAR2(30),
   CLI_DIRECCION        VARCHAR2(30),
   constraint PK_CLIENTE primary key (CLI_CI_RUC)
)
   tablespace DATOS
/

comment on table CLIENTE is
'Tabla que almacena informacion acerca del cliente
'
/

comment on column CLIENTE.CLI_CI_RUC is
'cedula de identifad del cliente'
/

comment on column CLIENTE.SCS_CODIGO is
'codigo de la sucursal'
/

comment on column CLIENTE.CLI_NOMBRE is
'nombre del cliente'
/

comment on column CLIENTE.CLI_DIRECCION is
'direccion del cliente'
/

/*==============================================================*/
/* Index: SUCURSAL_TIENE_CLIENTE_FK                             */
/*==============================================================*/
create index SUCURSAL_TIENE_CLIENTE_FK on CLIENTE (
   SCS_CODIGO ASC
)
/

/*==============================================================*/
/* Table: DETALLE_FACTURA                                       */
/*==============================================================*/
create table DETALLE_FACTURA (
   PRD_CODIGO           VARCHAR2(13)          not null,
   FAC_NUMERO           VARCHAR2(1024)        not null,
   constraint PK_DETALLE_FACTURA primary key (PRD_CODIGO, FAC_NUMERO)
)
   tablespace DATOS
/

comment on table DETALLE_FACTURA is
'Tabla que almacena informacion acerca del detalle de la factura'
/

comment on column DETALLE_FACTURA.PRD_CODIGO is
'codigo del producto'
/

comment on column DETALLE_FACTURA.FAC_NUMERO is
'numero de la factura'
/

/*==============================================================*/
/* Index: RELATIONSHIP_16_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_16_FK on DETALLE_FACTURA (
   FAC_NUMERO ASC
)
/

/*==============================================================*/
/* Index: PRODUCTO_CONTIENE_DETALLEFACTU                        */
/*==============================================================*/
create index PRODUCTO_CONTIENE_DETALLEFACTU on DETALLE_FACTURA (
   PRD_CODIGO ASC
)
/

/*==============================================================*/
/* Table: EMPRESA                                               */
/*==============================================================*/
create table EMPRESA (
   EMP_CODIGO           VARCHAR2(100)         not null,
   EMP_NOMBRE           VARCHAR2(30),
   EMP_DIRECCION        VARCHAR2(30),
   EMP_CORREO           VARCHAR2(30),
   EMP_TIPO             VARCHAR2(30),
   constraint PK_EMPRESA primary key (EMP_CODIGO)
)
   tablespace DATOS
/

comment on table EMPRESA is
'Tabla que almacena informacion acerca de la empresa'
/

comment on column EMPRESA.EMP_CODIGO is
' identificador único de la empresa'
/

comment on column EMPRESA.EMP_NOMBRE is
'nombre de la empresa'
/

comment on column EMPRESA.EMP_DIRECCION is
'dirección física de la empresa'
/

comment on column EMPRESA.EMP_CORREO is
'dirección de correo electrónico de la empresa'
/

comment on column EMPRESA.EMP_TIPO is
'categoría a la que pertenece la empresa'
/

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   FAC_NUMERO           VARCHAR2(1024)        not null,
   CLI_CI_RUC           VARCHAR2(1024),
   SCS_CODIGO           VARCHAR2(5),
   FAC_TOTAL            INTEGER,
   constraint PK_FACTURA primary key (FAC_NUMERO)
)
   tablespace DATOS
/

comment on table FACTURA is
'Tabla que almacena informacion acerca de la factura
'
/

comment on column FACTURA.FAC_NUMERO is
'numero identificador de la factura'
/

comment on column FACTURA.CLI_CI_RUC is
'identificador del cliente'
/

comment on column FACTURA.SCS_CODIGO is
'codigo de la sucursal'
/

comment on column FACTURA.FAC_TOTAL is
'precio total de la factura'
/

/*==============================================================*/
/* Index: CLIENTE_TIENE_FACTURA_FK                              */
/*==============================================================*/
create index CLIENTE_TIENE_FACTURA_FK on FACTURA (
   CLI_CI_RUC ASC
)
/

/*==============================================================*/
/* Index: SUCURSAL_POSEE_FACTURA_FK                             */
/*==============================================================*/
create index SUCURSAL_POSEE_FACTURA_FK on FACTURA (
   SCS_CODIGO ASC
)
/

/*==============================================================*/
/* Table: ORDEN_COMPRA                                          */
/*==============================================================*/
create table ORDEN_COMPRA (
   ORD_NUMERO           INTEGER               not null,
   PRV_CODIGO           VARCHAR2(8),
   ORD_FECHA            DATE,
   constraint PK_ORDEN_COMPRA primary key (ORD_NUMERO)
)
   tablespace DATOS
/

comment on table ORDEN_COMPRA is
'Tabla que almacena informacion acerca de la orden de compra'
/

comment on column ORDEN_COMPRA.ORD_NUMERO is
'identificador de la orden'
/

comment on column ORDEN_COMPRA.PRV_CODIGO is
'codigo del proveedor'
/

comment on column ORDEN_COMPRA.ORD_FECHA is
'fecha en que se emitió la orden de compra'
/

/*==============================================================*/
/* Index: PROVEEDOR_CONTIENE_ORDENCOMPRA                        */
/*==============================================================*/
create index PROVEEDOR_CONTIENE_ORDENCOMPRA on ORDEN_COMPRA (
   PRV_CODIGO ASC
)
/

/*==============================================================*/
/* Table: ORDEN_PRODUCTO                                        */
/*==============================================================*/
create table ORDEN_PRODUCTO (
   PRD_CODIGO           VARCHAR2(13)          not null,
   ORD_NUMERO           INTEGER               not null,
   PRD_TOTAL            INTEGER,
   constraint PK_ORDEN_PRODUCTO primary key (PRD_CODIGO, ORD_NUMERO)
)
   tablespace DATOS
/

comment on table ORDEN_PRODUCTO is
'Tabla que almacena informacion acerca de la orden del producto'
/

comment on column ORDEN_PRODUCTO.PRD_CODIGO is
'codigo del producto'
/

comment on column ORDEN_PRODUCTO.ORD_NUMERO is
'numero de orden'
/

comment on column ORDEN_PRODUCTO.PRD_TOTAL is
'precio total de la orden de producto'
/

/*==============================================================*/
/* Index: RELATIONSHIP_19_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_19_FK on ORDEN_PRODUCTO (
   ORD_NUMERO ASC
)
/

/*==============================================================*/
/* Index: PRODUCTO_CONTIENE_ORDENPRODUCT                        */
/*==============================================================*/
create index PRODUCTO_CONTIENE_ORDENPRODUCT on ORDEN_PRODUCTO (
   PRD_CODIGO ASC
)
/

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO (
   PRD_CODIGO           VARCHAR2(13)          not null,
   TIPO_PRO_CODIGO      INTEGER,
   PRD_NOMBRE           VARCHAR2(30),
   PRD_DESCRIPCION      VARCHAR2(1024),
   PRD_PRECIO           INTEGER,
   PRD_CATEGORIA        VARCHAR2(1024),
   constraint PK_PRODUCTO primary key (PRD_CODIGO)
)
   tablespace DATOS
/

comment on table PRODUCTO is
'Tabla que almacena informacion acerca del producto

'
/

comment on column PRODUCTO.PRD_CODIGO is
'codigo del producto'
/

comment on column PRODUCTO.TIPO_PRO_CODIGO is
'codigo del tipo de producto'
/

comment on column PRODUCTO.PRD_NOMBRE is
'nombre del producto'
/

comment on column PRODUCTO.PRD_DESCRIPCION is
'descripción del producto'
/

comment on column PRODUCTO.PRD_PRECIO is
'precio del producto'
/

comment on column PRODUCTO.PRD_CATEGORIA is
'categoría a la que pertenece el producto'
/

/*==============================================================*/
/* Index: TIPOPRODUCTO_CONTIENE_PRODUCTO                        */
/*==============================================================*/
create index TIPOPRODUCTO_CONTIENE_PRODUCTO on PRODUCTO (
   TIPO_PRO_CODIGO ASC
)
/

/*==============================================================*/
/* Table: PRODUCTO_PROMOCION                                    */
/*==============================================================*/
create table PRODUCTO_PROMOCION (
   PRD_CODIGO           VARCHAR2(13)          not null,
   PRM_CODIGO           INTEGER               not null,
   constraint PK_PRODUCTO_PROMOCION primary key (PRD_CODIGO, PRM_CODIGO)
)
   tablespace DATOS
/

comment on table PRODUCTO_PROMOCION is
'Tabla que almacena informacion acerca del producto en promocion'
/

comment on column PRODUCTO_PROMOCION.PRD_CODIGO is
'codigo del producto'
/

comment on column PRODUCTO_PROMOCION.PRM_CODIGO is
'codigo de promocion'
/

/*==============================================================*/
/* Index: RELATIONSHIP_17_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_17_FK on PRODUCTO_PROMOCION (
   PRM_CODIGO ASC
)
/

/*==============================================================*/
/* Index: PRODUCTO_CONTIENE_PROMOCIONPRO                        */
/*==============================================================*/
create index PRODUCTO_CONTIENE_PROMOCIONPRO on PRODUCTO_PROMOCION (
   PRD_CODIGO ASC
)
/

/*==============================================================*/
/* Table: PROMOCION                                             */
/*==============================================================*/
create table PROMOCION (
   PRM_CODIGO           INTEGER               not null
      constraint CKC_PRM_CODIGO_PROMOCIO check (PRM_CODIGO >= 0),
   PRM_DESCRIPCION      VARCHAR2(1024),
   PRM_INICIO           DATE,
   PRM_FIN              DATE,
   PRM_DESCUENTO        INTEGER,
   constraint PK_PROMOCION primary key (PRM_CODIGO)
)
   tablespace DATOS
/

comment on table PROMOCION is
'Tabla que almacena informacion acerca de la promocion'
/

comment on column PROMOCION.PRM_CODIGO is
'codigo de la promocion'
/

comment on column PROMOCION.PRM_DESCRIPCION is
'descripción de la promoción'
/

comment on column PROMOCION.PRM_INICIO is
'fecha en que la promoción comienza'
/

comment on column PROMOCION.PRM_FIN is
'fecha en que la promoción termina'
/

comment on column PROMOCION.PRM_DESCUENTO is
'cantidad de descuento ofrecida en la promoción'
/

/*==============================================================*/
/* Table: PROVEEDOR                                             */
/*==============================================================*/
create table PROVEEDOR (
   PRV_CODIGO           VARCHAR2(8)           not null,
   EMP_CODIGO           VARCHAR2(100),
   PRV_NOMBRE           VARCHAR2(30),
   constraint PK_PROVEEDOR primary key (PRV_CODIGO)
)
   tablespace DATOS
/

comment on table PROVEEDOR is
'Tabla que almacena informacion acerca del proveedor'
/

comment on column PROVEEDOR.PRV_CODIGO is
'identificador único del proveedor'
/

comment on column PROVEEDOR.EMP_CODIGO is
'identificador único de la empresa'
/

comment on column PROVEEDOR.PRV_NOMBRE is
'categoría a la que pertenece la empresa'
/

/*==============================================================*/
/* Index: EMPRESA_TIENE_PROVEEDOR_FK                            */
/*==============================================================*/
create index EMPRESA_TIENE_PROVEEDOR_FK on PROVEEDOR (
   EMP_CODIGO ASC
)
/

/*==============================================================*/
/* Table: PROVEEDOR_PRODUCTO                                    */
/*==============================================================*/
create table PROVEEDOR_PRODUCTO (
   PRD_CODIGO           VARCHAR2(13)          not null,
   PRV_CODIGO           VARCHAR2(8)           not null,
   constraint PK_PROVEEDOR_PRODUCTO primary key (PRD_CODIGO, PRV_CODIGO)
)
   tablespace DATOS
/

comment on table PROVEEDOR_PRODUCTO is
'Tabla que almacena informacion acerca del proveedor del producto
'
/

comment on column PROVEEDOR_PRODUCTO.PRD_CODIGO is
'codigo del producto'
/

comment on column PROVEEDOR_PRODUCTO.PRV_CODIGO is
'codigo del proveedor'
/

/*==============================================================*/
/* Index: RELATIONSHIP_15_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_15_FK on PROVEEDOR_PRODUCTO (
   PRV_CODIGO ASC
)
/

/*==============================================================*/
/* Index: PRODUCTO_CONTIENE_PROVEEDORPRO                        */
/*==============================================================*/
create index PRODUCTO_CONTIENE_PROVEEDORPRO on PROVEEDOR_PRODUCTO (
   PRD_CODIGO ASC
)
/

/*==============================================================*/
/* Table: SUCURSAL                                              */
/*==============================================================*/
create table SUCURSAL (
   SCS_CODIGO           VARCHAR2(5)           not null,
   EMP_CODIGO           VARCHAR2(100),
   SCS_TELEFONO         VARCHAR2(102),
   SCS_NOMBRE           VARCHAR2(1024),
   constraint PK_SUCURSAL primary key (SCS_CODIGO)
)
   tablespace DATOS
/

comment on table SUCURSAL is
'Tabla que almacena informacion acerca de la sucursal'
/

comment on column SUCURSAL.SCS_CODIGO is
'codigo de la sucursal'
/

comment on column SUCURSAL.EMP_CODIGO is
'identificador único de la sucursal'
/

comment on column SUCURSAL.SCS_TELEFONO is
'número de teléfono de la sucursal'
/

comment on column SUCURSAL.SCS_NOMBRE is
'nombre de la sucursal '
/

/*==============================================================*/
/* Index: EMPRESA_TIENE_SUCURSAL_FK                             */
/*==============================================================*/
create index EMPRESA_TIENE_SUCURSAL_FK on SUCURSAL (
   EMP_CODIGO ASC
)
/

/*==============================================================*/
/* Table: TIPO_PRODUCTO                                         */
/*==============================================================*/
create table TIPO_PRODUCTO (
   TIPO_PRO_CODIGO      INTEGER               not null
      constraint CKC_TIPO_PRO_CODIGO_TIPO_PRO check (TIPO_PRO_CODIGO >= 0),
   TIPO_PRO_NOMBRE      VARCHAR2(1024),
   constraint PK_TIPO_PRODUCTO primary key (TIPO_PRO_CODIGO)
)
   tablespace DATOS
/

comment on table TIPO_PRODUCTO is
'Tabla que almacena informacion acerca del tipo de producto'
/

comment on column TIPO_PRODUCTO.TIPO_PRO_CODIGO is
'codigo del tipo de producto'
/

comment on column TIPO_PRODUCTO.TIPO_PRO_NOMBRE is
'nombre del tipo de producto'
/

/*==============================================================*/
/* Table: TRANSACCION                                           */
/*==============================================================*/
create table TRANSACCION (
   TRS_CODIGO           VARCHAR2(8)           not null,
   TRS_FECHA            DATE,
   TRS_MONTO            INTEGER,
   TRS_TIPO             VARCHAR2(1024),
   constraint PK_TRANSACCION primary key (TRS_CODIGO)
)
   tablespace DATOS
/

comment on table TRANSACCION is
'Tabla que almacena informacion acerca de la transaccion
'
/

comment on column TRANSACCION.TRS_CODIGO is
'codigo de la transaccion'
/

comment on column TRANSACCION.TRS_FECHA is
'fecha en que se realizó la transacción'
/

comment on column TRANSACCION.TRS_MONTO is
'cantidad de dinero involucrada en la transacción'
/

comment on column TRANSACCION.TRS_TIPO is
'categoría a la que pertenece la transacción'
/


create trigger TDB_BODEGA before delete
on BODEGA for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of DeleteParentRestrict constraint for "BODEGA_TRANSACCION"
    cursor cfk1_bodega_transaccion(var_bod_codigo varchar) is
       select 1
       from   BODEGA_TRANSACCION
       where  BOD_CODIGO = var_bod_codigo
        and   var_bod_codigo is not null;

begin
    --  Cannot delete parent "BODEGA" if children still exist in "BODEGA_TRANSACCION"
    open  cfk1_bodega_transaccion(:old.BOD_CODIGO);
    fetch cfk1_bodega_transaccion into dummy;
    found := cfk1_bodega_transaccion%FOUND;
    close cfk1_bodega_transaccion;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "BODEGA_TRANSACCION". Cannot delete parent "BODEGA".';
       raise integrity_error;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TIB_BODEGA before insert
on BODEGA for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of InsertChildParentExist constraint for the parent "SUCURSAL"
    cursor cpk1_bodega(var_scs_codigo varchar) is
       select 1
       from   SUCURSAL
       where  SCS_CODIGO = var_scs_codigo
        and   var_scs_codigo is not null;

begin
    --  Parent "SUCURSAL" must exist when inserting a child in "BODEGA"
    if :new.SCS_CODIGO is not null then
       open  cpk1_bodega(:new.SCS_CODIGO);
       fetch cpk1_bodega into dummy;
       found := cpk1_bodega%FOUND;
       close cpk1_bodega;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "SUCURSAL". Cannot create child in "BODEGA".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_BODEGA before update
of BOD_CODIGO,
   SCS_CODIGO
on BODEGA for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    seq NUMBER;
    --  Declaration of UpdateChildParentExist constraint for the parent "SUCURSAL"
    cursor cpk1_bodega(var_scs_codigo varchar) is
       select 1
       from   SUCURSAL
       where  SCS_CODIGO = var_scs_codigo
        and   var_scs_codigo is not null;
    --  Declaration of UpdateParentRestrict constraint for "BODEGA_TRANSACCION"
    cursor cfk1_bodega_transaccion(var_bod_codigo varchar) is
       select 1
       from   BODEGA_TRANSACCION
       where  BOD_CODIGO = var_bod_codigo
        and   var_bod_codigo is not null;

begin
    seq := IntegrityPackage.GetNestLevel;
    --  Parent "SUCURSAL" must exist when updating a child in "BODEGA"
    if (:new.SCS_CODIGO is not null) and (seq = 0) then
       open  cpk1_bodega(:new.SCS_CODIGO);
       fetch cpk1_bodega into dummy;
       found := cpk1_bodega%FOUND;
       close cpk1_bodega;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "SUCURSAL". Cannot update child in "BODEGA".';
          raise integrity_error;
       end if;
    end if;

    --  Cannot modify parent code in "BODEGA" if children still exist in "BODEGA_TRANSACCION"
    if (updating('BOD_CODIGO') and :old.BOD_CODIGO != :new.BOD_CODIGO) then
       open  cfk1_bodega_transaccion(:old.BOD_CODIGO);
       fetch cfk1_bodega_transaccion into dummy;
       found := cfk1_bodega_transaccion%FOUND;
       close cfk1_bodega_transaccion;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "BODEGA_TRANSACCION". Cannot modify parent code in "BODEGA".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TIB_BODEGA_TRANSACCION before insert
on BODEGA_TRANSACCION for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of InsertChildParentExist constraint for the parent "BODEGA"
    cursor cpk1_bodega_transaccion(var_bod_codigo varchar) is
       select 1
       from   BODEGA
       where  BOD_CODIGO = var_bod_codigo
        and   var_bod_codigo is not null;
    --  Declaration of InsertChildParentExist constraint for the parent "TRANSACCION"
    cursor cpk2_bodega_transaccion(var_trs_codigo varchar) is
       select 1
       from   TRANSACCION
       where  TRS_CODIGO = var_trs_codigo
        and   var_trs_codigo is not null;

begin
    --  Parent "BODEGA" must exist when inserting a child in "BODEGA_TRANSACCION"
    if :new.BOD_CODIGO is not null then
       open  cpk1_bodega_transaccion(:new.BOD_CODIGO);
       fetch cpk1_bodega_transaccion into dummy;
       found := cpk1_bodega_transaccion%FOUND;
       close cpk1_bodega_transaccion;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "BODEGA". Cannot create child in "BODEGA_TRANSACCION".';
          raise integrity_error;
       end if;
    end if;

    --  Parent "TRANSACCION" must exist when inserting a child in "BODEGA_TRANSACCION"
    if :new.TRS_CODIGO is not null then
       open  cpk2_bodega_transaccion(:new.TRS_CODIGO);
       fetch cpk2_bodega_transaccion into dummy;
       found := cpk2_bodega_transaccion%FOUND;
       close cpk2_bodega_transaccion;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "TRANSACCION". Cannot create child in "BODEGA_TRANSACCION".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_BODEGA_TRANSACCION before update
of TRS_CODIGO,
   BOD_CODIGO
on BODEGA_TRANSACCION for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    seq NUMBER;
    --  Declaration of UpdateChildParentExist constraint for the parent "BODEGA"
    cursor cpk1_bodega_transaccion(var_bod_codigo varchar) is
       select 1
       from   BODEGA
       where  BOD_CODIGO = var_bod_codigo
        and   var_bod_codigo is not null;
    --  Declaration of UpdateChildParentExist constraint for the parent "TRANSACCION"
    cursor cpk2_bodega_transaccion(var_trs_codigo varchar) is
       select 1
       from   TRANSACCION
       where  TRS_CODIGO = var_trs_codigo
        and   var_trs_codigo is not null;

begin
    seq := IntegrityPackage.GetNestLevel;
    --  Parent "BODEGA" must exist when updating a child in "BODEGA_TRANSACCION"
    if (:new.BOD_CODIGO is not null) and (seq = 0) then
       open  cpk1_bodega_transaccion(:new.BOD_CODIGO);
       fetch cpk1_bodega_transaccion into dummy;
       found := cpk1_bodega_transaccion%FOUND;
       close cpk1_bodega_transaccion;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "BODEGA". Cannot update child in "BODEGA_TRANSACCION".';
          raise integrity_error;
       end if;
    end if;

    --  Parent "TRANSACCION" must exist when updating a child in "BODEGA_TRANSACCION"
    if (:new.TRS_CODIGO is not null) and (seq = 0) then
       open  cpk2_bodega_transaccion(:new.TRS_CODIGO);
       fetch cpk2_bodega_transaccion into dummy;
       found := cpk2_bodega_transaccion%FOUND;
       close cpk2_bodega_transaccion;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "TRANSACCION". Cannot update child in "BODEGA_TRANSACCION".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TDB_CLIENTE before delete
on CLIENTE for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of DeleteParentRestrict constraint for "FACTURA"
    cursor cfk1_factura(var_cli_ci_ruc varchar) is
       select 1
       from   FACTURA
       where  CLI_CI_RUC = var_cli_ci_ruc
        and   var_cli_ci_ruc is not null;

begin
    --  Cannot delete parent "CLIENTE" if children still exist in "FACTURA"
    open  cfk1_factura(:old.CLI_CI_RUC);
    fetch cfk1_factura into dummy;
    found := cfk1_factura%FOUND;
    close cfk1_factura;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "FACTURA". Cannot delete parent "CLIENTE".';
       raise integrity_error;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TIB_CLIENTE before insert
on CLIENTE for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of InsertChildParentExist constraint for the parent "SUCURSAL"
    cursor cpk1_cliente(var_scs_codigo varchar) is
       select 1
       from   SUCURSAL
       where  SCS_CODIGO = var_scs_codigo
        and   var_scs_codigo is not null;

begin
    --  Parent "SUCURSAL" must exist when inserting a child in "CLIENTE"
    if :new.SCS_CODIGO is not null then
       open  cpk1_cliente(:new.SCS_CODIGO);
       fetch cpk1_cliente into dummy;
       found := cpk1_cliente%FOUND;
       close cpk1_cliente;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "SUCURSAL". Cannot create child in "CLIENTE".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_CLIENTE before update
of CLI_CI_RUC,
   SCS_CODIGO
on CLIENTE for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    seq NUMBER;
    --  Declaration of UpdateChildParentExist constraint for the parent "SUCURSAL"
    cursor cpk1_cliente(var_scs_codigo varchar) is
       select 1
       from   SUCURSAL
       where  SCS_CODIGO = var_scs_codigo
        and   var_scs_codigo is not null;
    --  Declaration of UpdateParentRestrict constraint for "FACTURA"
    cursor cfk1_factura(var_cli_ci_ruc varchar) is
       select 1
       from   FACTURA
       where  CLI_CI_RUC = var_cli_ci_ruc
        and   var_cli_ci_ruc is not null;

begin
    seq := IntegrityPackage.GetNestLevel;
    --  Parent "SUCURSAL" must exist when updating a child in "CLIENTE"
    if (:new.SCS_CODIGO is not null) and (seq = 0) then
       open  cpk1_cliente(:new.SCS_CODIGO);
       fetch cpk1_cliente into dummy;
       found := cpk1_cliente%FOUND;
       close cpk1_cliente;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "SUCURSAL". Cannot update child in "CLIENTE".';
          raise integrity_error;
       end if;
    end if;

    --  Cannot modify parent code in "CLIENTE" if children still exist in "FACTURA"
    if (updating('CLI_CI_RUC') and :old.CLI_CI_RUC != :new.CLI_CI_RUC) then
       open  cfk1_factura(:old.CLI_CI_RUC);
       fetch cfk1_factura into dummy;
       found := cfk1_factura%FOUND;
       close cfk1_factura;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "FACTURA". Cannot modify parent code in "CLIENTE".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TIB_DETALLE_FACTURA before insert
on DETALLE_FACTURA for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of InsertChildParentExist constraint for the parent "FACTURA"
    cursor cpk1_detalle_factura(var_fac_numero varchar) is
       select 1
       from   FACTURA
       where  FAC_NUMERO = var_fac_numero
        and   var_fac_numero is not null;
    --  Declaration of InsertChildParentExist constraint for the parent "PRODUCTO"
    cursor cpk2_detalle_factura(var_prd_codigo varchar) is
       select 1
       from   PRODUCTO
       where  PRD_CODIGO = var_prd_codigo
        and   var_prd_codigo is not null;

begin
    --  Parent "FACTURA" must exist when inserting a child in "DETALLE_FACTURA"
    if :new.FAC_NUMERO is not null then
       open  cpk1_detalle_factura(:new.FAC_NUMERO);
       fetch cpk1_detalle_factura into dummy;
       found := cpk1_detalle_factura%FOUND;
       close cpk1_detalle_factura;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "FACTURA". Cannot create child in "DETALLE_FACTURA".';
          raise integrity_error;
       end if;
    end if;

    --  Parent "PRODUCTO" must exist when inserting a child in "DETALLE_FACTURA"
    if :new.PRD_CODIGO is not null then
       open  cpk2_detalle_factura(:new.PRD_CODIGO);
       fetch cpk2_detalle_factura into dummy;
       found := cpk2_detalle_factura%FOUND;
       close cpk2_detalle_factura;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "PRODUCTO". Cannot create child in "DETALLE_FACTURA".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_DETALLE_FACTURA before update
of PRD_CODIGO,
   FAC_NUMERO
on DETALLE_FACTURA for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    seq NUMBER;
    --  Declaration of UpdateChildParentExist constraint for the parent "FACTURA"
    cursor cpk1_detalle_factura(var_fac_numero varchar) is
       select 1
       from   FACTURA
       where  FAC_NUMERO = var_fac_numero
        and   var_fac_numero is not null;
    --  Declaration of UpdateChildParentExist constraint for the parent "PRODUCTO"
    cursor cpk2_detalle_factura(var_prd_codigo varchar) is
       select 1
       from   PRODUCTO
       where  PRD_CODIGO = var_prd_codigo
        and   var_prd_codigo is not null;

begin
    seq := IntegrityPackage.GetNestLevel;
    --  Parent "FACTURA" must exist when updating a child in "DETALLE_FACTURA"
    if (:new.FAC_NUMERO is not null) and (seq = 0) then
       open  cpk1_detalle_factura(:new.FAC_NUMERO);
       fetch cpk1_detalle_factura into dummy;
       found := cpk1_detalle_factura%FOUND;
       close cpk1_detalle_factura;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "FACTURA". Cannot update child in "DETALLE_FACTURA".';
          raise integrity_error;
       end if;
    end if;

    --  Parent "PRODUCTO" must exist when updating a child in "DETALLE_FACTURA"
    if (:new.PRD_CODIGO is not null) and (seq = 0) then
       open  cpk2_detalle_factura(:new.PRD_CODIGO);
       fetch cpk2_detalle_factura into dummy;
       found := cpk2_detalle_factura%FOUND;
       close cpk2_detalle_factura;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "PRODUCTO". Cannot update child in "DETALLE_FACTURA".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TDB_EMPRESA before delete
on EMPRESA for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of DeleteParentRestrict constraint for "PROVEEDOR"
    cursor cfk1_proveedor(var_emp_codigo varchar) is
       select 1
       from   PROVEEDOR
       where  EMP_CODIGO = var_emp_codigo
        and   var_emp_codigo is not null;
    --  Declaration of DeleteParentRestrict constraint for "SUCURSAL"
    cursor cfk2_sucursal(var_emp_codigo varchar) is
       select 1
       from   SUCURSAL
       where  EMP_CODIGO = var_emp_codigo
        and   var_emp_codigo is not null;

begin
    --  Cannot delete parent "EMPRESA" if children still exist in "PROVEEDOR"
    open  cfk1_proveedor(:old.EMP_CODIGO);
    fetch cfk1_proveedor into dummy;
    found := cfk1_proveedor%FOUND;
    close cfk1_proveedor;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "PROVEEDOR". Cannot delete parent "EMPRESA".';
       raise integrity_error;
    end if;

    --  Cannot delete parent "EMPRESA" if children still exist in "SUCURSAL"
    open  cfk2_sucursal(:old.EMP_CODIGO);
    fetch cfk2_sucursal into dummy;
    found := cfk2_sucursal%FOUND;
    close cfk2_sucursal;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "SUCURSAL". Cannot delete parent "EMPRESA".';
       raise integrity_error;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_EMPRESA before update
of EMP_CODIGO
on EMPRESA for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of UpdateParentRestrict constraint for "PROVEEDOR"
    cursor cfk1_proveedor(var_emp_codigo varchar) is
       select 1
       from   PROVEEDOR
       where  EMP_CODIGO = var_emp_codigo
        and   var_emp_codigo is not null;
    --  Declaration of UpdateParentRestrict constraint for "SUCURSAL"
    cursor cfk2_sucursal(var_emp_codigo varchar) is
       select 1
       from   SUCURSAL
       where  EMP_CODIGO = var_emp_codigo
        and   var_emp_codigo is not null;

begin
    --  Cannot modify parent code in "EMPRESA" if children still exist in "PROVEEDOR"
    if (updating('EMP_CODIGO') and :old.EMP_CODIGO != :new.EMP_CODIGO) then
       open  cfk1_proveedor(:old.EMP_CODIGO);
       fetch cfk1_proveedor into dummy;
       found := cfk1_proveedor%FOUND;
       close cfk1_proveedor;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "PROVEEDOR". Cannot modify parent code in "EMPRESA".';
          raise integrity_error;
       end if;
    end if;

    --  Cannot modify parent code in "EMPRESA" if children still exist in "SUCURSAL"
    if (updating('EMP_CODIGO') and :old.EMP_CODIGO != :new.EMP_CODIGO) then
       open  cfk2_sucursal(:old.EMP_CODIGO);
       fetch cfk2_sucursal into dummy;
       found := cfk2_sucursal%FOUND;
       close cfk2_sucursal;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "SUCURSAL". Cannot modify parent code in "EMPRESA".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TDB_FACTURA before delete
on FACTURA for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of DeleteParentRestrict constraint for "DETALLE_FACTURA"
    cursor cfk1_detalle_factura(var_fac_numero varchar) is
       select 1
       from   DETALLE_FACTURA
       where  FAC_NUMERO = var_fac_numero
        and   var_fac_numero is not null;

begin
    --  Cannot delete parent "FACTURA" if children still exist in "DETALLE_FACTURA"
    open  cfk1_detalle_factura(:old.FAC_NUMERO);
    fetch cfk1_detalle_factura into dummy;
    found := cfk1_detalle_factura%FOUND;
    close cfk1_detalle_factura;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "DETALLE_FACTURA". Cannot delete parent "FACTURA".';
       raise integrity_error;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TIB_FACTURA before insert
on FACTURA for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of InsertChildParentExist constraint for the parent "CLIENTE"
    cursor cpk1_factura(var_cli_ci_ruc varchar) is
       select 1
       from   CLIENTE
       where  CLI_CI_RUC = var_cli_ci_ruc
        and   var_cli_ci_ruc is not null;
    --  Declaration of InsertChildParentExist constraint for the parent "SUCURSAL"
    cursor cpk2_factura(var_scs_codigo varchar) is
       select 1
       from   SUCURSAL
       where  SCS_CODIGO = var_scs_codigo
        and   var_scs_codigo is not null;

begin
    --  Parent "CLIENTE" must exist when inserting a child in "FACTURA"
    if :new.CLI_CI_RUC is not null then
       open  cpk1_factura(:new.CLI_CI_RUC);
       fetch cpk1_factura into dummy;
       found := cpk1_factura%FOUND;
       close cpk1_factura;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "CLIENTE". Cannot create child in "FACTURA".';
          raise integrity_error;
       end if;
    end if;

    --  Parent "SUCURSAL" must exist when inserting a child in "FACTURA"
    if :new.SCS_CODIGO is not null then
       open  cpk2_factura(:new.SCS_CODIGO);
       fetch cpk2_factura into dummy;
       found := cpk2_factura%FOUND;
       close cpk2_factura;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "SUCURSAL". Cannot create child in "FACTURA".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_FACTURA before update
of FAC_NUMERO,
   CLI_CI_RUC,
   SCS_CODIGO
on FACTURA for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    seq NUMBER;
    --  Declaration of UpdateChildParentExist constraint for the parent "CLIENTE"
    cursor cpk1_factura(var_cli_ci_ruc varchar) is
       select 1
       from   CLIENTE
       where  CLI_CI_RUC = var_cli_ci_ruc
        and   var_cli_ci_ruc is not null;
    --  Declaration of UpdateChildParentExist constraint for the parent "SUCURSAL"
    cursor cpk2_factura(var_scs_codigo varchar) is
       select 1
       from   SUCURSAL
       where  SCS_CODIGO = var_scs_codigo
        and   var_scs_codigo is not null;
    --  Declaration of UpdateParentRestrict constraint for "DETALLE_FACTURA"
    cursor cfk1_detalle_factura(var_fac_numero varchar) is
       select 1
       from   DETALLE_FACTURA
       where  FAC_NUMERO = var_fac_numero
        and   var_fac_numero is not null;

begin
    seq := IntegrityPackage.GetNestLevel;
    --  Parent "CLIENTE" must exist when updating a child in "FACTURA"
    if (:new.CLI_CI_RUC is not null) and (seq = 0) then
       open  cpk1_factura(:new.CLI_CI_RUC);
       fetch cpk1_factura into dummy;
       found := cpk1_factura%FOUND;
       close cpk1_factura;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "CLIENTE". Cannot update child in "FACTURA".';
          raise integrity_error;
       end if;
    end if;

    --  Parent "SUCURSAL" must exist when updating a child in "FACTURA"
    if (:new.SCS_CODIGO is not null) and (seq = 0) then
       open  cpk2_factura(:new.SCS_CODIGO);
       fetch cpk2_factura into dummy;
       found := cpk2_factura%FOUND;
       close cpk2_factura;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "SUCURSAL". Cannot update child in "FACTURA".';
          raise integrity_error;
       end if;
    end if;

    --  Cannot modify parent code in "FACTURA" if children still exist in "DETALLE_FACTURA"
    if (updating('FAC_NUMERO') and :old.FAC_NUMERO != :new.FAC_NUMERO) then
       open  cfk1_detalle_factura(:old.FAC_NUMERO);
       fetch cfk1_detalle_factura into dummy;
       found := cfk1_detalle_factura%FOUND;
       close cfk1_detalle_factura;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "DETALLE_FACTURA". Cannot modify parent code in "FACTURA".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TDB_ORDEN_COMPRA before delete
on ORDEN_COMPRA for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of DeleteParentRestrict constraint for "ORDEN_PRODUCTO"
    cursor cfk1_orden_producto(var_ord_numero integer) is
       select 1
       from   ORDEN_PRODUCTO
       where  ORD_NUMERO = var_ord_numero
        and   var_ord_numero is not null;

begin
    --  Cannot delete parent "ORDEN_COMPRA" if children still exist in "ORDEN_PRODUCTO"
    open  cfk1_orden_producto(:old.ORD_NUMERO);
    fetch cfk1_orden_producto into dummy;
    found := cfk1_orden_producto%FOUND;
    close cfk1_orden_producto;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "ORDEN_PRODUCTO". Cannot delete parent "ORDEN_COMPRA".';
       raise integrity_error;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TIB_ORDEN_COMPRA before insert
on ORDEN_COMPRA for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of InsertChildParentExist constraint for the parent "PROVEEDOR"
    cursor cpk1_orden_compra(var_prv_codigo varchar) is
       select 1
       from   PROVEEDOR
       where  PRV_CODIGO = var_prv_codigo
        and   var_prv_codigo is not null;

begin
    --  Parent "PROVEEDOR" must exist when inserting a child in "ORDEN_COMPRA"
    if :new.PRV_CODIGO is not null then
       open  cpk1_orden_compra(:new.PRV_CODIGO);
       fetch cpk1_orden_compra into dummy;
       found := cpk1_orden_compra%FOUND;
       close cpk1_orden_compra;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "PROVEEDOR". Cannot create child in "ORDEN_COMPRA".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_ORDEN_COMPRA before update
of ORD_NUMERO,
   PRV_CODIGO
on ORDEN_COMPRA for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    seq NUMBER;
    --  Declaration of UpdateChildParentExist constraint for the parent "PROVEEDOR"
    cursor cpk1_orden_compra(var_prv_codigo varchar) is
       select 1
       from   PROVEEDOR
       where  PRV_CODIGO = var_prv_codigo
        and   var_prv_codigo is not null;
    --  Declaration of UpdateParentRestrict constraint for "ORDEN_PRODUCTO"
    cursor cfk1_orden_producto(var_ord_numero integer) is
       select 1
       from   ORDEN_PRODUCTO
       where  ORD_NUMERO = var_ord_numero
        and   var_ord_numero is not null;

begin
    seq := IntegrityPackage.GetNestLevel;
    --  Parent "PROVEEDOR" must exist when updating a child in "ORDEN_COMPRA"
    if (:new.PRV_CODIGO is not null) and (seq = 0) then
       open  cpk1_orden_compra(:new.PRV_CODIGO);
       fetch cpk1_orden_compra into dummy;
       found := cpk1_orden_compra%FOUND;
       close cpk1_orden_compra;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "PROVEEDOR". Cannot update child in "ORDEN_COMPRA".';
          raise integrity_error;
       end if;
    end if;

    --  Cannot modify parent code in "ORDEN_COMPRA" if children still exist in "ORDEN_PRODUCTO"
    if (updating('ORD_NUMERO') and :old.ORD_NUMERO != :new.ORD_NUMERO) then
       open  cfk1_orden_producto(:old.ORD_NUMERO);
       fetch cfk1_orden_producto into dummy;
       found := cfk1_orden_producto%FOUND;
       close cfk1_orden_producto;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "ORDEN_PRODUCTO". Cannot modify parent code in "ORDEN_COMPRA".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TIB_ORDEN_PRODUCTO before insert
on ORDEN_PRODUCTO for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of InsertChildParentExist constraint for the parent "ORDEN_COMPRA"
    cursor cpk1_orden_producto(var_ord_numero integer) is
       select 1
       from   ORDEN_COMPRA
       where  ORD_NUMERO = var_ord_numero
        and   var_ord_numero is not null;
    --  Declaration of InsertChildParentExist constraint for the parent "PRODUCTO"
    cursor cpk2_orden_producto(var_prd_codigo varchar) is
       select 1
       from   PRODUCTO
       where  PRD_CODIGO = var_prd_codigo
        and   var_prd_codigo is not null;

begin
    --  Parent "ORDEN_COMPRA" must exist when inserting a child in "ORDEN_PRODUCTO"
    if :new.ORD_NUMERO is not null then
       open  cpk1_orden_producto(:new.ORD_NUMERO);
       fetch cpk1_orden_producto into dummy;
       found := cpk1_orden_producto%FOUND;
       close cpk1_orden_producto;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "ORDEN_COMPRA". Cannot create child in "ORDEN_PRODUCTO".';
          raise integrity_error;
       end if;
    end if;

    --  Parent "PRODUCTO" must exist when inserting a child in "ORDEN_PRODUCTO"
    if :new.PRD_CODIGO is not null then
       open  cpk2_orden_producto(:new.PRD_CODIGO);
       fetch cpk2_orden_producto into dummy;
       found := cpk2_orden_producto%FOUND;
       close cpk2_orden_producto;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "PRODUCTO". Cannot create child in "ORDEN_PRODUCTO".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_ORDEN_PRODUCTO before update
of PRD_CODIGO,
   ORD_NUMERO
on ORDEN_PRODUCTO for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    seq NUMBER;
    --  Declaration of UpdateChildParentExist constraint for the parent "ORDEN_COMPRA"
    cursor cpk1_orden_producto(var_ord_numero integer) is
       select 1
       from   ORDEN_COMPRA
       where  ORD_NUMERO = var_ord_numero
        and   var_ord_numero is not null;
    --  Declaration of UpdateChildParentExist constraint for the parent "PRODUCTO"
    cursor cpk2_orden_producto(var_prd_codigo varchar) is
       select 1
       from   PRODUCTO
       where  PRD_CODIGO = var_prd_codigo
        and   var_prd_codigo is not null;

begin
    seq := IntegrityPackage.GetNestLevel;
    --  Parent "ORDEN_COMPRA" must exist when updating a child in "ORDEN_PRODUCTO"
    if (:new.ORD_NUMERO is not null) and (seq = 0) then
       open  cpk1_orden_producto(:new.ORD_NUMERO);
       fetch cpk1_orden_producto into dummy;
       found := cpk1_orden_producto%FOUND;
       close cpk1_orden_producto;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "ORDEN_COMPRA". Cannot update child in "ORDEN_PRODUCTO".';
          raise integrity_error;
       end if;
    end if;

    --  Parent "PRODUCTO" must exist when updating a child in "ORDEN_PRODUCTO"
    if (:new.PRD_CODIGO is not null) and (seq = 0) then
       open  cpk2_orden_producto(:new.PRD_CODIGO);
       fetch cpk2_orden_producto into dummy;
       found := cpk2_orden_producto%FOUND;
       close cpk2_orden_producto;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "PRODUCTO". Cannot update child in "ORDEN_PRODUCTO".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TDB_PRODUCTO before delete
on PRODUCTO for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of DeleteParentRestrict constraint for "PROVEEDOR_PRODUCTO"
    cursor cfk1_proveedor_producto(var_prd_codigo varchar) is
       select 1
       from   PROVEEDOR_PRODUCTO
       where  PRD_CODIGO = var_prd_codigo
        and   var_prd_codigo is not null;
    --  Declaration of DeleteParentRestrict constraint for "DETALLE_FACTURA"
    cursor cfk2_detalle_factura(var_prd_codigo varchar) is
       select 1
       from   DETALLE_FACTURA
       where  PRD_CODIGO = var_prd_codigo
        and   var_prd_codigo is not null;
    --  Declaration of DeleteParentRestrict constraint for "PRODUCTO_PROMOCION"
    cursor cfk3_producto_promocion(var_prd_codigo varchar) is
       select 1
       from   PRODUCTO_PROMOCION
       where  PRD_CODIGO = var_prd_codigo
        and   var_prd_codigo is not null;
    --  Declaration of DeleteParentRestrict constraint for "ORDEN_PRODUCTO"
    cursor cfk4_orden_producto(var_prd_codigo varchar) is
       select 1
       from   ORDEN_PRODUCTO
       where  PRD_CODIGO = var_prd_codigo
        and   var_prd_codigo is not null;

begin
    --  Cannot delete parent "PRODUCTO" if children still exist in "PROVEEDOR_PRODUCTO"
    open  cfk1_proveedor_producto(:old.PRD_CODIGO);
    fetch cfk1_proveedor_producto into dummy;
    found := cfk1_proveedor_producto%FOUND;
    close cfk1_proveedor_producto;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "PROVEEDOR_PRODUCTO". Cannot delete parent "PRODUCTO".';
       raise integrity_error;
    end if;

    --  Cannot delete parent "PRODUCTO" if children still exist in "DETALLE_FACTURA"
    open  cfk2_detalle_factura(:old.PRD_CODIGO);
    fetch cfk2_detalle_factura into dummy;
    found := cfk2_detalle_factura%FOUND;
    close cfk2_detalle_factura;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "DETALLE_FACTURA". Cannot delete parent "PRODUCTO".';
       raise integrity_error;
    end if;

    --  Cannot delete parent "PRODUCTO" if children still exist in "PRODUCTO_PROMOCION"
    open  cfk3_producto_promocion(:old.PRD_CODIGO);
    fetch cfk3_producto_promocion into dummy;
    found := cfk3_producto_promocion%FOUND;
    close cfk3_producto_promocion;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "PRODUCTO_PROMOCION". Cannot delete parent "PRODUCTO".';
       raise integrity_error;
    end if;

    --  Cannot delete parent "PRODUCTO" if children still exist in "ORDEN_PRODUCTO"
    open  cfk4_orden_producto(:old.PRD_CODIGO);
    fetch cfk4_orden_producto into dummy;
    found := cfk4_orden_producto%FOUND;
    close cfk4_orden_producto;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "ORDEN_PRODUCTO". Cannot delete parent "PRODUCTO".';
       raise integrity_error;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TIB_PRODUCTO before insert
on PRODUCTO for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of InsertChildParentExist constraint for the parent "TIPO_PRODUCTO"
    cursor cpk1_producto(var_tipo_pro_codigo integer) is
       select 1
       from   TIPO_PRODUCTO
       where  TIPO_PRO_CODIGO = var_tipo_pro_codigo
        and   var_tipo_pro_codigo is not null;

begin
    --  Parent "TIPO_PRODUCTO" must exist when inserting a child in "PRODUCTO"
    if :new.TIPO_PRO_CODIGO is not null then
       open  cpk1_producto(:new.TIPO_PRO_CODIGO);
       fetch cpk1_producto into dummy;
       found := cpk1_producto%FOUND;
       close cpk1_producto;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "TIPO_PRODUCTO". Cannot create child in "PRODUCTO".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_PRODUCTO before update
of PRD_CODIGO,
   TIPO_PRO_CODIGO
on PRODUCTO for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    seq NUMBER;
    --  Declaration of UpdateChildParentExist constraint for the parent "TIPO_PRODUCTO"
    cursor cpk1_producto(var_tipo_pro_codigo integer) is
       select 1
       from   TIPO_PRODUCTO
       where  TIPO_PRO_CODIGO = var_tipo_pro_codigo
        and   var_tipo_pro_codigo is not null;
    --  Declaration of UpdateParentRestrict constraint for "PROVEEDOR_PRODUCTO"
    cursor cfk1_proveedor_producto(var_prd_codigo varchar) is
       select 1
       from   PROVEEDOR_PRODUCTO
       where  PRD_CODIGO = var_prd_codigo
        and   var_prd_codigo is not null;
    --  Declaration of UpdateParentRestrict constraint for "DETALLE_FACTURA"
    cursor cfk2_detalle_factura(var_prd_codigo varchar) is
       select 1
       from   DETALLE_FACTURA
       where  PRD_CODIGO = var_prd_codigo
        and   var_prd_codigo is not null;
    --  Declaration of UpdateParentRestrict constraint for "PRODUCTO_PROMOCION"
    cursor cfk3_producto_promocion(var_prd_codigo varchar) is
       select 1
       from   PRODUCTO_PROMOCION
       where  PRD_CODIGO = var_prd_codigo
        and   var_prd_codigo is not null;
    --  Declaration of UpdateParentRestrict constraint for "ORDEN_PRODUCTO"
    cursor cfk4_orden_producto(var_prd_codigo varchar) is
       select 1
       from   ORDEN_PRODUCTO
       where  PRD_CODIGO = var_prd_codigo
        and   var_prd_codigo is not null;

begin
    seq := IntegrityPackage.GetNestLevel;
    --  Parent "TIPO_PRODUCTO" must exist when updating a child in "PRODUCTO"
    if (:new.TIPO_PRO_CODIGO is not null) and (seq = 0) then
       open  cpk1_producto(:new.TIPO_PRO_CODIGO);
       fetch cpk1_producto into dummy;
       found := cpk1_producto%FOUND;
       close cpk1_producto;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "TIPO_PRODUCTO". Cannot update child in "PRODUCTO".';
          raise integrity_error;
       end if;
    end if;

    --  Cannot modify parent code in "PRODUCTO" if children still exist in "PROVEEDOR_PRODUCTO"
    if (updating('PRD_CODIGO') and :old.PRD_CODIGO != :new.PRD_CODIGO) then
       open  cfk1_proveedor_producto(:old.PRD_CODIGO);
       fetch cfk1_proveedor_producto into dummy;
       found := cfk1_proveedor_producto%FOUND;
       close cfk1_proveedor_producto;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "PROVEEDOR_PRODUCTO". Cannot modify parent code in "PRODUCTO".';
          raise integrity_error;
       end if;
    end if;

    --  Cannot modify parent code in "PRODUCTO" if children still exist in "DETALLE_FACTURA"
    if (updating('PRD_CODIGO') and :old.PRD_CODIGO != :new.PRD_CODIGO) then
       open  cfk2_detalle_factura(:old.PRD_CODIGO);
       fetch cfk2_detalle_factura into dummy;
       found := cfk2_detalle_factura%FOUND;
       close cfk2_detalle_factura;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "DETALLE_FACTURA". Cannot modify parent code in "PRODUCTO".';
          raise integrity_error;
       end if;
    end if;

    --  Cannot modify parent code in "PRODUCTO" if children still exist in "PRODUCTO_PROMOCION"
    if (updating('PRD_CODIGO') and :old.PRD_CODIGO != :new.PRD_CODIGO) then
       open  cfk3_producto_promocion(:old.PRD_CODIGO);
       fetch cfk3_producto_promocion into dummy;
       found := cfk3_producto_promocion%FOUND;
       close cfk3_producto_promocion;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "PRODUCTO_PROMOCION". Cannot modify parent code in "PRODUCTO".';
          raise integrity_error;
       end if;
    end if;

    --  Cannot modify parent code in "PRODUCTO" if children still exist in "ORDEN_PRODUCTO"
    if (updating('PRD_CODIGO') and :old.PRD_CODIGO != :new.PRD_CODIGO) then
       open  cfk4_orden_producto(:old.PRD_CODIGO);
       fetch cfk4_orden_producto into dummy;
       found := cfk4_orden_producto%FOUND;
       close cfk4_orden_producto;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "ORDEN_PRODUCTO". Cannot modify parent code in "PRODUCTO".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TIB_PRODUCTO_PROMOCION before insert
on PRODUCTO_PROMOCION for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of InsertChildParentExist constraint for the parent "PROMOCION"
    cursor cpk1_producto_promocion(var_prm_codigo integer) is
       select 1
       from   PROMOCION
       where  PRM_CODIGO = var_prm_codigo
        and   var_prm_codigo is not null;
    --  Declaration of InsertChildParentExist constraint for the parent "PRODUCTO"
    cursor cpk2_producto_promocion(var_prd_codigo varchar) is
       select 1
       from   PRODUCTO
       where  PRD_CODIGO = var_prd_codigo
        and   var_prd_codigo is not null;

begin
    --  Parent "PROMOCION" must exist when inserting a child in "PRODUCTO_PROMOCION"
    if :new.PRM_CODIGO is not null then
       open  cpk1_producto_promocion(:new.PRM_CODIGO);
       fetch cpk1_producto_promocion into dummy;
       found := cpk1_producto_promocion%FOUND;
       close cpk1_producto_promocion;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "PROMOCION". Cannot create child in "PRODUCTO_PROMOCION".';
          raise integrity_error;
       end if;
    end if;

    --  Parent "PRODUCTO" must exist when inserting a child in "PRODUCTO_PROMOCION"
    if :new.PRD_CODIGO is not null then
       open  cpk2_producto_promocion(:new.PRD_CODIGO);
       fetch cpk2_producto_promocion into dummy;
       found := cpk2_producto_promocion%FOUND;
       close cpk2_producto_promocion;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "PRODUCTO". Cannot create child in "PRODUCTO_PROMOCION".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_PRODUCTO_PROMOCION before update
of PRD_CODIGO,
   PRM_CODIGO
on PRODUCTO_PROMOCION for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    seq NUMBER;
    --  Declaration of UpdateChildParentExist constraint for the parent "PROMOCION"
    cursor cpk1_producto_promocion(var_prm_codigo integer) is
       select 1
       from   PROMOCION
       where  PRM_CODIGO = var_prm_codigo
        and   var_prm_codigo is not null;
    --  Declaration of UpdateChildParentExist constraint for the parent "PRODUCTO"
    cursor cpk2_producto_promocion(var_prd_codigo varchar) is
       select 1
       from   PRODUCTO
       where  PRD_CODIGO = var_prd_codigo
        and   var_prd_codigo is not null;

begin
    seq := IntegrityPackage.GetNestLevel;
    --  Parent "PROMOCION" must exist when updating a child in "PRODUCTO_PROMOCION"
    if (:new.PRM_CODIGO is not null) and (seq = 0) then
       open  cpk1_producto_promocion(:new.PRM_CODIGO);
       fetch cpk1_producto_promocion into dummy;
       found := cpk1_producto_promocion%FOUND;
       close cpk1_producto_promocion;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "PROMOCION". Cannot update child in "PRODUCTO_PROMOCION".';
          raise integrity_error;
       end if;
    end if;

    --  Parent "PRODUCTO" must exist when updating a child in "PRODUCTO_PROMOCION"
    if (:new.PRD_CODIGO is not null) and (seq = 0) then
       open  cpk2_producto_promocion(:new.PRD_CODIGO);
       fetch cpk2_producto_promocion into dummy;
       found := cpk2_producto_promocion%FOUND;
       close cpk2_producto_promocion;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "PRODUCTO". Cannot update child in "PRODUCTO_PROMOCION".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TDB_PROMOCION before delete
on PROMOCION for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of DeleteParentRestrict constraint for "PRODUCTO_PROMOCION"
    cursor cfk1_producto_promocion(var_prm_codigo integer) is
       select 1
       from   PRODUCTO_PROMOCION
       where  PRM_CODIGO = var_prm_codigo
        and   var_prm_codigo is not null;

begin
    --  Cannot delete parent "PROMOCION" if children still exist in "PRODUCTO_PROMOCION"
    open  cfk1_producto_promocion(:old.PRM_CODIGO);
    fetch cfk1_producto_promocion into dummy;
    found := cfk1_producto_promocion%FOUND;
    close cfk1_producto_promocion;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "PRODUCTO_PROMOCION". Cannot delete parent "PROMOCION".';
       raise integrity_error;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_PROMOCION before update
of PRM_CODIGO
on PROMOCION for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of UpdateParentRestrict constraint for "PRODUCTO_PROMOCION"
    cursor cfk1_producto_promocion(var_prm_codigo integer) is
       select 1
       from   PRODUCTO_PROMOCION
       where  PRM_CODIGO = var_prm_codigo
        and   var_prm_codigo is not null;

begin
    --  Cannot modify parent code in "PROMOCION" if children still exist in "PRODUCTO_PROMOCION"
    if (updating('PRM_CODIGO') and :old.PRM_CODIGO != :new.PRM_CODIGO) then
       open  cfk1_producto_promocion(:old.PRM_CODIGO);
       fetch cfk1_producto_promocion into dummy;
       found := cfk1_producto_promocion%FOUND;
       close cfk1_producto_promocion;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "PRODUCTO_PROMOCION". Cannot modify parent code in "PROMOCION".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TDB_PROVEEDOR before delete
on PROVEEDOR for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of DeleteParentRestrict constraint for "PROVEEDOR_PRODUCTO"
    cursor cfk1_proveedor_producto(var_prv_codigo varchar) is
       select 1
       from   PROVEEDOR_PRODUCTO
       where  PRV_CODIGO = var_prv_codigo
        and   var_prv_codigo is not null;
    --  Declaration of DeleteParentRestrict constraint for "ORDEN_COMPRA"
    cursor cfk2_orden_compra(var_prv_codigo varchar) is
       select 1
       from   ORDEN_COMPRA
       where  PRV_CODIGO = var_prv_codigo
        and   var_prv_codigo is not null;

begin
    --  Cannot delete parent "PROVEEDOR" if children still exist in "PROVEEDOR_PRODUCTO"
    open  cfk1_proveedor_producto(:old.PRV_CODIGO);
    fetch cfk1_proveedor_producto into dummy;
    found := cfk1_proveedor_producto%FOUND;
    close cfk1_proveedor_producto;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "PROVEEDOR_PRODUCTO". Cannot delete parent "PROVEEDOR".';
       raise integrity_error;
    end if;

    --  Cannot delete parent "PROVEEDOR" if children still exist in "ORDEN_COMPRA"
    open  cfk2_orden_compra(:old.PRV_CODIGO);
    fetch cfk2_orden_compra into dummy;
    found := cfk2_orden_compra%FOUND;
    close cfk2_orden_compra;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "ORDEN_COMPRA". Cannot delete parent "PROVEEDOR".';
       raise integrity_error;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TIB_PROVEEDOR before insert
on PROVEEDOR for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of InsertChildParentExist constraint for the parent "EMPRESA"
    cursor cpk1_proveedor(var_emp_codigo varchar) is
       select 1
       from   EMPRESA
       where  EMP_CODIGO = var_emp_codigo
        and   var_emp_codigo is not null;

begin
    --  Parent "EMPRESA" must exist when inserting a child in "PROVEEDOR"
    if :new.EMP_CODIGO is not null then
       open  cpk1_proveedor(:new.EMP_CODIGO);
       fetch cpk1_proveedor into dummy;
       found := cpk1_proveedor%FOUND;
       close cpk1_proveedor;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "EMPRESA". Cannot create child in "PROVEEDOR".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_PROVEEDOR before update
of PRV_CODIGO,
   EMP_CODIGO
on PROVEEDOR for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    seq NUMBER;
    --  Declaration of UpdateChildParentExist constraint for the parent "EMPRESA"
    cursor cpk1_proveedor(var_emp_codigo varchar) is
       select 1
       from   EMPRESA
       where  EMP_CODIGO = var_emp_codigo
        and   var_emp_codigo is not null;
    --  Declaration of UpdateParentRestrict constraint for "PROVEEDOR_PRODUCTO"
    cursor cfk1_proveedor_producto(var_prv_codigo varchar) is
       select 1
       from   PROVEEDOR_PRODUCTO
       where  PRV_CODIGO = var_prv_codigo
        and   var_prv_codigo is not null;
    --  Declaration of UpdateParentRestrict constraint for "ORDEN_COMPRA"
    cursor cfk2_orden_compra(var_prv_codigo varchar) is
       select 1
       from   ORDEN_COMPRA
       where  PRV_CODIGO = var_prv_codigo
        and   var_prv_codigo is not null;

begin
    seq := IntegrityPackage.GetNestLevel;
    --  Parent "EMPRESA" must exist when updating a child in "PROVEEDOR"
    if (:new.EMP_CODIGO is not null) and (seq = 0) then
       open  cpk1_proveedor(:new.EMP_CODIGO);
       fetch cpk1_proveedor into dummy;
       found := cpk1_proveedor%FOUND;
       close cpk1_proveedor;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "EMPRESA". Cannot update child in "PROVEEDOR".';
          raise integrity_error;
       end if;
    end if;

    --  Cannot modify parent code in "PROVEEDOR" if children still exist in "PROVEEDOR_PRODUCTO"
    if (updating('PRV_CODIGO') and :old.PRV_CODIGO != :new.PRV_CODIGO) then
       open  cfk1_proveedor_producto(:old.PRV_CODIGO);
       fetch cfk1_proveedor_producto into dummy;
       found := cfk1_proveedor_producto%FOUND;
       close cfk1_proveedor_producto;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "PROVEEDOR_PRODUCTO". Cannot modify parent code in "PROVEEDOR".';
          raise integrity_error;
       end if;
    end if;

    --  Cannot modify parent code in "PROVEEDOR" if children still exist in "ORDEN_COMPRA"
    if (updating('PRV_CODIGO') and :old.PRV_CODIGO != :new.PRV_CODIGO) then
       open  cfk2_orden_compra(:old.PRV_CODIGO);
       fetch cfk2_orden_compra into dummy;
       found := cfk2_orden_compra%FOUND;
       close cfk2_orden_compra;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "ORDEN_COMPRA". Cannot modify parent code in "PROVEEDOR".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TIB_PROVEEDOR_PRODUCTO before insert
on PROVEEDOR_PRODUCTO for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of InsertChildParentExist constraint for the parent "PROVEEDOR"
    cursor cpk1_proveedor_producto(var_prv_codigo varchar) is
       select 1
       from   PROVEEDOR
       where  PRV_CODIGO = var_prv_codigo
        and   var_prv_codigo is not null;
    --  Declaration of InsertChildParentExist constraint for the parent "PRODUCTO"
    cursor cpk2_proveedor_producto(var_prd_codigo varchar) is
       select 1
       from   PRODUCTO
       where  PRD_CODIGO = var_prd_codigo
        and   var_prd_codigo is not null;

begin
    --  Parent "PROVEEDOR" must exist when inserting a child in "PROVEEDOR_PRODUCTO"
    if :new.PRV_CODIGO is not null then
       open  cpk1_proveedor_producto(:new.PRV_CODIGO);
       fetch cpk1_proveedor_producto into dummy;
       found := cpk1_proveedor_producto%FOUND;
       close cpk1_proveedor_producto;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "PROVEEDOR". Cannot create child in "PROVEEDOR_PRODUCTO".';
          raise integrity_error;
       end if;
    end if;

    --  Parent "PRODUCTO" must exist when inserting a child in "PROVEEDOR_PRODUCTO"
    if :new.PRD_CODIGO is not null then
       open  cpk2_proveedor_producto(:new.PRD_CODIGO);
       fetch cpk2_proveedor_producto into dummy;
       found := cpk2_proveedor_producto%FOUND;
       close cpk2_proveedor_producto;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "PRODUCTO". Cannot create child in "PROVEEDOR_PRODUCTO".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_PROVEEDOR_PRODUCTO before update
of PRD_CODIGO,
   PRV_CODIGO
on PROVEEDOR_PRODUCTO for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    seq NUMBER;
    --  Declaration of UpdateChildParentExist constraint for the parent "PROVEEDOR"
    cursor cpk1_proveedor_producto(var_prv_codigo varchar) is
       select 1
       from   PROVEEDOR
       where  PRV_CODIGO = var_prv_codigo
        and   var_prv_codigo is not null;
    --  Declaration of UpdateChildParentExist constraint for the parent "PRODUCTO"
    cursor cpk2_proveedor_producto(var_prd_codigo varchar) is
       select 1
       from   PRODUCTO
       where  PRD_CODIGO = var_prd_codigo
        and   var_prd_codigo is not null;

begin
    seq := IntegrityPackage.GetNestLevel;
    --  Parent "PROVEEDOR" must exist when updating a child in "PROVEEDOR_PRODUCTO"
    if (:new.PRV_CODIGO is not null) and (seq = 0) then
       open  cpk1_proveedor_producto(:new.PRV_CODIGO);
       fetch cpk1_proveedor_producto into dummy;
       found := cpk1_proveedor_producto%FOUND;
       close cpk1_proveedor_producto;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "PROVEEDOR". Cannot update child in "PROVEEDOR_PRODUCTO".';
          raise integrity_error;
       end if;
    end if;

    --  Parent "PRODUCTO" must exist when updating a child in "PROVEEDOR_PRODUCTO"
    if (:new.PRD_CODIGO is not null) and (seq = 0) then
       open  cpk2_proveedor_producto(:new.PRD_CODIGO);
       fetch cpk2_proveedor_producto into dummy;
       found := cpk2_proveedor_producto%FOUND;
       close cpk2_proveedor_producto;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "PRODUCTO". Cannot update child in "PROVEEDOR_PRODUCTO".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TDB_SUCURSAL before delete
on SUCURSAL for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of DeleteParentRestrict constraint for "CLIENTE"
    cursor cfk1_cliente(var_scs_codigo varchar) is
       select 1
       from   CLIENTE
       where  SCS_CODIGO = var_scs_codigo
        and   var_scs_codigo is not null;
    --  Declaration of DeleteParentRestrict constraint for "FACTURA"
    cursor cfk2_factura(var_scs_codigo varchar) is
       select 1
       from   FACTURA
       where  SCS_CODIGO = var_scs_codigo
        and   var_scs_codigo is not null;
    --  Declaration of DeleteParentRestrict constraint for "BODEGA"
    cursor cfk3_bodega(var_scs_codigo varchar) is
       select 1
       from   BODEGA
       where  SCS_CODIGO = var_scs_codigo
        and   var_scs_codigo is not null;

begin
    --  Cannot delete parent "SUCURSAL" if children still exist in "CLIENTE"
    open  cfk1_cliente(:old.SCS_CODIGO);
    fetch cfk1_cliente into dummy;
    found := cfk1_cliente%FOUND;
    close cfk1_cliente;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "CLIENTE". Cannot delete parent "SUCURSAL".';
       raise integrity_error;
    end if;

    --  Cannot delete parent "SUCURSAL" if children still exist in "FACTURA"
    open  cfk2_factura(:old.SCS_CODIGO);
    fetch cfk2_factura into dummy;
    found := cfk2_factura%FOUND;
    close cfk2_factura;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "FACTURA". Cannot delete parent "SUCURSAL".';
       raise integrity_error;
    end if;

    --  Cannot delete parent "SUCURSAL" if children still exist in "BODEGA"
    open  cfk3_bodega(:old.SCS_CODIGO);
    fetch cfk3_bodega into dummy;
    found := cfk3_bodega%FOUND;
    close cfk3_bodega;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "BODEGA". Cannot delete parent "SUCURSAL".';
       raise integrity_error;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TIB_SUCURSAL before insert
on SUCURSAL for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of InsertChildParentExist constraint for the parent "EMPRESA"
    cursor cpk1_sucursal(var_emp_codigo varchar) is
       select 1
       from   EMPRESA
       where  EMP_CODIGO = var_emp_codigo
        and   var_emp_codigo is not null;

begin
    --  Parent "EMPRESA" must exist when inserting a child in "SUCURSAL"
    if :new.EMP_CODIGO is not null then
       open  cpk1_sucursal(:new.EMP_CODIGO);
       fetch cpk1_sucursal into dummy;
       found := cpk1_sucursal%FOUND;
       close cpk1_sucursal;
       if not found then
          errno  := -20002;
          errmsg := 'Parent does not exist in "EMPRESA". Cannot create child in "SUCURSAL".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_SUCURSAL before update
of SCS_CODIGO,
   EMP_CODIGO
on SUCURSAL for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    seq NUMBER;
    --  Declaration of UpdateChildParentExist constraint for the parent "EMPRESA"
    cursor cpk1_sucursal(var_emp_codigo varchar) is
       select 1
       from   EMPRESA
       where  EMP_CODIGO = var_emp_codigo
        and   var_emp_codigo is not null;
    --  Declaration of UpdateParentRestrict constraint for "CLIENTE"
    cursor cfk1_cliente(var_scs_codigo varchar) is
       select 1
       from   CLIENTE
       where  SCS_CODIGO = var_scs_codigo
        and   var_scs_codigo is not null;
    --  Declaration of UpdateParentRestrict constraint for "FACTURA"
    cursor cfk2_factura(var_scs_codigo varchar) is
       select 1
       from   FACTURA
       where  SCS_CODIGO = var_scs_codigo
        and   var_scs_codigo is not null;
    --  Declaration of UpdateParentRestrict constraint for "BODEGA"
    cursor cfk3_bodega(var_scs_codigo varchar) is
       select 1
       from   BODEGA
       where  SCS_CODIGO = var_scs_codigo
        and   var_scs_codigo is not null;

begin
    seq := IntegrityPackage.GetNestLevel;
    --  Parent "EMPRESA" must exist when updating a child in "SUCURSAL"
    if (:new.EMP_CODIGO is not null) and (seq = 0) then
       open  cpk1_sucursal(:new.EMP_CODIGO);
       fetch cpk1_sucursal into dummy;
       found := cpk1_sucursal%FOUND;
       close cpk1_sucursal;
       if not found then
          errno  := -20003;
          errmsg := 'Parent does not exist in "EMPRESA". Cannot update child in "SUCURSAL".';
          raise integrity_error;
       end if;
    end if;

    --  Cannot modify parent code in "SUCURSAL" if children still exist in "CLIENTE"
    if (updating('SCS_CODIGO') and :old.SCS_CODIGO != :new.SCS_CODIGO) then
       open  cfk1_cliente(:old.SCS_CODIGO);
       fetch cfk1_cliente into dummy;
       found := cfk1_cliente%FOUND;
       close cfk1_cliente;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "CLIENTE". Cannot modify parent code in "SUCURSAL".';
          raise integrity_error;
       end if;
    end if;

    --  Cannot modify parent code in "SUCURSAL" if children still exist in "FACTURA"
    if (updating('SCS_CODIGO') and :old.SCS_CODIGO != :new.SCS_CODIGO) then
       open  cfk2_factura(:old.SCS_CODIGO);
       fetch cfk2_factura into dummy;
       found := cfk2_factura%FOUND;
       close cfk2_factura;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "FACTURA". Cannot modify parent code in "SUCURSAL".';
          raise integrity_error;
       end if;
    end if;

    --  Cannot modify parent code in "SUCURSAL" if children still exist in "BODEGA"
    if (updating('SCS_CODIGO') and :old.SCS_CODIGO != :new.SCS_CODIGO) then
       open  cfk3_bodega(:old.SCS_CODIGO);
       fetch cfk3_bodega into dummy;
       found := cfk3_bodega%FOUND;
       close cfk3_bodega;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "BODEGA". Cannot modify parent code in "SUCURSAL".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TDB_TIPO_PRODUCTO before delete
on TIPO_PRODUCTO for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of DeleteParentRestrict constraint for "PRODUCTO"
    cursor cfk1_producto(var_tipo_pro_codigo integer) is
       select 1
       from   PRODUCTO
       where  TIPO_PRO_CODIGO = var_tipo_pro_codigo
        and   var_tipo_pro_codigo is not null;

begin
    --  Cannot delete parent "TIPO_PRODUCTO" if children still exist in "PRODUCTO"
    open  cfk1_producto(:old.TIPO_PRO_CODIGO);
    fetch cfk1_producto into dummy;
    found := cfk1_producto%FOUND;
    close cfk1_producto;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "PRODUCTO". Cannot delete parent "TIPO_PRODUCTO".';
       raise integrity_error;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_TIPO_PRODUCTO before update
of TIPO_PRO_CODIGO
on TIPO_PRODUCTO for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of UpdateParentRestrict constraint for "PRODUCTO"
    cursor cfk1_producto(var_tipo_pro_codigo integer) is
       select 1
       from   PRODUCTO
       where  TIPO_PRO_CODIGO = var_tipo_pro_codigo
        and   var_tipo_pro_codigo is not null;

begin
    --  Cannot modify parent code in "TIPO_PRODUCTO" if children still exist in "PRODUCTO"
    if (updating('TIPO_PRO_CODIGO') and :old.TIPO_PRO_CODIGO != :new.TIPO_PRO_CODIGO) then
       open  cfk1_producto(:old.TIPO_PRO_CODIGO);
       fetch cfk1_producto into dummy;
       found := cfk1_producto%FOUND;
       close cfk1_producto;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "PRODUCTO". Cannot modify parent code in "TIPO_PRODUCTO".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TDB_TRANSACCION before delete
on TRANSACCION for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of DeleteParentRestrict constraint for "BODEGA_TRANSACCION"
    cursor cfk1_bodega_transaccion(var_trs_codigo varchar) is
       select 1
       from   BODEGA_TRANSACCION
       where  TRS_CODIGO = var_trs_codigo
        and   var_trs_codigo is not null;

begin
    --  Cannot delete parent "TRANSACCION" if children still exist in "BODEGA_TRANSACCION"
    open  cfk1_bodega_transaccion(:old.TRS_CODIGO);
    fetch cfk1_bodega_transaccion into dummy;
    found := cfk1_bodega_transaccion%FOUND;
    close cfk1_bodega_transaccion;
    if found then
       errno  := -20006;
       errmsg := 'Children still exist in "BODEGA_TRANSACCION". Cannot delete parent "TRANSACCION".';
       raise integrity_error;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create trigger TUB_TRANSACCION before update
of TRS_CODIGO
on TRANSACCION for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    --  Declaration of UpdateParentRestrict constraint for "BODEGA_TRANSACCION"
    cursor cfk1_bodega_transaccion(var_trs_codigo varchar) is
       select 1
       from   BODEGA_TRANSACCION
       where  TRS_CODIGO = var_trs_codigo
        and   var_trs_codigo is not null;

begin
    --  Cannot modify parent code in "TRANSACCION" if children still exist in "BODEGA_TRANSACCION"
    if (updating('TRS_CODIGO') and :old.TRS_CODIGO != :new.TRS_CODIGO) then
       open  cfk1_bodega_transaccion(:old.TRS_CODIGO);
       fetch cfk1_bodega_transaccion into dummy;
       found := cfk1_bodega_transaccion%FOUND;
       close cfk1_bodega_transaccion;
       if found then
          errno  := -20005;
          errmsg := 'Children still exist in "BODEGA_TRANSACCION". Cannot modify parent code in "TRANSACCION".';
          raise integrity_error;
       end if;
    end if;


--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
