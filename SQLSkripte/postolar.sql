use master;
drop database if exists postolar;
go
create database postolar;
go
use postolar;

create table korisnik (
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	telefonskiBroj char (50) not null,
	obuca int,
	postolar int
);

create table postolar (
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	popravak int,
	korisnik int
);

create table obuca (
	sifra int not null primary key identity (1,1),
	postolar int,
	korisnik int
);

create table popravak (
	sifra int not null primary key identity (1,1),
	korisnik int,
	postolar int,
	obuca int,
	cijena decimal (18,2) not null
);

alter table obuca add foreign key (korisnik) references korisnik(sifra);
alter table obuca add foreign key (postolar) references postolar(sifra);
alter table popravak add foreign key (obuca) references obuca(sifra);

select * from korisnik;

insert into korisnik (ime,prezime,telefonskiBroj,obuca,postolar)
values 
	('Ivan','Iviæ','0995487513'),
	('Marija','Maruæ','0984759832'),
	('Pavao','Paviæ','0954785236');

select * from postolar;

insert into postolar (ime,prezime,popravak,korisnik)
values
	('Petar','Periæ',null,1),
	('Mile','Miliæ',null,2),
	('Želja','žiliæ',null,3);

select * from obuca;

insert into obuca (postolar,korisnik)
values
	(1,1),
	(2,2),
	(3,3);

select * from popravak;

insert into popravak (korisnik,postolar,obuca,cijena)
values
	(1,1,1,'50'),
	(2,2,2,'35'),
	(3,3,3,'10');


select * from popravak;

update popravak set cijena='40.05'
where sifra=1;

select * from korisnik;

delete from popravak where obuca=2;
delete from obuca where korisnik=2;
delete from korisnik where sifra=2;
