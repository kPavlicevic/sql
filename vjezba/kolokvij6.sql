use master;
drop database if exists kolokvij6;
go
create database kolokvij6;
go
use kolokvij6;

/*0. Kreirajte tablice i veze izmeðu tablica.*/

create table punac (
	id int not null primary key identity (1,1),
	ekstroventno bit not null,
	suknja varchar (30) not null,
	majica varchar (44) not null,
	prviPuta datetime not null
);

create table svekrva (
	id int not null primary key identity (1,1),
	hlace varchar (48) not null,
	suknja varchar (42) not null,
	ogrlica int not null,
	treciPuta datetime not null,
	dukserica varchar (32) not null,
	narukvica int not null,
	id_punac int
);

create table ostavljena (
	id int not null primary key identity (1,1),
	prviPuta datetime not null,
	kratkaMajica varchar (39) not null,
	drugiPuta datetime,
	maraka decimal (14,10) 
);

create table prijatelj_ostavljena (
	id int not null primary key identity (1,1),
	id_prijatelj int not null,
	id_ostavljena int not null
);

create table prijatelj (
	id int not null primary key identity (1,1),
	haljina varchar (35),
	prstena int not null,
	introvertno bit,
	stilFrizura varchar (36) not null
);

create table brat (
	id int not null primary key identity (1,1),
	nausnica int not null,
	treciPuta datetime not null,
	narukvica int not null,
	hlace varchar (31),
	id_prijatelj int
);

create table zena (
	id int not null primary key identity (1,1),
	novcica decimal (14,8) not null,
	narukvica int not null,
	dukserica varchar (40) not null,
	haljina varchar (30),
	hlace varchar (32),
	id_brat int not null
);

create table decko (
	id int not null primary key identity (1,1),
	prviPuta datetime,
	modelNaocala varchar (41),
	nausnica int,
	id_zena int not null
);

alter table svekrva add foreign key (id_punac) references punac(id);
alter table prijatelj_ostavljena add foreign key (id_ostavljena) references ostavljena(id);
alter table prijatelj_ostavljena add foreign key (id_prijatelj) references prijatelj(id);
alter table brat add foreign key (id_prijatelj) references prijatelj(id);
alter table zena add foreign key (id_brat) references brat(id);
alter table decko add foreign key (id_zena) references zena(id);

/*1. U tablice zena, brat i prijatelj_ostavljena unesite po 3 retka.*/

select * from ostavljena;

insert into ostavljena (prviPuta,kratkaMajica)
values
	('2021-06-13','uska'),
	('2022-07-15','siroka'),
	('2023-08-02','uska');

select * from prijatelj;

insert into prijatelj (prstena,stilFrizura)
values
	('1','kratka'),
	('2','dugacka'),
	('3','frckava');

select * from prijatelj_ostavljena;

insert into prijatelj_ostavljena (id_prijatelj,id_ostavljena)
values
	(1,1),
	(2,2),
	(3,3);

select * from brat;

insert into brat (nausnica,treciPuta,narukvica)
values
	('5','2023-04-06','15'),
	('6','2023-12-05','16'),
	('7','2023-10-16','17');

select * from zena;

insert into zena (novcica,narukvica,dukserica,id_brat)
values
	('34.12','1','siroka',1),
	('56.98','2','uska',2),
	('100.31','3','kratka',3);

/*2. U tablici svekrva postavite svim zapisima kolonu suknja na 
vrijednost Osijek.*/

update svekrva set suknja='Osijek';

/*3. U tablici decko obrišite sve zapise èija je vrijednost kolone 
modelnaocala manje od AB.*/

delete from decko where modelNaocala<'AB';

/*4. Izlistajte narukvica iz tablice brat uz uvjet da vrijednost kolone 
treciputa nepoznate. */

select narukvica from brat where treciPuta is null;

/*5. Prikažite drugiputa iz tablice ostavljena, zena iz tablice decko te 
narukvica iz tablice zena uz uvjet da su vrijednosti kolone treciputa iz 
tablice brat poznate te da su vrijednosti kolone prstena iz tablice 
prijatelj jednake broju 219. Podatke posložite po narukvica iz tablice 
zena silazno. */

select a.drugiPuta, f.id_zena, e.narukvica
from ostavljena a 
inner join prijatelj_ostavljena b on a.id=b.id_ostavljena
inner join prijatelj c on c.id=b.id_prijatelj
inner join brat d on c.id=d.id_prijatelj
inner join zena e on d.id=e.id_brat
inner join decko f on e.id=f.id_zena
where d.treciPuta is not null and c.prstena='219'
order by e.narukvica desc;

/* 6. Prikažite kolone prstena i introvertno iz tablice prijatelj èiji se 
primarni kljuè ne nalaze u tablici prijatelj_ostavljena.*/

select prstena, introvertno from prijatelj
where id not in (select id_prijatelj from prijatelj_ostavljena);
