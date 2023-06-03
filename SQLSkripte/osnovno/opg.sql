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