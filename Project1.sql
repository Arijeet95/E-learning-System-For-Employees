Create Database E_learn;
GO
CREATE TABLE [Users]
(
	UserId VARCHAR(10) NOT NULL CONSTRAINT pk_users_id Primary Key,
	UserName VARCHAR(30) NOT NULL,
	Gender CHAR(1) CONSTRAINT chk_users_gender CHECK(Gender in ('M','F','O')),
	DateOfBirth DATE,
	Contact_No VARCHAR(10) NOT NULL CONSTRAINT chk_users_contact_no CHECK(LEN(Contact_No)=10),
	[Address] VARCHAR(100) NOT NULL,
	[Type] CHAR(1) CONSTRAINT chk_users_type CHECK([Type] in ('I','T','E')),
)
GO

INSERT INTO [Users] VALUES('231456','Ram Prasad','M','1993/09/01','7457452323','Patna','I')
INSERT INTO [Users] VALUES('231501','Melanie Vanyashkin','F','1992/08/08','8987654321','Beberibe','T')
INSERT INTO [Users] VALUES('231457','Ranique Straun','F','1994/03/13','7467876543','New York','E')
INSERT INTO [Users] VALUES('231458','Patten Kahler','M','1990/02/17','9856461234','London','T')
INSERT INTO [Users] VALUES('231567','Florenza Horsewood','F','1990/02/06','8321907654','Alaska','T')
INSERT INTO [Users] VALUES('231568','Trescha Geerdts','F','1988/12/04','5674321243','Helsinki','I')
INSERT INTO [Users] VALUES('231923','Granville Yarnley','M','1990/01/07','6987543210','Belgium','I')
INSERT INTO [Users] VALUES('231924','Conny Miner','M','1993/09/01','7987651234','Tokyo','I')
INSERT INTO [Users] VALUES('231935','Teodoor Grossier','F','1988/11/17','8765321089','Sydney','I')
INSERT INTO [Users] VALUES('231568','Caria Deary','F','1989/04/10','7654221089','Cape Town','I')
select * from [Users]

CREATE TABLE [CourseAssessments]
(
	CourseAssessmentId VARCHAR(10) CONSTRAINT pk_courseassessments_id PRIMARY KEY,
	Total_Assessment INTEGER NOT NULL,
	Total_Assessment_Attempted INTEGER DEFAULT 0,
	Total_Correct_Assessment INTEGER DEFAULT 0
)
Go

INSERT INTO [CourseAssessments] (CourseAssessmentId,Total_Assessment) VALUES('PY2018',30)
INSERT INTO [CourseAssessments] (CourseAssessmentId,Total_Assessment) VALUES('SQL2019',20)
INSERT INTO [CourseAssessments] (CourseAssessmentId,Total_Assessment) VALUES('C#2017',25)
INSERT INTO [CourseAssessments] (CourseAssessmentId,Total_Assessment) VALUES('C#2018',28)
INSERT INTO [CourseAssessments] (CourseAssessmentId,Total_Assessment) VALUES('TY2018',40)
INSERT INTO [CourseAssessments] (CourseAssessmentId,Total_Assessment) VALUES('MVC2019',24)
INSERT INTO [CourseAssessments] (CourseAssessmentId,Total_Assessment) VALUES('API2019',18)
SELECT * FROM [CourseAssessments]

CREATE TABLE Categories
(
	CategoryId VARCHAR(10) CONSTRAINT pk_categories_id PRIMARY KEY,
	Title VARCHAR(50) NOT NULL Unique,
)
Go

INSERT INTO Categories VALUES('1','Generic')
INSERT INTO Categories VALUES('2','Microsoft')
INSERT INTO Categories VALUES('3','Java')
INSERT INTO Categories VALUES('4','Web Development')
INSERT INTO Categories VALUES('5','Data Analysis')
SELECT * FROM Categories

