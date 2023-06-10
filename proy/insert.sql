-- 2 inserts de cada tabla
insert into congreso values ('CON-1', 'Congreso 1', 'Nacional', to_date('01/01/2023', 'dd/mm/yyyy'), to_date('02/01/2023', 'dd/mm/yyyy'), 'Madrid', 'España', 'Editorial 1');
insert into congreso values ('CON-2', 'Congreso 2', 'Internacional', to_date('03/01/2023', 'dd/mm/yyyy'), to_date('04/01/2023', 'dd/mm/yyyy'), 'Valencia', 'España', 'Editorial 2');

insert into supervisor values ('SUP-1');
insert into supervisor values ('SUP-2');

insert into investigacion values ('INV-1', 'SUP-1', 'Investigacion 1', 'INV1', 'Descripcion 1', 'Financiador 1', 1000, to_date('01/01/2023', 'dd/mm/yyyy'), to_date('02/01/2023', 'dd/mm/yyyy'));
insert into investigacion values ('INV-2', 'SUP-2', 'Investigacion 2', 'INV2', 'Descripcion 2', 'Financiador 2', 2000, to_date('03/01/2023', 'dd/mm/yyyy'), to_date('04/01/2023', 'dd/mm/yyyy'));

insert into revista values ('REV-1', 'Revista 1', 'Editorial 1', 1, 1, 1, 1);
insert into revista values ('REV-2', 'Revista 2', 'Editorial 2', 2, 2, 2, 2);

insert into publicacion values (1, 'CON-1', 'REV-1', 'INV-1', 'Titulo 1');
insert into publicacion values (2, 'CON-2', 'REV-2', 'INV-2', 'Titulo 2');

insert into linea_investigacion values ('LNINV-1', 1, 'Linea 1', 'Descriptores 1');
insert into linea_investigacion values ('LNINV-2', 2, 'Linea 2', 'Descriptores 2');

insert into profesor values ('PRF-1', 'Ivan', 'Moyota', 1, '123456789', 'Matematicas');
insert into profesor values ('PRF-2', 'Patricio', 'Santillan', 2, '987654321', 'Ciencias Sociales');
insert into profesor values ('PRF-3', 'Xavier', 'Chavez', 3, '123456789', 'Quimica');

insert into profesor_investigacion values ('PRF-1', 'INV-1', to_date('01/01/2023', 'dd/mm/yyyy'), to_date('02/01/2023', 'dd/mm/yyyy'), 1);
insert into profesor_investigacion values ('PRF-2', 'INV-2', to_date('03/01/2023', 'dd/mm/yyyy'), to_date('04/01/2023', 'dd/mm/yyyy'), 0);
