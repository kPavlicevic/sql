/*Dobrovoljno vatrogasno dru�tvo Branjin Vrh
Dobrovoljno vatrogasno dru�tvo Branjin Vrh je malo vatrogasno dru�tvo u srcu Baranje koje 
djeluje ve� 117 godina. Kako dru�tvo trenutno nema svoju web stranicu, putem ovog projekta 
bih napravila web stranicu dobrovoljnog vatrogasnog dru�tva. Na toj bi stranici krajnji 
korisnici (posjetitelji) mogli pratiti sva doga�anja, �itati vijesti vezane za ovo, ali i 
druga dobrovoljna vatrogasna dru�tva u Baranji i �ire. Korisnici bi mogli kontaktirati 
dru�tvo pomo�u mail adrese, odnosno obrasca koji se �alje na mail adresu te se upisati u 
vatrogasno dru�tvo putem prijavnice dostupne na web adresi. S druge strane poslu�itelji 
informacija mogu vrlo jednostavno najavljivati doga�anja, objavljivati vijesti, postaviti fotografije i sli�no. 
*/


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
	godina varchar (4)
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
	sadr�aj varchar (500),
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