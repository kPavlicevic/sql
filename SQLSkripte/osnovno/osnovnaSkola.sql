use master;
drop database if exists osnovnaSkola;
go
create database osnovnaSkola;
go
use osnovnaSkola;

create table djecjaRadionica(
	sifra int not null primary key identity (1,1),
	naziv varchar (50) not null,
	brojdjece varchar (50),
	uciteljica int not null
);

create table dijete(
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	oib char (11)
);

create table uciteljica(
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	djecjaRadionica int
);

create table djecjaRadionica_dijete(
	sifra int not null primary key identity (1,1),
	dijete int,
	djecjaRadionica int
);


alter table djecjaRadionica_dijete add foreign key (djecjaRadionica) references djecjaRadionica(sifra);
alter table djecjaRadionica_dijete add foreign key (dijete) references dijete(sifra);
alter table uciteljica add foreign key (djecjaRadionica) references djecjaRadionica(sifra);