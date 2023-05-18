use master;
drop database if exists udrugaZaZastituZivotinja;
go 
create database udrugaZaZastituZivotinja;
go
use udrugaZaZastituZivotinja;

create table udruga (
	sifra int not null primary key identity (1,1),
	naziv varchar (50) not null,
	lokacija varchar (50) not null
);

create table osoba (
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	udruga int not null,
);

create table sticenik (
	sifra int not null primary key identity (1,1),
	vrsta varchar (50) not null,
	starost int,
	prostorija int not null,
	osoba int not null,
	udruga int not null
);

create table prostorija (
	sifra int not null primary key identity (1,1),
	tip varchar,
	velièina decimal (18,2)
);

alter table osoba add foreign key (udruga) references udruga(sifra);
alter table sticenik add foreign key (osoba) references osoba(sifra);
alter table sticenik add foreign key (udruga) references udruga(sifra);
alter table sticenik add foreign key (prostorija) references prostorija(sifra);