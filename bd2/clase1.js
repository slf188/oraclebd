// clase 1
sqlplus /nolog
// se conecta con sys
conn sys as sysdba
// se conecta con system
connect system
show user
show con_name
select tablespace_name from dba_tablespaces;
show dbspace

CREATE TABLESPACE "TSTABLA"
DATAFILE 'C:\Oracle\Database21c\oradata\ORCL\prueba.DBF' SIZE 100M;
// en mi computadora es C:\app\LuisVallejo\product\21c\oradata\XE\prueba.DBF
// podemos agrandar el tamano del tablespace con un update

// para crear un tablespace temporal lo hacemos de la siguiente manera
CREATE TEMPORARY TABLESPACE "TSTABLA_TEMP" TEMPFILE 'C:\Oracle\Database21c\oradata\ORCL\prueba_TEMP.DBF'  SIZE 100M;

alter session set "_ORACLE_SCRIPT"=true;

create user usr_felipe
identified by lticPUCE
default tablespace TSTABLA quota unlimited on TSTABLA 
temporary tablespace TSTABLA_TEMP;

create role desarrollo;

grant create session, create table, alter any table, drop any table,
insert any table, update any table, delete any table, select any table
to desarrollo;

SELECT PRIVILEGE FROM DBA_SYS_PRIVS WHERE GRANTEE = 'DESARROLLO';

GRANT DESARROLLO TO USR_FELIPE;
// para ver usuarios
select username from dba_users;

grant unlimited tablespace to usr_felipe;
grant "CONNECT" to usr_felipe;
grant alter tablespace to usr_felipe;
grant execute any procedure to usr_felipe;

// otra manera de crear usuarios:
create user usr_juan1
identified by passjuan1
grant create session;

create table prueba (
    pru_id integer not null,
    pru_numero integer not null,
    pru_title varchar(50) not null,
    pru_descrip varchar(50),
    pru_year number(4),
    pru_mail varchar(20),
    constraint pk_prueba primary key(pru_id)
);
