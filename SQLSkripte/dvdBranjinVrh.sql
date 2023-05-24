use master;
drop database if exists dvdBranjinVrh;
go
create database dvdBranjinVrh;
go
use dvdBranjinVrh;

create table dvdBranjinVrh(
	sifra int not null primary key identity (1,1),
	email varchar (50) not null,
	naziv varchar (50) not null,
	godina char (4)
);

create table korisnik(
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	email varchar (50)
);

create table obrazac(
	sifra int not null primary key identity (1,1),
	korisnik int not null,
	dvdBranjinVrh int not null
);

create table prijavnica(
	sifra int not null primary key identity (1,1),
	korisnik int not null,
	dvdBranjinVrh int not null
);

create table vijesti(
	sifra int not null primary key identity (1,1),
	dvdBranjinVrh int not null,
	slika image,
	sadržaj varchar (500),
	vrijeme time
);

create table dogadanja(
	sifra int not null primary key identity (1,1),
	dvdBranjinVrh int not null,
	slika image,
	vrijeme time,
	lokacija varchar (50)
);


alter table obrazac add foreign key (korisnik) references korisnik(sifra);
alter table obrazac add foreign key (dvdBranjinVrh) references dvdBranjinVrh(sifra);
alter table prijavnica add foreign key (korisnik) references korisnik(sifra);
alter table prijavnica add foreign key (dvdBranjinVrh) references dvdBranjinVrh(sifra);
alter table vijesti add foreign key (dvdBranjinVrh) references dvdBranjinVrh(sifra);
alter table dogadanja add foreign key (dvdBranjinVrh) references dvdBranjinVrh(sifra);