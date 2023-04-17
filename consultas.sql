/*
   Si no tienes una base de datos, copia las siguientes dos líneas que no están comentadas
*/
CREATE DATABASE IF NOT EXISTS pruebas;
USE pruebas;

/*
   Si ya tienes una base de datos, sólo copia lo siguiente
*/
CREATE TABLE tblUsuarios (
   idx INT PRIMARY KEY AUTO_INCREMENT,
   usuario VARCHAR(20),
   nombre VARCHAR(20),
   sexo VARCHAR(1),
   nivel TINYINT,
   email VARCHAR(50),
   telefono VARCHAR(20),
   marca VARCHAR(20),
   compañia VARCHAR(20),
   saldo FLOAT,
   activo BOOLEAN
);

INSERT INTO tblUsuarios 
VALUES 
('1','BRE2271','BRENDA','M','2','brenda@live.com','655-330-5736','SAMSUNG','IUSACELL','100','1'),
('2','OSC4677','OSCAR','H','3','oscar@gmail.com','655-143-4181','LG','TELCEL','0','1'),
('3','JOS7086','JOSE','H','3','francisco@gmail.com','655-143-3922','NOKIA','MOVISTAR','150','1'),
('4','LUI6115','LUIS','H','0','enrique@outlook.com','655-137-1279','SAMSUNG','TELCEL','50','1'),
('5','LUI7072','LUIS','H','1','luis@hotmail.com','655-100-8260','NOKIA','IUSACELL','50','0'),
('6','DAN2832','DANIEL','H','0','daniel@outlook.com','655-145-2586','SONY','UNEFON','100','1'),
('7','JAQ5351','JAQUELINE','M','0','jaqueline@outlook.com','655-330-5514','BLACKBERRY','AXEL','0','1'),
('8','ROM6520','ROMAN','H','2','roman@gmail.com','655-330-3263','LG','IUSACELL','50','1'),
('9','BLA9739','BLAS','H','0','blas@hotmail.com','655-330-3871','LG','UNEFON','100','1'),
('10','JES4752','JESSICA','M','1','jessica@hotmail.com','655-143-6861','SAMSUNG','TELCEL','500','1'),
('11','DIA6570','DIANA','M','1','diana@live.com','655-143-3952','SONY','UNEFON','100','0'),
('12','RIC8283','RICARDO','H','2','ricardo@hotmail.com','655-145-6049','MOTOROLA','IUSACELL','150','1'),
('13','VAL6882','VALENTINA','M','0','valentina@live.com','655-137-4253','BLACKBERRY','AT&T','50','0'),
('14','BRE8106','BRENDA','M','3','brenda2@gmail.com','655-100-1351','MOTOROLA','NEXTEL','150','1'),
('15','LUC4982','LUCIA','M','3','lucia@gmail.com','655-145-4992','BLACKBERRY','IUSACELL','0','1'),
('16','JUA2337','JUAN','H','0','juan@outlook.com','655-100-6517','SAMSUNG','AXEL','0','0'),
('17','ELP2984','ELPIDIO','H','1','elpidio@outlook.com','655-145-9938','MOTOROLA','MOVISTAR','500','1'),
('18','JES9640','JESSICA','M','3','jessica2@live.com','655-330-5143','SONY','IUSACELL','200','1'),
('19','LET4015','LETICIA','M','2','leticia@yahoo.com','655-143-4019','BLACKBERRY','UNEFON','100','1'),
('20','LUI1076','LUIS','H','3','luis2@live.com','655-100-5085','SONY','UNEFON','150','1'),
('21','HUG5441','HUGO','H','2','hugo@live.com','655-137-3935','MOTOROLA','AT&T','500','1');

-- Listar los nombres de los usuario
select * from tblUsuarios;
select nombre from tblUsuarios;
-- Calcular el saldo máximo de los usuarios de sexo Mujer
select max(saldo) from tblUsuarios where sexo='M';
-- Listar nombre y telefono de los usuarios con telefino nokia, blackberry o sony
select nombre, telefono from tblUsuarios where marca IN('NOKIA', 'BLACKBERRY', 'SONY');
-- Contar los usuarios sin saldo o inactivod
select count(*) from tblUsuarios where NOT activo OR saldo <=0;
-- Listar el loging de los usuarios con nivel 1,2, o 3
select usuario from tblUsuarios where nivel in(1,2,3);
select usuario from tblUsuarios where nivel in(1,2);
-- Listar los numero telefonicos con saldo menos o igual a 300
select telefono from tblUsuarios where saldo <= 300; 
select nombre from tblUsuarios where saldo >= 300; 

-- Calcular la suma de saldos de los usuarios de la compañia telefonica NEXTEL
select sum(saldo) from tblUsuarios where compañia='NEXTEL';

-- contar el numero de usuarios por compañia telefonica
select compañia, count(*) from tblUsuarios group by compañia;

