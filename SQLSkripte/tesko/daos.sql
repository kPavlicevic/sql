/*Zbirka mati�nih knjiga DAOS
Zbirka mati�nih knjiga Dr�avnog arhiva u Osijeku trenutno broji skoro 1400 mati�nih knjiga ro�enih, 
vjen�anih i umrlih rimokatoli�ke, pravoslavne, �idovske te drugih vjeroispovijesti iz razdoblja od 1686. 
do 1900. godine s podru�ja Osje�ko-baranjske, Viroviti�ko-podravske i Vukovarsko-srijemske �upanije. 
Pravo na kori�tenje arhivskog gradiva prema Pravilniku o kori�tenju arhivskog gradiva imaju svi korisnici
pod jednakim uvjetima. Me�utim, javno gradivo koje se odnosi na osobne podatke, kao �to su mati�ne knjige, 
dostupno je za kori�tenje 70 godina nakon svog nastanka, odnosno 100 godina od ro�enja osobe na koju se odnosi. 
No, kao i sve ostalo arhivsko gradivo koje se �uva u arhivskim ustanovama na kori�tenje se daje isklju�ivo u 
arhivskim �itaonicama gdje korisnik podnosi pisani zahtjev na posebnom obrascu. Ovim projektom cilj je 
korisnicima omogu�iti pregled i rezervaciju arhivskog gradiva te time znatnije vremenski skratiti postupak 
rje�avanja zahtjeva korisnika i dostupnosti gradiva.
*/

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


select * from korisnik;

insert into korisnik (ime,prezime,telefonskiBroj)
values
	('Stipo','Stipi�','0985126478'),
	('Kata','Kati�','0995214789'),
	('Domagoj','Domi�','0995024587');


select * from gradivo;

insert into gradivo (vrsta,status,korisnik)
values
	('knjiga ro�enih','dostupno',1),
	('knjiga vjen�anih','nedostupno',2),
	('knjiga umrlih','dostupno',3);

select * from obrazac;

insert into obrazac (korisnik,gradivo)
values
	(1,1),
	(2,2),
	(3,3);


select * from gradivo;

update gradivo set status='dostupno'
where sifra=2;

select * from korisnik;

delete from gradivo where korisnik=3;
delete from korisnik where sifra=3;

