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
	djecjaRadionica int not null
);

create table djecjaRadionica_dijete(
	dijete int not null,
	djecjaRadionica int not null
);


alter table djecjaRadionica_dijete add foreign key (djecjaRadionica) references djecjaRadionica(sifra);
alter table djecjaRadionica_dijete add foreign key (dijete) references dijete(sifra);
alter table uciteljica add foreign key (djecjaRadionica) references djecjaRadionica(sifra);


select * from djecjaRadionica;

insert into djecjaRadionica (naziv,brojDjece,uciteljica)
values
	('Zumbiæi','20',1),
	('Leptiriæi','15',2),
	('Njuškice','37',3);

select * from dijete;

insert into dijete (ime,prezime,oib)
values
	('Nika','Nikiæ','26478952301'),
	('Josip','Joziæ','05463201578'),
	('Rira','Nakiæ','87563214985');

select * from uciteljica;

insert into uciteljica (ime,prezime)
values
	('Ljiljana','Lijiæ'),
	('Ðurða','Ðuriæ'),
	('Marija','Mariæ');

select * from djecjaRadionica_dijete where dijete = 1 and djecjaRadionica=6;

insert into djecjaRadionica_dijete (djecjaRadionica,dijete)
values
	(6,1),
	(7,2),
	(8,3);
	
	
update djecjaRadionica_dijete set dijete=1, djecjaRadionica=8
where sifra=24;

update djecjaRadionica_dijete set djecjaRadionica=6
where sifra=24;

alter table djecjaRadionica_dijete add unique(dijete, djecjaRadionica)
	

delete from djecjaRadionica_dijete where sifra=24;