-- tipo_congreso trigger
insert into congreso values ('CON-3', 'Congreso 3', 'Otro', to_date('01/01/2023', 'dd/mm/yyyy'), to_date('02/01/2023', 'dd/mm/yyyy'), 'Madrid', 'España', 'Editorial 1');

-- trigger paginas_revista
insert into revista values ('REV-3', 'Revista 4', 'Editorial 4', 4, 4, 8, 6);

-- trigger lider_investigacion
-- no pasa
insert into profesor_investigacion values ('PRF-3', 'INV-1', to_date('05/01/2023', 'dd/mm/yyyy'), to_date('06/01/2023', 'dd/mm/yyyy'), 1);
-- pasa
insert into profesor_investigacion values ('PRF-3', 'INV-1', to_date('05/01/2023', 'dd/mm/yyyy'), to_date('06/01/2023', 'dd/mm/yyyy'), 0);

