drop trigger TA_MODIFICA_PRECIO;

create or replace trigger TU_PRECIO 
before update of PRD_PRECIO
on producto
for each row
begin 
    if (:new.PRD_PRECIO > 100) then
        raise_application_error(-20000, 'El precio esta furea de rango');
    end if;
end TU_PRECIO;
/

update producto set PRD_PRECIO = 101 where PRD_CODIGO = 'Prod1';

create table empleado (
    emp_ci  varchar2(15),
    emp_nombre  varchar2(50),
    crg_codigo  varchar2(10),
    salario number(16,4)
)
    tablespace DATOS
/

-- tenemos la tabla empleado que tiene 2 atributos crg_codigo y salario
-- crear un trigger que se ejecute en update en la tabla 'empleado' que el objetivo sea 'salario'
-- el atributo 'salario' es de tipo number(16, 4), necesitamos declarar una nueva variable que contenga el salario del presidente
-- si el salario del empleado que puede ser 'OPER' o 'GEREN' es superior al de 'PRESI' creaer un raise_application_error(el salario del empleado no puede ser mayor al del presidente)
-- y evitar que se asigne el nuevo valor al empleado
-- el nombre del trigger sera TU_SALARIO

insert into empleado values ('1', 'Oden', 'OPER', 1000);
insert into empleado values ('2', 'Roger', 'PRESI', 3000);
insert into empleado values ('3', 'Rayleigh', 'GEREN', 2000);
insert into empleado values ('4', 'Gaban', 'OPER', 2000);
insert into empleado values ('5', 'Marco', 'GEREN', 2000);
insert into empleado values ('6', 'Jozu', 'OPER', 1000);
insert into empleado values ('7', 'Nekomamushi', 'OPER', 1000);
insert into empleado values ('8', 'Inuarashi', 'OPER', 4000);

select * from empleado;

desc empleado;  

create or replace trigger TU_SALARIO
before update on empleado
for each row
declare
    salario_presidente number(16, 4);
begin
    select salario into salario_presidente from empleado where crg_codigo = 'PRESI';
    if :new.crg_codigo = 'OPER' or :new.crg_codigo = 'GEREN' then
        if :new.salario > salario_presidente then
            raise_application_error(-20000, 'El salario del empleado no puede ser mayor al del presidente');
        end if;
    end if;
end TU_SALARIO;
/

commit;

drop trigger TU_SALARIO;

update empleado set salario = 100 where emp_nombre = 'Oden';
update empleado set salario = 5000 where crg_codigo = 'OPER';
update empleado set salario = 26000 where crg_codigo = 'GEREN';

select * from empleado;
insert into empleado values ('8', 'Vista', 'GEREN', 2000);
update empleado set emp_ci = '9' where emp_nombre = 'Vista';

-- eliminar el empleado con emp_nombre = 'Vista' en la tabla empleados
delete from empleado where emp_nombre = 'Vista';
