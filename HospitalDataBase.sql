CREATE DATABASE Hospital

USE Hospital

DROP DATABASE Hospital

CREATE TABLE OperationRooms(
	Id int PRIMARY KEY
)

CREATE TABLE Surgeons(
	Oib varchar(10) PRIMARY KEY CHECK(Oib NOT LIKE '%[^0-9]%' AND LEN(Oib) = 10),
	Name nvarchar(50) CHECK(Name NOT LIKE '%[0-9]%') NOT NULL,
	Surname nvarchar(50) CHECK(Surname NOT LIKE '%[0-9]%') NOT NULL,
	Address nvarchar(70) NOT NULL,
	Speciality nvarchar(100) CHECK(Speciality NOT LIKE '%[0-9]%')
)

CREATE TABLE Rooms(
	Id int PRIMARY KEY
)

CREATE TABLE Patients(
	Oib varchar(10) PRIMARY KEY CHECK(Oib NOT LIKE '%[^0-9]%' AND LEN(Oib) = 10),
	Name nvarchar(50) CHECK(Name NOT LIKE '%[0-9]%') NOT NULL,
	Surname nvarchar(50) CHECK(Surname NOT LIKE '%[0-9]%') NOT NULL,
	Address nvarchar(70) NOT NULL,
	RoomId int FOREIGN KEY REFERENCES Rooms(Id) NOT NULL
)

CREATE TABLE Operations(
	Id int IDENTITY(1,1) PRIMARY KEY,
	OperationType nvarchar(100) NOT NULL,
	PatientOib varchar(10) FOREIGN KEY REFERENCES Patients(Oib) NOT NULL,
	SurgeonOib varchar(10) FOREIGN KEY REFERENCES Surgeons(Oib) NOT NULL,
	OperationTime datetime2 DEFAULT GETDATE() NOT NULL,
	OperationRoomId int FOREIGN KEY REFERENCES OperationRooms(Id) NOT NULL
)

CREATE TABLE Nurses(
	Oib varchar(10) PRIMARY KEY CHECK(Oib NOT LIKE '%[^0-9]%' AND LEN(Oib) = 10),
	Name nvarchar(50) CHECK(Name NOT LIKE '%[0-9]%') NOT NULL,
	Surname nvarchar(50) CHECK(Surname NOT LIKE '%[0-9]%') NOT NULL,
	RoomId int FOREIGN KEY REFERENCES Rooms(Id) DEFAULT NULL,
	OperationRoomId int FOREIGN KEY REFERENCES OperationRooms(Id) DEFAULT NULL
)

INSERT INTO OperationRooms(Id) VALUES (100), (101), (102), (103)

INSERT INTO Surgeons(Oib, Name, Surname, Address, Speciality) VALUES
('0000000000', 'Mate', 'Matić', 'Omiška 8, Split', 'Kardiokirurg'),
('1111111111', 'Ante', 'Antić', 'Velebitska 23, Knin', 'Neurokirurg'),
('2222222222', 'Stipe', 'Stipić', 'Krležina 2, Split', 'Gastroenterolog')

INSERT INTO Rooms(Id) VALUES (1), (2), (3), (4), (5), (6), (7)

INSERT INTO Patients(Oib, Name, Surname, Address, RoomId) VALUES
('3333333333', ' ', 'Patak', 'Radunica 34, Split', 2),
('4444444444', 'Miki', 'Maus', 'Put Starog Sela 20, Hvar', 5),
('5555555555', 'Duje', 'Dujić', 'Klarina 5, Split', 7)

INSERT INTO Operations(OperationType, PatientOib, SurgeonOib, OperationTime, OperationRoomId) VALUES
('Operacija jetre', '3333333333', '2222222222', '2021-3-3 3:40PM', 100),
('Operacija mozga', '4444444444', '1111111111', '2021-12-9 12:00', 102),
('Operacija srca', '5555555555', '0000000000', '2021-12-10 7:00AM', 103)

INSERT INTO Nurses(Oib, Name, Surname, RoomId, OperationRoomId) VALUES
('6666666666', 'Maja', 'Majić', 1, 100),
('7777777777', 'Ivana', 'Ivić', NULL, 101),
('8888888888', 'Zrinka', 'Zrinić', 3, 103),
('9999999999', 'Petra', 'Petrić', 4, NULL)





