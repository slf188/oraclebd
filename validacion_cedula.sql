set SERVEROUTPUT on;
-- validar un numero de cedula ecuatoriano
-- 10 digitos
-- primer parametro la cedula de tipo entero
-- devolver booleano
create or replace function validar_cedula_ecuatoriana(cedula integer)
return boolean
-- multiplicar alternadavemente por 2 y 1 menos el ultimo digito
-- 2 1 2 1 2 1 2 1 2 
-- sumar los resultados de la multiplicacion
-- verificar si el segundo digito de la suma es mayor a 0
-- si es mayor sumar el primer digito a la decena superior
-- restar el resultado de la suma menos el resultado de la decena superior
-- si el resultado es igual al ultimo digito de la cedula es valida
-- si no es igual no es valida
is
    v_cedula varchar2(10);
    v_suma number(2);
    v_decena_superior number(2);
    v_resultado number(2);
    v_ultimo_digito number(1);
    v_segundo_digito number(1);
begin
    v_cedula := to_char(cedula);
    v_suma := 0;
    v_decena_superior := 0;
    v_resultado := 0;
    v_ultimo_digito := to_number(substr(v_cedula, -1));
    v_segundo_digito := to_number(substr(v_cedula, 2, 1));
    for i in 1..9 loop
        if mod(i, 2) = 0 then
            v_suma := v_suma + to_number(substr(v_cedula, i, 1));
        else
            v_suma := v_suma + to_number(substr(v_cedula, i, 1)) * 2;
        end if;
    end loop;
    if v_suma > 0 then
        v_decena_superior := (trunc(v_suma / 10) + 1) * 10;
    end if;
    v_resultado := v_decena_superior - v_suma;
    if v_resultado = v_ultimo_digito then
        return true;
    else
        return false;
    end if;
end;

-- llamado de la funcion
declare
    v_cedula integer := 0604250381;
    v_resultado boolean;
begin
    v_resultado := validar_cedula_ecuatoriana(v_cedula);
    if v_resultado then
        dbms_output.put_line('La cedula es valida');
    else
        dbms_output.put_line('La cedula no es valida');
    end if;
end;
