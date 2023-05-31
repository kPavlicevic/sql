use master;
drop database if exists osnovnaSkola;
go
create database osnovnaSkola;
go
use osnovnaSkola;

create table djecjaRadionica(
	sifra int not null primary key identity (1,1),
	naziv varchar (50) not null,
	brojdjece varchar (50),
	uciteljica int not null
);

create table dijete(
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	oib char (11)
);

create table uciteljica(
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	djecjaRadionica varchar (50)
);

create table djecjaRadionica_dijete(
	sifra int not null primary key identity (1,1),
	dijete int,
	djecjaRadionica int
);


