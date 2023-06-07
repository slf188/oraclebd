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
