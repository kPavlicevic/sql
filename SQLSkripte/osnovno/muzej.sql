use master;
drop database if exists muzej;
go
create database muzej;
go
use muzej;

create table izlozba (
	sifra int not null primary key identity (1,1),
	sponzor int not null,
	kustos int not null
);

create table djelo (
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	autor varchar (50) not null,
	izlozba int not null
);

create table kustos (
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	izlozba int not null
);

create table sponzor (
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	donacija decimal (18,2)
);

alter table djelo add foreign key (izlozba) references izlozba(sifra);
alter table izlozba add foreign key (sponzor) references sponzor(sifra);
alter table izlozba add foreign key (kustos) references kustos(sifra);


select * from sponzor;

insert into sponzor (ime,prezime,donacija)
values
	('Mara','Mariæ','1500'),
	('Mile','Miliæ','2000'),
	('Kata','Katiæ','3900');

select * from kustos;

insert into kustos (ime,prezime,izlozba)
values
	('Valentina','Viliæ','1'),
	('Ante','Antiæ','2'),
	('Hrvoje','Horvat','3');

select * from izlozba;

insert into izlozba (sponzor,kustos)
values
	(1,1),
	(2,2),
	(3,3);

select * from djelo;

insert into djelo (ime,autor,izlozba)
values 
	('Krik','Munch',1),
	('MonaLisa','daVinci',2),
	('David','Michelangelo',3);

select * from kustos;

update kustos set prezime='Aniæ'
where sifra=2;

select * from djelo;

delete from djelo where sifra=3;