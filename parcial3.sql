create table PRODUCTOAUX (
    AUX_CODIGO  varchar2(11),
    AUX_TIPO    varchar2(1),
    AUX_MODELO  varchar2(1),
    AUX_COLOR   varchar2(1),
    AUX_TALLA   varchar2(2),
    AUX_PRECIO  decimal(12, 4)
)
    tablespace DATOS
/

desc PRODUCTOAUX;

-- disparador al momento de crear un nuevo registro y que actualize el AUX_CODIGO y el AUX_PRECIO
-- aux_codigo se estrctura a_b_c_dd_ee
create or replace trigger TRG_PRODUCTOAUX
before insert on PRODUCTOAUX
for each row
-- a = aux_tipo del 1 al 3
-- b = aux_modelo del 1 al 5
-- c = aux_color del 1 al 4
-- dd = aux_talla del 3 al 45
-- ee = aux_precio
-- usar los valores insertados para actualizar aux_codigo y aux_precio
begin
-- restringir a, b, c, dd, ee si los valores no estan dentro del rango
    if :new.AUX_TIPO not between 1 and 3 then
        raise_application_error(-20001, 'El valor de AUX_TIPO no esta dentro del rango');
    end if;
    if :new.AUX_MODELO not between 1 and 5 then
        raise_application_error(-20002, 'El valor de AUX_MODELO no esta dentro del rango');
    end if;
    if :new.AUX_COLOR not between 1 and 4 then
        raise_application_error(-20003, 'El valor de AUX_COLOR no esta dentro del rango');
    end if;
    if :new.AUX_TALLA not between 3 and 45 then
        raise_application_error(-20004, 'El valor de AUX_TALLA no esta dentro del rango');
    end if;

    -- actializar aux_precio
    -- precio de zapato es 20
    -- si aux_color = 3 se suma 5%
    -- si aux_color = 1 se suma 10%
    -- si aux_color = 2 se suma 20%
    -- si aux_color = 4 se suma 30%
    if :new.AUX_COLOR = 3 then
        :new.AUX_PRECIO := :new.AUX_PRECIO + (:new.AUX_PRECIO * 0.05);
    elsif :new.AUX_COLOR = 1 then
        :new.AUX_PRECIO := :new.AUX_PRECIO + (:new.AUX_PRECIO * 0.1);
    elsif :new.AUX_COLOR = 2 then
        :new.AUX_PRECIO := :new.AUX_PRECIO + (:new.AUX_PRECIO * 0.2);
    elsif :new.AUX_COLOR = 4 then
        :new.AUX_PRECIO := :new.AUX_PRECIO + (:new.AUX_PRECIO * 0.3);
    end if;
    -- si aux_talla 3 a 15 se suma 5%
    -- si aux_talla 16 a 30 se suma 10%
    -- si aux_talla 31 a 40 se suma 15%
    -- si aux_talla > 40 se suma 20%
    if :new.AUX_TALLA between 3 and 15 then
        :new.AUX_PRECIO := :new.AUX_PRECIO + (:new.AUX_PRECIO * 0.05);
    elsif :new.AUX_TALLA between 16 and 30 then
        :new.AUX_PRECIO := :new.AUX_PRECIO + (:new.AUX_PRECIO * 0.1);
    elsif :new.AUX_TALLA between 31 and 40 then
        :new.AUX_PRECIO := :new.AUX_PRECIO + (:new.AUX_PRECIO * 0.15);
    elsif :new.AUX_TALLA > 40 then
        :new.AUX_PRECIO := :new.AUX_PRECIO + (:new.AUX_PRECIO * 0.2);
    end if;

    -- actualizar aux_codigo
    :new.AUX_CODIGO := :new.AUX_TIPO || '_' || :new.AUX_MODELO || '_' || :new.AUX_COLOR || '_' || :new.AUX_TALLA || '_' || :new.AUX_PRECIO;
end TRG_PRODUCTOAUX;
/

insert into PRODUCTOAUX values ('3', '1', '2', '3', '19', 20.0);
