/*16.	Obiteljsko poljoprivredno gospodarstvo 
OPG proizvodi proizvode od sirovina koje sami uzgoje. 
Jedan proizvod se može sastojati od više sirovina. Jedna 
sirovina se može nalaziti u više proizvoda. Jedan djelatnik 
OPG-a je odgovoran za jedan ili više proizvoda.
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
	('rajèica','povræe'),
	('šljive','voæe'),
	('jagode','voæe');

select * from djelatnik;

insert into djelatnik (ime,prezime)
values
	('Šima','Šimiæ'),
	('Želja','Željaniæ'),
	('Ivica','Iviæ');

select * from proizvod;

insert into proizvod (naziv,djelatnik)
values
	('pasirana rajèica',1),
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
