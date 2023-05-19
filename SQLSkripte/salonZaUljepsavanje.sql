use master;
drop database if exists salonZaUljepsavanje;
go
create database salonZaUljepsavanje collate Croatian_CI_AS;
go
use salonZaUljepsavanje;

create table termin(
	sifra int not null primary key identity (1,1),
	datum datetime,
	korisnik int not null,
	usluga int not null,
	djelatnik int not null
);

create table korisnik (
	sifra int not null primary key identity (1,1),
	spol varchar,
	ime varchar (50),
	prezime varchar (50)
	
);

create table usluga (
	sifra int not null primary key identity (1,1),
	naziv varchar (50) not null,
	cijena decimal (18,2) null
);

create table djelatnik (
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null
);

alter table termin add foreign key (korisnik) references korisnik(sifra);
alter table termin add foreign key (usluga) references usluga(sifra);
alter table termin add foreign key (djelatnik) references djelatnik(sifra);


select * from korisnik

insert into korisnik (spol,ime,prezime)
values
	('z','Josipa','Joziæ'),
	('z','Ivka','Ivkiæ'),
	('z','Jure','Juriæ');

select * from djelatnik

insert into djelatnik (ime,prezime)
values
	('Ivanka','Iviæ'),
	('Marija','Mariæ'),
	('Danijela','Daniæ');

select * from usluga

insert into usluga (naziv,cijena)
values
	('manikura','12.50'),
	('pedikura','15'),
	('farbanje','23');

select * from termin

insert into termin (datum,korisnik,usluga, djelatnik)
values
	('2023-05-25',1,1,1),
	('2023-06-25',2,2,2),
	('2023-07-05',3,3,3);