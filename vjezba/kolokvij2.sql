use master;
drop database if exists kolokvij2;
go
create database kolokvij2;
go
use kolokvij2;

create table brat (
	id_brat int not null primary key identity (1,1),
	suknja varchar (47),
	ogrlica int not null,
	asocijalno bit not null,
	id_neprijatelj int not null
);

create table neprijatelj (
	id_neprijatelj int not null primary key identity (1,1),
	majica varchar (32),
	haljina varchar (43) not null,
	lipa decimal (16,8),
	modelNaocala varchar (49) not null,
	kuna decimal (12,6) not null,
	jmbag char (11),
	id_cura int
);

create table cura (
	id_cura int not null primary key identity (1,1),
	haljina varchar (33) not null,
	drugiPuta datetime not null,
	suknja varchar (38),
	narukvica int,
	introvertno bit,
	majica varchar (40) not null,
	id_decko int
);

create table decko (
	id_decko int not null primary key identity (1,1),
	indiferentno bit,
	vesta varchar (34),
	asocijalno bit not null
);

create table decko_zarucnica (
	id_decko_zarucnica int not null primary key identity (1,1),
	id_decko int not null,
	id_zarucnica int not null
);

create table zarucnica (
	id_zarucnica int not null primary key identity (1,1),
	narukvica int,
	bojaKose varchar (37) not null,
	novcica decimal (15,9),
	lipa decimal (15,8) not null,
	indiferentno bit not null
);

create table prijatelj (
	id_prijatelj int not null primary key identity (1,1),
	modelNaocala varchar (37),
	treciPuta datetime not null,
	ekstroventno bit not null,
	prviPuta datetime,
	id_svekar int not null
);

create table svekar (
	id_svekar int not null primary key identity (1,1),
	stilFrizura varchar (48),
	ogrlica int not null,
	asocijalno bit not null
);

alter table brat add foreign key (id_neprijatelj) references neprijatelj(id_neprijatelj);
alter table neprijatelj add foreign key (id_cura) references cura(id_cura);
alter table cura add foreign key (id_decko) references decko(id_decko);
alter table decko_zarucnica add foreign key (id_decko) references decko(id_decko);
alter table decko_zarucnica add foreign key (id_zarucnica) references zarucnica(id_zarucnica);
alter table prijatelj add foreign key (id_svekar) references svekar (id_svekar);


/*1. U tablice neprijatelj, cura i decko_zarucnica unesite po 3 retka.
*/

select * from zarucnica;

insert into zarucnica (bojaKose,lipa,indiferentno)
values
	('plava','34.21','0'),
	('smeda','32.125','0'),
	('crna','43.12','0');

select * from decko;

insert into decko (asocijalno)
values
	('1'),
	('0'),
	('0');

select * from decko_zarucnica;

insert into decko_zarucnica (id_decko,id_zarucnica)
values 
	(2,3),
	(3,4),
	(4,5);


select * from cura;

insert into cura (haljina,drugiPuta,majica,id_decko)
values
	('dugacka','2022-04-15','kratka',2),
	('kratka','2023-09-20','dugacka',3),
	('kratka','2023-06-21','kratka',4);

select * from neprijatelj;

insert into neprijatelj (haljina,modelNaocala,kuna,id_cura)
values
	('uska','okrugle','75.12',4),
	('leprsava','kockaste','100.50',5),
	('dugacka','okrigle','59.89',6);


/*2. U tablici prijatelj postavite svim zapisima kolonu treciputa na 
vrijednost 30. travnja 2020. */

update prijatelj set treciPuta='2020-04-30';

/*3. U tablici brat obrišite sve zapise èija je vrijednost kolone ogrlica 
razlièito od 14. */

delete from brat where ogrlica!='14';

/*4. Izlistajte suknja iz tablice cura uz uvjet da vrijednost kolone 
drugiputa nepoznate. */

select suknja from cura where drugiPuta is null;

/*5. Prikažite novcica iz tablice zarucnica, neprijatelj iz tablice brat te 
haljina iz tablice neprijatelj uz uvjet da su vrijednosti kolone 
drugiputa iz tablice cura poznate te da su vrijednosti kolone vesta iz 
tablice decko sadrže niz znakova ba. Podatke posložite po haljina iz 
tablice neprijatelj silazno. */


select a.novcica, f.id_neprijatelj, e.haljina
from zarucnica a
inner join decko_zarucnica b on a.id_zarucnica=b.id_zarucnica
inner join decko c on c.id_decko=b.id_decko
inner join cura d on c.id_decko=d.id_decko
inner join neprijatelj e on e.id_cura=d.id_cura
inner join brat f on f.id_neprijatelj=e.id_neprijatelj
where d.drugiPuta is not null and c.vesta like '%ba%'
order by e.haljina desc;


/*6. Prikažite kolone vesta i asocijalno iz tablice decko èiji se primarni 
kljuè ne nalaze u tablici decko_zarucnica. */

select decko.vesta, decko.asocijalno from decko
where id_decko not in ( select id_decko from decko_zarucnica);