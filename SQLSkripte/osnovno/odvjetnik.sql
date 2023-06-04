/*18.	Odvjetnik 
Jedan odvjetnik brani više klijenata. Jednog klijenta može 
braniti više puta.U obranama mu pomažu suradnici. Na jednoj obrani 
može biti više suradnika a jedan suradnik može sudjelovati na više obrana.
*/

use master;
drop database if exists odvjetnik;
go
create database odvjetnik;
go
use odvjetnik;

create table odvjetnik (
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null
);

create table klijent (
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null
);

create table obrana (
	sifra int not null primary key identity (1,1),
	vrsta varchar (50) not null,
	odvjetnik_klijent int not null
);

create table suradnik (
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null
);

create table odvjetnik_klijent (
	sifra int not null primary key identity (1,1),
	odvjetnik int not null,
	klijent int not null,
	obrana int not null
);

create table obrana_suradnik (
	sifra int not null primary key identity (1,1),
	obrana int not null,
	suradnik int not null,
);

alter table odvjetnik_klijent add foreign key (odvjetnik) references odvjetnik(sifra);
alter table odvjetnik_klijent add foreign key (klijent) references klijent(sifra);
alter table odvjetnik_klijent add foreign key (obrana) references obrana(sifra);
alter table obrana_suradnik add foreign key (obrana) references obrana(sifra);
alter table obrana_suradnik add foreign key (suradnik) references suradnik(sifra);