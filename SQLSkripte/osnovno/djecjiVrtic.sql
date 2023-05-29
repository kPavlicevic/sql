use master;
drop database if exists djecjiVrtic;
go
create database djecjiVrtic;
go
use djecjiVrtic;

create table odgojnaSkupina (
	sifra int not null primary key identity (1,1),
	naziv varchar (50),
	starost int
);

create table dijete (
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	starost int,
	odgojnaSkupina int not null
);

create table odgajateljica (
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	strucnaSprema varchar (50) not null,
	odgojnaSkupina int not null
);

alter table dijete add foreign key (odgojnaSkupina) references odgojnaSkupina(sifra);
alter table odgajateljica add foreign key (odgojnaSkupina) references odgojnaSkupina(sifra);

select * from odgojnaSkupina;

insert into odgojnaSkupina (naziv,starost)
values
	('bubamara','3'),
	('tratin�ica','4'),
	('leptiri�i','5');

select * from dijete;

insert into dijete (ime,starost,odgojnaSkupina)
values
	('Jure','3',1),
	('Ivan','4',2),
	('Valentina','5',3);

select * from odgajateljica;

insert into odgajateljica (ime,prezime,strucnaSprema,odgojnaSkupina)
values
	('Marija','Mari�','odgajateljica',1),
	('Ljiljana','Liji�','odgajateljica',2),
	('�ur�a','�uri�','odgajateljica',3);


select * from dijete;

update dijete set starost='2'
where sifra=1;

select * from odgajateljica;

delete from odgajateljica where sifra=3;

