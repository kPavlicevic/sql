/*Zbirka matiènih knjiga DAOS
Zbirka matiènih knjiga Državnog arhiva u Osijeku trenutno broji skoro 1400 matiènih knjiga roðenih, 
vjenèanih i umrlih rimokatolièke, pravoslavne, židovske te drugih vjeroispovijesti iz razdoblja od 1686. 
do 1900. godine s podruèja Osjeèko-baranjske, Virovitièko-podravske i Vukovarsko-srijemske županije. 
Pravo na korištenje arhivskog gradiva prema Pravilniku o korištenju arhivskog gradiva imaju svi korisnici
pod jednakim uvjetima. Meðutim, javno gradivo koje se odnosi na osobne podatke, kao što su matiène knjige, 
dostupno je za korištenje 70 godina nakon svog nastanka, odnosno 100 godina od roðenja osobe na koju se odnosi. 
No, kao i sve ostalo arhivsko gradivo koje se èuva u arhivskim ustanovama na korištenje se daje iskljuèivo u 
arhivskim èitaonicama gdje korisnik podnosi pisani zahtjev na posebnom obrascu. Ovim projektom cilj je 
korisnicima omoguæiti pregled i rezervaciju arhivskog gradiva te time znatnije vremenski skratiti postupak 
rješavanja zahtjeva korisnika i dostupnosti gradiva.
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
	('Stipo','Stipiæ','0985126478'),
	('Kata','Katiæ','0995214789'),
	('Domagoj','Domiæ','0995024587');


select * from gradivo;

insert into gradivo (vrsta,status,korisnik)
values
	('knjiga roðenih','dostupno',1),
	('knjiga vjenèanih','nedostupno',2),
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

