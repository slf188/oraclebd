insert into congreso values ('CONG_001', 'Congreso 1', 'Nacional', to_date('01/01/2015', 'dd/mm/yyyy'), to_date('01/01/2016', 'dd/mm/yyyy'), 'Bogota', 'Colombia', 'Editorial 1');
insert into congreso values ('CONG_002', 'Congreso 2', 'Internacional', to_date('01/01/2016', 'dd/mm/yyyy'), to_date('01/01/2017', 'dd/mm/yyyy'), 'Valencia', 'España', 'Editorial 2');
insert into congreso values ('CONG_003', 'Congreso 3', 'Nacional', to_date('01/01/2017', 'dd/mm/yyyy'), to_date('01/01/2018', 'dd/mm/yyyy'), 'Quito', 'Ecuador', 'Editorial 3');
insert into congreso values ('CONG_004', 'Congreso 4', 'Internacional', to_date('01/01/2018', 'dd/mm/yyyy'), to_date('01/01/2019', 'dd/mm/yyyy'), 'Lima', 'Peru', 'Editorial 4');
insert into congreso values ('CONG_005', 'Congreso 5', 'Nacional', to_date('01/01/2019', 'dd/mm/yyyy'), to_date('01/01/2020', 'dd/mm/yyyy'), 'Buenos Aires', 'Argentina', 'Editorial 5');

insert into investigacion values ('INVE_001', 'Investigacion 1', 'INV_1', 'Descripcion 1', 'Financiador 1', 1000, to_date('01/01/2015', 'dd/mm/yyyy'), to_date('01/01/2016', 'dd/mm/yyyy'));
insert into investigacion values ('INVE_002', 'Investigacion 2', 'INV_2', 'Descripcion 2', 'Financiador 2', 2000, to_date('01/01/2016', 'dd/mm/yyyy'), to_date('01/01/2017', 'dd/mm/yyyy'));
insert into investigacion values ('INVE_003', 'Investigacion 3', 'INV_3', 'Descripcion 3', 'Financiador 3', 3000, to_date('01/01/2017', 'dd/mm/yyyy'), to_date('01/01/2018', 'dd/mm/yyyy'));
insert into investigacion values ('INVE_004', 'Investigacion 4', 'INV_4', 'Descripcion 4', 'Financiador 4', 4000, to_date('01/01/2018', 'dd/mm/yyyy'), to_date('01/01/2019', 'dd/mm/yyyy'));
insert into investigacion values ('INVE_005', 'Investigacion 5', 'INV_5', 'Descripcion 5', 'Financiador 5', 5000, to_date('01/01/2019', 'dd/mm/yyyy'), to_date('01/01/2020', 'dd/mm/yyyy'));

insert into revista values ('REVI_001', 'Revista 1', 'Editorial 1', 1, 1, 1, 10);
insert into revista values ('REVI_002', 'Revista 2', 'Editorial 2', 2, 2, 1, 20);
insert into revista values ('REVI_003', 'Revista 3', 'Editorial 3', 3, 3, 1, 30);
insert into revista values ('REVI_004', 'Revista 4', 'Editorial 4', 4, 4, 1, 40);
insert into revista values ('REVI_005', 'Revista 5', 'Editorial 5', 5, 5, 1, 50);

insert into publicacion values (1, 'INVE_001', 'REVI_001', null, 'Titulo 1');
insert into publicacion values (2, 'INVE_002', 'REVI_002', null, 'Titulo 2');
insert into publicacion values (3, 'INVE_003', 'REVI_003', null, 'Titulo 3');
insert into publicacion values (4, 'INVE_004', null, 'CONG_001', 'Titulo 4');
insert into publicacion values (5, 'INVE_005', null, 'CONG_002', 'Titulo 5');

insert into linea_investigacion values ('LINI_001', 1, 'Linea 1', 'Descripctores 1');
insert into linea_investigacion values ('LINI_002', 2, 'Linea 2', 'Descripctores 2');
insert into linea_investigacion values ('LINI_003', 3, 'Linea 3', 'Descripctores 3');
insert into linea_investigacion values ('LINI_004', 4, 'Linea 4', 'Descripctores 4');
insert into linea_investigacion values ('LINI_005', 5, 'Linea 5', 'Descripctores 5');

insert into profesor values ('PROF_001', 'Ivan', 'Moyota', 1, '1', 'Doctor');
insert into profesor values ('PROF_002', 'Juan', 'Perez', 2, '12', 'Doctor');
insert into profesor values ('PROF_003', 'Pedro', 'Gomez', 3, '123', 'No Doctor');
insert into profesor values ('PROF_004', 'Maria', 'Lopez', 4, '1234', 'Doctor');
insert into profesor values ('PROF_005', 'Luisa', 'Gonzales', 5, '12345', 'No Doctor');

insert into profesor_investigacion values ('PROF_001', 'INVE_001', to_date('01/01/2015', 'dd/mm/yyyy'), to_date('01/01/2016', 'dd/mm/yyyy', 1));
insert into profesor_investigacion values ('PROF_002', 'INVE_002', to_date('01/01/2016', 'dd/mm/yyyy'), to_date('01/01/2017', 'dd/mm/yyyy', 0));
insert into profesor_investigacion values ('PROF_003', 'INVE_003', to_date('01/01/2017', 'dd/mm/yyyy'), to_date('01/01/2018', 'dd/mm/yyyy', 0));
insert into profesor_investigacion values ('PROF_004', 'INVE_004', to_date('01/01/2018', 'dd/mm/yyyy'), to_date('01/01/2019', 'dd/mm/yyyy', 1));
insert into profesor_investigacion values ('PROF_005', 'INVE_005', to_date('01/01/2019', 'dd/mm/yyyy'), to_date('01/01/2020', 'dd/mm/yyyy', 0));
