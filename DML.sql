--Borra las tablas en caso de que sigan habiendo datos.
DELETE FROM cliente;
DELETE FROM caja_fuerte;
DELETE FROM alquilar;
DELETE FROM entidad_bancaria;
DELETE FROM sucursal;
DELETE FROM cuenta_bancaria;
DELETE FROM oficina;
DELETE FROM trabajador;
DELETE FROM entrevistar;
DELETE FROM tarjeta;
DELETE FROM credito;
DELETE FROM debito;
DELETE FROM realizar_operacion;
DELETE FROM factura;
DELETE FROM cuenta_ahorro;
DELETE FROM cuenta_corriente;
DELETE FROM crear_tarjeta;

--Reinicia a 1 los autoincrementables en caso de borrado
ALTER SEQUENCE cliente_id_cliente_seq RESTART WITH 1;
ALTER SEQUENCE caja_fuerte_id_caja_seq RESTART WITH 1;
ALTER SEQUENCE cuenta_bancaria_id_cuenta_seq RESTART WITH 1;
ALTER SEQUENCE trabajador_id_trabajador_seq RESTART WITH 1;
ALTER SEQUENCE tarjeta_id_tarjeta_seq RESTART WITH 1;
ALTER SEQUENCE realizar_operacion_id_operacion_seq RESTART WITH 1;

--SELECT * FROM information_schema.sequences;

INSERT INTO cliente(dni,nombre,apellidos,telefono,domicilio,correo)
VALUES
('09802921E','Jose','Breton Cañado','944525235','Rúa Carolina, 1, 3º D','josba@gmail.com'),
('18425747X','Axel','Fernández','671304862','Ruela Abril, 38, 4º A','ereina@hotmail.com'),
('88045124C','Sandra','Maria Amado','672112121','Plaza Torres, 677, 8º D','miguel.saldana@saldana.net'),
('75752830F','Julio','Neira','679912481','Ruela Carrión, 34, 9º 1º','aarreola@gmail.com'),
('97309370G','Celestina','Calderon','632651404','Travesía Ponce, 139, 07º B','nayara54@bankia.org');

INSERT INTO caja_fuerte(m2,contraseña,contenido)
VALUES
(2.2,'106947','Gafas de sol, 1504.3 dolares, Caja segura, Testamento'),
(1.3,'890607','Bolsa de canicas, Contratos, Facturas'),
(2.3,'681646','Chapas, Monedas antiguas, Escritos antiguos'),
(4.3,'972725','Llaves de coche, Botella de cocacola antigua'),
(3.2,'592194','Mochila vacia, Sacapuntas, Lapiz');

INSERT INTO alquilar(id_caja,id_cliente,fecha_inicio,fecha_fin)
VALUES
(1,3,'28/01/2022','28/01/2023'),
(2,3,'15/05/2016','15/05/2017'),
(3,1,'15/05/2006','15/05/2007'),
(4,4,'29/03/2030','29/03/2031'),
(5,5,'26/06/2011','26/06/2012');

