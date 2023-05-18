use master;
drop database if exists djecjiVrtic;
go
create database djecjiVrtic;
go
use djecjiVrtic;

create table odgojnaSkupina (
	sifra int not null primary key identity (1,1),
	naziv varchar (50),
	starost int
);

create table dijete (
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	starost int,
	odgojnaSkupina int not null
);

create table odgajateljica (
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	strucnaSprema varchar (50) not null,
	odgojnaSkupina int not null
);

alter table dijete add foreign key (odgojnaSkupina) references odgojnaSkupina(sifra);
alter table odgajateljica add foreign key (odgojnaSkupina) references odgojnaSkupina(sifra);