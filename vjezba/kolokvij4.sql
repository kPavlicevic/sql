use master;
drop database if exists kolokvij4;
go
create database kolokvij4;
go
use kolokvij4;


/*0. Kreirajte tablice (16) i veze izmeðu tablica.*/

create table ostavljen (
	id int not null primary key identity (1,1),
	modelNaocala varchar (48),
	introvertno bit,
	kuna decimal (14,10)
);

create table punac (
	id int not null primary key identity (1,1),
	treciPuta datetime,
	majica varchar (46),
	jmbag char (11) not null,
	novcica decimal (18,7) not null,
	maraka decimal (12,6) not null,
	id_ostavljen int not null
);

create table mladic (
	id int not null primary key identity (1,1),
	kuna decimal (15,9),
	lipa decimal (18,5),
	nausnica int,
	stilFrizura varchar (49),
	vesta varchar (34) not null
);

create table zena_mladic (
	id int not null primary key identity (1,1),
	id_zena int not null,
	id_mladic int not null
);

create table zena (
	id int not null primary key identity (1,1),
	suknja varchar (39) not null,
	lipa decimal (18,7),
	prstena int not null
);

create table snasa (
	id int not null primary key identity (1,1),
	introvertno bit,
	treciPuta datetime,
	haljina varchar (44) not null,
	id_zena int not null
);

create table becar (
	id int not null primary key identity (1,1),
	novcica decimal (14,8),
	kratkaMajica varchar (48) not null,
	bojaOciju varchar (36) not null,
	id_snasa int not null
);

create table prijatelj (
	id int not null primary key identity (1,1),
	eura decimal (16,9),
	prstena int not null,
	gustoca decimal (16,5),
	jmbag char (11) not null,
	suknja varchar (47) not null,
	id_becar int not null
);

alter table punac add foreign key (id_ostavljen) references ostavljen(id);
alter table zena_mladic add foreign key (id_mladic) references mladic(id);
alter table zena_mladic add foreign key (id_zena) references zena(id);
alter table snasa add foreign key (id_zena) references zena(id);
alter table becar add foreign key (id_snasa) references snasa(id);
alter table prijatelj add foreign key (id_becar) references becar(id);


/*1. U tablice becar, snasa i zena_mladic unesite po 3 retka. */

select * from mladic;

insert into mladic (vesta)
values
	('pamucna'),
	('lanena'),
	('sintetika');

select * from zena;

insert into zena (suknja,prstena)
values
	('dugacka','2'),
	('kratka','4'),
	('leprsava','3');

select * from zena_mladic;

insert into zena_mladic (id_zena,id_mladic)
values
	(1,1),
	(2,2),
	(3,3);

select * from snasa;

insert into snasa (haljina,id_zena)
values
	('kratka',1),
	('uska',2),
	('dugacka',3);

select * from becar;

insert into becar (kratkaMajica,bojaOciju,id_snasa)
values
	('uska','zelena',1),
	('siroka','plava',2),
	('normal','smeda',3);


/*2. U tablici punac postavite svim zapisima kolonu majica na 
vrijednost Osijek.*/

update punac set majica='Osijek';


/*3. U tablici prijatelj obrišite sve zapise èija je vrijednost kolone 
prstena veæe od 17.*/

delete from prijatelj where prstena>'17';

/*4. Izlistajte haljina iz tablice snasa uz uvjet da vrijednost kolone 
treciputa nepoznate.*/

select haljina from snasa where treciPuta is null;

/* 5. Prikažite nausnica iz tablice mladic, jmbag iz tablice prijatelj te 
kratkamajica iz tablice becar uz uvjet da su vrijednosti kolone 
treciputa iz tablice snasa poznate te da su vrijednosti kolone lipa iz 
tablice zena razlièite od 29. Podatke posložite po kratkamajica iz 
tablice becar silazno.  */

select a.nausnica, f.jmbag, e.kratkaMajica
from mladic a
inner join zena_mladic b on a.id=b.id_mladic
inner join zena c on c.id=b.id_zena
inner join snasa d on c.id=d.id_zena
inner join becar e on d.id=e.id_snasa
inner join prijatelj f on e.id=f.id_becar
where d.treciPuta is not null and c.lipa!='29'
order by e.kratkaMajica desc;

/*6. Prikažite kolone lipa i prstena iz tablice zena èiji se primarni kljuè 
ne nalaze u tablici zena_mladic.*/

select zena.lipa, zena.prstena from zena
where id not in (select id_zena from zena_mladic);