INSERT INTO entidad_bancaria(codigo,nombre)
VALUES 
('0003','BANCO DE DEPOSITOS'),
('0011','ALLFUNDS BANK'),
('0019','DEUTSCHE BANK, S.A.E.'),
('0036','SANTANDER INVESTMENT'),
('0038','CACEIS BANK SPAIN'),
('0049','BANCO SANTANDER'),
('0061','BANCA MARCH'),
('0073','OPEN BANK'),
('0078','BANCA PUEYO'),
('0081','BANCO DE SABADELL'),
('0083','RENTA 4 BANCO'),
('0091','BANCO DE ALBACETE'),
('0108','SOCIETE GENERALE'),
('0113','BANCO INDUSTRIAL DE BILBAO'),
('0121','BANCO OCCIDENTAL'),
('0125','BANCOFAR'),
('0128','BANKINTER'),
('0133','NUEVO MICRO BANK'),
('0136','ARESBANK'),
('0144','BNP PARIBAS SECURITIES SERVICES'),
('0145','DEUTSCHE BANK, AG'),
('0149','BNP PARIBAS SUCURSAL EN ESPAÑA'),
('0151','JPMORGAN CHASE BANK NATIONAL ASSOCIA'),
('0152','BARCLAYS BANK IRELAND P.L.C.'),
('0154','CREDIT AGRICOLE CORPORATE'),
('0159','COMMERZBANK'),
('0160','MUFG BANK (EUROPE) N.V.'),
('0162','HSBC FRANCE SUCURSAL EN ESPAÑA'),
('0167','BNP PARIBAS FORTIS'),
('0169','BANCO DE LA NACION ARGENTINA'),
('0182','BBVA'),
('0184','BANCO EUROPEO DE FINANZAS'),
('0186','BANCO MEDIOLANUM'),
('0188','BANCO ALCALA'),
('0198','BANCO COOPERATIVO ESPAÑOL'),
('0200','WEALTHPRIVAT BANK'),
('0211','EBN BANCO DE NEGOCIOS'),
('0216','TARGOBANK'),
('0218','FCE BANK P.L.C.'),
('0219','BANK OF AFRICA EUROPE'),
('0220','BANCO FINANTIA SUCURSAL EN ESPAÑA'),
('0224','SANTANDER CONSUMER FINANCE'),
('0225','BANCO CETELEM'),
('0226','UBS EUROPE SUCURSAL EN ESPAÑA'),
('0229','WIZINK BANK'),
('0232','BANCO INVERSIS'),
('0234','BANCO CAMINOS'),
('0235','BANCO PICHINCHA ESPAÑA'),
('0237','CAJASUR'),
('0239','EVO BANCO'),
('0240','BANCO DE CREDITO SOCIAL COOPERATIVO'),
('0241','A&G BANCA PRIVADA'),
('0242','SABADELL CONSUMER FINANCE'),
('0243','CREDIT SUISSE BANK (EUROPE)'),
('1000','INSTITUTO DE CREDITO OFICIAL'),
('1451','CAISSE REGIONALE CREDIT AGRICOLES MU'),
('1457','DE LAGE LANDEN INTERNATIONAL B.V.'),
('1459','COOPERATIEVE RABOBANK U.A.'),
('1460','CREDIT SUISSE AG'),
('1465','ING BANK N.V.'),
('1472','CREDIT AGRICOLE LEASING & FACTORING'),
('1473','EDMOND DE ROTHSCHILD (EUROPE)'),
('1474','CITIBANK EUROPE PLC'),
('1479','NATIXIS SUCURSAL EN ESPAÑA'),
('1480','VOLKSWAGEN BANK GMBH'),
('1482','JOHN DEERE BANK'),
('1485','BANK OF AMERICA EUROPE DAC'),
('1487','TOYOTA KREDITBANK GMBH'),
('1488','PICTET & CIE (EUROPE)'),
('1490','SINGULAR BANK'),
('1491','TRIODOS BANK N.V.'),
('1492','BNP PARIBAS LEASE GROUP'),
('1493','CAIXA BANCO DE INVESTIMENTO'),
('1494','INTESA SANPAOLO, S.P.A.'),
('1496','GENEFIM SUCURSAL EN ESPAÑA'),
('1497','HAITONG BANK'),
('1499','CLAAS FINANCAL SERVICES, S.A.S'),
('1500','BPCE LEASE SUCURSAL EN ESPAÑA'),
('1501','DEUTSCHE PFANDBRIEFBANK, AG'),
('1504','HONDA BANK GMBH'),
('1508','RCI BANQUE SUCURSAL EN ESPAÑA'),
('1509','BANCO PRIMUS SUCURSAL EN ESPAÑA'),
('1512','ELAVON FINANCIAL SERVICES DAC'),
('1514','CNH INDUSTRIAL FINANCIAL SERVICES'),
('1516','J.P. MORGAN INTERNATIONAL BANK LTD'),
('1520','MEDIOBANCA SUCURSAL EN ESPAÑA'),
('1521','BINCKBANK NV, SUCURSAL EN ESPAÑA'),
('1523','MERCEDES-BENZ BANK AG'),
('1525','BANQUE CHAABI DU MAROC'),
('1531','CREDIT SUISSE INTERNATIONAL'),
('1532','BNP PARIBAS FACTOR SUCURSAL ESPAÑA'),
('1533','BMW BANK GMBH SUCURSAL EN ESPAÑA'),
('1535','AKF BANK GMBH & CO KG'),
('1538','INDUSTRIAL & COMMERCIAL BANK OF CHINA'),
('1541','ATTIJARIWAFA BANK EUROPE'),
('1543','COFIDIS SUCURSAL EN ESPAÑA'),
('1544','ANDBANK ESPAÑA'),
('1545','CA INDOSUEZ WEALTH (EUROPE)'),
('1546','CNH INDUSTRIAL CAPITAL EUROPE S.A.S.'),
('1547','LOMBARD ODIER (EUROPE)'),
('1548','DELL BANK INTERNATIONAL DAC'),
('1550','BANCA POPOLARE ETICA'),
('1551','SMBC BANK EU AG'),
('1552','MIRABAUD & CIE (EUROPE)'),
('1553','CHINA CONSTRUCTION BANK (EUROPE)'),
('1554','BANCA FARMAFACTORING SPA'),
('1555','CREDIT MUTUEL LEASING'),
('1557','UNICREDIT, S.P.A.SUCURSAL EN ESPAÑA'),
('1558','RBC EUROPE LTD, SUCURSAL EN ESPAÑA'),
('1559','MIZUHO BANK EUROPE N.V.'),
('1560','YOUNITED SUCURSAL EN ESPAÑA'),
('1563','N26 BANK GMBH, SUCURSAL EN ESPAÑA'),
('1564','GOLDMAN SACHS AG, SUCURSAL EN ESPAÑA'),
('1565','OPEL BANK, SUCURSAL EN ESPAÑA'),
('1566','NATWEST MARKETS N.V.'),
('1567','J.P. MORGAN AG, SUCURSAL EN ESPAÑA'),
('1568','ORANGE BANK, SUCURSAL EN ESPAÑA'),
('1569','BANCO DE INVESTIMENTO GLOBAL'),
('1570','GOVERNOR & COMP.OF THE BANK IRELAND'),
('1572','STIFEL EUROPE BANK AG'),
('1573','THE BANK OF NEW YORK MELLON SA/NV'),
('1574','BANK JULIUS BAER EUROPE'),
('1575','WESTERN UNION INTERNATIONAL BANK'),
('1576','BUNQ B.V. SUCURSAL EN ESPAÑA'),
('1577','ODDO BHF SCA, SUCURSAL EN ESPAÑA'),
('1578','SOLARISBANK AG, SUCURSAL EN ESPAÑA'),
('1579','KLARNA BANK AB, SUCURSAL EN ESPAÑA'),
('1580','BANQUE J.SAFRA SARASIN (LUXEMBOURG)'),
('2000','CECABANK'),
('2045','CAIXA ONTINYENT'),
('2048','LIBERBANK'),
('2056','CAIXA POLLENÇA'),
('2080','ABANCA'),
('2085','IBERCAJA'),
('2095','KUTXABANK'),
('2100','LA CAIXA'),
('2103','UNICAJA'),
('3001','CAJA RURAL DE ALMENDRALEJO'),
('3005','CAJA RURAL CENTRAL'),
('3007','CAJA RURAL DE GIJON'),
('3008','CAJA RURAL DE NAVARRA'),
('3009','CAJA RURAL DE EXTREMADURA'),
('3016','CAJA RURAL DE SALAMANCA'),
('3017','CAJA RURAL DE SORIA'),
('3018','C.R. REGIONAL SAN AGUSTIN'),
('3020','CAJA RURAL DE UTRERA'),
('3023','CAJA RURAL DE GRANADA'),
('3025','CAIXA DE C. DELS ENGINYERS'),
('3029','CAIXAPETRER'),
('3035','LABORAL KUTXA'),
('3045','CAIXALTEA'),
('3058','CAJAMAR CAJA RURAL'),
('3059','CAJA RURAL DE ASTURIAS'),
('3060','CAJAVIVA'),
('3067','CAJA JAEN'),
('3070','CAIXA RURAL GALEGA'),
('3076','CAJASIETE, CAJA RURAL'),
('3080','CAJA RURAL DE TERUEL'),
('3081','EUROCAJA RURAL'),
('3085','CAJA RURAL DE ZAMORA'),
('3089','C.R.DE BAENA NTRA.SRA.DE GUADALUPE'),
('3095','CAIXA RURAL ALMENARA'),
('3096','CAIXA RURAL DE L"ALCUDIA'),
('3098','CAJA RURAL DE NUEVA CARTEYA'),
('3102','CAIXA RURAL SANT VICENT FERRER'),
('3104','C.R. DE CAÑETE DE LAS TORRES'),
('3105','CAIXACALLOSA'),
('3110','CAIXA RURAL VILA-REAL'),
('3111','C.R. LA VALL SAN ISIDRO'),
('3112','CAIXA RURAL BURRIANA'),
('3113','C.R. SAN JOSE DE ALCORA'),
('3115','C.R. NUESTRA SRA. MADRE SOL'),
('3117','CAIXA RURAL D" ALGEMESI'),
('3118','CAIXA RURAL TORRENT'),
('3119','CAIXALQUERIES'),
('3121','CAJA RURAL DE CHESTE'),
('3123','CAIXA TURIS'),
('3127','CAJA RURAL DE CASAS IBAÑEZ'),
('3130','C.R. SAN JOSE DE ALMASSORA'),
('3134','C.R. NTRA. SRA. DE LA ESPERANZA'),
('3135','C.R. SAN JOSE DE NULES'),
('3138','RURALNOSTRA'),
('3140','CAJA RURAL DE GUISSONA'),
('3144','CAJA RURAL DE VILLAMALEA'),
('3150','CAJA RURAL DE ALBAL'),
('3152','CAJA RURAL DE VILLAR'),
('3157','CAIXA RURAL XILXES'),
('3159','CAIXA POPULAR-CAIXA RURAL'),
('3160','CAIXA RURAL VILAVELLA'),
('3162','CAIXA RURAL BENICARLO'),
('3165','CAIXA RURAL VILAFAMES'),
('3166','CAIXA RURAL LES COVES DE VINROMA'),
('3174','CAIXA RURAL VINAROS'),
('3179','CAJA RURAL DE ALGINET'),
('3183','ARQUIA BANK'),
('3187','CAJA RURAL DEL SUR'),
('3190','GLOBALCAJA'),
('3191','BANTIERRA'),
('9000','BANCO DE ESPAÑA');

