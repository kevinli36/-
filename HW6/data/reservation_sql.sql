CREATE database if not exists reservation;
USE reservation;

CREATE TABLE if not exists Traveler(
	Username			varchar(15)		PRIMARY KEY		NOT NULL,
	UserPassword		varchar(15)		NOT NULL,
	FullName			varchar(25)		NOT NULL,
	Sex					enum('male', 'female')			NOT NULL,
	Email_Address		varchar(30)		NOT NULL
) ENGINE=InnoDB;

CREATE TABLE if not exists Hotel(
	Hotel_ID			INT				PRIMARY KEY		NOT NULL,
	Hotel_Name			varchar(25)		NOT NULL,
	City				varchar(25)		NOT NULL,
	Detail_Address		varchar(50)		NOT NULL,
	Check_In_Date		char(10)		NOT NULL,
	Check_Out_Date		char(10)		NOT NULL,
	Room_IDs			varchar(100)    NOT NULL
) ENGINE=InnoDB;

CREATE TABLE if not exists Reservation(
	Reservation_ID		char(30)		PRIMARY KEY		NOT NULL,
	Total				FLOAT   		NOT NULL,
    Username			varchar(15)		NOT NULL,
	In_Name_Of			varchar(25)  	NOT NULL,
	Hotel_ID			INT				NOT NULL,
    FOREIGN KEY(Hotel_ID)		REFERENCES		Hotel(Hotel_ID),
    FOREIGN KEY(Username)		REFERENCES		Traveler(Username)
) ENGINE=InnoDB;

CREATE TABLE if not exists Room(
	Room_ID				INT				PRIMARY KEY		NOT NULL,
	Hotel_ID			INT				NOT NULL,
	Room_Type			varchar(15)		NOT NULL,
	Adult_Number		INT,
	Children_Number		INT,
	Child_Age_Min		INT,
	Child_Age_Max		INT,
    FOREIGN KEY(Hotel_ID)				REFERENCES		Hotel(Hotel_ID)
) ENGINE=InnoDB;

CREATE TABLE if not exists Card_Holder(
	Card_Holder_ID		char(15)		PRIMARY KEY		NOT NULL,
	First_name			varchar(15)		NOT NULL,
	Last_Name			varchar(15)		NOT NULL,
	Address1			varchar(50)		NOT NULL,
	Address2			varchar(50),
	City				varchar(20)		NOT NULL,
	Country				varchar(20)		NOT NULL,
	PostCode			varchar(10),
	Daytime_Telephone	varchar(15)		NOT NULL,
	EveningTime_Telephone	varchar(15)
) ENGINE=InnoDB;

CREATE TABLE if not exists Credit_Card(
	Card_Number			char(12)		PRIMARY KEY		NOT NULL,
	Card_Security_code	char(15)		NOT NULL,
	Card_Holder_ID		char(15)		NOT NULL,
    FOREIGN KEY(Card_Holder_ID)		REFERENCES		Card_Holder(Card_Holder_ID)
) ENGINE=InnoDB;

CREATE TABLE if not exists Payment(
	Payment_ID			char(30)		PRIMARY KEY		NOT NULL,
	Reservation_ID		char(30)		NOT NULL,
	Full_Name			char(30)		NOT NULL,
	Total				FLOAT			NOT NULL,
    Card_Number			char(12)		NOT NULL,
    FOREIGN KEY(Reservation_ID)		REFERENCES		Reservation(Reservation_ID),
    FOREIGN KEY(Card_Number)		REFERENCES		Credit_Card(Card_Number)
) ENGINE=InnoDB;