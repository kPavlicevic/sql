/* Dje�ji vrti� "Crvenkapica" 
Dje�ji vrti� "Crvenkapica" jedini vrti� u najisto�nijem gradu u Hrvatskoj, u Iloku, otvoren je davne
1889. godine i kroz njega su pro�le brojne generacije djece. 
Na�alost, zbog nedostatka financija, vrti� nije u mogu�nosti priu�titi si web stranicu,
te sam odlu�ila ovaj projekt napraviti za njih. S obzirom kako puno roditelja danas radi 
i nemaju kamo ostaviti dijete, vrti� je odli�no mjesto za njih. Putem ove stranice, roditelji 
�e svoje dijete mo�i upisati u vrti� putem "Prijava" te tako stalno biti u toku doga�aja.
Osim doga�aja, na stranici �e se nalaziti osnovne informacije o vrti�u, popisi i opisi
odgojnih skupina, razne galerija s doga�aja te kontakt.
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

