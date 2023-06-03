/*16.	Obiteljsko poljoprivredno gospodarstvo 
OPG proizvodi proizvode od sirovina koje sami uzgoje. 
Jedan proizvod se mo�e sastojati od vi�e sirovina. Jedna 
sirovina se mo�e nalaziti u vi�e proizvoda. Jedan djelatnik 
OPG-a je odgovoran za jedan ili vi�e proizvoda.
*/

use master;
drop database if exists opg;
go
create database opg;
go
use opg;

create table proizvod (
	sifra int not null primary key identity (1,1),
	naziv varchar (50) not null,
	djelatnik int not null
);

create table sirovina (
	sifra int not null primary key identity (1,1),
	naziv varchar (50) not null,
	vrsta varchar (50) not null
);

create table proizvod_sirovina (
	sifra int not null primary key identity (1,1),
	proizvod int not null,
	sirovina int not null
);

create table djelatnik (
	sifra int not null primary key identity (1,1),
	ime varchar (50)  not null,
	prezime varchar (50) not null
);

alter table proizvod add foreign key (djelatnik) references djelatnik(sifra);
alter table proizvod_sirovina add foreign key (proizvod) references proizvod(sifra);
alter table proizvod_sirovina add foreign key (sirovina) references sirovina(sifra);


select * from sirovina;

insert into sirovina (naziv,vrsta)
values
	('raj�ica','povr�e'),
	('�ljive','vo�e'),
	('jagode','vo�e');

select * from djelatnik;

insert into djelatnik (ime,prezime)
values
	('�ima','�imi�'),
	('�elja','�eljani�'),
	('Ivica','Ivi�');

select * from proizvod;

insert into proizvod (naziv,djelatnik)
values
	('pasirana raj�ica',1),
	('kompot',2),
	('marmelada',3);

select * from proizvod_sirovina;

insert into proizvod_sirovina (proizvod,sirovina)
values
	(1,1),
	(2,2),
	(3,3);


update proizvod set naziv='pekmez'
where sifra=3;


delete from proizvod where djelatnik=2;
delete from proizvod_sirovina where sifra=2;
delete from djelatnik where sifra=2;
