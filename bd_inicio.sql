use inicio;
Create Table user(
id int not null auto_increment,
name varchar(50) not null,
edad int not null,
email varchar(100) not null,
primary key(id)
);

insert into user (name, edad, email) values('Juan', 25, 'juan@juan.com');
insert into user (name, edad, email) values('Pedro', 26, 'pedro@pedro.com');
insert into user (name, edad, email) values('Maria', 24, 'Maria@maria.com');
insert into user (name, edad, email) values('Nicolas', 20, 'Nicolas@nicolas.com');

select * from user;
select * from user limit 2;

select * from user where edad>25;
select * from user where edad>=25;
select * from user where edad>=25 and email = 'juan@juan.com';
select * from user where email != 'juan@juan.com';
select * from user where edad between 24 and 26;
select * from user where email like '%com';
select * from user where email like 'juan%';

select * from user order by edad  asc;
select * from user order by edad  desc;

select max(edad) as mayor from user;
select min(edad) as menor from user;

select id, name from user;

select id, name as nombre from user;