INSERT INTO sucursal(id_sucursal,dirección,ciudad,codigo_postal,provincia,cod_entidad)
VALUES
('0001','PLAÇA OCTAVIA, 6,','SANT CUGAT DEL VALLES','08172','BARCELONA','0081'),
('0108','PASEO DE LA EXPLANADA 2 ENTLO.IZQDA.','ALICANTE','03002','ALICANTE','1544'),
('3059','MELQUIADES ALVAREZ, 7','OVIEDO','33002','ASTURIAS','3059'),
('0182','PZA.DE SAN NICOLAS, 4','BILBAO','48005','VIZCAYA','0182'),
('0050','RIBERA DEL LOIRA, 28 2ª PLTA.','COMUNIDAD DE MADRID, ES-MA','28000','MADRID','0149'),
('0002','PICO DE SAN PEDRO, 2 APDO.14261','TRES CANTOS','28760','MADRID','0128'),
('2100','MALLORCA, 165','BARCELONA','08036','BARCELONA','3029'),
('3045','PASSATGE DEL LLAURADOR, 1','ALTEA','03590','ALICANTE','3045'),
('9000','ALCALA, 50','MADRID','28014','MADRID','9000'),
('3190','BERNA, 1','TOLEDO','45003','TOLEDO','3190');

INSERT INTO oficina(id_oficina,seccion,m2,id_sucursal,id_entidad_bancaria)
VALUES
('00010081DP01','DEPARTAMENTO DE PRESTAMOS',10,'0001','0081'),
('00010081DP02','DEPARTAMENTO DE CONTABILIDAD',15,'0001','0081'),
('00010081DP03','DEPARTAMENTO DE DIRECCIÓN',12,'0001','0081'),
('00010081DP04','DEPARTAMENTO DE GESTORIAS',17,'0001','0081'),
('00010081DP05','DEPARTAMENTO DE ADMINISTRACIONES',10,'0001','0081'),
('00010081DP06','SALA DE SEGURIDAD',10,'0001','0081'),
('00010081DP07','SALA DE JUNTAS',10,'0001','0081'),
('00010081DP08','SALON DE DESCANSO',10,'0001','0081'),

