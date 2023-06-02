use master;
drop database if exists trgovackiCentar;
go
create database trgovackiCentar;
go
use trgovackiCentar;

create table trgovina(
	sifra int not null primary key identity (1,1),
	naziv varchar (50) not null,
	sef varchar (50) not null
);

create table osoba(
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	oib char (11),
	sef varchar (50) not null
);

create table trgovina_osoba(
	sifra int not null primary key identity (1,1),
	trgovina int not null,
	osoba int not null
);

alter table trgovina_osoba add foreign key (trgovina) references trgovina(sifra);
alter table trgovina_osoba add foreign key (osoba) references osoba(sifra);