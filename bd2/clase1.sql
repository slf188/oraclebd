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

select username from dba_users;

grant unlimited tablespace to usr_felipe;
grant "CONNECT" to usr_felipe;
grant alter tablespace to usr_felipe;
grant execute any procedure to usr_felipe;
