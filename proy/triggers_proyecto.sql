
--
CREATE OR REPLACE TRIGGER TRG_VERIFICAR_LIDER
BEFORE INSERT OR UPDATE ON PROFESOR_INVESTIGACION
FOR EACH ROW
DECLARE
   v_ban NUMBER;
BEGIN
   --Primero se verifica que no haya un lider en la misma investigación
   IF :NEW.PRFINV_ES_LIDER = 1 THEN
      SELECT COUNT(*) INTO v_ban
      FROM PROFESOR_INVESTIGACION
      WHERE INV_ID = :NEW.INV_ID AND PRFINV_ES_LIDER = 1;

      IF v_ban > 0 THEN
         RAISE_APPLICATION_ERROR(-20001, 'Ya existe un líder para este proyecto de investigación');
      END IF;

      -- Después se verifica que el líder sea un profesor doctor
      SELECT COUNT(*) INTO v_ban
      FROM PROFESOR
      WHERE PRF_ID = :NEW.PRF_ID AND UPPER(PRF_TITULACION) = 'DOCTOR';

      IF v_ban = 0 THEN
         RAISE_APPLICATION_ERROR(-20002, 'El líder debe de ser un profesor doctor');
      END IF;
   END IF;
END;
/

drop trigger  TRG_VERIFICAR_PARTICIPACION_LIDER;

--TRIGGER QUE VALIDA QUE LA PARTICIPACION DEL LIDER SEA LA MISMA DEL PROYECTO DE INVESTIGACION
CREATE OR REPLACE TRIGGER TRG_VERIFICAR_PARTICIPACION_LIDER
BEFORE INSERT OR UPDATE ON PROFESOR_INVESTIGACION
FOR EACH ROW
DECLARE
   v_fecha_inicio INVESTIGACION.INV_FECHA_INICIO%TYPE;
   v_fecha_fin INVESTIGACION.INV_FECHA_FIN%TYPE;
BEGIN
   -- Obtener las fechas de la investigación correspondiente
   SELECT INV_FECHA_INICIO, INV_FECHA_FIN INTO v_fecha_inicio, v_fecha_fin
   FROM INVESTIGACION
   WHERE INV_ID = :NEW.INV_ID;

   -- Verificar que el líder tenga las mismas fechas que la investigación
   IF :NEW.PRFINV_ES_LIDER = 1 AND (:NEW.PRFINV_FECHA_INICIO <> v_fecha_inicio OR :NEW.PRFINV_FECHA_FIN <> v_fecha_fin) THEN
      RAISE_APPLICATION_ERROR(-20003, 'Las fechas del líder de investigación deben coincidir con las fechas de la investigación');
   END IF;
END;
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



-- trigger que verifique que no se pueda insertar un profesor con un prf_num_despacho que ya exista
create or replace trigger prf_num_despacho
before insert or update on profesor
for each row
declare
    v_count number;
begin
    select count(*) into v_count
    from profesor
    where prf_num_despacho = :new.prf_num_despacho;

    if v_count > 0 then
        raise_application_error(-20001, 'Ya existe un profesor con ese numero de despacho');
    end if;
end;
/

-- trigger que verifique que no se pueda insertar un profesor con prf_telefono que ya exista
create or replace trigger prf_telefono
before insert or update on profesor
for each row
declare
    v_count number;
begin
    select count(*) into v_count
    from profesor
    where prf_telefono = :new.prf_telefono;

    if v_count > 0 then
        raise_application_error(-20001, 'Ya existe un profesor con ese numero de telefono');
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