('01081544DP01','DEPARTAMENTO DE PRESTAMOS',10,'0108','1544'),
('01081544DP02','DEPARTAMENTO DE CONTABILIDAD',15,'0108','1544'),
('01081544DP03','DEPARTAMENTO DE DIRECCIÓN',12,'0108','1544'),
('01081544DP04','DEPARTAMENTO DE GESTORIAS',17,'0108','1544'),
('01081544DP05','DEPARTAMENTO DE ADMINISTRACIONES',10,'0108','1544'),
('01081544DP06','SALA DE SEGURIDAD',10,'0108','1544'),
('01081544DP07','SALA DE JUNTAS',10,'0108','1544'),
('01081544DP08','SALON DE DESCANSO',10,'0108','1544'),

('30593059DP01','DEPARTAMENTO DE PRESTAMOS',10,'3059','3059'),
('30593059DP02','DEPARTAMENTO DE CONTABILIDAD',15,'3059','3059'),
('30593059DP03','DEPARTAMENTO DE DIRECCIÓN',12,'3059','3059'),
('30593059DP04','DEPARTAMENTO DE GESTORIAS',17,'3059','3059'),
('30593059DP05','DEPARTAMENTO DE ADMINISTRACIONES',10,'3059','3059'),
('30593059DP06','SALA DE SEGURIDAD',10,'3059','3059'),
('30593059DP07','SALA DE JUNTAS',10,'3059','3059'),
('30593059DP08','SALON DE DESCANSO',10,'3059','3059'),

