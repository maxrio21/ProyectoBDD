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
