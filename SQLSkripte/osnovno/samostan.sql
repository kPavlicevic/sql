use master;
drop database if exists samostan;
go
create database samostan;
go
use samostan;

create table samostan (
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	svecenik varchar (50) not null
);

create table svecenik (
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	posao int not null,
	samostan int not null,
);

create table nadredeniSvecenik (
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	svecenik int not null
);

create table posao (
	sifra int not null primary key identity (1,1),
	vrijeme time,
	svecenik int not null
);

alter table svecenik add foreign key (samostan) references samostan(sifra);
alter table svecenik add foreign key (posao) references posao(sifra);
alter table posao add foreign key (svecenik) references svecenik(sifra);
alter table nadredeniSvecenik add foreign key (svecenik) references svecenik(sifra);
