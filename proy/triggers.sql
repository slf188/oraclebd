-- trigger que unicamente permita que el tipo de congreso sea nacional o internacional
create or replace trigger tipo_congreso
before insert or update on congreso
for each row
begin
    if :new.CON_TIPO not in ('Nacional', 'Internacional', 'nacional', 'internacional') then
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

-- trigger que unicamente que PRF_TITULACION en profesor solo permita Doctor o No Doctor
create or replace trigger titulacion_doctor
before insert or update on profesor
for each row
begin
    if :new.PRF_TITULACION not in ('Doctor', 'No Doctor', 'doctor', 'no doctor') then
        raise_application_error(-20000, 'La titulacion del profesor debe ser Doctor o No Doctor');
    end if;
end;
/

-- trigger que no permita ingresar profesor si ya existe un lider en la investigacion
create or replace trigger lider_investigacion
before insert on profesor_investigacion
for each row
declare
    lider number;
begin
      select count(*) into lider from profesor_investigacion where inv_id = :new.inv_id and prfinv_es_lider = 1;
      if lider > 0 and :new.prfinv_es_lider = 1 then
         raise_application_error(-20000, 'Ya existe un lider en la investigacion');
      end if;
end;
/

-- investigacion tiene dos atributos fecha de inicio y fecha de fin, se debe validar que la fecha de inicio sea menor que la fecha de fin
create or replace trigger fecha_investigacion
before insert or update on investigacion
for each row
begin
    if :new.INV_FECHA_INICIO >= :new.INV_FECHA_FIN then
        raise_application_error(-20000, 'La fecha de inicio debe ser menor que la fecha de fin');
    end if;
end;
/

-- trigger que unicamente permita que prvfinv_es_lider en profesor_investigacion sea 1 cuando el profesor sea doctor en prf_titulacion
create or replace trigger lider_doctor
before insert or update on profesor_investigacion
for each row
declare
    v_titulacion profesor.PRF_TITULACION%type;
begin
   if :new.PRFINV_ES_LIDER = 1 then
        select PRF_TITULACION into v_titulacion from profesor where PRF_ID = :new.PRF_ID;
        if v_titulacion != 'Doctor' then
            raise_application_error(-20000, 'El profesor debe ser doctor para ser lider');
        end if;
   end if;
end;
/

-- trigger que automaticamente genere un nuevo supervisor cuando se inserte un nuevo registro en profesor_investigacion cuando prfinv_es_lider sea 1
create or replace trigger supervisor_investigacion
after insert on profesor_investigacion
for each row
-- el sup_id sera el mismo que prf_id
begin
    if :new.prfinv_es_lider = 1 then
        insert into supervisor values (:new.prf_id);
    end if;
end;
/

-- trigger que verifique que la fecha de inicio sea siempre menor a la fecha de fin en la tabla profesor_investigacion
create or replace trigger fecha_profesor_investigacion
before insert or update on profesor_investigacion
for each row
begin
    if :new.prfinv_fecha_inicio >= :new.prfinv_fecha_fin then
        raise_application_error(-20000, 'La fecha de inicio debe ser menor que la fecha de fin');
    end if;
end;
/

-- ideas para triggers
-- trigger que verifique que no se repita el num de despacho del profesor
-- trigger que verifique que no se repita el telefono del profesor
-- solo ideas esta super complicado hacer ambos de arriba :(
