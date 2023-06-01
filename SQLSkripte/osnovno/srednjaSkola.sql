use master;
drop database if exists srednjaSkola;
go
create database srednjaSkola;
go
use srednjaSkola;

create table razred(
	sifra int not null primary key identity (1,1),
	naziv varchar (50) not null,
	profesor int not null
);

create table ucenik(
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	oib char (11),
	razred int not null
);

create table profesor(
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	razred int not null
);

create table razred_profesor(
	sifra int not null primary key identity (1,1),
	razred int,
	profesor int
);