set SERVEROUTPUT on;

create or replace function validar(cedula integer)
return boolean
is
    v_cedula varchar2(10); -- cedula como string
    v_suma number(2) := 0; -- variable que acumula la suma de las multiplicaciones
    v_resultado number(2) := 0; -- resultado de la validacion
begin
    v_cedula := to_char(cedula); -- convertir a string
    for i in 1..9 loop -- loop sobre los digitos de la cedula
        v_suma := v_suma + to_number(substr(v_cedula, i, 1)) * (3 - mod(i, 2)); -- multiplicar por 1 y 2 alternado, sumar todo y almacenarlo en v_suma
    end loop;
    v_resultado := mod(v_suma, 10); -- calcular el resto de la suma dividido por 10
    if v_resultado = 0 then -- si el resto es 0 la cedula es valida
        return true;
    else -- de lo contrario es invalida
        return false;
    end if;
end;
/

-- llamado de la funcion
declare
    v_cedula integer := 0604250381;
    v_resultado boolean;
begin
    v_resultado := validar(v_cedula);
    if v_resultado then
        dbms_output.put_line('La cedula es valida');
    else
        dbms_output.put_line('La cedula no es valida');
    end if;
end;
/
