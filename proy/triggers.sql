-- trigger que unicamente permita que el tipo de congreso sea nacional o internacional
create or replace trigger tipo_congreso
before insert or update on congreso
for each row
begin
    if :new.CON_TIPO not in ('Nacional', 'Internacional') then
        raise_application_error(-20000, 'El tipo de congreso debe ser nacional o internacional');
    end if;
end;
/

-- trigger que evite que se colisionen las paginas de inicio y fin de una revista
create or replace trigger paginas_revista
before insert or update on revista
for each row
begin
    if :new.REV_PAG_INICIO >= :new.REV_PAG_FIN then
        raise_application_error(-20000, 'La pagina de inicio debe ser menor que la pagina de fin');
    end if;
end;
/
