set SERVEROUTPUT on;

create or replace function validar_cedula_ecuatoriana(v_cedula varchar2)
return boolean
is
    v_suma number(2) := 0;
    v_resultado number(2) := 0;
begin
    for i in 1..9 loop
        v_suma := v_suma + to_number(substr(v_cedula, i, 1)) * (3 - mod(i, 2));
    end loop;
    v_resultado := mod(v_suma, 10);
    if v_resultado = 0 then
        return true;
    else
        return false;
    end if;
end;
/

-- llamado
declare
    v_cedula varchar2(10) := '0604250381';
    v_resultado boolean;
begin
    v_resultado := validar_cedula_ecuatoriana(v_cedula);
    if v_resultado then
        dbms_output.put_line('La cedula es valida');
    else
        dbms_output.put_line('La cedula no es valida');
    end if;
end;
/
