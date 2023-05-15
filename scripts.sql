-- equivalente a sudo
alter session set "_ORACLE_SCRIPT"=TRUE;

-- para revisar los usuarios
select * from dba_users;

-- para eliminar un usuario
-- nunca eliminar sys system oracle sysdba
-- rollback es para instrucciones dml
-- no se aplica para instrucciones ddl
alter session set "_ORACLE_SCRIPT"=TRUE;
-- cascade se utiliza para eliminar todo de todo
drop user usuario cascade;

-- crear role y asignar accion select en dicho role en una tabla de la bd
alter session set "_ORACLE_SCRIPT"=TRUE;
create role facturador;
grant select on sisfacturacion.bodega to facturador;
grant select, insert on sisfacturacion.cliente to facturador;
grant select, update on sisfacturacion.producto to facturador;
grant select, insert, update, delete on sisfacturacion.factura to facturador;
grant select, insert, update, delete on sisfacturacion.detalle_factura to facturador;

-- rol servicios
create role servicios;
grant select, insert on sisfacturacion.bodega to servicios;

create user fvallejo identified by lticPUCE default tablespace DATOS temporary tablespace TEMP;

select * from dba_users;
grant connect, resource, facturador to fvallejo;
