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

-- prueba fecha_fin_profesor_investigacion
-- no pasa
insert into profesor_investigacion values ('PROF_001', 'INVE_003', to_date('01/01/2017', 'dd/mm/yyyy'), to_date('01/01/2020', 'dd/mm/yyyy'), 0);
-- pasa
insert into profesor_investigacion values ('PROF_001', 'INVE_003', to_date('01/01/2017', 'dd/mm/yyyy'), to_date('01/01/2018', 'dd/mm/yyyy'), 0);

-- prueba fecha_inicio_profesor_investigacion
-- no pasa
insert into profesor_investigacion values ('PROF_001', 'INVE_002', to_date('01/01/2015', 'dd/mm/yyyy'), to_date('01/01/2016', 'dd/mm/yyyy'), 0);
-- pasa
insert into profesor_investigacion values ('PROF_001', 'INVE_002', to_date('01/01/2016', 'dd/mm/yyyy'), to_date('01/01/2017', 'dd/mm/yyyy'), 0);

-- prueba pagina_inicio_fin_revista
-- no pasa
insert into revista values ('REVI_006', 'Revista 6', 'Editorial 6', 6, 6, 60, 60);
-- pasa
insert into revista values ('REVI_006', 'Revista 6', 'Editorial 6', 6, 6, 1, 61);

-- prueba participacion_profesor_investigacion
-- no pasa
insert into profesor_investigacion values ('PROF_001', 'INVE_001', to_date('01/01/2015', 'dd/mm/yyyy'), to_date('01/01/2016', 'dd/mm/yyyy'), 0);

-- prueba trg_validar_publicacion
-- no pasa
insert into publicacion values (6, 'INVE_006', 'REVI_006', 'CONG_003', 'Titulo 6');
-- pasa
insert into publicacion values (7, 'INVE_007', null, 'CONG_004', 'Titulo 7');

-- prueba trg_verificar_participacion_lider
-- no pasa
insert into profesor_investigacion values ('PROF_004', 'INVE_003', to_date('01/01/2017', 'dd/mm/yyyy'), to_date('03/01/2017', 'dd/mm/yyyy'), 1);
-- pasa
insert into profesor_investigacion values ('PROF_004', 'INVE_003', to_date('01/01/2017', 'dd/mm/yyyy'), to_date('01/01/2018', 'dd/mm/yyyy'), 1);

-- prueba prf_num_despacho y prf_telefono
-- no pasa
insert into profesor values ('PROF_006', 'Luis', 'Gonzales', 5, '123456', 'No Doctor');
insert into profesor values ('PROF_006', 'Luis', 'Gonzales', 6, '12345', 'No Doctor');
-- pasa
insert into profesor values ('PROF_006', 'Luis', 'Gonzales', 6, '123456', 'No Doctor');
