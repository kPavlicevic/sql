use master;
drop database if exists kolokvij1;
go
create database kolokvij1;
go
use kolokvij1;

create table svekar (
	id_svekar int not null primary key identity (1,1),
	bojaOciju varchar (40) not null,
	prstena int,
	dukserica varchar (41),
	lipa decimal (13,8),
	eura decimal (12,7),
	majica varchar (35)
);

create table sestra (
	id_sestra int not null primary key identity (1,1),
	introvertno bit,
	haljina varchar (31) not null,
	maraka decimal (16,6),
	hlace varchar (46) not null,
	narukvica int
);

create table zena (
	id_zena int not null primary key identity (1,1),
	treciPuta datetime,
	hlace varchar (46),
	kratkaMajica varchar (31) not null,
	jmbag char (11) not null,
	bojaOciju varchar (39) not null,
	haljina varchar (44),
	id_sestra int not null
);

create table muskarac (
	id_muskarac int not null primary key identity (1,1),
	bojaOciju varchar (50) not null,
	hlace varchar (30),
	modelNaocala varchar (43),
	maraka decimal (14,5) not null,
	id_zena int not null
);

create table mladic (
	id_mladic int not null primary key identity (1,1),
	suknja varchar (50) not null,
	kuna decimal (16,8) not null,
	drugiPuta datetime,
	asocijalno bit,
	ekstroventno bit not null,
	dukserica varchar (48) not null,
	id_muskarac int
);

create table sestra_svekar (
	id_sestra_svekar int not null primary key identity (1,1),
	id_sestra int not null,
	id_svekar int not null
);

create table punac (
	id_punac int not null primary key identity (1,1),
	ogrlica int,
	gustoca decimal (14,9),
	hlace varchar (41) not null
);

create table cura (
	id_cura int not null primary key identity (1,1),
	novcica decimal (16,5) not null,
	gustoca decimal (18,6) not null,
	lipa decimal (13,10),
	ogrlica int not null,
	bojaKose varchar (38),
	suknja varchar (36),
	id_punac int
);

alter table sestra_svekar add foreign key (id_svekar) references svekar(id_svekar);
alter table sestra_svekar add foreign key (id_sestra) references sestra(id_sestra);
alter table zena add foreign key (id_sestra) references sestra(id_sestra);
alter table muskarac add foreign key (id_zena) references zena(id_zena);
alter table mladic add foreign key (id_muskarac) references muskarac(id_muskarac);
alter table cura add foreign key (id_punac) references punac(id_punac);

select * from svekar;

insert into svekar (bojaOciju,prstena,dukserica,lipa,eura,majica)
values
	('plava','2','dugacka','15','23.12','kratka'),
	('roza','4','kratka','16','42.23','kratka'),
	('zelena','1','dugacka','50','12.34','kratka');

select * from sestra;

insert into sestra (haljina,maraka,hlace,narukvica)
values
	('dugacka','34.56','kratke',null),
	('kratka','45.32','dugacke',null),
	('leprsava','67.31','dugacke',null);

select * from sestra_svekar;

insert into sestra_svekar (id_sestra,id_svekar)
values
	(1,1),
	(2,2),
	(3,3);

select * from zena;

insert into zena (treciPuta,hlace,kratkaMajica,jmbag,bojaOciju,haljina,id_sestra)
values
	('2023-04-17','kratke','kratka','87521456982','plava','dugacka',1),
	('2023-05-10','tanane','kratkaa','51023678954','zelena','kratka',2),
	('2023-04-05','dugacke','kratka','74532158940','smeda','dugacka',3);

select * from muskarac;

insert into muskarac (bojaOciju,hlace,modelNaocala,maraka,id_zena)
values
	('plava','kratke','okrugle','35.32',1),
	('zelena','dugacke','kockaste','45.23',2),
	('smeda','kratke','okrugle','67.21',3);


-- 2. U tablici cura postavite svim zapisima kolonu gustoca na vrijednost 15,77.

update cura set gustoca=15.77;

-- 3. U tablici mladic obrišite sve zapise èija je vrijednost kolone kuna veæe od 15,78. 

delete from mladic where kuna>'15.78';

-- 4. Izlistajte kratkamajica iz tablice zena uz uvjet da vrijednost kolone hlace sadrže slova ana.select kratkaMajica from zena where hlace like '%ana%';/* 5. Prikažite dukserica iz tablice svekar, asocijalno iz tablice mladic 
te hlace iz tablice muskarac uz uvjet da su vrijednosti kolone hlace iz 
tablice zena poèinju slovom a te da su vrijednosti kolone haljina iz tablice 
sestra sadrže niz znakova ba. Podatke posložite po hlace iz 
tablice muskarac silazno. */select a.dukserica, f.asocijalno, e.hlacefrom svekar ainner join sestra_svekar b on a.sifra=b.id_svekarinner join sestra c on c.sifra=b.id_sestrainner join zena d on c.sifra=d.id_sestrainner join muskarac e on d.sifra=e.id_zenainner join mladic f on e.sifra=f.id_muskaracwhere d.hlace like 'a%' and c.haljina like '%ba%'order by e.hlace;-- 6. Prikažite kolone haljina i maraka iz tablice sestra èiji se primarni kljuè ne nalaze u tablici sestra_svekar.select sestra.haljina, sestra.maraka from sestrawhere sifra not in (select sifra from sestra_svekar);