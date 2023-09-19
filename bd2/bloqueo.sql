create table saturar (
    id_saturar integer not null,
    descripcion varchar2(50)
);

select * from saturar;

insert into saturar values(1001,'quito');
insert into saturar values(1002,'cuenca');
insert into saturar values(1003,'guayaquil');
insert into saturar values(1004,'manabi');

show user;

-- nos va a dar la ip de la conexion
-- nos va a dar una diferente ip por cada conexion, sin importar que nos conectemos al mismo usuario
select sys_context('USERENV','SID') SID from dual;
--               cmd   sqldeveloper
-- system        624      14
-- usr_felipe    873     260

-- asegurarser de ejecutar en sys
GRANT LOCK ANY TABLE TO usr_felipe;

-- para revisar los privilegios de un usuario:
SELECT privilege
FROM dba_sys_privs
WHERE grantee = 'usr_felipe';

-- bloqueamos la tabla desde el usr_felipe en el cmd
LOCK TABLE saturar IN EXCLUSIVE MODE;

-- si tratamos de realizar un cambio no nos permite hacerlo
UPDATE saturar SET descripcion = 'bloqueo1' WHERE id_saturar=1003;

-- para desbloquear debemos primero ver quien fue la persona que realizo el bloqueo
-- en el usuario system en el cmd o en el developer
SELECT SESSION_ID,LOCK_TYPE, MODE_HELD  FROM dba_locks 
WHERE BLOCKING_OTHERS = 'Blocking';
-- para ver el id del bloqueador 
-- ejecutar en sytem
SELECT * FROM DBA_BLOCKERS;
-- para ver el perpetuador y la victima del bloqueo ejecutamos el siguiente comando en system
SELECT * FROM DBA_WAITERS;

-- para ver la serie de la transaccion que se esta colgando i.e. el update que hicimos
-- ejecutar en system
SELECT SID,SERIAL# FROM V$SESSION WHERE SID = 873;

-- para desbloquearle al usuario para que pueda realizar la transaccion escribimos en system:
ALTER SYSTEM KILL SESSION '873,2112';
