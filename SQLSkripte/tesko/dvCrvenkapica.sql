/* Djeèji vrtiæ "Crvenkapica" 
Djeèji vrtiæ "Crvenkapica" jedini vrtiæ u najistoènijem gradu u Hrvatskoj, u Iloku, otvoren je davne
1889. godine i kroz njega su prošle brojne generacije djece. 
Nažalost, zbog nedostatka financija, vrtiæ nije u moguænosti priuštiti si web stranicu,
te sam odluèila ovaj projekt napraviti za njih. S obzirom kako puno roditelja danas radi 
i nemaju kamo ostaviti dijete, vrtiæ je odlièno mjesto za njih. Putem ove stranice, roditelji 
æe svoje dijete moæi upisati u vrtiæ putem "Prijava" te tako stalno biti u toku dogaðaja.
Osim dogaðaja, na stranici æe se nalaziti osnovne informacije o vrtiæu, popisi i opisi
odgojnih skupina, razne galerija s dogaðaja te kontakt.
*/



use master;
drop database if exists dvCrvenkapica;
go
create database dvCrvenkapica;
go
use dvCrvenkapica;

create table dijete(
	sifra int not null primary key identity (1,1),
	ime varchar (50),
	odgojnaSkupina int not null
);

create table vrtic(
	sifra int not null primary key identity (1,1),
	kontakt varchar (10) not null,
	naziv varchar (50) not null,
	lokacija varchar (50) not null
);

create table odgojnaSkupina(
	sifra int not null primary key identity (1,1),
	naziv varchar (50) not null,
	starost int not null,
	opis varchar (200)
);

create table galerija(
	sifra int not null primary key identity (1,1),
	vrtic int not null,
	slike image,
	naziv varchar (50)
);

create table prijava(
	sifra int not null primary key identity (1,1),
	dijete int not null,
	vrtic int not null
);

alter table prijava add foreign key (dijete) references dijete(sifra);
alter table prijava add foreign key (vrtic) references vrtic(sifra);
alter table dijete add foreign key (odgojnaSkupina) references odgojnaSkupina(sifra);
alter table galerija add foreign key (vrtic) references vrtic(sifra);

select * from vrtic;

insert into vrtic (kontakt,naziv,lokacija)
values
	('0998547851','Crvenkapica','Osijek');

select * from odgojnaSkupina;

insert into odgojnaSkupina (naziv,starost,opis)
values
	('Crvene kape','3','dijete u starosti od 3 godine');
	
select * from dijete;

insert into dijete (ime,odgojnaSkupina)
values
	('Ivan',1);

select * from prijava;

insert into prijava (vrtic,dijete)
values
	(1,1),(1,2);


select * from odgojnaSkupina;

update odgojnaSkupina set naziv='Crvene kapice'
where sifra=1;

