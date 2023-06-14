-- prueba tipo_congreso
-- no pasa
insert into congreso values ('CONG_006', 'Congreso 6', 'Social', to_date('01/01/2020', 'dd/mm/yyyy'), to_date('01/01/2021', 'dd/mm/yyyy'), 'Santiago', 'Chile', 'Editorial 6');
-- pasa
insert into congreso values ('CONG_006', 'Congreso 6', 'Internacional', to_date('01/01/2020', 'dd/mm/yyyy'), to_date('01/01/2021', 'dd/mm/yyyy'), 'Santiago', 'Chile', 'Editorial 6');

-- prueba paginas_revista y pagina_inicio_revista
-- no pasa
update revista set REV_PAG_INICIO = 10, REV_PAG_FIN = 1 where REV_ID = 'REVI_001';
-- pasa
update revista set REV_PAG_INICIO = 1, REV_PAG_FIN = 6 where REV_ID = 'REVI_001';

-- prueba titulacion_doctor
select * from profesor;
-- no pasa
insert into profesor values ('PROF_006', 'Luis', 'Gonzales', 6, '123456', 'Ingeniero');
-- pasa
insert into profesor values ('PROF_006', 'Luis', 'Gonzales', 6, '123456', 'Doctor');

-- prueba lider_investigacion
-- no pasa
insert into profesor_investigacion values ('PROF_002', 'INVE_001', to_date('01/01/2015', 'dd/mm/yyyy'), to_date('01/01/2016', 'dd/mm/yyyy'), 1);
-- pasa
insert into profesor_investigacion values ('PROF_003', 'INVE_001', to_date('01/01/2015', 'dd/mm/yyyy'), to_date('01/01/2016', 'dd/mm/yyyy'), 0);

-- prueba fecha_investigacion
-- no pasa
insert into investigacion values ('INVE_006', 'Investigacion 6', 'INV_6', 'Descripcion 6', 'Financiador 6', 6000, to_date('01/01/2020', 'dd/mm/yyyy'), to_date('01/01/2019', 'dd/mm/yyyy'));
-- pasa
insert into investigacion values ('INVE_007', 'Investigacion 7', 'INV_7', 'Descripcion 7', 'Financiador 7', 7000, to_date('01/01/2018', 'dd/mm/yyyy'), to_date('01/01/2019', 'dd/mm/yyyy'));

-- prueba lider_doctor
-- no pasa
insert into profesor_investigacion values ('PROF_005', 'INVE_002', to_date('01/01/2016', 'dd/mm/yyyy'), to_date('01/01/2017', 'dd/mm/yyyy'), 1);
-- pasa
update profesor_investigacion set PRFINV_ES_LIDER = 1 where PRF_ID = 'PROF_002';

-- prueba fecha_profesor_investigacion
-- no pasa
insert into profesor_investigacion values ('PROF_002', 'INVE_005', to_date('01/01/2020', 'dd/mm/yyyy'), to_date('01/01/2019', 'dd/mm/yyyy'), 0);
-- pasa
insert into profesor_investigacion values ('PROF_002', 'INVE_005', to_date('01/01/2019', 'dd/mm/yyyy'), to_date('01/01/2020', 'dd/mm/yyyy'), 0);
