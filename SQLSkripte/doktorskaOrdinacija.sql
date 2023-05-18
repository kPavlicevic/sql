use master;
drop database if exists doktorskaOrdinacija;
go
create database doktorskaOrdinacija;
go
use doktorskaOrdinacija;

create table doktor (
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	pacijent int,
	lijecenje int,
	medicinskaSestra int
);

create table pacijent (
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	doktor int
);

create table lijecenje (
	sifra int not null primary key identity (1,1),
	vrsta varchar (50) not null,
	medicinskaSestra int,
	pacijent int
);

create table medicinskaSestra (
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	doktor int
);

alter table pacijent add foreign key (doktor) references doktor(sifra);
alter table lijecenje add foreign key (pacijent) references pacijent(sifra);
alter table medicinskaSestra add foreign key (doktor) references doktor(sifra);