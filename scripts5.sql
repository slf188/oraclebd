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

/*
crear un disparador al momento de crear un nuevo registro y que actualize el AUX_CODIGO y el AUX_PRECIO
el aux_codigo se estrctura a_b_c_dd_ee
a corresponde a aux_tipo que puede ser 1 al 3
b corresponde a aux_modelo que puede ser 1 al 5
c corresponde a aux_color que puede ser 1 al 4, 1 = blanco, 2 = azul, 3 = negro, 4 = rojo
dd corresponde a aux_talla que puede ser del 3 al 45
ee corresponde a aux_precio
aux_precio se calcula asi
el precio de un zapato es 20 dolares
si es color negro se suma 5%
si es color blanco se suma 10%
si es color azul se suma 20%
si es color rojo se suma 30%
ademas se suma la talla
si aux_talla es 3 al 15 se suma 5%
si aux_talla es 16 al 30 se suma 10%
si aux_talla es de 31 al 40 se suma 15%
aux_talla mayores a 40 se suma 20%
*/
-- el trigger se llama DISPARADORAUX
create or replace trigger DISPARADORAUX
before insert on PRODUCTOAUX
for each row
begin
    if 