('01820182DP01','DEPARTAMENTO DE PRESTAMOS',10,'0182','0182'),
('01820182DP02','DEPARTAMENTO DE CONTABILIDAD',15,'0182','0182'),
('01820182DP03','DEPARTAMENTO DE DIRECCIÓN',12,'0182','0182'),
('01820182DP04','DEPARTAMENTO DE GESTORIAS',17,'0182','0182'),
('01820182DP05','DEPARTAMENTO DE ADMINISTRACIONES',10,'0182','0182'),
('01820182DP06','SALA DE SEGURIDAD',10,'0182','0182'),
('01820182DP07','SALA DE JUNTAS',10,'0182','0182'),
('01820182DP08','SALON DE DESCANSO',10,'0182','0182'),

('00500149DP01','DEPARTAMENTO DE PRESTAMOS',10,'0050','0149'),
('00500149DP02','DEPARTAMENTO DE CONTABILIDAD',15,'0050','0149'),
('00500149DP03','DEPARTAMENTO DE DIRECCIÓN',12,'0050','0149'),
('00500149DP04','DEPARTAMENTO DE GESTORIAS',17,'0050','0149'),
('00500149DP05','DEPARTAMENTO DE ADMINISTRACIONES',10,'0050','0149'),
('00500149DP06','SALA DE SEGURIDAD',10,'0050','0149'),
('00500149DP07','SALA DE JUNTAS',10,'0050','0149'),
('00500149DP08','SALON DE DESCANSO',10,'0050','0149'),

