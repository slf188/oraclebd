-- fac_num, fac_fecha, fac_total, cli_ci_ruc, cli_nombre, cli_direccion
desc cliente;
desc factura;

create view facXCli
as select f.FAC_TOTAL, f.CLI_CI_RUC, c.CLI_NOMBRE, c.CLI_DIRECCION
from factura f
inner join cliente c
on f.CLI_CI_RUC = c.CLI_CI_RUC;

select FAC_TOTAL, CLI_CI_RUC, CLI_NOMBRE, CLI_DIRECCION
from facXCLI;

-- scs_nom, fac_num, prod_cod, prod_descr
-- scs_nombre, fac_numero, prd_codigo, prd_descripcion
-- solo de la s_2
desc sucursal;
desc producto;
desc factura;
desc detalle_factura;
select * from sucursal;
-- sucursal tiene SCS_CODIGO, EMP_CODIGO, SCS_TELEFONO, SCS_NOMBRE
-- factura tiene FAC_NUMERO, CLI_CI_RUC, SCS_CODIGO, FAC_TOTAL
-- producto tiene PRD_CODIGO, TIPO_PRO_CODIGO, PRD_NOMBRE, PRD_DESCRIPCION, PRD_PRECIO, PRD_CATEGORIA
-- detalle_factura tiene PRD_CODIGO, FAC_NUMERO

-- los atributos que coinciden en 
-- sucursal y factura son SCS_CODIGO
-- producto y detalle_factura son PRD_CODIGO
-- factura y detalle_factura son FAC_NUMERO

select s.SCS_NOMBRE, f.FAC_NUMERO, p.PRD_CODIGO, p.PRD_DESCRIPCION
from detalle_factura df
inner join producto p 
on df.PRD_CODIGO = p.PRD_CODIGO
inner join factura f
on df.FAC_NUMERO = f.FAC_NUMERO
inner join sucursal s
on f.SCS_CODIGO = s.SCS_CODIGO
where s.SCS_CODIGO = 'S-2';

-- left-join
select s.SCS_NOMBRE, f.FAC_NUMERO, p.PRD_CODIGO, p.PRD_DESCRIPCION
from detalle_factura df
left join producto p
on df.PRD_CODIGO = p.PRD_CODIGO
left join factura f
on df.FAC_NUMERO = f.FAC_NUMERO
left join sucursal s
on f.SCS_CODIGO = s.SCS_CODIGO
where s.SCS_CODIGO = 'S-2';

-- right join
select s.SCS_NOMBRE, f.FAC_NUMERO, p.PRD_CODIGO, p.PRD_DESCRIPCION
from detalle_factura df
right join producto p
on df.PRD_CODIGO = p.PRD_CODIGO
right join factura f
on df.FAC_NUMERO = f.FAC_NUMERO
right join sucursal s
on f.SCS_CODIGO = s.SCS_CODIGO
where s.SCS_CODIGO = 'S-2';
-- full join
select s.SCS_NOMBRE, f.FAC_NUMERO, p.PRD_CODIGO, p.PRD_DESCRIPCION
from detalle_factura df
full join producto p
on df.PRD_CODIGO = p.PRD_CODIGO
full join factura f
on df.FAC_NUMERO = f.FAC_NUMERO
full join sucursal s
on f.SCS_CODIGO = s.SCS_CODIGO
where s.SCS_CODIGO = 'S-2';

-- seleccionar todos los clientes que tienen una factura
-- cli-ci_ruc, cli_nombre, cli_direccion
-- que sea igual la cedula de los clientes con la cedula en factura
desc cliente;
desc factura;
select * from factura;
select * from cliente;
-- cliente tiene CLI_CI_RUC, SCS_CODIGO, CLI_NOMBRE, CLI_DIRECCION
-- factura tiene FAC_NUMERO, CLI_CI_RUC, SCS_CODIGO, FAC_TOTAL

-- los atributos que coinciden son CLI_CI_RUC, SCS_CODIGO
create view ventasXCliente
as select c.CLI_CI_RUC, c.CLI_NOMBRE, c.CLI_DIRECCION
from cliente c, factura f
where c.CLI_CI_RUC = f.CLI_CI_RUC
and c.SCS_CODIGO = f.SCS_CODIGO;

select CLI_CI_RUC, CLI_NOMBRE, CLI_DIRECCION
from ventasXCliente;

