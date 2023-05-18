use master;
drop database if exists salonZaUljepsavanje;
go
create database salonZaUljepsavanje;
go
use salonZaUljepsavanje;

create table termin(
	sifra int not null primary key identity (1,1),
	datum datetime,
	korisnik int not null,
	usluga int not null,
	djelatnik int not null
);

create table korisnik (
	sifra int not null primary key identity (1,1),
	spol bit,
	duzinaKose decimal (5,2)
);

create table usluga (
	sifra int not null primary key identity (1,1),
	naziv varchar (50) not null,
	cijena decimal (18,2) null
);

create table djelatnik (
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null
);

alter table termin add foreign key (korisnik) references korisnik(sifra);
alter table termin add foreign key (usluga) references usluga(sifra);
alter table termin add foreign key (djelatnik) references djelatnik(sifra);