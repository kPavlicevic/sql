/*Dobrovoljno vatrogasno društvo Branjin Vrh
Dobrovoljno vatrogasno društvo Branjin Vrh je malo vatrogasno društvo u srcu Baranje koje 
djeluje veæ 117 godina. Kako društvo trenutno nema svoju web stranicu, putem ovog projekta 
bih napravila web stranicu dobrovoljnog vatrogasnog društva. Na toj bi stranici krajnji 
korisnici (posjetitelji) mogli pratiti sva dogaðanja, èitati vijesti vezane za ovo, ali i 
druga dobrovoljna vatrogasna društva u Baranji i šire. Korisnici bi mogli kontaktirati 
društvo pomoæu mail adrese, odnosno obrasca koji se šalje na mail adresu te se upisati u 
vatrogasno društvo putem prijavnice dostupne na web adresi. S druge strane poslužitelji 
informacija mogu vrlo jednostavno najavljivati dogaðanja, objavljivati vijesti, postaviti fotografije i slièno. 
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
	godina varchar (10)
);

create table korisnik(
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	email varchar (50) not null
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
	sadrzaj varchar (50),
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


select * from dvdBranjinVrh;

insert into dvdBranjinVrh (email,naziv,godina)
values
	('dvdbranjinvrh@gmail.com','Branjin Vrh','1989');

select * from korisnik;

insert into korisnik (ime,prezime,email)
values
	('Miro','Miriæ','miromiric@gmail.com'),
	('Ivo','Iviæ','ivoivic5@gmail.com'),
	('Stipo','Stipiæ','stipostipic34@gmail.com');

select * from vijesti;

insert into vijesti (dvdBranjinVrh,slika,vrijeme)
values
	(1,'vatrogasci','2022-04-10 18:00:00'),
	(1,'požar','2023-05-26 16:00:00'),
	(1,'priroda','2023-01-05 07:00:00');

select * from dogadanja;

insert into dogadanja (dvdBranjinVrh,slika,vrijeme,lokacija)
values
	(1,'godisnjica dvda','2022-06-20 12:00:00','Branjin Vrh'),
	(1,'vježba','2023-04-05 12:00:00','Branjin Vrh');

select * from prijavnica;

insert into prijavnica (dvdBranjinVrh,korisnik)
values
	(1,1),
	(1,2),
	(1,3);

select * from obrazac;

insert into obrazac (dvdBranjinVrh,korisnik)
values
	(1,1),
	(1,2),
	(1,3);