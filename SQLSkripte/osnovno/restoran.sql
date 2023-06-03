/*15.	Restoran 
Restoran ima više kategorija na jelovniku. Jedna kategorija ima više jela. 
Uz svako jelo može se ponuditi više piæa. Jedno piæe se može ponuditi uz više jela.
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


--select * from jelovnik;

--insert into jelovnik (kategorija)
--values
--	('predjelo'),
--	('glavno jelo'),
--	('desert'),
--	('pice');

--select * from jelo;

--insert into jelo (naziv,jelovnik)
--values
--	('Juha od gljiva',