('00020128DP01','DEPARTAMENTO DE PRESTAMOS',10,'0002','0128'),
('00020128DP02','DEPARTAMENTO DE CONTABILIDAD',15,'0002','0128'),
('00020128DP03','DEPARTAMENTO DE DIRECCIÓN',12,'0002','0128'),
('00020128DP04','DEPARTAMENTO DE GESTORIAS',17,'0002','0128'),
('00020128DP05','DEPARTAMENTO DE ADMINISTRACIONES',10,'0002','0128'),
('00020128DP06','SALA DE SEGURIDAD',10,'0002','0128'),
('00020128DP07','SALA DE JUNTAS',10,'0002','0128'),
('00020128DP08','SALON DE DESCANSO',10,'0002','0128'),

('21003029DP01','DEPARTAMENTO DE PRESTAMOS',10,'2100','3029'),
('21003029DP02','DEPARTAMENTO DE CONTABILIDAD',15,'2100','3029'),
('21003029DP03','DEPARTAMENTO DE DIRECCIÓN',12,'2100','3029'),
('21003029DP04','DEPARTAMENTO DE GESTORIAS',17,'2100','3029'),
('21003029DP05','DEPARTAMENTO DE ADMINISTRACIONES',10,'2100','3029'),
('21003029DP06','SALA DE SEGURIDAD',10,'2100','3029'),
('21003029DP07','SALA DE JUNTAS',10,'2100','3029'),
('21003029DP08','SALON DE DESCANSO',10,'2100','3029'),

('30453045DP01','DEPARTAMENTO DE PRESTAMOS',10,'3045','3045'),
('30453045DP02','DEPARTAMENTO DE CONTABILIDAD',15,'3045','3045'),
('30453045DP03','DEPARTAMENTO DE DIRECCIÓN',12,'3045','3045'),
('30453045DP04','DEPARTAMENTO DE GESTORIAS',17,'3045','3045'),
('30453045DP05','DEPARTAMENTO DE ADMINISTRACIONES',10,'3045','3045'),
('30453045DP06','SALA DE SEGURIDAD',10,'3045','3045'),
('30453045DP07','SALA DE JUNTAS',10,'3045','3045'),
('30453045DP08','SALON DE DESCANSO',10,'3045','3045'),

('90009000DP01','DEPARTAMENTO DE PRESTAMOS',10,'9000','9000'),
('90009000DP02','DEPARTAMENTO DE CONTABILIDAD',15,'9000','9000'),
('90009000DP03','DEPARTAMENTO DE DIRECCIÓN',12,'9000','9000'),
('90009000DP04','DEPARTAMENTO DE GESTORIAS',17,'9000','9000'),
('90009000DP05','DEPARTAMENTO DE ADMINISTRACIONES',10,'9000','9000'),
('90009000DP06','SALA DE SEGURIDAD',10,'9000','9000'),
('90009000DP07','SALA DE JUNTAS',10,'9000','9000'),
('90009000DP08','SALON DE DESCANSO',10,'9000','9000'),

('31903190DP01','DEPARTAMENTO DE PRESTAMOS',10,'3190','3190'),
('31903190DP02','DEPARTAMENTO DE CONTABILIDAD',15,'3190','3190'),
('31903190DP03','DEPARTAMENTO DE DIRECCIÓN',12,'3190','3190'),
('31903190DP04','DEPARTAMENTO DE GESTORIAS',17,'3190','3190'),
('31903190DP05','DEPARTAMENTO DE ADMINISTRACIONES',10,'3190','3190'),
('31903190DP06','SALA DE SEGURIDAD',10,'3190','3190'),
('31903190DP07','SALA DE JUNTAS',10,'3190','3190'),
('31903190DP08','SALON DE DESCANSO',10,'3190','3190');

