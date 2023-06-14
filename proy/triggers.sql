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

-- trigger que unicamente permita que prvfinv_es_lider en profesor_investigacion sea 1 cuando el profesor sea doctor en prf_titulacion, minuscula o mayuscula
create or replace trigger lider_doctor
before insert or update on profesor_investigacion
for each row
declare
    v_titulacion profesor.PRF_TITULACION%type;
begin
    if :new.PRFINV_ES_LIDER = 1 then
        select PRF_TITULACION into v_titulacion from profesor where PRF_ID = :new.PRF_ID;
        if upper(v_titulacion) != 'DOCTOR' then
            raise_application_error(-20000, 'El profesor debe ser doctor para ser lider');
        end if;
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

-- trigger que verifique que la fecha de fin de profesor_investigacion no sea mayor a la de fin en investigacion que se pasa en el segundo parametro
create or replace trigger fecha_fin_profesor_investigacion
before insert or update on profesor_investigacion
for each row
declare
    fecha_fin_investigacion date;
begin
    select inv_fecha_fin into fecha_fin_investigacion from investigacion where inv_id = :new.inv_id;
    if :new.prfinv_fecha_fin > fecha_fin_investigacion then
      raise_application_error(-20000, 'La fecha de fin de la investigacion que participa el profesor no puede ser mayor a la fecha de fin de la investigacion');
    end if;
end;
/

-- trigger que ayude verificar que la fecha de inicio de la investigacion sea menor a la fecha de inicio pasada en profesor_investigacion
create or replace trigger fecha_inicio_profesor_investigacion
before insert or update on profesor_investigacion
for each row
declare
    fecha_inicio_investigacion date;
begin
   select inv_fecha_inicio into fecha_inicio_investigacion from investigacion where inv_id = :new.inv_id;
   if :new.prfinv_fecha_inicio < fecha_inicio_investigacion then
      raise_application_error(-20000, 'La fecha de inicio de la investigacion que participa el profesor no puede ser menor a la fecha de inicio de la investigacion');
   end if;
end;
/

-- trigger que haga la pagina de inicio siempre sea 1, rev_pag_inicio en la tabla revista, enviar un mensaje de error si no es 1
create or replace trigger pagina_inicio_revista
before insert or update on revista
for each row
begin
   if :new.rev_pag_inicio != 1 then
      raise_application_error(-20000, 'La pagina de inicio debe ser 1');
   end if;
end;
/

-- trigger para que la pagina de inicio y fin no sean igual en revista, rev_pagino_inicio, rev_pagina_fin
create or replace trigger pagina_inicio_fin_revista
before insert or update on revista
for each row
begin
   if :new.rev_pag_inicio = :new.rev_pag_fin then
      raise_application_error(-20000, 'La pagina de inicio y fin no pueden ser iguales');
   end if;
end;
/

-- hacer un trigger que no permita que vuelva a participar en las fechas que ya participo un profesor
create or replace trigger participacion_profesor_investigacion
before insert or update on profesor_investigacion
for each row
declare
    v_count number;
begin
    select count(*) into v_count
    from profesor_investigacion
    where prf_id = :new.prf_id
    and inv_id = :new.inv_id
    and prfinv_fecha_inicio = :new.prfinv_fecha_inicio
    and prfinv_fecha_fin = :new.prfinv_fecha_fin;

    if v_count > 0 then
        raise_application_error(-20001, 'Ya participo en esas fechas');
    end if;

    select count(*) into v_count
    from profesor_investigacion
    where prf_id = :new.prf_id
    and inv_id = :new.inv_id
    and :new.prfinv_fecha_inicio between prfinv_fecha_inicio and prfinv_fecha_fin
    and :new.prfinv_fecha_fin between prfinv_fecha_inicio and prfinv_fecha_fin;

    if v_count > 0 then
        raise_application_error(-20001, 'Ya participo en esas fechas');
    end if;
end;
/

--trigger que valida que una publicacion sea de uno de los 2 tipos y los 2 no nulos
CREATE OR REPLACE TRIGGER trg_validar_publicacion
BEFORE INSERT OR UPDATE ON PUBLICACION
FOR EACH ROW
DECLARE
    v_congreso_id VARCHAR2(8);
    v_revista_id VARCHAR2(8);
BEGIN
    v_congreso_id := :NEW.CON_ID;
    v_revista_id := :NEW.REV_ID;

    IF (v_congreso_id IS NOT NULL AND v_revista_id IS NOT NULL) OR (v_congreso_id IS NULL AND v_revista_id IS NULL) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Una publicación debe ser asociada a un congreso o a una revista, pero no a ambos o ninguno.');
    END IF;
END;
/


-- ideas para triggers
-- trigger que verifique que no se repita el num de despacho del profesor
-- trigger que verifique que no se repita el telefono del profesor
-- solo ideas esta super complicado hacer ambos de arriba :(
