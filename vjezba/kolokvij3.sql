use master;
drop database if exists kolokvij3;
go
create database kolokvij3;
go
use kolokvij3;


/*0. Kreirajte tablice (16) i veze izmeðu tablica. */

create table cura (
	id int not null primary key identity (1,1),
	dukserica varchar (49),
	maraka decimal (13,7),
	drugiPuta datetime,
	majica varchar (49),
	novcica decimal (15,8),
	ogrlica int not null
);

create table svekar (
	id int not null primary key identity (1,1),
	novcica decimal (16,8) not null,
	suknja varchar (44) not null,
	bojaKose varchar (36),
	prstena int,
	narukvica int not null,
	id_cura int not null
);

create table brat (
	id int not null primary key identity (1,1),
	jmbag char (11),
	ogrlica int not null,
	ekstroventno bit not null
);

create table prijatelj_brat (
	id int not null primary key identity (1,1),
	id_prijatelj int not null,
	id_brat int not null
);

create table prijatelj (
	id int not null primary key identity (1,1),
	kuna decimal (16,10),
	haljina varchar (37),
	lipa decimal (13,10),
	dukserica varchar (31),
	indiferentno bit not null
);

create table ostavljena (
	id int not null primary key identity (1,1),
	kuna decimal (17,5),
	lipa decimal (15,6),
	majica varchar (36),
	modelNaocala varchar (31) not null,
	id_prijatelj int
);

create table snasa (
	id int not null primary key identity (1,1),
	introvertno bit,
	kuna decimal (15,6) not null,
	eura decimal (12,9) not null,
	treciPuta datetime,
	id_ostavljena int not null
);

create table punica (
	id int not null primary key identity (1,1),
	asocijalno bit,
	kratkaMajica varchar (44),
	kuna decimal (13,8) not null,
	vesta varchar (32) not null,
	id_snasa int
);

alter table svekar add foreign key (id_cura) references cura(id);
alter table prijatelj_brat add foreign key (id_brat) references brat(id);
alter table prijatelj_brat add foreign key (id_prijatelj) references prijatelj(id);
alter table ostavljena add foreign key (id_prijatelj) references prijatelj(id);
alter table snasa add foreign key (id_ostavljena) references ostavljena(id);
alter table punica add foreign key (id_snasa) references snasa(id);


/*1. U tablice snasa, ostavljena i prijatelj_brat unesite po 3 retka. */

select * from brat;

insert into brat (ogrlica,ekstroventno)
values
	('12','0'),
	('4','1'),
	('5','0');

select * from prijatelj;

insert into prijatelj (indiferentno)
values
	('0'),
	('1'),
	('0');

select * from prijatelj_brat;

insert into prijatelj_brat (id_prijatelj,id_brat)
values
	(1,4),
	(2,5),
	(3,6);

select * from ostavljena;

insert into ostavljena (modelNaocala)
values
	('okrugle'),
	('kockaste'),
	('zvjezdaste');

select * from snasa;

insert into snasa (kuna,eura,id_ostavljena)
values
	('32.50','4.32',1),
	('150.36','20.35',2),
	('360.41','50.60',3);

select * from punica;

insert into punica (kuna,vesta)
values
	('356.12','pamucna'),
	('435.72','vunena'),
	('120.56','pamucna');


/*2. U tablici svekar postavite svim zapisima kolonu suknja na 
vrijednost Osijek. */

update svekar set suknja='Osijek';

/* 3. U tablici punica obrišite sve zapise èija je vrijednost kolone 
kratkamajica jednako AB. */

delete from punica where kratkaMajica='AB';

/* 4. Izlistajte majica iz tablice ostavljena uz uvjet da vrijednost kolone 
lipa nije 9,10,20,30 ili 35. */

select majica from ostavljena where lipa not in ('9','10','20','30','35');

/*5. Prikažite ekstroventno iz tablice brat, vesta iz tablice punica te 
kuna iz tablice snasa uz uvjet da su vrijednosti kolone lipa iz tablice 
ostavljena razlièito od 91 te da su vrijednosti kolone haljina iz tablice 
prijatelj sadrže niz znakova ba. Podatke posložite po kuna iz tablice 
snasa silazno. */

select a.ekstroventno, f.vesta, e.kuna
from brat a
inner join prijatelj_brat b on a.id=b.id_brat
inner join prijatelj c on b.id_prijatelj=c.id
inner join ostavljena d on d.id_prijatelj=c.id
inner join snasa e on d.id=e.id_ostavljena
inner join punica f on e.id=f.id_snasa
where d.lipa!='91' and c.haljina like '%nt%'
order by e.kuna desc;

/* 6. Prikažite kolone haljina i lipa iz tablice prijatelj èiji se primarni kljuè 
ne nalaze u tablici prijatelj_brat. */

select prijatelj.haljina, prijatelj.lipa from prijatelj
where id not in (select id_prijatelj from prijatelj_brat);