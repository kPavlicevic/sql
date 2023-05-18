
drop database if exists frizerskiSalon;
go
create database frizerskiSalon collate Croatian_CI_AS;
go
use frizerskiSalon;

create table termin(
	sifra int not null primary key identity (1,1),
	datum datetime,
	korisnik int,
	usluga int,
	djelatnik int not null
);

create table djelatnik(
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null
);

create table usluga(
	sifra int not null primary key identity (1,1),
	naziv varchar (50) not null,
	cijena decimal (18,2) null
);

create table korisnik(
	sifra int not null primary key identity (1,1),
	spol varchar,
	duzinaKose decimal (5,2)
);

alter table termin add foreign key (djelatnik) references djelatnik(sifra);
alter table termin add foreign key (usluga) references usluga(sifra);
alter table termin add foreign key (korisnik) references korisnik(sifra);

select * from korisnik;

insert into korisnik (spol,duzinaKose)
values
	('z','30.15'),
	('m','10.05'),
	('z','50.55');


select * from djelatnik;

insert into djelatnik (ime,prezime)
values
	('Ivanka','Ivaniæ'),
	('Marija','Mariæ'),
	('Danijela','Daniæ');

select * from usluga;

insert into usluga (naziv,cijena)
values
	('frizura','50'),
	('sisanje','15'),
	('farbanje','32.55');

select * from termin;

insert into termin (datum,korisnik,usluga,djelatnik)
values
	('2023-06-10',1,1,1),
	('2023-06-05',2,2,2),
	('2023-05-25',3,3,3);



 
