use master;
drop database if exists frizerskiSalon;
go
create database frizerskiSalon;
go
use frizerskiSalon;

create table termin(
	sifra int not null primary key identity (1,1),
	datum datetime,
	korisnik int,
	usluga int,
	djelatnik int not null
);

create table djelatnik(
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null
);

create table usluga(
	sifra int not null primary key identity (1,1),
	naziv varchar (50) not null,
	cijena decimal (18,2) null
);

create table korisnik(
	sifra int not null primary key identity (1,1),
	spol bit,
	duzinaKose decimal (5,2)
);

alter table termin add foreign key (djelatnik) references djelatnik(sifra);
alter table termin add foreign key (usluga) references usluga(sifra);
alter table termin add foreign key (korisnik) references korisnik(sifra);



 
