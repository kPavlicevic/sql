use master;
drop database if exists dvCrvenkapica;
go
create database dvCrvenkapica;
go
use dvCrvenkapica;

create table dijete(
	sifra int not null primary key identity (1,1),
	ime varchar (50),
	prijava int not null,
	odgojnaSkupina int not null
);

create table vrtic(
	sifra int not null primary key identity (1,1),
	kontakt varchar (10) not null,
	naziv varchar (50) not null,
	lokacija varchar (50) not null
);

create table odgojnaSkupina(
	sifra int not null primary key identity (1,1),
	naziv varchar (50) not null,
	starost int not null,
	opis varchar (200),
	popisa varchar (200)
);

create table galerija(
	sifra int not null primary key identity (1,1),
	vrtic int not null,
	slike image,
	naziv varchar (50)
);

create table prijava(
	sifra int not null primary key identity (1,1),
	dijete int not null,
	vrtic int not null
);