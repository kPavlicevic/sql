use master;
drop database if exists daos;
go
create database daos;
go
use daos;

create table korisnik(
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	telefonskiBroj varchar (10) not null,
);

create table gradivo(
	sifra int not null primary key identity (1,1),
	vrsta varchar (50),
	status varchar (50),
	korisnik int not null
);

create table obrazac(
	sifra int not null primary key identity (1,1),
	korisnik int not null,
	gradivo int not null
);

alter table gradivo add foreign key (korisnik) references korisnik(sifra);
alter table obrazac add foreign key (korisnik) references korisnik(sifra);
alter table obrazac add foreign key (gradivo) references gradivo(sifra);