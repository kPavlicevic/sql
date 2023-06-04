/*17.	Vodoinstalater 
Vodoinstalater popravlja kvarove na vodovodnim instalacijama. 
Tijekom jednog popravka mo�e popraviti vi�e kvarova a jedan kvar
se mo�e popravljati vi�e puta. Na odre�enim popravcima mu poma�e njegov �egrt.
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


select * from popravak;

insert into popravak (cijena)
values
	('25.60'),
	('104.34'),
	('238.45');

select * from kvar;

insert into kvar (vrsta)
values
	('wc �koljka'),
	('sudoper'),
	('umivaonik');

select * from segrt;

insert into segrt (ime,prezime)
values
	('Ivan','Ivi�'),
	('Zoran','Zori�'),
	('Vale','Vali�');

select * from popravak_kvar;

insert into popravak_kvar (popravak,kvar,segrt)
values
	(2,1,1),
	(3,2,2),
	(4,3,3);

update kvar set vrsta='cijev'
where sifra=1;

delete from popravak_kvar where popravak=2;
delete from popravak where sifra=2;