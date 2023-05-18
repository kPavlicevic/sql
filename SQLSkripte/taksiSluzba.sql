use master;
drop database if exists taksiSluzba;
go
create database taksiSluzba;
go
use taksiSluzba;

create table vozilo (
	sifra int not null primary key identity (1,1),
	vozac varchar (50) not null,
	putnik varchar (50) not null
);

create table vozac (
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	putnik varchar (50) not null,
	vozilo int not null
);

create table voznja (
	sifra int not null primary key identity (1,1),
	vozac varchar (50) not null,
	vozilo varchar (50) not null,
	putnik int not null
);

create table putnik (
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	voznja varchar (50) not null,
	vozac int not null
	
);

alter table vozac add foreign key (vozilo) references vozilo(sifra);
alter table putnik add foreign key (vozac) references vozac(sifra);
alter table voznja add foreign key (putnik) references putnik(sifra);
