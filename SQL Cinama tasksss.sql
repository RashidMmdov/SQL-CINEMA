create database Cinema 
use Cinema

create table Costumers(
	Id int primary key identity,
	Costumer_Name nvarchar(100)
)

create table Tickets(
	Id int primary key identity,
	Price float,
	Costumer_Id int constraint OM_CostumerToTicket foreign key references Costumers(Id)
)

create table Films(
	Id int primary key identity,
	Films_Name nvarchar(100),
	Ticket_Id int foreign key references Tickets(Id)
)


create table Janrs(
	Id int primary key identity,
	Janr_Name nvarchar(30)
)

create table Actors(
	Id int primary key identity,
	Actor_Name nvarchar(30)
)

create table Halls(
	Id int primary key identity,
	Hall_Name nvarchar(10),
	Ticket_Id int foreign key references Tickets(Id)
)

create table Seanse(
	Id int primary key identity,
	Seance_Count int,
	Ticket_Id int foreign key references Tickets(Id)

)


create table Temp_Janr_AND_Film(
	Id int primary key identity,
	Janr_Id int foreign key references Janrs(Id),
	Film_Id int foreign key references Films(Id)
)

create table Temp_Actors_AND_Film(
	Id int primary key identity,
	Actor_Id int foreign key references Actors(Id),
	Film_Id int foreign key references Films(Id)
)
-- deyer teyin etme

insert into Costumers
values('A.Qalayev'),
('R.Qasimov'),
('N.Muradov')

insert into Tickets
values(9.12,1),
(7.65,2),
(11.18,3)

insert into Films
values('Iron Man',1),
('Wolverine',2),
('Recep Ivedik 3',3)

insert into Janrs
values('Fantastic'),
('Fantastic'),
('Comedy')

insert into Actors
values('Robert Downey'),
('Hugh Jackman'),
('Şahan Gökbakar')

insert into Halls
values('A1',3),
('B2',1),
('C7',2)

insert into Seanse
values(2,1),
(1,3),
(3,2)

insert into Temp_Janr_AND_Film
values(1,1),
(3,2),
(2,3)

insert into Temp_Actors_AND_Film
values(1,1),
(2,2),
(3,3)


-- join hele bele yazilmisdir..


select f.Films_Name as Films,j.Janr_Name as Janrs from Temp_Janr_AND_Film as T
join Janrs as j
on T.Janr_Id=j.Id
join Films as f
on T.Janr_Id=f.Id 
union
select f.Films_Name as Films,a.Actor_Name as Actors from Temp_Actors_AND_Film as T
join Films as f
on T.Film_Id=f.Id
join Actors as a
on T.Actor_Id=a.Id 


--wiew Ticketin tum deyerleri ucun

create view vW_SelectAllTicket
as
select c.Costumer_Name as Costumers,f.Films_Name as Films,s.Seance_Count as 'Film Seance',t.Price as 'Film Price',h.Hall_Name as Halls from Tickets as t
join Costumers as c
on t.Costumer_Id=c.Id
join Films as f
on t.Id=f.Ticket_Id
join Halls as h
on t.Id=h.Ticket_Id
join Seanse as s
on t.Id=s.Ticket_Id


select * from vW_SelectAllTicket