-- contar el numero de usuario por nivel
select nivel, count(*) from tblUsuarios group by nivel;

-- Listar el loging de los usuarios con nivel 2
select usuario from tblUsuarios where nivel= 2;

-- Mostar el email de los usuarios que usan gmail
select email from tblUsuarios where email like '%gmail.com';

-- Listar nombre y telefono de los uaurios con telefono LG, SAMSUMG o Motorola
select nombre, telefono from tblUsuarios where marca in('LG', 'SAMSUNG', 'MOTOROLA'); 

-- listas nombre y telefono de los usuario que no sean de la marca LG o SAMSUNG
select nombre, telefono from tblUsuarios where marca NOT IN('LG', 'SAMSUMG');

-- listar  el loging y el telefono de los usuarios con compañia telefonica IUSACELL
select usuario, telefono from tblUsuarios WHERE compañia='IUSACELL';

-- listar el loging y el telefono de los usuarios con compañia telefonica que no sea TELCEL
select usuario, telefono from tblUsuarios WHERE compañia <> 'TELCEL';

-- Calcular el saldo promedio de los usuarios que tienen telefono marca NOKIA
select avg(saldo) from tblUsuarios where marca = 'NOKIA';
select avg(saldo) from tblUsuarios where marca = 'SAMSUNG';

-- Listar el loging y el telefono de los usuarios con compañia telefonica IUSACELL o AXEL
SELECT usuario, telefono from tblUsuarios where compañia IN('ISACELL', 'AXEL');

-- Mostrar el email de los usuarios que usan yahoo
select email from tblUsuarios where email like '%yahoo.com';
-- los que no usan yahoo
select email from tblUsuarios where email NOT like '%yahoo.com';

-- Listar el loging y el telefono de los usuarios  con compañia telefonia  que no sea TELCEL o IUSACELL
select usuario, telefono from tblUsuarios where compañia NOT IN('TELECEL', 'ISACELL');

-- listar el login y el telefono de los usuarios con compañia telefonoca UNEFON
select usuario, telefono from tblUsuarios where compañia = 'UNEFON';

-- Listar las diferentes marcar de celular en orden alfabetico descendendetemente
select distinct marca from tblUsuarios order by marca desc;
-- ascendentemenre
select distinct marca from tblUsuarios order by marca asc;

-- listar las diferentes compañia en orden alfabetico aleatorio
select distinct compañia from tblUsuarios order by rand();
select distinct compañia from tblUsuarios order by compañia asc;

-- listar el loging de los usuarios con nivel 0 o 2
select usuario from tblUsuarios where nivel IN(0,2);

-- calcular el saldo promedio de los usuarios que tiene telefono marca LG
select avg(saldo) from tblUsuarios where marca='LG';

-- listar el loging de los usuarios con nivel 1 0 3
select usuario from tblUsuarios where nivel IN (1,3);

-- Listar nombre y telefono  de los uaurios con telefono que no sea de la marca BLACBERRY
select nombre, telefono from tblUsuarios where marca <> 'BLACKBERRY';

-- listar el loging de los usuarios con nivel 3
select usuario from tblUsuarios where nivel = 3;
select usuario from tblUsuarios where nivel = 0;
select usuario from tblUsuarios where nivel = 1;
select usuario from tblUsuarios where nivel = 2;

-- contar el numero de usuarios por sexo
select sexo, count(*) from tblUsuarios group by sexo;

-- listar el loging y el telefino de los usuarios con compañia telefonica AT&T 
select usuario, telefono from tblUsuarios where compañia = 'AT&T';

-- listar las diferentes compañias en orden alfabetico descendentemente
select distinct compañia from tblUsuarios order by compañia desc; 

-- listar el loging de los usuarios inactivos
select usuario from tblUsuarios where NOT activo;
-- listar los numeros de telefono sin saldo
select telefono from tblUsuarios where saldo <=0;

-- Calcular el saldo minimo de los usuarios de sexo hombre
select min(saldo) from tblUsuarios where sexo = 'H';

-- Listar los numeros de telefono con saldo mayor a 300
select telefono from tblUsuarios where saldo > 300;

-- contar el numero de usuarios  por marca de telefono
select marca, count(*) from tblUsuarios group by marca;

-- listar el nombre y el tefono de los usuarios con telefono que no sea de la marca LG
select nombre, telefono from tblUsuarios where marca <> 'LG';

-- listas las diferentes compañias  en orden alfabetico ascendentemente
select distinct compañia from tblUsuarios order by compañia asc;

-- mostrar el correo de los usuarios que usan hotmail
select email from tblUsuarios where email like '%hotmail.com';

-- Listar el nombre de los usuarios sin saldo o inactivos
select nombre from tblUsuarios where NOT activo OR saldo <=0;

-- Listar el loging y el telefono de los uasuarios con compañia telefonica  ISUCELL o UNEFON
select usuario, telefono from tblUsuarios where compañia in('ISACELL', 'UNEFON'); 



