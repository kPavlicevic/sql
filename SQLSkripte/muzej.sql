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
