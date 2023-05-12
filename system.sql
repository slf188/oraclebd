select * from tab;

create tablespace DATOS
datafile '/opt/oracle/oradata/XE/XEPDB1/DATOS.dbf'
size 500M
    autoextend on next 100M;
    
create tablespace INDICES
datafile '/opt/oracle/oradata/XE/XEPDB1/INDICES.dbf'
size 500M
    autoextend on next 100M;
    
alter session set "_ORACLE_SCRIPT"=TRUE;
create user sisfactura identified by lticPUCE default tablespace DATOS;
grant connect, resource, dba to sisfactura;
