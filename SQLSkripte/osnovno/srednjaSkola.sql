use master;
drop database if exists srednjaSkola;
go
create database srednjaSkola;
go
use srednjaSkola;

create table razred(
	sifra int not null primary key identity (1,1),
	naziv varchar (50) not null,
	profesor int not null
);

create table ucenik(
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	oib char (11),
	razred int not null
);

create table profesor(
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	razred int not null
);

create table razred_profesor(
	sifra int not null primary key identity (1,1),
	razred int,
	profesor int
);

alter table ucenik add foreign key (razred) references razred(sifra);
alter table razred_profesor add foreign key (razred) references razred(sifra);
alter table razred_profesor add foreign key (profesor) references profesor(sifra);


select * from razred;

insert into razred (naziv,profesor)
values
	('1C',1),
	('2G',2),
	('4B',3);

select * from ucenik;

insert into ucenik (ime,prezime,oib,razred)
values
	('Andrija','Andriæ','21579630158',1),
	('Karlo','Karliæ','02589631478',2),
	('Krešo','Krešiæ','03215698745',3);

select * from profesor;

insert into profesor (ime,prezime,razred)
values
	('Jasna','Jasniæ',1),
	('Josip','Joziæ',2),
	('Nada','Nadiæ',3);

select * from razred_profesor;

insert into razred_profesor (razred,profesor)
values
	(1,1),
	(2,2),
	(3,3);

update ucenik set ime='Andria'
where sifra=10;

delete from ucenik where sifra=10;