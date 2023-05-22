select * from cliente;

desc cliente;

create table AUDITORIA (
    AUD_USUARIO varchar2(30),
    AUD_FECHA   DATE,
    AUD_DATOSOLD    varchar2(300),
    AUD_DATOSNEW    varchar2(300)
)
    tablespace DATOS
/

-- se quiere controlar las transacciones que se realicen sobre la tabla productos
create or replace trigger TA_Cliente
before insert on cliente
for each row
declare
    datosold char(300);
    datosnew char(300);
begin
    datosold := :old.CLI_CI_RUC || ' ' || :old.SCS_CODIGO || ' ' || :old.CLI_NOMBRE || ' ' || :old.CLI_DIRECCION;
    
    datosnew := :new.CLI_CI_RUC || ' ' || :new.SCS_CODIGO || ' ' || :new.CLI_NOMBRE || ' ' || :new.CLI_DIRECCION;
    
     insert into auditoria values (user, sysdate, datosold, datosnew);
end TA_CLIENTE;
/

select * from auditoria;
desc auditoria;

select * from cliente;
desc cliente;
insert into cliente values ('151', 'S-5', 'Edward Elric', 'Resembool');

select * from auditoria;

-- producto
-- hacer disparador que pueda modificar el precio de tabla productos, cuando el precio no sea mayor a 20$
-- raise application error
-- sacar un mensaje que diga el precio es mayor a 20$
select * from producto;
-- producto tiene el atributo PRD_PRECIO
create or replace trigger TA_MODIFICA_PRECIO
before update on producto
for each row
begin
    if :new.PRD_PRECIO > 20 then
        raise_application_error(-20000, 'El precio es mayor a 20$');
        :new.PRD_PRECIO := :old.PRD_PRECIO;
    end if;
end TA_MODIFICA_PRECIO;
/

-- insert into producto values ('Prod31', '5', 'Hogar7', 'Hogar 7', '31', 'Hogar');

update producto set PRD_PRECIO = 100 where PRD_CODIGO = 'Prod1';

select * from producto;
