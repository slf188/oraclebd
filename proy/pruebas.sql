-- tipo_congreso trigger
-- no pasa
insert into congreso values ('CON-3', 'Congreso 3', 'Otro', to_date('01/01/2023', 'dd/mm/yyyy'), to_date('02/01/2023', 'dd/mm/yyyy'), 'Madrid', 'España', 'Editorial 3');
-- pasa
insert into congreso values ('CON-3', 'Congreso 3', 'nacional', to_date('01/01/2023', 'dd/mm/yyyy'), to_date('02/01/2023', 'dd/mm/yyyy'), 'Barcelona', 'España', 'Editorial 3');

-- trigger paginas_revista
-- no pasa
insert into revista values ('REV-3', 'Revista 4', 'Editorial 4', 4, 4, 8, 6);
-- pasa
insert into revista values ('REV-3', 'Revista 4', 'Editorial 4', 4, 4, 8, 16);

-- trigger lider_investigacion
-- no pasa
insert into profesor_investigacion values ('PRF-3', 'INV-1', to_date('05/01/2023', 'dd/mm/yyyy'), to_date('06/01/2023', 'dd/mm/yyyy'), 1);
-- pasa
insert into profesor_investigacion values ('PRF-3', 'INV-1', to_date('05/01/2023', 'dd/mm/yyyy'), to_date('06/01/2023', 'dd/mm/yyyy'), 0);

-- titulacion_doctor
-- no pasa
insert into profesor values ('PRF-4', 'Damian', 'Nicolalde', 4, '123456789', 'Otro');
-- pasa
insert into profesor values ('PRF-4', 'Damian', 'Nicolalde', 4, '123456789', 'Doctor');
insert into profesor values ('PRF-5', 'Henry', 'Roa', 5, '123456789', 'no doctor');

-- lider_doctor
-- no pasa
insert into profesor_investigacion values ('PRF-4', 'INV-1', to_date('05/01/2023', 'dd/mm/yyyy'), to_date('06/01/2023', 'dd/mm/yyyy'), 1);
-- pasa
insert into profesor_investigacion values ('PRF-4', 'INV-2', to_date('05/01/2023', 'dd/mm/yyyy'), to_date('06/01/2023', 'dd/mm/yyyy'), 0);
