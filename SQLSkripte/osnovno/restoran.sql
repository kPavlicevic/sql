/*15.	Restoran 
Restoran ima vi�e kategorija na jelovniku. Jedna kategorija ima vi�e jela. 
Uz svako jelo mo�e se ponuditi vi�e pi�a. Jedno pi�e se mo�e ponuditi uz vi�e jela.
*/

use master;
drop database if exists restoran;
go
create database restoran;
go
use restoran;

create table jelovnik (
	sifra int not null primary key identity (1,1),
	kategorija varchar (50) not null
);

create table jelo (
	sifra int not null primary key identity (1,1),
	naziv varchar (50) not null,
	jelovnik int not null
);

create table pice (
	sifra int not null primary key identity (1,1),
	naziv varchar (50) not null,
	vrsta varchar (50) not null
);

create table jelo_pice (
	sifra int not null primary key identity (1,1),
	jelo int not null,
	pice int not null
);

alter table jelo add foreign key (jelovnik) references jelovnik(sifra);
alter table jelo_pice add foreign key (jelo) references jelo(sifra);
alter table jelo_pice add foreign key (pice) references pice(sifra);


select * from jelovnik;

insert into jelovnik (kategorija)
values
	('predjelo'),
	('glavno jelo'),
	('desert'),
	('pice');

select * from jelo;

insert into jelo (naziv,jelovnik)
values
	('Juha od gljiva',1),
	('Piletina i pommes',2),
	('Pita od jabuke',3);

select * from pice;

insert into pice (naziv,vrsta)
values
	('Karlova�ko','alkohol'),
	('Kava','topli napitak'),
	('Juice','sok');

select * from jelo_pice;

insert into jelo_pice (jelo,pice)
values
	(2,1),
	(3,2),
	(4,3);