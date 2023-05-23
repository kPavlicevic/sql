use master;
drop database if exists doktorskaOrdinacija;
go
create database doktorskaOrdinacija;
go
use doktorskaOrdinacija;

create table doktor (
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
);

create table pacijent (
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	doktor int
);

create table lijecenje (
	sifra int not null primary key identity (1,1),
	vrsta varchar (50) not null,
	medicinskaSestra int,
	pacijent int
);

create table medicinskaSestra (
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	doktor int
);

alter table pacijent add foreign key (doktor) references doktor(sifra);
alter table lijecenje add foreign key (pacijent) references pacijent(sifra);
alter table medicinskaSestra add foreign key (doktor) references doktor(sifra);


select * from doktor;

insert into doktor (ime,prezime)
values
	('Vesna','Vesniæ'),
	('Jasenka','Jasniæ'),
	('Janko','Janiæ');

select * from pacijent;

insert into pacijent (ime,prezime,doktor)
values
	('Kata','Katiæ',1),
	('Iva','Iviæ',2),
	('Dodo','Dodiæ',3);

select * from medicinskaSestra;

insert into medicinskaSestra (ime,prezime,doktor)
values 
	('Tina','Tiniæ',1),
	('Josipa','Joziæ',2),
	('Maja','Majiæ',3);

select * from lijecenje;

insert into lijecenje (vrsta,medicinskaSestra,pacijent)
values
	('antibiotici',1,1),
	('fizikalna terapija',2,2),
	('kemoterapija',3,3);


select * from lijecenje;

update lijecenje set vrsta='imunoterapija'
where sifra=3;

select * from lijecenje;

delete from lijecenje where sifra=2;

