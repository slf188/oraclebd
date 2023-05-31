desc producto;

-- para poder imprimir
set SERVEROUTPUT on;

-- realizar procedimiento que aumente prd_precio por 10% en la tabla producto
create or replace procedure aumentar_precio
as
begin
    update producto set prd_precio = prd_precio * 1.1;
end;
/

select * from producto;

exec aumentar_precio;

desc empleado;

-- especificar bien la variable de la tabla y tambien en los parametros que pasamos en el procedimiento
create or replace procedure salario (ci in varchar2, sal out number) 
as
begin
    select salario into sal from empleado 
    where empleado.emp_ci = ci;
end;
/

select * from empleado;

drop procedure salario;

-- llamar el procedimiento
declare
    sal number;
begin
    salario('1', sal);
    dbms_output.put_line('Salario: ' || sal);
end;
/

desc factura;
