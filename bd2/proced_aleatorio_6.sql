show user;

sqlplus /nolog

conn sys as sysdba

CREATE TABLESPACE "TSTABLA"
DATAFILE 'C:\Oracle\Database21c\oradata\ORCL\prueba.DBF' SIZE 100M;
-- en mi computadora es C:\app\LuisVallejo\product\21c\oradata\XE\prueba.DBF
-- podemos agrandar el tamano del tablespace con un update

-- para crear un tablespace temporal lo hacemos de la siguiente manera
CREATE TEMPORARY TABLESPACE "TSTABLA_TEMP" TEMPFILE 'C:\Oracle\Database21c\oradata\ORCL\prueba_TEMP.DBF'  SIZE 100M;

alter session set "_ORACLE_SCRIPT"=true;

create user usr_felipe
identified by lticPUCE
default tablespace TSTABLA quota unlimited on TSTABLA 
temporary tablespace TSTABLA_TEMP;

create role desarrollo;

-- asegurar de tener create procedure
grant create session, create table, alter any table, drop any table, create procedure,
insert any table, update any table, delete any table, select any table
to desarrollo;

GRANT DESARROLLO TO USR_FELIPE;

create table prueba (
    pru_id integer not null,
    pru_numero integer not null,
    pru_title varchar(50) not null,
    pru_descrip varchar(50),
    pru_year number(4),
    pru_mail varchar(20),
    constraint pk_prueba primary key(pru_id)
);

select * from prueba;

-- procedimiento almacenado que inserte 10 registros en la tabla prueba
-- con valores aleatorios
create or replace procedure insertar_prueba
is
begin 
    for i in 1..10 loop
        insert into prueba values(
            i,
            round(dbms_random.value(1,100)),
            'titulo'||i,
            'desc'||i,
            round(dbms_random.value(2000,2020)),
            '
            '||i||'@'
        );
    end loop;
end;

exec insertar_prueba;

select count(*) from prueba;

select * from prueba;   