INSERT INTO cuenta_bancaria(iban,deposito,tipo,contraseña,id_cliente,id_sucursal,id_entidad_bancaria)
VALUES
('ES950081000110110000000001',1565.54,'CORRIENTE',857823,1,'0001','0081'),
('ES42154401086110000000002',534546.42,'CORRIENTE',426263,3,'0108','1544'),
('ES49305930598110000000003',2010.07,'AHORRO',345353,3,'3059','3059'),
('ES810182018210110000000004',1845.00,'AHORRO',534635,2,'0182','0182'),
('ES51005001491110000000005',704151.93,'CORRIENTE',892376,5,'0050','0149'),
('ES560128000211110000000006',587.62,'AHORRO',103956,3,'0002','0128'),
('ES60302921006110000000007',1230.00,'AHORRO',747693,1,'2100','3029'),
('ES23304530453110000000008',978079.30,'CORRIENTE',248683,2,'3045','3045'),
('ES43900090004110000000009',180907.00,'CORRIENTE',739389,5,'9000','9000'),
('ES5131903190680000000010',5410.00,'AHORRO',486723,4,'3190','3190');

INSERT INTO trabajador(dni,nombre,apellidos,telefono,domicilio,fecha_nac,correo,id_oficina)
VALUES
('26304527W','Ruth','Stiefel','5076970812','4632 Trymore, 56283','14/08/1999','ErnieTWilson@superrito.com','21003029DP02'),
('14296427H','Oscar','K. Rickard','635013406','Pza. Fuensanta, 1832360 A Veiga','06/11/1982','OscarKRickard@superrito.com','21003029DP05'),
('99145427V','Edna','C. Mahoney','646645175','Matilla de los Caños del Río','21/08/1996','EdnaCMahoney@gustr.com','00010081DP06'),
('54422668E','Cynthia','B. Alexander','626080665','Gejuelo del Barro','29/11/1981','CynthiaBAlexander@gustr.com','00020128DP01'),
('52168315Z','Craig','R. Douglass','729296873','Avendaño, 52 03820 Cocentaina','25/08/1980','CraigRDouglass@gustr.com','30593059DP05'),
('12018971E','Eric','D. Stepp','695701198','Paseo Junquera, 84 12527 Artana','25/02/1991','EricDStepp@gustr.com','00500149DP06'),
('45965418X','Rebeca','K. Wenz','751755631','Alcon Molina, 36 31110 Valle de Elorz Noáin','01/01/1992','RebeccaKWenz@gustr.com','30453045DP07'),
('54377478G','Kendra','R. Crutcher','725552211','Eusebio Dávila, 40 41550 Aguadulce','10/05/1972','KendraRCrutcher@superrito.com','01820182DP01'),
('00403835R','Tania','C. Grout','607347696','Paseo del Atlántico, 7117520 Puigcerdà','07/01/1995','ThanhCGrout@gustr.com','31903190DP07'),
('97827401Y','Audrey','J. Douglas','730864430','C/ Los Herrán, 71 06260 Monesterio','19/08/1970','AudreyJDouglas@superrito.com','00500149DP02');

INSERT INTO entrevistar(id_trabajador,id_sucursal,id_entidad_bancaria,fecha)
VALUES
(1,'2100','3029','13/09/2021'),
(2,'2100','3029','28-05-2020'),
(3,'0001','0081','10-12-2020'),
(4,'0002','0128','09-12-2022'),
(5,'3059','3059','10-02-2021'),
(6,'0050','0149','14-09-2020'),
(7,'3045','3045','12-10-2018'),
(8,'0182','0182','12-08-2018'),
(9,'3190','3190','27-07-2019'),
(10,'0050','0149','24-11-2021');

INSERT INTO tarjeta(titular,cvv,vencimiento,id_cliente,id_cuenta,contraseña,tipo)
VALUES
('Jose Breton Cañado',182,'11/03/2025',1,1,5079,'CREDITO'),
('Sandra Maria Amado',356,'09/03/2024',3,2,8593,'DEBITO'),
('Celestina Calderon',432,'09/03/2026',5,5,7437,'CREDITO'),
('Axel Fernández',757,'07/03/2024',2,8,8718,'DEBITO'),
('Celestina Calderon',313,'07/03/2023',5,9,0744,'CREDITO');

