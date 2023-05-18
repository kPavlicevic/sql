use master;
drop database if exists urarSilvija;
go
create database urarSilvija;
go
use urarSilvija;

create table korisnik (
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	telefonskiBroj char (50) not null,
	sat int,
	urar int
);

create table urarSilvija (
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	popravak int,
	korisnik int
);

create table sat (
	sifra int not null primary key identity (1,1),
	urarSilvija int,
	korisnik int
);

create table popravak (
	sifra int not null primary key identity (1,1),
	korisnik int,
	urarSilvija int,
	sat int,
	cijena decimal (18,5) not null
);

alter table sat add foreign key (korisnik) references korisnik(sifra);
alter table sat add foreign key (urarSilvija) references urarSilvija(sifra);
alter table popravak add foreign key (sat) references sat(sifra);