create tablespace DATOSG1
datafile '/opt/oracle/oradata/XE/XEPDB1/DATOSG1.dbf'
size 2M
    autoextend on next 1M;
    
create tablespace INDICESG1
datafile '/opt/oracle/oradata/XE/XEPDB1/INDICESG1.dbf'
size 2M
    autoextend on next 1M;


alter session set "_ORACLE_SCRIPT"=TRUE;
create user PROYECTOG1 identified by lticPUCE default tablespace DATOSG1;
grant connect, resource, dba to PROYECTOG1;