/*
Hago un pequeño inciso de la cantidad de datos de las 
tablas credito y debito, la cantidad es menor a 5
por que las cuentas de banco creadas son 10, de estas 10
solo 5 son cuentas corrientes y de estas tarjetas se dividen
3 en credito y 2 en debito. 

Si hubieran más cuentas correintes
el numero aumentaria, pero dado la carga de trabajo que supone
el proyecto disiminuire un poco el numero a cambio de aumentarlo
en zonas posteriores y superiores del proyecto.

De todas formas el sistema esta preparado para añadir más cuentas
de banco para que en un futuro sea escalable.
*/

INSERT INTO credito(id_tarjeta)
VALUES
(1),
(3),
(5);

INSERT INTO debito(id_tarjeta)
VALUES
(2),
(4);

INSERT INTO realizar_operacion(id_cliente,id_cuenta,cantidad,fecha,tipo)
VALUES
(1,1,685.67,'12-06-2020','INGRESO'),
(1,1,-25.34,'13-11-2021','RETIRADA'),
(1,7,750.34,'06-06-2021','INGRESO'),
(1,7,-264.28,'12-08-2021','RETIRADA'),
(2,8,581.35,'22-10-2021','INGRESO'),
(2,8,-2054.54,'31-07-2020','RETIRADA'),
(2,4,1000.50,'09-02-2021','INGRESO'),
(2,4,-1500.54,'05-01-2022','RETIRADA'),
(3,6,899.54,'21-12-2020','INGRESO'),
(3,6,-100.00,'12-05-2020','RETIRADA'),
(3,2,50.45,'18-09-2020','INGRESO'),
(3,2,-435.64,'01-04-2022','RETIRADA'),
(3,3,300.65,'31-05-2021','INGRESO'),
(3,3,-4000.54,'05-10-2021','RETIRADA'),
(4,10,750.98,'01-05-2021','INGRESO'),
(4,10,-617.23,'25-06-2020','RETIRADA'),
(5,5,485.74,'17-11-2021','INGRESO'),
(5,5,-893.62,'31-01-2021','RETIRADA');

INSERT INTO factura(fecha,id_cliente,id_cuenta)
VALUES
('12-06-2020',1,1),
('13-11-2021',1,1),
('06-06-2021',1,7),
('12-08-2021',1,7),
('22-10-2021',2,8),
('31-07-2020',2,8),
('09-02-2021',2,4),
('05-01-2022',2,4),
('21-12-2020',3,6),
('12-05-2020',3,6),
('18-09-2020',3,2),
('01-04-2022',3,2),
('31-05-2021',3,3),
('05-10-2021',3,3),
('01-05-2021',4,10),
('25-06-2020',4,10),
('17-11-2021',5,5),
('31-01-2021',5,5);

INSERT INTO cuenta_ahorro(id_cuenta)
VALUES
(3),
(4),
(6),
(7),
(10);

INSERT INTO cuenta_corriente(id_cuenta)
VALUES
(1),
(2),
(5),
(8),
(9);

INSERT INTO crear_tarjeta(id_cliente,id_cc,id_sucursal,id_entidad_bancaria,contraseña,id_tarjeta,fecha_creacion)
VALUES
(1,1,'0001','0081',5079,1,'2020-03-11'),
(2,8,'3045','3045',8593,2,'2019-03-09'),
(3,2,'0108','1544',7437,3,'2021-03-07'),
(5,5,'0050','0149',8718,4,'2019-03-07'),
(5,9,'9000','9000',0744,5,'07-03-2018');

SELECT *
FROM crear_tarjeta;

SELECT *
FROM cuenta_bancaria
WHERE tipo LIKE '%CORRIENTE%'
ORDER BY id_cliente;

SELECT *
FROM tarjeta;
