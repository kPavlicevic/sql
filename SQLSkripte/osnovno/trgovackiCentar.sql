use master;
drop database if exists trgovackiCentar;
go
create database trgovackiCentar;
go
use trgovackiCentar;

create table trgovina(
	sifra int not null primary key identity (1,1),
	naziv varchar (50) not null,
	sef varchar (50) not null
);

create table osoba(
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	oib char (11),
	sef varchar (50) not null
);

create table trgovina_osoba(
	sifra int not null primary key identity (1,1),
	trgovina int not null,
	osoba int not null
);

alter table trgovina_osoba add foreign key (trgovina) references trgovina(sifra);
alter table trgovina_osoba add foreign key (osoba) references osoba(sifra);


select * from trgovina;

insert into trgovina (naziv,sef)
values
	('Adidas','Ivan'),
	('Pull&Bear','Ivona'),
	('C&A','Marina');

select * from osoba;

insert into osoba (ime,prezime,oib,sef)
values
	('Jasmina','Jasniæ','57963254125','Ivan'),
	('Ana','Aniæ','59875632015','Ivona'),
	('Lidija','Lijiæ','98623015485','Marina');

select * from trgovina_osoba;

insert into trgovina_osoba (trgovina,osoba)
values
	(1,1),
	(2,2),
	(3,3);

update trgovina set sef='Marinka'
where sifra=3;

delete from trgovina_osoba where osoba=3;
delete from osoba where sifra=3;