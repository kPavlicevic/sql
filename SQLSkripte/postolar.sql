use master;
drop database if exists postolar;
go
create database postolar;
go
use postolar;

create table korisnik (
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	telefonskiBroj char (50) not null,
	obuca int,
	postolar int
);

create table postolar (
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	popravak int,
	korisnik int
);

create table obuca (
	sifra int not null primary key identity (1,1),
	postolar int,
	korisnik int
);

create table popravak (
	sifra int not null primary key identity (1,1),
	korisnik int,
	postolar int,
	obuca int,
	cijena decimal (18,2) not null
);

alter table obuca add foreign key (korisnik) references korisnik(sifra);
alter table obuca add foreign key (postolar) references postolar(sifra);
alter table popravak add foreign key (obuca) references obuca(sifra);