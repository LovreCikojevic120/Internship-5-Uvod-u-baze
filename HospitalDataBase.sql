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