CREATE TABLE [Courses]
(
	CourseId VARCHAR(10) NOT NULL CONSTRAINT pk_courses_courseid Primary Key,
	CategoryId VARCHAR(10) CONSTRAINT fk_courses_categoryid references Categories(CategoryId),
	CourseAssessmentId VARCHAR(10) CONSTRAINT fk_courses_courseassessmentid references CourseAssessments(CourseAssessmentId),
	CourseName VARCHAR(20) NOT NULL,
	[Description] VARCHAR(100) NOT NULL,
	[Duration] TIME Not NULL,
	[Creators] VARCHAR(250) NOT NULL, 
)
GO

ALTER TABLE [Courses] ALTER COLUMN Duration TIME(7)

INSERT INTO [Courses] VALUES ('C1','1','PY2018','Python','This course Introduces about the python programming language.','10:00','Deepankar')
INSERT INTO [Courses] VALUES ('C2','4','TY2018','TypeScript','More about TypeScript','12:00','Randy Tarrant')
INSERT INTO [Courses] VALUES ('C3','2','C#2017','C#','This course Introduces about the C# language.','18:00:00','Brendon Cappleman')
INSERT INTO [Courses] VALUES ('C4','2','MVC2019','MVC','This course Introduces about MVC.','23:00','Christen Filippazzo')
INSERT INTO [Courses] VALUES ('C5','2','API2019','API','This course Introduces about API.','20:00','Reagan Darrel')
SELECT * FROM [Courses]



CREATE TABLE MapCoursesCategories
(
	MapCoursesCategoriesId VARCHAR(10) CONSTRAINT pk_mapcoursescategories_id PRIMARY KEY,
	CategoryId VARCHAR(10) CONSTRAINT fk_mapcoursescategories_categoryid references Categories(CategoryId),
	CourseId VARCHAR(10) CONSTRAINT fk_mapcoursescategories_courseid references Courses(CourseId)
)
Go


INSERT INTO MapCoursesCategories VALUES ('MCC1','1','C1')
INSERT INTO MapCoursesCategories VALUES ('MCC2','4','C2')
INSERT INTO MapCoursesCategories VALUES ('MCC3','2','C3')
INSERT INTO MapCoursesCategories VALUES ('MCC4','2','C4')
INSERT INTO MapCoursesCategories VALUES ('MCC5','2','C5')
SELECT * FROM MapCoursesCategories


CREATE TABLE [MapUsersCourses]
(
	MapUsersCoursesId VARCHAR(10) NOT NULL CONSTRAINT pk_mapuserscourses_id Primary Key,
	UserId VARCHAR(10) NOT NULL CONSTRAINT fk_mapuserscourses_userid references [Users](UserId),
	CourseId VARCHAR(10) NOT NULL CONSTRAINT fk_mapuserscourses_courseid references Courses(CourseId),
	Completion BINARY NOT NULL DEFAULT 0
)
Go
DROP table MA
INSERT INTO [MapUsersCourses](MapId,UserId,CourseId) VALUES ('M1','231456','C1')
INSERT INTO [MapUsersCourses](MapId,UserId,CourseId) VALUES ('M2','231501','C3')
INSERT INTO [MapUsersCourses](MapId,UserId,CourseId) VALUES ('M3','231457','C4')
INSERT INTO [MapUsersCourses](MapId,UserId,CourseId) VALUES ('M4','231567','C3')
INSERT INTO [MapUsersCourses](MapId,UserId,CourseId) VALUES ('M5','231935','C5')

INSERT INTO [MapUsersCourses] VALUES ('M6','231568','C2',1)
INSERT INTO [MapUsersCourses] VALUES ('M7','231924','C1',1)
INSERT INTO [MapUsersCourses] VALUES ('M8','231935','C4',1)
INSERT INTO [MapUsersCourses] VALUES ('M9','231568','C4',1)
INSERT INTO [MapUsersCourses] VALUES ('M10','231568','C3',1)
SELECT * FROM [MapUsersCourses]

sp_rename 'MapUsersCourses.MapId', 'MapUsersCoursesId', 'COLUMN';

drop table [Users]
drop table [Courses]
drop table MapCoursesCategories
drop table MapUsersCourses
drop table Categories
drop table CourseAssessments