--a.1
SELECT *
FROM CLIENTE
WHERE correo LIKE '%hotmail%';

--a.2
SELECT *
FROM ENTIDAD_BANCARIA
WHERE codigo > '0300'
ORDER BY (nombre);

--a.3
SELECT *
FROM SUCURSAL
WHERE 
provincia NOT LIKE '%MADRID%' AND 
ciudad = 'ALICANTE';

--a.4
SELECT *
FROM CUENTA_BANCARIA
WHERE 
tipo = 'CORRIENTE' AND 
id_cuenta BETWEEN 1 AND 5;

--a.5
SELECT *
FROM CONTRATO
WHERE clausulas NOT LIKE '';

--b.1
--b.2

--c.1
SELECT CONCAT(cl.nombre,' ',cl.apellidos) AS cliente,cu.iban,cu.deposito,cu.tipo,cu.contraseña
FROM CLIENTE cl, CUENTA_BANCARIA cu
WHERE 
cl.id_cliente = cu.id_cliente
ORDER BY deposito ASC;

--c.2
SELECT CONCAT(c.nombre,' ',c.apellidos) AS cliente,cb.iban,r.cantidad, r.fecha, r.tipo 
FROM REALIZAR_OPERACION r, CLIENTE c, CUENTA_BANCARIA cb
WHERE 
r.id_cliente = c.id_cliente AND
r.id_cuenta = cb.id_cuenta
ORDER BY cantidad ASC;

--c.3
SELECT CONCAT(t.nombre,' ',t.apellidos) AS trabajador,t.telefono,t.correo AS correo_electronico,o.id_oficina AS oficina,o.seccion AS especialidad,o.id_sucursal AS sucursal,e.nombre AS banco
FROM trabajador t, oficina o, sucursal s, entidad_bancaria e
WHERE 
o.id_oficina = t.id_oficina AND
o.id_sucursal = s.id_sucursal AND
o.id_entidad_bancaria = e.codigo;

/*
d.1 
Queremos saber el nombre, apellidos y el IBAN 
de la persona con más dinero en su cuenta bancaria.
*/
SELECT CONCAT(cl.nombre,' ',cl.apellidos),c.iban,c.deposito
FROM cuenta_bancaria c, cliente cl
WHERE 
c.id_cliente = cl.id_cliente AND
deposito =
	(
		SELECT MAX(deposito)
		FROM cuenta_bancaria
	);
	
/*
d.2
Queremos saber el nombre y apellidos del cliente, su iban,
la cantidad, la fecha y el tipo de la primera operación que
se hizo en nuestro sistema bancario.
*/
SELECT CONCAT(cl.nombre,' ',cl.apellidos) AS cliente,cu.iban,ro.cantidad,ro.fecha,ro.tipo
FROM realizar_operacion ro,cuenta_bancaria cu,cliente cl
WHERE 
ro.id_cliente = cl.id_cliente AND
ro.id_cuenta = cu.id_cuenta AND
ro.fecha = 
	(
		SELECT MIN(fecha)
		FROM realizar_operacion
	);

/*
d.3
Queremos saber la media de metros cuadrados
de todas las cajas fuertes del banco.
*/
SELECT AVG(m2) AS tamaño
FROM caja_fuerte;

/*
e.1
Queremos saber cuantos trabajadores hay 
en cada oficina segun su especialidad.
*/
SELECT o.seccion, COUNT(t.*) AS trabajadores
FROM trabajador t, oficina o
WHERE t.id_oficina = o.id_oficina
GROUP BY (o.seccion);

/*
e.2
Queremos la suma del deposito total de todas
las cuentas bancarias por usuario ordenado
de mayor a menor
*/
SELECT CONCAT(c.nombre,' ',c.apellidos) AS cliente, SUM(deposito) AS total
FROM cuenta_bancaria cu,cliente c
WHERE cu.id_cliente = c.id_cliente
GROUP BY c.nombre,c.apellidos
ORDER BY SUM(deposito) DESC;

/*
f.1
Queremos saber la primera factura efectuada 
por un cliente, el nombre completo del cliente,
la fecha y su iban.
*/
SELECT f.id_factura AS factura,f.fecha,CONCAT(c.nombre,' ',c.apellidos) AS cliente,cu.iban
FROM factura f, cliente c, cuenta_bancaria cu
WHERE 
f.id_cliente = c.id_cliente AND
f.id_cuenta = cu.id_cuenta AND 
f.fecha = 
	(
		SELECT MIN(fecha)
		FROM factura
	);


/*
f.2
Queremos saber la oficina con la especialidad x
que tenga el maximo de trabajadores asignados.
*/
SELECT o.seccion AS especialidad
FROM trabajador t, oficina o
WHERE t.id_oficina = o.id_oficina
GROUP BY (o.id_oficina)
HAVING COUNT(t.id_oficina) = 
	(
		SELECT MAX(S.n) 
		FROM 
		(
			SELECT COUNT(t.id_oficina) AS n 
			FROM trabajador t
			GROUP BY (t.id_oficina)
		)S 
	);

/*
g.1
Queremos saber el codigo y nombre de las entidades bancarias
que han entrevisado más de 2 trabajadores.
*/
SELECT *
FROM entrevistar;

SELECT eb.codigo,eb.nombre,COUNT(e.id_trabajador) AS trabajadores
FROM entrevistar e, entidad_bancaria eb
WHERE eb.codigo = e.id_entidad_bancaria
GROUP BY (eb.codigo,eb.nombre)
HAVING COUNT(eb.nombre) > 1;

/*
g.2
Muestra el tipo de cuenta bancaria
que tenga más de tres cuentas los cuales
tengan un deposito superior a 2000€
*/
SELECT tipo, COUNT(*)
FROM cuenta_bancaria
WHERE deposito > 2000
GROUP BY tipo
HAVING COUNT(*) > 3 

SELECT *
FROM cuenta_bancaria

/*
h.1
Cambia el telefono de telefono al
trabajador que empieza por la 
letra T
*/
UPDATE trabajador
SET telefono = 666666666
WHERE nombre =
	(
		SELECT nombre
		FROM trabajador
		WHERE 
		UPPER(nombre) LIKE 'T%'
	); 

/*
h.2
Cambiar la clasula de contrato al ultimo trabajador 
*/
UPDATE contrato
SET clausulas = 'Asistir a potenciales clientes como asistente personal.'
WHERE id_trabajador = 
	(
		SELECT MAX(id_trabajador)
		FROM trabajador
	);

/*
h.3
Modifica la fecha final de alquiler
de la caja fuerte nº5 a 2020-01-01
*/
SELECT *
FROM alquilar

UPDATE alquilar
SET fecha_fin = '2020-01-01'
WHERE id_caja =
	(
		SELECT id_caja 
		FROM alquilar
		WHERE id_caja = 5
	);



