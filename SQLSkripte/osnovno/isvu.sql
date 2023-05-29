use master;
drop database if exists ISVU;
go
create database ISVU;
go
use ISVU;

create table student (
	id int not null primary key identity (1,1),
	firstname varchar (50) not null,
	lastname varchar (50) not null,
	jmbag char (10)
);

create table course (
	id int not null primary key identity (1,1),
	name varchar (50) not null,
	ects varchar (50) not null,
	description varchar (100)
);

create table student_course (
	id int not null primary key identity (1,1),
	student int not null,
	course int not null,
	dateofenorllement datetime,
	academicyear int
);

create table academicyear (
	id int not null primary key identity (1,1),
	name varchar (50) not null,
	statedate datetime,
	enddate datetime
);

alter table student_course add foreign key (student) references student(id);
alter table student_course add foreign key (course) references course(id);
alter table student_course add foreign key (academicyear) references academicyear(id);