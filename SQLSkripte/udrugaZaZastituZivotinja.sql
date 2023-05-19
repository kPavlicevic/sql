use master;
drop database if exists udrugaZaZastituZivotinja;
go 
create database udrugaZaZastituZivotinja;
go
use udrugaZaZastituZivotinja;

create table udruga (
	sifra int not null primary key identity (1,1),
	naziv varchar (50) not null,
	lokacija varchar (50) not null
);

create table osoba (
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	udruga int not null,
);

create table sticenik (
	sifra int not null primary key identity (1,1),
	vrsta varchar (50) not null,
	starost int,
	prostorija int not null,
	osoba int not null,
	udruga int not null
);

create table prostorija (
	sifra int not null primary key identity (1,1),
	tip varchar,
	dimenzije decimal (4,2)
);

alter table osoba add foreign key (udruga) references udruga(sifra);
alter table sticenik add foreign key (osoba) references osoba(sifra);
alter table sticenik add foreign key (udruga) references udruga(sifra);
alter table sticenik add foreign key (prostorija) references prostorija(sifra);

select * from udruga;

insert into udruga (naziv,lokacija)
values 
	('Šapice','Osijek'),
	('Maze','Zagreb'),
	('Njuškice','Pozega');

select * from prostorija;

insert into prostorija (tip,dimenzije)
values 
	('o','15.05'),
	('o','20.00'),
	('o','17.20');

select * from osoba;

insert into osoba (ime,prezime,udruga)
values 
	('Mia','Mijiæ',1),
	('Petar','Periæ',2),
	('Bela','Bello',3);

select * from sticenik;

insert into sticenik (vrsta,starost,udruga,prostorija,osoba)
values
	('pas','10',1,1,1),
	('tigar','5',2,2,2),
	('maèka','7',3,3,3);


