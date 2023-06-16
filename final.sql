create table HOTEL (
    cod_hotel   varchar2(6) primary key,
    descripcion varchar2(50),
    direccion varchar2(50),
    sector  varchar2(30)
)

create table HABITACION (
    cod_habitacion  varchar2(6) primary key,
    cod_hotel   varchar2(6) references HOTEL(cod_hotel),
    soleada varchar2(1),
    capacidad   integer,
    val_renta   decimal(12,2)
)


create table MUEBLE (
    cod_mueble  varchar2(10) primary key,
    cod_habitacion  varchar2(6) references HABITACION(cod_habitacion),
    descripcion varchar2(40),
    caracteristica  varchar2(30),
    precio  decimal(12, 2)
)

desc hotel;
desc habitacion;
desc mueble;

select * from hotel;
select * from habitacion;
select * from mueble;

-- insertar un hotel
insert into HOTEL values('Hotel1', 'Hotel 1', 'Direccion 1', 'SUR');

-- insertar 3 habitaciones
insert into HABITACION values('H1', 'Hotel1', 'S', 2, 60);
insert into HABITACION values('H2', 'Hotel1', 'N', 3, 70);
insert into HABITACION values('H3', 'Hotel1', 'S', 4, 80);

-- insertar 3 muebles, por cada habitacion
insert into MUEBLE values('M1', 'H1', 'SILLA', 'CUERO', 50);
-- esta se desplega en 3
insert into MUEBLE values('M2', 'H1', 'ESCRITORIO', 'CUERO', 70);
insert into MUEBLE values('M3', 'H1', 'SILLA', 'MADERA', 80);

insert into MUEBLE values('M4', 'H2', 'MESA', 'CUERO', 30);
insert into MUEBLE values('M5', 'H2', 'ESCRITORIO', 'CUERO', 40);
insert into MUEBLE values('M6', 'H2', 'CAMAS', 'MADERA', 50);

insert into MUEBLE values('M7', 'H3', 'ESCRITORIO', 'CUERO', 100);
insert into MUEBLE values('M8', 'H3', 'COMODA', 'CUERO', 110);
insert into MUEBLE values('M9', 'H3', 'SILLA', 'MADERA', 120);

-- 2
select cod_mueble, descripcion, caracteristica, precio
from MUEBLE
where caracteristica = 'CUERO'
and precio between 50 and 80
and cod_habitacion in (
    select cod_habitacion
    from HABITACION
    where cod_hotel in (
        select cod_hotel
        from HOTEL
        where sector = 'SUR'
    )
);

-- 3
select ht.cod_hotel, h.cod_habitacion, h.soleada, h.capacidad
from HOTEL ht, HABITACION h
where ht.cod_hotel = h.cod_hotel
and h.cod_habitacion in (
    select cod_habitacion
    from MUEBLE
    where descripcion = 'ESCRITORIO'
)
and h.capacidad = 2;

-- 4
create view v_muebles as
select ht.cod_hotel, h.cod_habitacion, m.cod_mueble, m.precio
from HOTEL ht, HABITACION h, MUEBLE m
where ht.cod_hotel = h.cod_hotel
and h.cod_habitacion = m.cod_habitacion;

-- ejecutar view
select * from v_muebles;

-- 5
create or replace trigger tr_mueble
before insert on MUEBLE
for each row
declare
    v_precio number(12, 2);
begin
    select precio into v_precio from MUEBLE where cod_mueble = :new.cod_mueble;
    update HABITACION set val_renta = val_renta + (v_precio / 36) where cod_habitacion = :new.cod_habitacion;
end;
/

drop trigger tr_mueble;

-- probar trigger
insert into MUEBLE values('M0', 'H3', 'SILLA', 'MADERA', 100);
select * from HABITACION;
select * from mueble;


