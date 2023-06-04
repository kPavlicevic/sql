/*17.	Vodoinstalater 
Vodoinstalater popravlja kvarove na vodovodnim instalacijama. 
Tijekom jednog popravka može popraviti više kvarova a jedan kvar
se može popravljati više puta. Na odreðenim popravcima mu pomaže njegov šegrt.
*/


use master;
drop database if exists vodoinstalater;
go
create database vodoinstalater;
go
use vodoinstalater;

create table popravak(
	sifra int not null primary key identity (1,1),
	cijena decimal (18,2) not null
);

create table kvar(
	sifra int not null primary key identity (1,1),
	vrsta varchar (50) not null
);

create table segrt(
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null
);

create table popravak_kvar(
	sifra int not null primary key identity (1,1),
	popravak int not null,
	kvar int not null,
	segrt int not null
);

alter table popravak_kvar add foreign key (popravak) references popravak(sifra);
alter table popravak_kvar add foreign key (kvar) references kvar(sifra);
alter table popravak_kvar add foreign key (segrt) references segrt(sifra);