CREATE TABLE Roles(
	[RoleId] INTEGER CONSTRAINT pk_RoleId PRIMARY KEY,
	RoleName VARCHAR(15) NOT NULL
)


Insert INTO Roles Values(1,'Admin')
Insert INTO Roles Values(2,'Employee')
Insert INTO Roles Values(3,'Trainee')
Insert INTO Roles Values(4,'Intern')
Delete from Roles

ALTER TABLE Users ADD [Password] varchar(15),[Email] varchar(20),[RoleId] INTEGER CONSTRAINT fk_Role_RoleId REFERENCES Roles(RoleId)
DELETE FROM Users

CREATE TABLE [Users]
(
	UserId VARCHAR(10) NOT NULL CONSTRAINT pk_users_id Primary Key,
	UserName VARCHAR(30) NOT NULL,
	[UserPassword] varchar(15) NOT NULL,
	[EmailiD] varchar(20) NOT NULL,
	Gender CHAR(1) CONSTRAINT chk_users_gender CHECK(Gender in ('M','F','O')),
	DateOfBirth DATE,
	Contact_No VARCHAR(10) NOT NULL CONSTRAINT chk_users_contact_no CHECK(LEN(Contact_No)=10),
	[Address] VARCHAR(100) NOT NULL,
	[Type] CHAR(1) CONSTRAINT chk_users_type CHECK([Type] in ('I','T','E')),
	[RoleId] INTEGER CONSTRAINT fk_Role_RoleId REFERENCES Roles(RoleId)
)
GO
DROP TABLE Users;
Drop Table MapUsersCourses

INSERT INTO [Users] VALUES('231456','Ram Prasad','xyz123','abcd@gmail.com','M','1993/09/01','7457452323','Patna','I',4)
INSERT INTO [Users] VALUES('231501','Melanie Vanyashkin','abc123','mel43@gmail.com','F','1992/08/08','8987654321','Beberibe','T',3)
INSERT INTO [Users] VALUES('231457','Ranique Straun','tttt1234','ranique@gmail.com','F','1994/03/13','7467876543','New York','E',1)
INSERT INTO [Users] VALUES('231458','Patten Kahler','pt61234','patten@gmail.com','M','1990/02/17','9856461234','London','T',3)
INSERT INTO [Users] VALUES('231567','Florenza Horsewood','flenza21212','florenza@outlook.com','F','1990/02/06','8321907654','Alaska','T',3)
INSERT INTO [Users] VALUES('231569','Trescha Geerdts','trescha121','trescha@yahoo.com','F','1988/12/04','5674321243','Helsinki','I',4)
INSERT INTO [Users] VALUES('231923','Granville Yarnley','gran4324','granville@gmail.com','M','1990/01/07','6987543210','Belgium','I',4)
INSERT INTO [Users] VALUES('231924','Conny Miner','conny1234','conny@rediff.com','M','1993/09/01','7987651234','Tokyo','I',4)
INSERT INTO [Users] VALUES('231935','Teodoor Grossier','teodoor123','teodoor@gmail.com','F','1988/11/17','8765321089','Sydney','I',4)
INSERT INTO [Users] VALUES('231568','Caria Deary','caria6778','caria@gmail.com','F','1989/04/10','7654221089','Cape Town','I',4)
select * from [Users]