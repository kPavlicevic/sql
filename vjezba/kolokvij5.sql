use master;
drop database if exists kolokvij5;
go
create database kolokvij5;
go
use kolokvij5;


/*0. Kreirajte tablice i veze izmeðu tablica.*/

create table zarucnik (
	id int not null primary key identity (1,1),
	jmbag char (11),
	lipa decimal (12,8),
	indiferentno bit not null
);

create table mladic (
	id int not null primary key identity (1,1),
	kratkaMajica varchar (48) not null,
	haljina varchar (30) not null,
	asocijalno bit,
	id_zarucnik int
);

create table cura (
	id int not null primary key identity (1,1),
	carape varchar (41) not null,
	maraka decimal (17,10) not null,
	asocijalno bit,
	vesta varchar (47) not null
);

create table svekar_cura (
	id int not null primary key identity (1,1),
	id_svekar int not null,
	id_cura int not null
);

create table svekar (
	id int not null primary key identity (1,1),
	bojaKose varchar (33),
	majica varchar (31),
	carape varchar (31) not null,
	haljina varchar (43),
	narukvica int,
	eura decimal (14,5) not null
);

create table punac (
	id int not null primary key identity (1,1),
	dukserica varchar (33),
	prviPuta datetime not null,
	majica varchar (36),
	id_svekar int not null
);

create table punica (
	id int not null primary key identity (1,1),
	hlace varchar (43) not null,
	nausnica int not null,
	ogrlica int,
	vesta varchar (49) not null,
	modelNaocala varchar (31) not null,
	treciPuta datetime not null,
	id_punac int not null
);

create table ostavljena (
	id int not null primary key identity (1,1),
	majica varchar (33),
	ogrlica int not null,
	carape varchar (44),
	stilFrizura varchar (42),
	id_punica int not null
);

alter table mladic add foreign key (id_zarucnik) references zarucnik(id);
alter table svekar_cura add foreign key (id_cura) references cura(id);
alter table svekar_cura add foreign key (id_svekar) references svekar(id);
alter table punac add foreign key (id_svekar) references svekar(id);
alter table punica add foreign key (id_punac) references punac(id);
alter table ostavljena add foreign key (id_punica) references punica(id);

/*1. U tablice punica, punac i svekar_cura unesite po 3 retka.*/

select * from cura;

insert into cura (carape,maraka,vesta)
values
	('stopalice','23.65','sportska'),
	('visoke','443.21','pamucna'),
	('debele','50.21','pamucna');

select * from svekar;

insert into svekar (carape,eura)
values
	('vunene','40.32'),
	('niske','5.35'),
	('visoke','10.40');

select * from svekar_cura;

insert into svekar_cura (id_svekar,id_cura)
values
	(1,1),
	(2,2),
	(3,3);

select * from punac;

insert into punac (prviPuta,id_svekar)
values
	('2023-05-14',1),
	('2023-06-25',2),
	('2022-08-16',3);

select * from punica;

insert into punica (hlace,nausnica,vesta,modelNaocala,treciPuta,id_punac)
values 
	('kratke','2','pamucna','okrugle','2023-07-03',1),
	('dugacke','3','pamucna','kockaste','2022-08-21',2),
	('leprsave','5','lanena','okrugle','2021-03-08',3);


/*2. U tablici mladic postavite svim zapisima kolonu haljina na 
vrijednost Osijek. */

update mladic set haljina='Osijek';

/*3. U tablici ostavljena obrišite sve zapise èija je vrijednost kolone 
ogrlica jednako 17. */

delete from ostavljena where ogrlica='17';

/*4. Izlistajte majica iz tablice punac uz uvjet da vrijednost kolone 
prviputa nepoznate. */

select majica from punac where prviPuta is null;

/*5. Prikažite asocijalno iz tablice cura, stilfrizura iz tablice ostavljena te 
nausnica iz tablice punica uz uvjet da su vrijednosti kolone prviputa iz 
tablice punac poznate te da su vrijednosti kolone majica iz tablice 
svekar sadrže niz znakova ba. Podatke posložite po nausnica iz tablice 
punica silazno. */

select a.asocijalno, f.stilFrizura, e.nausnica 
from cura a 
inner join svekar_cura b on a.id=b.id_cura
inner join svekar c on c.id=b.id_svekar
inner join punac d on c.id=d.id_svekar
inner join punica e on d.id=e.id_punac
inner join ostavljena f on e.id=f.id_punica
where d.prviPuta is not null and c.majica like '%ba%'
order by e.nausnica desc;

/*6. Prikažite kolone majica i carape iz tablice svekar èiji se primarni 
kljuè ne nalaze u tablici svekar_cura.*/

select svekar.majica, svekar.carape from svekar
where id not in (select id_svekar from svekar_cura);

