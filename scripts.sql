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
