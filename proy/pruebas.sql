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
insert into profesor_investigacion values ('PRF-5', 'INV-1', to_date('05/01/2023', 'dd/mm/yyyy'), to_date('06/01/2023', 'dd/mm/yyyy'), 1);
-- pasa
insert into profesor_investigacion values ('PRF-5', 'INV-2', to_date('05/01/2023', 'dd/mm/yyyy'), to_date('06/01/2023', 'dd/mm/yyyy'), 0);

-- prueba fecha_investigacion
-- no pasa
insert into investigacion values ('INV-3', 'SUP-3' , 'Investigacion 3', 'INV3', 'Descripcion 3', 'Financiador 3', 3000, to_date('03/01/2023', 'dd/mm/yyyy'), to_date('02/01/2023', 'dd/mm/yyyy'));
-- pasa
insert into investigacion values ('INV-3', 'SUP-3', 'Investigacion 3', 'INV3', 'Descripcion 3', 'Financiador 3', 3000, to_date('01/01/2023', 'dd/mm/yyyy'), to_date('03/01/2023', 'dd/mm/yyyy'));

-- prueba fecha_profesor_investigacion
-- no pasa
insert into profesor_investigacion values ('PRF-4', 'INV-1', to_date('05/01/2025', 'dd/mm/yyyy'), to_date('04/01/2023', 'dd/mm/yyyy'), 0);
-- pasa
insert into profesor_investigacion values ('PRF-4', 'INV-1', to_date('05/01/2023', 'dd/mm/yyyy'), to_date('06/01/2028', 'dd/mm/yyyy'), 0);

-- prueba fecha_fin_profesor_investigacion
insert into investigacion values ('INV-4', 'SUP-2', 'Investigacion 4', 'INV3', 'Descripcion 4', 'Financiador 4', 4000, to_date('01/01/2023', 'dd/mm/yyyy'), to_date('01/01/2024', 'dd/mm/yyyy'));
-- no pasa
-- trigger que ayude verificar que la fecha de inicio de la investigacion sea menor a la fecha de inicio pasada en profesor_investigacion
insert into profesor_investigacion values ('PRF-4', 'INV-4', to_date('05/01/2023', 'dd/mm/yyyy'), to_date('06/01/2024', 'dd/mm/yyyy'), 0);
-- pasa
insert into profesor_investigacion values ('PRF-4', 'INV-4', to_date('05/01/2023', 'dd/mm/yyyy'), to_date('06/01/2023', 'dd/mm/yyyy'), 0);

-- prueba fecha_inicio_profesor_investigacion
insert into investigacion values ('INV-4', 'SUP-2', 'Investigacion 4', 'INV3', 'Descripcion 4', 'Financiador 4', 4000, to_date('01/01/2023', 'dd/mm/yyyy'), to_date('01/01/2024', 'dd/mm/yyyy'));
-- no pasa
insert into profesor_investigacion values ('PRF-4', 'INV-4', to_date('05/01/2021', 'dd/mm/yyyy'), to_date('06/01/2023', 'dd/mm/yyyy'), 0);
-- pasa
insert into profesor_investigacion values ('PRF-4', 'INV-4', to_date('05/01/2023', 'dd/mm/yyyy'), to_date('06/01/2023', 'dd/mm/yyyy'), 0);

-- prueba trigger participacion_profesor_investigacion
insert into profesor values ('PRF-4', 'Damian', 'Nicolalde', 4, '123', 'Doctor');
insert into investigacion values ('INV-3', 'Investigacion 3', 'INV3', 'Descripcion 3', 'Financiador 3', 3000, to_date('03/01/2023', 'dd/mm/yyyy'), to_date('03/01/2024', 'dd/mm/yyyy'));

-- primera participacion
insert into profesor_investigacion values ('PRF-1', 'INV-3', to_date('03/01/2023', 'dd/mm/yyyy'), to_date('01/04/2023', 'dd/mm/yyyy'), 0);
-- segunda participacio
insert into profesor_investigacion values ('PRF-1', 'INV-3', to_date('01/07/2023', 'dd/mm/yyyy'), to_date('01/09/2023', 'dd/mm/yyyy'), 0);
insert into profesor_investigacion values ('PRF-1', 'INV-3', to_date('01/07/2023', 'dd/mm/yyyy'), to_date('01/09/2023', 'dd/mm/yyyy'), 0);
insert into profesor_investigacion values ('PRF-1', 'INV-3', to_date('02/07/2023', 'dd/mm/yyyy'), to_date('03/07/2023', 'dd/mm/yyyy'), 0);
-- ultima y tercera
insert into profesor_investigacion values ('PRF-1', 'INV-3', to_date('01/12/2023', 'dd/mm/yyyy'), to_date('01/01/2024', 'dd/mm/yyyy'), 0);
