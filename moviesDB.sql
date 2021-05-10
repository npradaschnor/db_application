-- drop database if exists
	DROP Database IF EXISTS MoviesDB;

-- create new database
CREATE DATABASE MoviesDB;

USE MoviesDB;


create function sp_ConvertSQLServerDate(dttm binary(16))
returns datetime
DETERMINISTIC
return CAST(
      '1900-01-01 00:00:00' + 
      INTERVAL CAST(CONV(substr(HEX(dttm),1,8), 16, 10)  AS SIGNED) DAY +
      INTERVAL CAST(CONV(substr(HEX(dttm),9,8), 16, 10)  AS SIGNED)* 10000/3 MICROSECOND
AS DATETIME);



CREATE TABLE Country(
	CountryID int NOT NULL,
	CountryName varchar(255) NULL UNIQUE,
	primary key(CountryID))
	Engine=InnoDb;

INSERT Country (CountryID, CountryName) VALUES (35, N'Taiwan');
INSERT Country (CountryID, CountryName) VALUES (36, N'Malaysia');
INSERT Country (CountryID, CountryName) VALUES (37, N'Japan');
INSERT Country (CountryID, CountryName) VALUES (38, N'Austria');
INSERT Country (CountryID, CountryName) VALUES (39, N'Australia');
INSERT Country (CountryID, CountryName) VALUES (40, N'Mexico');
INSERT Country (CountryID, CountryName) VALUES (41, N'Spain');
INSERT Country (CountryID, CountryName) VALUES (42, N'Ukraine');
INSERT Country (CountryID, CountryName) VALUES (43, N'South Africa');
INSERT Country (CountryID, CountryName) VALUES (44, N'Italy');
INSERT Country (CountryID, CountryName) VALUES (45, N'Sweden');
INSERT Country (CountryID, CountryName) VALUES (46, N'Ireland');
INSERT Country (CountryID, CountryName) VALUES (47, N'Canada');
INSERT Country (CountryID, CountryName) VALUES (48, N'China');
INSERT Country (CountryID, CountryName) VALUES (79, N'France');
INSERT Country (CountryID, CountryName) VALUES (167, N'New Zealand');
INSERT Country (CountryID, CountryName) VALUES (240, N'United Kingdom');
INSERT Country (CountryID, CountryName) VALUES (241, N'United States');
INSERT Country (CountryID, CountryName) VALUES (257, N'Germany');
INSERT Country (CountryID, CountryName) VALUES (258, N'Russia');


CREATE TABLE Director(
	DirectorID int NOT NULL,
	DirectorName nvarchar(255) NULL,
	DirectorDOB datetime NULL,
	DirectorGender enum('Male','Female') NULL,
	DirectorCountryID integer DEFAULT 241,
	foreign key(DirectorCountryID) references Country(CountryID),
	primary key(DirectorID))
	Engine=InnoDB;

INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (4, N'Steven Spielberg', sp_ConvertSQLServerDate(0x0000430000000000), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (5, N'Joel Coen', sp_ConvertSQLServerDate(0x00004E5700000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (6, N'Ethan Coen', sp_ConvertSQLServerDate(0x0000525A00000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (7, N'George Lucas', sp_ConvertSQLServerDate(0x00003F4C00000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender, DirectorCountryID) VALUES (8, N'Ang Lee', sp_ConvertSQLServerDate(0x00004E3200000000 ), N'Male', 35);
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (9, N'Martin Scorsese', sp_ConvertSQLServerDate(0x00003D2C00000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender, DirectorCountryID) VALUES (10, N'Clint Eastwood', sp_ConvertSQLServerDate(0x00002B6300000000 ), N'Male', 167);
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (11, N'Sam Raimi', sp_ConvertSQLServerDate(0x0000555400000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender, DirectorCountryID) VALUES (12, N'Peter Jackson', sp_ConvertSQLServerDate(0x0000583700000000 ), N'Male', 167);
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (14, N'Bryan Singer', sp_ConvertSQLServerDate(0x00005DC000000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender, DirectorCountryID) VALUES (15, N'James Cameron', sp_ConvertSQLServerDate(0x00004DEE00000000 ), N'Male', 47);
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (16, N'Tom Shadyac', sp_ConvertSQLServerDate(0x0000541800000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender, DirectorCountryID) VALUES (17, N'Kevin Reynolds', sp_ConvertSQLServerDate(0x00004A4000000000 ), N'Male', 240);
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (18, N'Michael Bay', sp_ConvertSQLServerDate(0x00005CEC00000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender, DirectorCountryID) VALUES (19, N'David Yates', NULL, N'Male', 167);
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (20, N'Robert Zemeckis', sp_ConvertSQLServerDate(0x00004AB600000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (21, N'Steve Hickner', NULL, N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender, DirectorCountryID) VALUES (25, N'Wolfgang Peterson', sp_ConvertSQLServerDate(0x00003AC700000000 ), N'Male', 257);
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender, DirectorCountryID) VALUES (26, N'Mike Newell', sp_ConvertSQLServerDate(0x00003C4200000000 ), N'Male', 240);
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender, DirectorCountryID) VALUES (27, N'Christopher Nolan', sp_ConvertSQLServerDate(0x000064B100000000 ), N'Male', 167);
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (28, N'Tim Burton', sp_ConvertSQLServerDate(0x000053AC00000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender, DirectorCountryID) VALUES (29, N'Lee Tamahori', sp_ConvertSQLServerDate(0x000047FD00000000 ), N'Male', 167);
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (30, N'Richard Donner', sp_ConvertSQLServerDate(0x00002B3E00000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (37, N'Paul Greengrass', sp_ConvertSQLServerDate(0x00004F5800000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender, DirectorCountryID) VALUES (38, N'Alfonso Cuaron', sp_ConvertSQLServerDate(0x0000585300000000 ), N'Male', 40);
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (39, N'Andy Wachowski', sp_ConvertSQLServerDate(0x0000610100000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (40, N'Ron Howard', sp_ConvertSQLServerDate(0x00004D4600000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (41, N'Chris Columbus', sp_ConvertSQLServerDate(0x000053BC00000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender, DirectorCountryID) VALUES (42, N'Roland Emmerich', sp_ConvertSQLServerDate(0x00004FB100000000 ), N'Male', 40);
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (43, N'Edward Zwick', sp_ConvertSQLServerDate(0x00004B4900000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (44, N'J. J. Abrams', sp_ConvertSQLServerDate(0x00005EDB00000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender, DirectorCountryID) VALUES (45, N'John Woo', sp_ConvertSQLServerDate(0x000042AA00000000 ), N'Male', 167);
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (46, N'Pete Docter', sp_ConvertSQLServerDate(0x000061E200000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender, DirectorCountryID) VALUES (47, N'Roger Spottiswoode', sp_ConvertSQLServerDate(0x0000403800000000 ), N'Male', 240);
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (48, N'Steven Soderbergh', sp_ConvertSQLServerDate(0x000059EF00000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (49, N'Len Wiseman', sp_ConvertSQLServerDate(0x0000686500000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender, DirectorCountryID) VALUES (50, N'Frank Coraci', sp_ConvertSQLServerDate(0x00005E4B00000000 ), N'Male', 37);
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (51, N'Ridley Scott', sp_ConvertSQLServerDate(0x0000361700000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (52, N'Doug Liman', sp_ConvertSQLServerDate(0x00005D8900000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender, DirectorCountryID) VALUES (53, N'Alex Proyas', sp_ConvertSQLServerDate(0x00005AEB00000000 ), N'Male', 38);
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (54, N'Martin Campbell', sp_ConvertSQLServerDate(0x00003A3A00000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender, DirectorCountryID) VALUES (55, N'Jean-Christophe Comar', sp_ConvertSQLServerDate(0x0000520B00000000 ), N'Male', 79);
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (78, N'Tony Scott', sp_ConvertSQLServerDate(0x00003F7200000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (79, N'Quentin Tarantino', sp_ConvertSQLServerDate(0x00005A3700000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (80, N'Tom Dey', NULL, N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender, DirectorCountryID) VALUES (81, N'David Dobkin', NULL, N'Male', 167);
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (82, N'Stephen Norrington', NULL, N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (83, N'Andrew Davis', sp_ConvertSQLServerDate(0x000042E500000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender, DirectorCountryID) VALUES (86, N'Joss Whedon', sp_ConvertSQLServerDate(0x00005BFD00000000 ), N'Male', 47);
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (87, N'David Carson', NULL, N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (88, N'Irvin Kershner', sp_ConvertSQLServerDate(0x0000214600000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (89, N'Robert Wise', sp_ConvertSQLServerDate(0x000014F500000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender, DirectorCountryID) VALUES (90, N'Richard Marquand', sp_ConvertSQLServerDate(0x000036A600000000 ), N'Male', 240);
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (91, N'David Cronenberg', sp_ConvertSQLServerDate(0x00003DA200000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (92, N'Lewis Gilbert', sp_ConvertSQLServerDate(0x00001CC900000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (93, N'Andrew Dominik', NULL, N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender, DirectorCountryID) VALUES (94, N'Ivan Reitman', sp_ConvertSQLServerDate(0x000042CC00000000 ), N'Male', 47);
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (95, N'William Shatner', sp_ConvertSQLServerDate(0x00002C8A00000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender, DirectorCountryID) VALUES (96, N'Nicholas Meyer', sp_ConvertSQLServerDate(0x0000419900000000 ), N'Male', 167);
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (97, N'Paul Michael Glaser', sp_ConvertSQLServerDate(0x00003DAC00000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (98, N'Kevin Costner', sp_ConvertSQLServerDate(0x00004E8900000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (99, N'Leonard Nimoy', sp_ConvertSQLServerDate(0x00002C8E00000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (100, N'John Guillermin', sp_ConvertSQLServerDate(0x000024E500000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender, DirectorCountryID) VALUES (101, N'Richard Attenborough', sp_ConvertSQLServerDate(0x000021C000000000 ), N'Male', 240);
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (102, N'Kurt Wimmer', NULL, N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (103, N'Robert Rodriguez', sp_ConvertSQLServerDate(0x000061AF00000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender, DirectorCountryID) VALUES (104, N'Larry Charles', sp_ConvertSQLServerDate(0x0000501700000000 ), N'Male', 79);
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender, DirectorCountryID) VALUES (105, N'Yimou Zhang', sp_ConvertSQLServerDate(0x00004A0000000000 ), N'Male', 48);
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (106, N'Edgar Wright', sp_ConvertSQLServerDate(0x000069FF00000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender, DirectorCountryID) VALUES (108, N'Danny Boyle', sp_ConvertSQLServerDate(0x0000510A00000000 ), N'Male', 240);
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender, DirectorCountryID) VALUES (109, N'Oliver Hirschbiegel', sp_ConvertSQLServerDate(0x000052BD00000000 ), N'Male', 79);
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (110, N'Val Guest', sp_ConvertSQLServerDate(0x0000110900000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (111, N'Jean-Pierre Jeunet', sp_ConvertSQLServerDate(0x00004C9300000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (112, N'Terence Young', sp_ConvertSQLServerDate(0x0000161000000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender, DirectorCountryID) VALUES (113, N'Peter R. Hunt', sp_ConvertSQLServerDate(0x000023F000000000 ), N'Male', 79);
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (114, N'Stanley Tong', NULL, N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (115, N'Guy Hamilton', sp_ConvertSQLServerDate(0x0000206500000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender, DirectorCountryID) VALUES (116, N'George Clooney', sp_ConvertSQLServerDate(0x0000578500000000 ), N'Male', 48);
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (117, N'Michael Anderson', sp_ConvertSQLServerDate(0x00001CA500000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender, DirectorCountryID) VALUES (118, N'Sammo Hung', sp_ConvertSQLServerDate(0x00004A3600000000 ), N'Male', 167);
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender, DirectorCountryID) VALUES (122, N'Akira Kurosawa', sp_ConvertSQLServerDate(0x00000F6B00000000 ), N'Male', 37);
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (123, N'Morgan Spurlock', sp_ConvertSQLServerDate(0x0000651500000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (124, N'Oliver Owl', sp_ConvertSQLServerDate(0x000063DF00000000 ), N'Male');
INSERT Director (DirectorID, DirectorName, DirectorDOB, DirectorGender) VALUES (125, N'Wendy Wise', sp_ConvertSQLServerDate(0x0000656B00000000 ), N'Female');


CREATE TABLE Certificate(
	CertificateID bigint NOT NULL,
	Certificate varchar(255) NULL,
	primary key(CertificateID))
	Engine=InnoDb;

INSERT Certificate (CertificateID, Certificate) VALUES (1, N'U');
INSERT Certificate (CertificateID, Certificate)  VALUES (2, N'PG');
INSERT Certificate (CertificateID, Certificate)  VALUES (3, N'12');
INSERT Certificate (CertificateID, Certificate)  VALUES (4, N'12A');
INSERT Certificate (CertificateID, Certificate)  VALUES (5, N'15');
INSERT Certificate (CertificateID, Certificate)  VALUES (6, N'18');


CREATE TABLE Actor(
	ActorID int NOT NULL,
	ActorName nvarchar(255) NULL,
	ActorDOB datetime NULL,
	ActorGender enum('Male','Female') NULL,
	ActorCountryID integer DEFAULT 241,
	primary key(ActorID),
	foreign key(ActorCountryID) references Country(CountryID))
	Engine=innodb;
	

INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (1, N'Tom Cruise', sp_ConvertSQLServerDate(0x0000592C00A2F7EC), N'Male', 241);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (2, N'Sam Neill', sp_ConvertSQLServerDate(0x0000440E00000000), N'Male', 167);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (3, N'Laura Dern', sp_ConvertSQLServerDate(0x00005FBF00000000), N'Female', 241);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (4, N'Jeff Goldblum', sp_ConvertSQLServerDate(0x00004B5700000000), N'Male', 241);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (5, N'Richard Attenborough', sp_ConvertSQLServerDate(0x000021C000000000), N'Male', 240);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (6, N'Samuel L. Jackson', sp_ConvertSQLServerDate(0x000045DE00000000), N'Male', 241);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (7, N'Tobey Maguire', sp_ConvertSQLServerDate(0x00006BB200000000), N'Male', 241);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (8, N'Willem Dafoe', sp_ConvertSQLServerDate(0x00004F4200000000), N'Male', 241);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (9, N'Kirsten Dunst', sp_ConvertSQLServerDate(0x0000757500000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (10, N'Naomi Watts', sp_ConvertSQLServerDate(0x0000621300000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (11, N'Jack Black', sp_ConvertSQLServerDate(0x0000636100000000), N'Male', 241);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (12, N'Adrien Brody', sp_ConvertSQLServerDate(0x0000688E00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (13, N'Andy Serkis', sp_ConvertSQLServerDate(0x00005BBD00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (14, N'Brandon Routh', sp_ConvertSQLServerDate(0x000071CF00000000), N'Male', 241);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (15, N'Kate Bosworth', sp_ConvertSQLServerDate(0x0000766C00000000), N'Female', 240);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (16, N'Kevin Spacey', sp_ConvertSQLServerDate(0x000054FB00000000), N'Male', 241);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (17, N'Leonardo DiCaprio', sp_ConvertSQLServerDate(0x00006ACE00000000), N'Male', 241);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (18, N'Kate Winslet', sp_ConvertSQLServerDate(0x00006C1600000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (19, N'Billy Zane', sp_ConvertSQLServerDate(0x00005E6000000000), N'Male', 241);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (20, N'Bill Paxton', sp_ConvertSQLServerDate(0x00004F0000000000), N'Male', 241);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (21, N'Steve Carell', sp_ConvertSQLServerDate(0x0000595800000000), N'Male', 241);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (22, N'Morgan Freeman', sp_ConvertSQLServerDate(0x0000356100000000), N'Male', 241);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (23, N'Kevin Costner', sp_ConvertSQLServerDate(0x00004E8900000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (24, N'Dennis Hopper', sp_ConvertSQLServerDate(0x000033E500000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (25, N'Ben Affleck', sp_ConvertSQLServerDate(0x0000679C00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (26, N'Josh Hartnett', sp_ConvertSQLServerDate(0x0000701200000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (27, N'Kate Beckinsale', sp_ConvertSQLServerDate(0x000068F500000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (28, N'Cuba Gooding Jr.', sp_ConvertSQLServerDate(0x0000610500000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (29, N'Jon Voight', sp_ConvertSQLServerDate(0x000037A100000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (30, N'Alec Baldwin', sp_ConvertSQLServerDate(0x0000531C00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (31, N'Tom Sizemore', sp_ConvertSQLServerDate(0x0000585400000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (32, N'Dan Aykroyd', sp_ConvertSQLServerDate(0x00004AE600000000), N'Male', 47);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (33, N'Shia LaBeouf', sp_ConvertSQLServerDate(0x00007B5400000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (34, N'John Turturro', sp_ConvertSQLServerDate(0x0000518D00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (35, N'Peter Cullen', NULL, N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (36, N'Hugo Weaving', sp_ConvertSQLServerDate(0x000055F800000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (37, N'Megan Fox', sp_ConvertSQLServerDate(0x00007B3A00000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (38, N'Daniel Radcliffe', sp_ConvertSQLServerDate(0x00007FC600000000), N'Male', 240);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (39, N'Ralph Fiennes', sp_ConvertSQLServerDate(0x000059D800000000), N'Male', 240);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (40, N'Brendan Gleeson', sp_ConvertSQLServerDate(0x00004ECF00000000), N'Male',46);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (41, N'Gary Oldman', sp_ConvertSQLServerDate(0x0000530F00000000), N'Male', 240);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (42, N'Michael Gambon', sp_ConvertSQLServerDate(0x00003A3500000000), N'Male', 240);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (43, N'Alan Rickman', sp_ConvertSQLServerDate(0x000041D400000000), N'Male', 240);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (44, N'Emma Thompson', sp_ConvertSQLServerDate(0x0000549500000000), N'Female', 240);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (45, N'Helena Bonham Carter', sp_ConvertSQLServerDate(0x00005EBB00000000), N'Female', 240);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (46, N'Robbie Coltrane', sp_ConvertSQLServerDate(0x000047AE00000000), N'Male', 240);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (47, N'Emma Watson', sp_ConvertSQLServerDate(0x000080D000000000), N'Female', 240);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (48, N'Rupert Grint', sp_ConvertSQLServerDate(0x00007E7900000000), N'Male', 240);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (49, N'Robin Wright Penn', sp_ConvertSQLServerDate(0x00005E8B00000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (50, N'Anthony Hopkins', sp_ConvertSQLServerDate(0x0000363600000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (51, N'John Malkovich', sp_ConvertSQLServerDate(0x00004CF400000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (52, N'Ray Winstone', sp_ConvertSQLServerDate(0x0000518400000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (53, N'Angelina Jolie', sp_ConvertSQLServerDate(0x00006B9B00000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (54, N'John Goodman', sp_ConvertSQLServerDate(0x00004ADB00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (55, N'Jerry Seinfeld', sp_ConvertSQLServerDate(0x00004D8100000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (56, N'Renee Zellweger', sp_ConvertSQLServerDate(0x000062E400000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (57, N'Matthew Broderick', sp_ConvertSQLServerDate(0x000058C400000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (58, N'Chris Rock', sp_ConvertSQLServerDate(0x00005CE200000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (59, N'Ray Liotta', sp_ConvertSQLServerDate(0x00004E6A00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (60, N'Rip Torn', sp_ConvertSQLServerDate(0x00002C5E00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (61, N'Johnny Depp', sp_ConvertSQLServerDate(0x00005A8100000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (62, N'Geoffrey Rush', sp_ConvertSQLServerDate(0x0000497D00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (63, N'Orlando Bloom', sp_ConvertSQLServerDate(0x00006DE800000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (64, N'Keira Knightley', sp_ConvertSQLServerDate(0x0000799A00000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (65, N'Bill Nighy', sp_ConvertSQLServerDate(0x0000474200000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (66, N'Jonathan Pryce', sp_ConvertSQLServerDate(0x000043A500000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (67, N'Stellan Skarsgard', sp_ConvertSQLServerDate(0x0000496600000000), N'Male', 45);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (68, N'Will Smith', sp_ConvertSQLServerDate(0x0000621000000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (69, N'Patton Oswalt', sp_ConvertSQLServerDate(0x0000628C00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (70, N'Ian Holm', sp_ConvertSQLServerDate(0x00002D3800000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (71, N'Brian Dennehy', sp_ConvertSQLServerDate(0x000036F400000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (72, N'Peter O''Toole', sp_ConvertSQLServerDate(0x00002E7D00000000), N'Male', 46);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (73, N'Brian Cox', sp_ConvertSQLServerDate(0x0000423800000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (75, N'Brad Pitt', sp_ConvertSQLServerDate(0x00005B4100000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (76, N'Diane Kruger', sp_ConvertSQLServerDate(0x00006D3200000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (77, N'Eric Bana', sp_ConvertSQLServerDate(0x000061E100000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (78, N'Christian Bale', sp_ConvertSQLServerDate(0x000069B100000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (79, N'Michael Caine', sp_ConvertSQLServerDate(0x00002F5D00000000), N'Male', 240);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (80, N'Liam Neeson', sp_ConvertSQLServerDate(0x00004ACE00000000), N'Male', 240);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (81, N'Katie Holmes', sp_ConvertSQLServerDate(0x000070A800000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (82, N'Rutger Hauer', sp_ConvertSQLServerDate(0x00003EDC00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (83, N'Ken Watanabe', sp_ConvertSQLServerDate(0x0000555200000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (84, N'James Fox', sp_ConvertSQLServerDate(0x0000382E00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (85, N'Christopher Lee', sp_ConvertSQLServerDate(0x00001FF500000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (86, N'Pierce Brosnan', sp_ConvertSQLServerDate(0x00004C2500000000), N'Male', 46);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (87, N'Halle Berry', sp_ConvertSQLServerDate(0x00005F0B00000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (88, N'Rosamund Pike', sp_ConvertSQLServerDate(0x000070D100000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (89, N'Judi Dench', sp_ConvertSQLServerDate(0x000031D800000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (90, N'John Cleese', sp_ConvertSQLServerDate(0x000038CF00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (91, N'Michael Madsen', sp_ConvertSQLServerDate(0x000053CB00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (92, N'Samantha Bond', sp_ConvertSQLServerDate(0x0000585200000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (93, N'Mel Gibson', sp_ConvertSQLServerDate(0x00004FE700000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (94, N'Danny Glover', sp_ConvertSQLServerDate(0x0000426B00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (95, N'Joe Pesci', sp_ConvertSQLServerDate(0x00003D8000000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (96, N'Rene Russo', sp_ConvertSQLServerDate(0x00004D3A00000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (97, N'Jet Li', sp_ConvertSQLServerDate(0x00005A5500000000), N'Male', 48);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (98, N'Bruce Willis', sp_ConvertSQLServerDate(0x00004EC500000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (99, N'Billy Bob Thornton', sp_ConvertSQLServerDate(0x00004F4F00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (100, N'Liv Tyler', sp_ConvertSQLServerDate(0x00006E9100000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (101, N'Steve Buscemi', sp_ConvertSQLServerDate(0x000052AD00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (102, N'Owen Wilson', sp_ConvertSQLServerDate(0x0000624600000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (103, N'Michael Clarke Duncan', sp_ConvertSQLServerDate(0x000052AA00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (104, N'Peter Stormare', sp_ConvertSQLServerDate(0x00004C8C00000000), N'Male', 45);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (105, N'Tommy Lee Jones', sp_ConvertSQLServerDate(0x000042A200000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (106, N'Jamie Foxx', sp_ConvertSQLServerDate(0x000060F100000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (107, N'Jessica Biel', sp_ConvertSQLServerDate(0x0000753B00000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (108, N'Ving Rhames', sp_ConvertSQLServerDate(0x000054B000000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (109, N'Donald Sutherland', sp_ConvertSQLServerDate(0x000032B400000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (110, N'James Woods', sp_ConvertSQLServerDate(0x0000437900000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (111, N'Colin Farrell', sp_ConvertSQLServerDate(0x00006D0500000000), N'Male', 46);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (112, N'Ciaran Hinds', sp_ConvertSQLServerDate(0x00004BC500000000), N'Male', 240);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (113, N'Sophie Marceau', sp_ConvertSQLServerDate(0x00005F6A00000000), N'Female', 79);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (114, N'Robert Carlyle', sp_ConvertSQLServerDate(0x0000576F00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (115, N'Denise Richards', sp_ConvertSQLServerDate(0x0000657B00000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (116, N'Desmond Llewelyn', sp_ConvertSQLServerDate(0x0000138A00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (117, N'Russell Crowe', sp_ConvertSQLServerDate(0x00005BB000000000), N'Male', 167);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (118, N'Paul Bettany', sp_ConvertSQLServerDate(0x000065DE00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (119, N'Dakota Fanning', sp_ConvertSQLServerDate(0x0000865200000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (120, N'Tim Robbins', sp_ConvertSQLServerDate(0x000053E000000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (121, N'Matt Damon', sp_ConvertSQLServerDate(0x000064F700000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (122, N'Julia Stiles', sp_ConvertSQLServerDate(0x000073E700000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (123, N'David Strathairn', sp_ConvertSQLServerDate(0x0000460200000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (124, N'Paddy Considine', sp_ConvertSQLServerDate(0x00006A8B00000000), N'Male', 240);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (125, N'Albert Finney', sp_ConvertSQLServerDate(0x000033DD00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (126, N'Monica Bellucci', sp_ConvertSQLServerDate(0x00005C6000000000), N'Female', 44);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (127, N'Laurence Fishburne', sp_ConvertSQLServerDate(0x000057DA00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (128, N'Carrie-Anne Moss', sp_ConvertSQLServerDate(0x0000607F00000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (129, N'Keanu Reeves', sp_ConvertSQLServerDate(0x00005C4400000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (130, N'Tom Hanks', sp_ConvertSQLServerDate(0x000050A300000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (131, N'Audrey Tautou', sp_ConvertSQLServerDate(0x00006D4B00000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (132, N'Ian McKellen', sp_ConvertSQLServerDate(0x0000383400000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (133, N'Jean Reno', sp_ConvertSQLServerDate(0x0000454E00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (134, N'Jurgen Prochnow', sp_ConvertSQLServerDate(0x00003B1F00000000), N'Male', 257);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (135, N'Richard Harris', sp_ConvertSQLServerDate(0x00002BDE00000000), N'Male', 46);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (136, N'John Hurt', sp_ConvertSQLServerDate(0x0000392600000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (137, N'Dennis Quaid', sp_ConvertSQLServerDate(0x00004D6D00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (138, N'Jake Gyllenhaal', sp_ConvertSQLServerDate(0x0000738400000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (139, N'Billy Connolly', sp_ConvertSQLServerDate(0x00003D3300000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (140, N'Hiroyuki Sanada', sp_ConvertSQLServerDate(0x000056B700000000), N'Male', 37);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (141, N'Cillian Murphy', sp_ConvertSQLServerDate(0x00006CFF00000000), N'Male', 46);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (142, N'Michelle Yeoh', sp_ConvertSQLServerDate(0x0000594E00000000), N'Female', 36);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (143, N'George Clooney', sp_ConvertSQLServerDate(0x0000578500000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (144, N'Mark Wahlberg', sp_ConvertSQLServerDate(0x000065E700000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (145, N'John C. Reilly', sp_ConvertSQLServerDate(0x00005D4C00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (146, N'Mary Elizabeth Mastrantonio', sp_ConvertSQLServerDate(0x0000540000000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (147, N'Michael Ironside', sp_ConvertSQLServerDate(0x0000478000000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (148, N'Philip Seymour Hoffman', sp_ConvertSQLServerDate(0x0000606200000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (149, N'Michelle Monaghan', sp_ConvertSQLServerDate(0x00006CC000000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (150, N'Simon Pegg', sp_ConvertSQLServerDate(0x0000640B00000000), N'Male', 240);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (151, N'Nicolas Cage', sp_ConvertSQLServerDate(0x00005B5500000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (152, N'Christian Slater', sp_ConvertSQLServerDate(0x0000635700000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (153, N'Ewan McGregor', sp_ConvertSQLServerDate(0x000065A500000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (154, N'Natalie Portman', sp_ConvertSQLServerDate(0x0000743000000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (155, N'Hayden Christensen', sp_ConvertSQLServerDate(0x000073FD00000000), N'Male', 47);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (156, N'Frank Oz', sp_ConvertSQLServerDate(0x00003F5700000000), N'Male', 240);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (157, N'Ian McDiarmid', sp_ConvertSQLServerDate(0x00003FA500000000), N'Male', 240);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (158, N'Temuera Morrison', sp_ConvertSQLServerDate(0x0000570200000000), N'Male', 167);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (159, N'Rena Owen', sp_ConvertSQLServerDate(0x0000593F00000000), N'Female', 167);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (160, N'Billy Crystal', sp_ConvertSQLServerDate(0x000044C400000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (161, N'James Coburn', sp_ConvertSQLServerDate(0x000028E500000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (162, N'Ray Park', sp_ConvertSQLServerDate(0x00006A7E00000000), N'Male', 240);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (163, N'Anthony Daniels', sp_ConvertSQLServerDate(0x000041D400000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (164, N'Kenny Baker', sp_ConvertSQLServerDate(0x0000316D00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (165, N'Peter Mayhew', sp_ConvertSQLServerDate(0x00003F5100000000), N'Male', 240);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (166, N'Joe Don Baker', sp_ConvertSQLServerDate(0x0000338600000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (167, N'Elliott Gould', sp_ConvertSQLServerDate(0x0000372700000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (168, N'Andy Garcia', sp_ConvertSQLServerDate(0x0000504B00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (169, N'Julia Roberts', sp_ConvertSQLServerDate(0x000060C300000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (170, N'Don Cheadle', sp_ConvertSQLServerDate(0x00005C9C00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (171, N'Timothy Olyphant', sp_ConvertSQLServerDate(0x0000619000000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (172, N'Jackie Chan', sp_ConvertSQLServerDate(0x00004D6B00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (173, N'Steve Coogan', sp_ConvertSQLServerDate(0x00005DDB00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (174, N'Arnold Schwarzenegger', sp_ConvertSQLServerDate(0x000043E000000000), N'Male', 38);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (175, N'Maggie Q', sp_ConvertSQLServerDate(0x0000714300000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (176, N'Sammo Hung', sp_ConvertSQLServerDate(0x00004A3600000000), N'Male', 48);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (177, N'Jim Broadbent', sp_ConvertSQLServerDate(0x0000467800000000), N'Male', 240);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (178, N'Luke Wilson', sp_ConvertSQLServerDate(0x0000665300000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (179, N'Jeremy Irons', sp_ConvertSQLServerDate(0x0000458100000000), N'Male', 240);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (180, N'Edward Norton', sp_ConvertSQLServerDate(0x0000635700000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (181, N'Vince Vaughan', sp_ConvertSQLServerDate(0x0000643500000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (182, N'Cate Blanchett', sp_ConvertSQLServerDate(0x000062F700000000), N'Female', 39);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (183, N'Jude Law', sp_ConvertSQLServerDate(0x0000682400000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (184, N'Brent Spiner', sp_ConvertSQLServerDate(0x0000460900000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (185, N'Viggo Mortensen', sp_ConvertSQLServerDate(0x000053E400000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (186, N'Elijah Wood', sp_ConvertSQLServerDate(0x000073AC00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (187, N'James Cromwell', sp_ConvertSQLServerDate(0x0000392B00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (188, N'Bridget Moynahan', sp_ConvertSQLServerDate(0x000065C100000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (189, N'Daniel Craig', sp_ConvertSQLServerDate(0x0000614100000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (190, N'Max von Sydow', sp_ConvertSQLServerDate(0x000029C300000000), N'Male', 45);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (191, N'Linda Hamilton', sp_ConvertSQLServerDate(0x000050F200000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (192, N'Edward Furlong', sp_ConvertSQLServerDate(0x00006EB100000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (193, N'Robert Patrick', sp_ConvertSQLServerDate(0x000053F400000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (194, N'Kenneth Branagh', sp_ConvertSQLServerDate(0x000056F200000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (195, N'Denzel Washington', sp_ConvertSQLServerDate(0x00004E7400000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (196, N'Djimon Hounsou', sp_ConvertSQLServerDate(0x00005BC100000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (197, N'Jennifer Connelly', sp_ConvertSQLServerDate(0x0000653800000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (198, N'Arnold Vosloo', sp_ConvertSQLServerDate(0x0000591B00000000), N'Male', 43);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (199, N'Joaquin Phoenix', sp_ConvertSQLServerDate(0x00006AC000000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (200, N'Connie Nielsen', sp_ConvertSQLServerDate(0x00005D7400000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (201, N'Oliver Reed', sp_ConvertSQLServerDate(0x000034F500000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (202, N'Jamie Lee Curtis', sp_ConvertSQLServerDate(0x0000540500000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (203, N'Tom Arnold', sp_ConvertSQLServerDate(0x0000546D00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (204, N'Charlton Heston', sp_ConvertSQLServerDate(0x0000235200000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (205, N'Tia Carrere', sp_ConvertSQLServerDate(0x00005F9800000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (206, N'Art Malik', sp_ConvertSQLServerDate(0x00004B6D00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (207, N'Eliza Dushku', sp_ConvertSQLServerDate(0x0000738F00000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (208, N'Daniel Day-Lewis', sp_ConvertSQLServerDate(0x000051C900000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (209, N'Cameron Diaz', sp_ConvertSQLServerDate(0x000067AB00000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (210, N'Milla Jovovich', sp_ConvertSQLServerDate(0x00006C5F00000000), N'Female', 42);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (211, N'Chris Tucker', sp_ConvertSQLServerDate(0x000067AC00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (212, N'Sean Bean', sp_ConvertSQLServerDate(0x0000549700000000), N'Male', 240);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (213, N'Karl Urban', sp_ConvertSQLServerDate(0x0000675700000000), N'Male', 79);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (214, N'Linda Fiorentino', sp_ConvertSQLServerDate(0x0000530300000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (215, N'Jack Nicholson', sp_ConvertSQLServerDate(0x0000353900000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (216, N'Martin Sheen', sp_ConvertSQLServerDate(0x000039E800000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (217, N'Paul Giamatti', sp_ConvertSQLServerDate(0x0000603300000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (218, N'F. Murray Abraham', sp_ConvertSQLServerDate(0x000038CC00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (219, N'Charles Dance', sp_ConvertSQLServerDate(0x000042BB00000000), N'Male', 240);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (221, N'Catherine Zeta-Jones', sp_ConvertSQLServerDate(0x0000637D00000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (222, N'Adam Sandler', sp_ConvertSQLServerDate(0x00005F2500000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (223, N'Christopher Walken', sp_ConvertSQLServerDate(0x00003DB200000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (224, N'David Hasselhoff', sp_ConvertSQLServerDate(0x00004AF600000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (225, N'Henry Winkler', sp_ConvertSQLServerDate(0x0000416200000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (226, N'Jim Carrey', sp_ConvertSQLServerDate(0x0000588500000000), N'Male', 47);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (227, N'Jennifer Aniston', sp_ConvertSQLServerDate(0x0000629B00000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (228, N'Emmanuelle Beart', sp_ConvertSQLServerDate(0x00005AC300000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (229, N'Robert Duvall', sp_ConvertSQLServerDate(0x00002C3E00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (230, N'Tea Leoni', sp_ConvertSQLServerDate(0x00005E6100000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (231, N'Jon Favreau', sp_ConvertSQLServerDate(0x00005F4D00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (232, N'Vanessa Redgrave', sp_ConvertSQLServerDate(0x000034E700000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (233, N'Paul Newman', sp_ConvertSQLServerDate(0x000023C400000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (234, N'Stanley Tucci', sp_ConvertSQLServerDate(0x000056D500000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (235, N'Ed Harris', sp_ConvertSQLServerDate(0x000048A100000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (236, N'Christopher Plummer', sp_ConvertSQLServerDate(0x00002ABA00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (237, N'Clive Owen', sp_ConvertSQLServerDate(0x00005C6300000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (238, N'Bill Pullman', sp_ConvertSQLServerDate(0x00004CFC00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (239, N'Mary McDonnell', sp_ConvertSQLServerDate(0x00004AA600000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (240, N'Randy Quaid', sp_ConvertSQLServerDate(0x0000486700000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (241, N'Hugh Jackman', sp_ConvertSQLServerDate(0x0000622100000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (242, N'Patrick Stewart', sp_ConvertSQLServerDate(0x000039D300000000), N'Male', 240);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (243, N'Famke Janssen', sp_ConvertSQLServerDate(0x00005DF100000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (244, N'Sean Connery', sp_ConvertSQLServerDate(0x00002BB900000000), N'Male', 240);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (245, N'Michael Biehn', sp_ConvertSQLServerDate(0x000050B900000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (246, N'Rachel Weisz', sp_ConvertSQLServerDate(0x0000658D00000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (247, N'Will Ferrell', sp_ConvertSQLServerDate(0x0000605B00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (248, N'Sacha Baron Cohen', sp_ConvertSQLServerDate(0x0000666900000000), N'Male', 240);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (249, N'Dan Castellaneta', sp_ConvertSQLServerDate(0x000051E700000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (250, N'Julie Kavner', sp_ConvertSQLServerDate(0x0000484F00000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (251, N'Nancy Cartwright', sp_ConvertSQLServerDate(0x0000527C00000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (252, N'Yeardley Smith', sp_ConvertSQLServerDate(0x00005C0700000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (253, N'Patrick McGoohan', sp_ConvertSQLServerDate(0x0000284000000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (254, N'William Hurt', sp_ConvertSQLServerDate(0x000047A400000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (255, N'Sigourney Weaver', sp_ConvertSQLServerDate(0x0000470100000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (256, N'Mike Myers', sp_ConvertSQLServerDate(0x00005A7200000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (257, N'Eddie Murphy', sp_ConvertSQLServerDate(0x0000576400000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (258, N'Antonio Banderas', sp_ConvertSQLServerDate(0x0000567800000000), N'Male', 41);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (259, N'Jonathan Frakes', sp_ConvertSQLServerDate(0x00004B1700000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (260, N'LeVar Burton', sp_ConvertSQLServerDate(0x0000518100000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (261, N'Michael Dorn', sp_ConvertSQLServerDate(0x00004B8700000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (262, N'Gates McFadden', sp_ConvertSQLServerDate(0x0000462500000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (263, N'Marina Sirtis', sp_ConvertSQLServerDate(0x00004ECF00000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (264, N'Bob Hoskins', sp_ConvertSQLServerDate(0x00003D1600000000), N'Male', 240);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (265, N'Christopher Lloyd', sp_ConvertSQLServerDate(0x0000375D00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (266, N'Kathleen Turner', sp_ConvertSQLServerDate(0x00004DB400000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (267, N'Christina Ricci', sp_ConvertSQLServerDate(0x0000724D00000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (268, N'Vin Diesel', sp_ConvertSQLServerDate(0x0000605D00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (269, N'William Sadler', sp_ConvertSQLServerDate(0x000047BC00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (270, N'Bonnie Bedelia', sp_ConvertSQLServerDate(0x000044CF00000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (271, N'Geena Davis', sp_ConvertSQLServerDate(0x00004FF900000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (272, N'Kevin Bacon', sp_ConvertSQLServerDate(0x0000537C00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (273, N'Gary Sinise', sp_ConvertSQLServerDate(0x00004EC300000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (274, N'Sharon Stone', sp_ConvertSQLServerDate(0x0000530400000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (275, N'Sylvester Stallone', sp_ConvertSQLServerDate(0x0000425B00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (276, N'John Lithgow', sp_ConvertSQLServerDate(0x0000415700000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (277, N'Michael Rooker', sp_ConvertSQLServerDate(0x00004ED700000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (278, N'Harrison Ford', sp_ConvertSQLServerDate(0x00003CAD00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (279, N'Scarlett Johansson', sp_ConvertSQLServerDate(0x0000791E00000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (280, N'Hilary Swank', sp_ConvertSQLServerDate(0x00006A6600000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (281, N'Kathleen Quinlan', sp_ConvertSQLServerDate(0x00004E4D00000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (282, N'Joely Richardson', sp_ConvertSQLServerDate(0x00005CC500000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (283, N'Sean Pertwee', sp_ConvertSQLServerDate(0x00005BEA00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (284, N'Ron Perlman', sp_ConvertSQLServerDate(0x000047BC00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (285, N'Selma Blair', sp_ConvertSQLServerDate(0x0000676700000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (286, N'Ben Stiller', sp_ConvertSQLServerDate(0x00005E0A00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (287, N'Juliette Lewis', sp_ConvertSQLServerDate(0x000068D200000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (288, N'Fred Williamson', sp_ConvertSQLServerDate(0x0000367600000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (289, N'Snoop Dogg', sp_ConvertSQLServerDate(0x0000667000000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (290, N'Chris Penn', sp_ConvertSQLServerDate(0x00005DD700000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (291, N'Gerard Butler', sp_ConvertSQLServerDate(0x000063AE00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (292, N'Dominic West', sp_ConvertSQLServerDate(0x0000639100000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (293, N'David Wenham', sp_ConvertSQLServerDate(0x00005DC400000000), N'Male', 39);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (294, N'Lena Headey', sp_ConvertSQLServerDate(0x0000693A00000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (295, N'Malcolm McDowell', sp_ConvertSQLServerDate(0x00003DFC00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (296, N'James Doohan', sp_ConvertSQLServerDate(0x00001CC600000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (297, N'Walter Koenig', sp_ConvertSQLServerDate(0x0000345D00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (298, N'William Shatner', sp_ConvertSQLServerDate(0x00002C8A00000000), N'Male', 47);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (299, N'Leonard Nimoy', sp_ConvertSQLServerDate(0x00002C8E00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (300, N'DeForest Kelley', sp_ConvertSQLServerDate(0x00001C9B00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (301, N'George Takei', sp_ConvertSQLServerDate(0x0000353700000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (302, N'Nichelle Nichols', sp_ConvertSQLServerDate(0x00002F1100000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (303, N'Ricardo Montalban', sp_ConvertSQLServerDate(0x00001DD100000000), N'Male', 40);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (305, N'Marlon Brando', sp_ConvertSQLServerDate(0x0000229A00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (306, N'Gene Hackman', sp_ConvertSQLServerDate(0x00002AEA00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (307, N'Christopher Reeve', sp_ConvertSQLServerDate(0x00004B3C00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (308, N'Margot Kidder', sp_ConvertSQLServerDate(0x0000459D00000000), N'Female', 47);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (309, N'James Gandolfini', sp_ConvertSQLServerDate(0x0000580C00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (310, N'Val Kilmer', sp_ConvertSQLServerDate(0x0000559900000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (311, N'Jim Caviezel', sp_ConvertSQLServerDate(0x0000621100000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (312, N'Uma Thurman', sp_ConvertSQLServerDate(0x0000645500000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (313, N'Lucy Liu', sp_ConvertSQLServerDate(0x0000625400000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (314, N'Daryl Hannah', sp_ConvertSQLServerDate(0x000056EB00000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (315, N'David Carradine', sp_ConvertSQLServerDate(0x000034B200000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (316, N'Charles S. Dutton', sp_ConvertSQLServerDate(0x000048E000000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (317, N'Pete Postlethwaite', sp_ConvertSQLServerDate(0x000041CF00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (318, N'Wesley Snipes', sp_ConvertSQLServerDate(0x0000594800000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (319, N'Kris Kristofferson', sp_ConvertSQLServerDate(0x0000340900000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (320, N'Donnie Yen', sp_ConvertSQLServerDate(0x00005AB100000000), N'Male', 48);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (321, N'Ryan Phillippe', sp_ConvertSQLServerDate(0x00006A9000000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (322, N'Robert De Niro', sp_ConvertSQLServerDate(0x00003E3D00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (323, N'John Rhys-Davies', sp_ConvertSQLServerDate(0x00003F4300000000), N'Male', 240);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (324, N'Stephen Dorff', sp_ConvertSQLServerDate(0x000068F800000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (325, N'James Earl Jones', sp_ConvertSQLServerDate(0x00002C4A00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (326, N'Julianne Moore', sp_ConvertSQLServerDate(0x000056EB00000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (327, N'Joe Pantoliano', sp_ConvertSQLServerDate(0x000049C100000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (328, N'Madeleine Stowe', sp_ConvertSQLServerDate(0x000053A500000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (329, N'Russell Means', sp_ConvertSQLServerDate(0x000038DD00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (330, N'Wes Studi', sp_ConvertSQLServerDate(0x0000446C00000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (331, N'Rudy Youngblood', sp_ConvertSQLServerDate(0x0000760500000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (332, N'Dalia Hernandez', sp_ConvertSQLServerDate(0x00007A2700000000), N'Female', 40);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (333, N'Rachel McAdams', sp_ConvertSQLServerDate(0x00006D8600000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender, ActorCountryID) VALUES (334, N'Isla Fisher', sp_ConvertSQLServerDate(0x00006C8F00000000), N'Female', 39);
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (335, N'Jane Seymour', sp_ConvertSQLServerDate(0x000048F000000000), N'Female');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (336, N'Michael J. Fox', sp_ConvertSQLServerDate(0x000057A700000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (337, N'Thomas F. Wilson', sp_ConvertSQLServerDate(0x0000549500000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (338, N'Timothy Dalton', sp_ConvertSQLServerDate(0x00003F1600000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (339, N'Benicio Del Toro', sp_ConvertSQLServerDate(0x00005FC800000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (340, N'Robert Brown', sp_ConvertSQLServerDate(0x00001EC100000000), N'Male');
INSERT Actor (ActorID, ActorName, ActorDOB, ActorGender) VALUES (341, N'David Hedison', sp_ConvertSQLServerDate(0x0000271000000000), N'Male');

CREATE TABLE Studio(
	StudioID int NOT NULL AUTO_INCREMENT,
	StudioName varchar(255) NULL UNIQUE,
	Primary Key(StudioID))
	Engine=InnoDB;

	
INSERT Studio (StudioID, StudioName) VALUES (1, N'Universal Pictures');
INSERT Studio (StudioID, StudioName) VALUES (2, N'Paramount Pictures');
INSERT Studio (StudioID, StudioName) VALUES (3, N'Walt Disney Pictures');
INSERT Studio (StudioID, StudioName) VALUES (4, N'20th Century Fox');
INSERT Studio (StudioID, StudioName) VALUES (5, N'Columbia Pictures');
INSERT Studio (StudioID, StudioName) VALUES (6, N'Warner Bros. Pictures');
INSERT Studio (StudioID, StudioName) VALUES (7, N'Touchstone Pictures');
INSERT Studio (StudioID, StudioName) VALUES (8, N'Dreamworks');
INSERT Studio (StudioID, StudioName) VALUES (9, N'ImageMovers');
INSERT Studio (StudioID, StudioName) VALUES (10, N'Disney Pixar');
INSERT Studio (StudioID, StudioName) VALUES (11, N'MGM');
INSERT Studio (StudioID, StudioName) VALUES (12, N'Chris Lee Productions');
INSERT Studio (StudioID, StudioName) VALUES (13, N'Lucasfilm');
INSERT Studio (StudioID, StudioName) VALUES (14, N'New Line Cinema');
INSERT Studio (StudioID, StudioName) VALUES (15, N'Carolco Pictures');
INSERT Studio (StudioID, StudioName) VALUES (16, N'Miramax Films');
INSERT Studio (StudioID, StudioName) VALUES (17, N'Jerry Bruckheimer Films');
INSERT Studio (StudioID, StudioName) VALUES (18, N'Gaumont');
INSERT Studio (StudioID, StudioName) VALUES (19, N'Revolution Studios');
INSERT Studio (StudioID, StudioName) VALUES (20, N'Imagine Entertainment');
INSERT Studio (StudioID, StudioName) VALUES (21, N'Morgan Creek Productions');
INSERT Studio (StudioID, StudioName) VALUES (22, N'United Artists');
INSERT Studio (StudioID, StudioName) VALUES (23, N'Dimension Films');
INSERT Studio (StudioID, StudioName) VALUES (24, N'Braveworld Productions');
INSERT Studio (StudioID, StudioName) VALUES (25, N'Icon Productions');
INSERT Studio (StudioID, StudioName) VALUES (26, N'Carolina Bank');
INSERT Studio (StudioID, StudioName) VALUES (27, N'Tig Productions');
INSERT Studio (StudioID, StudioName) VALUES (28, N'Dune Entertainment');
INSERT Studio (StudioID, StudioName) VALUES (29, N'Beijing New Picture Film Co.');
INSERT Studio (StudioID, StudioName) VALUES (30, N'Big Talk Productions');
INSERT Studio (StudioID, StudioName) VALUES (31, N'Malpaso Company');
INSERT Studio (StudioID, StudioName) VALUES (32, N'British Film Council');
INSERT Studio (StudioID, StudioName) VALUES (33, N'Channel Four Films');
INSERT Studio (StudioID, StudioName) VALUES (34, N'Constantin Film');
INSERT Studio (StudioID, StudioName) VALUES (35, N'Bavaria Film');
INSERT Studio (StudioID, StudioName) VALUES (36, N'Bayerischer Rundfunk');
INSERT Studio (StudioID, StudioName) VALUES (37, N'RKO Radio Pictures');
INSERT Studio (StudioID, StudioName) VALUES (38, N'Toho Company');
INSERT Studio (StudioID, StudioName) VALUES (39, N'Kathbur Pictures');
INSERT Studio (StudioID, StudioName) VALUES (40, N'Avalon Studios');

CREATE TABLE Language(
	LanguageID int NOT NULL,
	Language varchar(255) NULL,
	Primary Key(LanguageID))
	Engine=InnoDB;

INSERT Language (LanguageID, Language) VALUES (1, N'English');
INSERT Language (LanguageID, Language) VALUES (2, N'Cantonese');
INSERT Language (LanguageID, Language) VALUES (3, N'French');
INSERT Language (LanguageID, Language) VALUES (4, N'German');
INSERT Language (LanguageID, Language) VALUES (5, N'Mandarin');
INSERT Language (LanguageID, Language) VALUES (6, N'Japanese');
INSERT Language (LanguageID, Language) VALUES (7, N'Aramaic');
INSERT Language (LanguageID, Language) VALUES (8, N'Mayan');
INSERT Language (LanguageID, Language) VALUES (9, N'Russian');
INSERT Language (LanguageID, Language) VALUES (10, N'Spanish');
INSERT Language (LanguageID, Language) VALUES (11, N'Owl Hoot');

CREATE TABLE Genre(
	GenreId bigint NOT NULL,
	GenreName varchar(50) NULL,
	Primary Key (GenreId))
	Engine=InnoDB;

INSERT Genre (GenreId, GenreName) VALUES (1, N'Action');
INSERT Genre (GenreId, GenreName) VALUES (2, N'Drama');
INSERT Genre (GenreId, GenreName) VALUES (3, N'Romantic');
INSERT Genre (GenreId, GenreName) VALUES (4, N'Comedy');
INSERT Genre (GenreId, GenreName) VALUES (5, N'Muscial');
INSERT Genre (GenreId, GenreName) VALUES (6, N'Other');

CREATE TABLE Film(
	FilmID int NOT NULL,
	FilmName nvarchar(255) NULL,
	FilmReleaseDate datetime NULL,
	FilmDirectorID int NULL,
	FilmLanguageID int NULL,
	FilmCountryID int NULL,
	FilmStudioID int NULL,
	FilmGenreID bigint DEFAULT 6,
	FilmSynopsis varchar(2000) NULL,
	FilmRunTimeMinutes int NULL,
	FilmCertificateID bigint NULL,
	FilmBudgetDollars int NULL,
	FilmBoxOfficeDollars int NULL,
	FilmOscarNominations int NULL,
	FilmOscarWins int NULL,
	Primary Key(FilmID),
	Foreign Key(FilmDirectorID) References Director(DirectorID),
	Foreign Key(FilmLanguageID) References Language(LanguageID),
	Foreign Key(FilmCountryID) References Country(CountryID),
	Foreign Key(FilmStudioID) References Studio(StudioID),
	Foreign Key(FilmGenreID) References Genre(GenreId),
	Foreign Key(FilmCertificateID) References Certificate(CertificateID))
	Engine=InnoDB;

	
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (1, N'Jurassic Park', sp_ConvertSQLServerDate(0x0000857400000000), 4, 1, 241, 1, N'Scientists clone dinosaurs to populate a theme park which suffers a major security breakdown and releases the dinosaurs.', 127, 2, 63000000, 920100000, 3, 3);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (2, N'Spider-Man', sp_ConvertSQLServerDate(0x0000922B00000000), 11, 1, 241, 5, N'When bitten by a genetically modified spider, a nerdy, shy, and awkward high school student gains spider-like abilities that he eventually must use to fight evil as a superhero after tragedy befalls his family.', 121, 4, 139000000, 821606375, 2, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (3, N'King Kong', sp_ConvertSQLServerDate(0x0000972B00000000), 12, 1, 241, 1, N'In 1933 New York, an overly ambitious movie producer coerces his cast and hired ship crew to travel to mysterious Skull Island, where they encounter Kong, a giant ape who is immediately smitten with leading lady Ann Darrow.', 187, 4, 207000000, 550316796, 4, 3);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (5, N'Superman Returns', sp_ConvertSQLServerDate(0x0000980000000000), 14, 1, 241, 6, N'After a long visit to the lost remains of the planet Krypton, the Man of Steel returns to earth to become the peoples savior once again and reclaim the love of Lois Lane.', 154, 4, 204000000, 391120000, 1, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmGenreID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (6, N'Titanic', sp_ConvertSQLServerDate(0x00008BE800000000), 15, 1, 241, 4, 3, N'Fictional romantic tale of a rich girl and poor boy who meet on the ill-fated voyage of the ''unsinkable'' ship.', 194, 3, 200000000, 1835400000, 14, 11);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmGenreID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (7, N'Evan Almighty', sp_ConvertSQLServerDate(0x0000997F00000000), 16, 1, 241, 1, 2, N'God (Freeman) contacts Congressman Evan Baxter (Carell) and tells him to build an ark in preparation for a great flood.', 95, 2, 175000000, 173219280, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (8, N'Waterworld', sp_ConvertSQLServerDate(0x0000886800000000), 17, 1, 241, 1, N'In a future where the polar ice caps have melted and most of Earth is underwater, a mutated mariner fights starvation and outlaw "smokers," and reluctantly helps a woman and a young girl find dry land.', 136, 3, 175000000, 264246220, 1, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (9, N'Pearl Harbor', sp_ConvertSQLServerDate(0x000090B100000000), 18, 1, 241, 7, N'Pearl Harbor follows the story of two best friends, Rafe and Danny, and their love lives as they go off to join the war.', 183, 3, 151500000, 450500000, 4, 1);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (10, N'Transformers', sp_ConvertSQLServerDate(0x0000997800000000), 18, 1, 241, 8, N'A war re-erupts on Earth between two robotic clans, the heroic Autobots and the evil Decepticons, leaving the fate of mankind hanging in the balance.', 144, 4, 151000000, 707675744, 3, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (11, N'Harry Potter and the Order of the Phoenix', sp_ConvertSQLServerDate(0x0000996900000000), 19, 1, 240, 6, N'With their warning about Lord Voldemort''s return scoffed at, Harry and Dumbledore are targeted by the Wizard authorities as an authoritarian bureaucrat slowly seizes power at Hogwarts.', 138, 4, 150000000, 938454486, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (12, N'Beowulf', sp_ConvertSQLServerDate(0x000099E800000000), 20, 1, 241, 2, N'The warrior Beowulf must fight and defeat the monster Grendel who is terrorizing towns, and later, Grendel''s mother, who begins killing out of revenge.', 113, 4, 150000000, 194995215, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (13, N'Bee Movie', sp_ConvertSQLServerDate(0x00009A0400000000), 21, 1, 241, 8, N'Barry B. Benson, a bee who has just graduated from college, is disillusioned at his lone career choice: making honey. On a special trip outside the hive, Barry''s life is saved by Vanessa, a florist in New York City. As their relationship blossoms, he discovers humans actually eat honey, and subsequently decides to sue us.', 90, 1, 150000000, 286758211, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (17, N'Troy', sp_ConvertSQLServerDate(0x000094EE00000000), 25, 1, 241, 6, N'An adaptation of Homer''s great epic, the film follows the assault on Troy by the united Greek forces and chronicles the fates of the men involved.', 163, 5, 150000000, 497298577, 1, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (18, N'Harry Potter and the Goblet of Fire', sp_ConvertSQLServerDate(0x0000971000000000), 26, 1, 240, 6, N'Harry finds himself selected as an underaged competitor in a dangerous multi-wizardary school competition.', 157, 4, 150000000, 896013036, 1, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (19, N'Batman Begins', sp_ConvertSQLServerDate(0x0000967500000000), 27, 1, 241, 6, N'The story of how Bruce Wayne became what he was destined to be: Batman.', 140, 4, 150000000, 371824647, 1, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmGenreID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (20, N'Charlie and the Chocolate Factory', sp_ConvertSQLServerDate(0x000096A000000000), 28, 1, 240, 6, 5, N'A young boy wins a tour through the most magnificent chocolate factory in the world, led by the world''s most unusual candy maker.', 115, 2, 150000000, 473459076, 1, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (22, N'Die Another Day', sp_ConvertSQLServerDate(0x000092CA00000000), 29, 1, 240, 11, N'James Bond is sent to investigate the connection between a North Korean terrorist and a diamond mogul who is funding the development of an international space weapon.', 133, 4, 142000000, 431942139, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (23, N'Lethal Weapon 4', sp_ConvertSQLServerDate(0x00008CD600000000), 30, 1, 241, 6, N'With personal crises and age weighing in on them, LAPD officers Riggs and Murtaugh must contend with a deadly Chinese crimelord trying to get his brother out of prison.', 127, 5, 140000000, 285400000, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (24, N'Armageddon', sp_ConvertSQLServerDate(0x00008CAC00000000), 18, 1, 241, 7, N'When an asteroid the size of Texas is headed for Earth the world''s best deep core drilling team is sent to nuke the rock from the inside.', 150, 3, 140000000, 554600000, 4, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (26, N'Spider-Man 3', sp_ConvertSQLServerDate(0x0000992400000000), 11, 1, 241, 5, N'A strange black entity from another world bonds with Peter Parker and causes inner turmoil as he contends with new villains, temptations, and revenge.', 139, 4, 258000000, 891930303, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (27, N'Spider-Man 2', sp_ConvertSQLServerDate(0x0000952600000000), 11, 1, 241, 5, N'Peter Parker is beset with troubles in his failing personal life as he battles a brilliant scientist named Doctor Otto Octavius, who becomes Doctor Octopus (aka Doc Ock), after an accident causes him to bond psychically with mechanical tentacles that do his bidding.', 127, 4, 200000000, 784024485, 3, 1);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (33, N'War of the Worlds', sp_ConvertSQLServerDate(0x0000968400000000), 4, 1, 241, 2, N'As Earth is invaded by alien tripod fighting machines, one family fights for survival.', 116, 4, 132000000, 591745532, 3, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmGenreID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (34, N'The Bourne Ultimatum', sp_ConvertSQLServerDate(0x0000998D00000000), 37, 1, 241, 1, 6, N'Bourne dodges new, superior assassins as he searches for his unknown past while a government agent tries to track him down.', 115, 4, 130000000, 442748521, 3, 3);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (35, N'Harry Potter and the Prisoner of Azkaban', sp_ConvertSQLServerDate(0x000094F800000000), 38, 1, 240, 6, N'It''s Harry''s third year at Hogwarts; not only does he have a new "Defense Against the Dark Arts" teacher, but there is also trouble brewing. Convicted murderer Sirius Black has escaped the Wizards'' Prison and is coming after Harry.', 141, 2, 130000000, 795538952, 2, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (36, N'The Matrix Reloaded', sp_ConvertSQLServerDate(0x0000938000000000), 39, 1, 241, 6, N'Neo and the rebel leaders estimate that they have 72 hours until 250,000 probes discover Zion and destroy it and its inhabitants. During this, Neo must decide how he can save Trinity from a dark fate in his dreams.', 138, 5, 127000000, 738576929, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (37, N'The Da Vinci Code', sp_ConvertSQLServerDate(0x000097C600000000), 40, 1, 241, 5, N'A murder inside the Louvre and clues in Da Vinci paintings lead to the discovery of a religious mystery protected by a secret society for two thousand years -- which could shake the foundations of Christianity.', 149, 4, 125000000, 757536138, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (38, N'Harry Potter and the Philosopher''s Stone', sp_ConvertSQLServerDate(0x0000915900000000), 41, 1, 240, 6, N'Rescued from the outrageous neglect of his aunt and uncle, a young boy with a great destiny proves his worth while attending Hogwarts School of Witchcraft and Wizardry.', 152, 2, 125000000, 976457891, 3, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (39, N'The Day After Tomorrow', sp_ConvertSQLServerDate(0x000094F400000000), 42, 1, 241, 4, N'A climatologist tries to figure out a way to save the world from abrupt global warming. He must get to his young son in New York, which is being taken over by a new ice age.', 124, 4, 125000000, 542740799, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (41, N'The Last Samurai', sp_ConvertSQLServerDate(0x0000946900000000), 43, 1, 241, 6, N'An American military advisor embraces the Samurai culture he was hired to destroy after he is captured in battle.', 154, 5, 120000000, 456810575, 4, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmGenreID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (42, N'The Perfect Storm', sp_ConvertSQLServerDate(0x00008F7D00000000), 25, 1, 241, 6, 2, N'An unusually intense storm pattern catches some commercial fishermen unaware and puts them in mortal danger.', 130, 3, 120000000, 328711434, 2, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (43, N'Mission: Impossible III', sp_ConvertSQLServerDate(0x000097B700000000), 44, 1, 241, 2, N'Ethan Hunt comes face to face with a dangerous and sadistic arms dealer while trying to keep his identity secret in order to protect his girlfriend.', 126, 4, 150000000, 397501348, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (44, N'Mission: Impossible II', sp_ConvertSQLServerDate(0x00008F6800000000), 45, 1, 241, 2, N'A secret agent is sent to Sydney, to find and destroy a genetically modified disease called "Chimera"', 123, 5, 120000000, 546209889, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (45, N'Windtalkers', sp_ConvertSQLServerDate(0x0000927800000000), 45, 1, 241, 11, N'Two U.S. Marines in WWII are assigned to protect Navajo Marines who use their native language as an unbreakable radio cypher.', 134, 5, 115000000, 77628265, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (46, N'Star Wars: Episode II - Attack of the Clones', sp_ConvertSQLServerDate(0x0000920E00000000), 7, 1, 241, 13, N'Anakin Skywalker shares a forbidden romance with Padme Amidala while his teacher, Obi-Wan Kenobi, makes an investigation of a separatist assassination attempt on Padme which leads to the discovery of a secret Republican clone army.', 142, 2, 115000000, 656695615, 1, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (47, N'Monsters, Inc.', sp_ConvertSQLServerDate(0x000091AD00000000), 46, 1, 241, 10, N'Monsters generate their city''s power by scaring children, but they are terribly afraid themselves of being contaminated by children, so when one enters Monstropolis, top scarer Sulley find his world disrupted.', 92, 1, 115000000, 525370172, 3, 1);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (48, N'Star Wars: Episode I - The Phantom Menace', sp_ConvertSQLServerDate(0x00008E0300000000), 7, 1, 241, 13, N'The evil Trade Federation, led by Nute Gunray (Carson) is planning to take over the peaceful world of Naboo.', 133, 1, 115000000, 924288297, 3, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (49, N'Star Wars: Episode III - Revenge of the Sith', sp_ConvertSQLServerDate(0x0000965900000000), 7, 1, 241, 13, N'After three years of fighting in the Clone Wars, Anakin Skywalker concludes his journey towards the Dark Side of the Force, putting his friendship with Obi Wan Kenobi and his marriage at risk.', 140, 4, 115000000, 848470577, 1, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmGenreID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (50, N'The Matrix Revolutions', sp_ConvertSQLServerDate(0x0000942800000000), 39, 1, 241, 6, 6, N'The human city of Zion defends itself against the massive invasion of the machines as Neo fights to end the war at another front while also opposing the rogue Agent Smith.', 129, 5, 110000000, 424259759, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (51, N'Tomorrow Never Dies', sp_ConvertSQLServerDate(0x00008BBE00000000), 47, 1, 240, 11, N'James Bond heads to stop a media mogul''s plan to induce war between China and the UK in order to obtain exclusive global media coverage.', 119, 3, 110000000, 339504276, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (52, N'Ocean''s Eleven', sp_ConvertSQLServerDate(0x000091B400000000), 48, 1, 241, 6, N'Danny Ocean and his ten accomplices plan to rob three Las Vegas casinos simultaneously.', 116, 3, 110000000, 450728529, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (53, N'Live Free or Die Hard', sp_ConvertSQLServerDate(0x0000996100000000), 49, 1, 241, 4, N'John McClane takes on an Internet-based terrorist organization who is systematically shutting down the United States.', 130, 5, 110000000, 383277179, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (54, N'Around the World in 80 Days', sp_ConvertSQLServerDate(0x0000951F00000000), 50, 1, 241, 3, N'A bet pits a British inventor, a Chinese thief, and a French artist on a worldwide adventure that they can circle the globe in 80 days.', 120, 2, 110000000, 72004159, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (55, N'Kingdom of Heaven', sp_ConvertSQLServerDate(0x0000964C00000000), 51, 1, 241, 4, N'Balian of Ibelin travels to Jerusalem during the crusades of the 12th century, and there he finds himself as the defender of the city and its people.', 145, 5, 110000000, 211398413, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmGenreID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (56, N'Mr. and Mrs. Smith', sp_ConvertSQLServerDate(0x0000966F00000000), 52, 1, 241, 4, 3, N'A bored married couple is surprised to learn that they are both assassins hired by competing agencies to kill each other.', 120, 5, 110000000, 468336279, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (57, N'The Aviator', sp_ConvertSQLServerDate(0x000095D400000000), 9, 1, 241, 6, N'A biopic depicting the early years of legendary director and aviator Howard Hughes'' career, from the late 1920s to the mid-1940s.', 170, 4, 110000000, 214608827, 11, 5);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (59, N'The Lord of the Rings: Fellowship of the Ring', sp_ConvertSQLServerDate(0x0000917A00000000), 12, 1, 167, 14, N'In a small village in the Shire a young Hobbit named Frodo has been entrusted with an ancient Ring. Now he must embark on an Epic quest to the Cracks of Doom in order to destroy it.', 178, 2, 109000000, 868621686, 13, 4);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (60, N'I, Robot', sp_ConvertSQLServerDate(0x0000953B00000000), 53, 1, 241, 4, N'In the year 2035 a techno-phobic cop investigates a crime that may have been perpetrated by a robot, which leads to a larger threat to humanity.', 115, 4, 105000000, 348801023, 1, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (61, N'Casino Royale', sp_ConvertSQLServerDate(0x0000987B00000000), 54, 1, 240, 11, N'In his first mission, James Bond must stop Le Chiffre, a banker to the world''s terrorist organizations, from winning a high-stakes poker tournament at Casino Royale in Montenegro.', 144, 4, 102000000, 594165000, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (62, N'Minority Report', sp_ConvertSQLServerDate(0x0000923F00000000), 4, 1, 241, 8, N'In the future, criminals are caught before the crimes they commit, but one of the officers in the special unit is accused of one such crime and sets out to prove his innocence.', 145, 3, 102000000, 358814112, 1, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (63, N'Terminator 2: Judgement Day', sp_ConvertSQLServerDate(0x000082B800000000), 15, 1, 241, 15, N'The cyborg who once tried to kill Sarah Connor must now protect her teenager son, John Connor, from an even more powerful and advanced cyborg.', 137, 5, 100000000, 516816151, 4, 6);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (64, N'Catwoman', sp_ConvertSQLServerDate(0x0000954200000000), 55, 1, 241, 6, N'A shy woman, endowed with the speed, reflexes, and senses of a cat, walks a thin line between criminal and hero, even as a detective doggedly pursues her, fascinated by both of her personas.', 104, 4, 100000000, 73887903, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (65, N'Harry Potter and the Chamber of Secrets', sp_ConvertSQLServerDate(0x000092C500000000), 41, 1, 240, 6, N'Harry ignores warnings not to return to Hogwarts, only to find the school plagued by a series of mysterious attacks and a strange voice haunting him.', 161, 2, 100000000, 878987880, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (66, N'American Gangster', sp_ConvertSQLServerDate(0x000099E800000000), 51, 1, 241, 1, N'In 1970s America, a detective works to bring down the drug empire of Frank Lucas, a heroin kingpin from Manhattan, who is smuggling the drug into the country from the Far East.', 157, 6, 100000000, 264132214, 2, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmGenreID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (67, N'Blood Diamond', sp_ConvertSQLServerDate(0x000098C200000000), 43, 1, 241, 6, 2, N'A fisherman, a smuggler, and a syndicate of businessmen match wits over the possession of a priceless diamond.', 143, 5, 100000000, 171377916, 5, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (68, N'Gladiator', sp_ConvertSQLServerDate(0x00008F3000000000), 51, 1, 241, 8, N'When a Roman general is betrayed and his family murdered by a corrupt prince, he comes to Rome as a gladiator to seek revenge.', 155, 5, 103000000, 457683805, 12, 5);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (69, N'True Lies', sp_ConvertSQLServerDate(0x000086FC00000000), 15, 1, 241, 4, N'When a secret agent learns of his wife''s extra-marital affair, he pursues her and uses his intelligence resources in a job he kept secret from her.', 141, 5, 100000000, 365300000, 1, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmGenreID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (70, N'Gangs of New York', sp_ConvertSQLServerDate(0x000092FC00000000), 9, 1, 241, 16, 6, N'In 1863, Amsterdam Vallon returns to the Five Points area of New York City seeking revenge against Bill the Butcher, his father''s killer.', 167, 6, 97000000, 190400000, 10, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (71, N'Black Hawk Down', sp_ConvertSQLServerDate(0x0000919800000000), 51, 1, 241, 17, N'123 elite U.S. soldiers drop into Somalia to capture two top lieutenants of a renegade warlord and find themselves in a desperate battle with a large force of heavily-armed Somalis.', 144, 5, 95000000, 173638745, 4, 2);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (73, N'The Lord of the Rings: Return of the King', sp_ConvertSQLServerDate(0x0000945200000000), 12, 1, 167, 14, N'The former Fellowship of the Ring prepare for the final battle for Middle Earth, while Frodo & Sam approach Mount Doom to destroy the One Ring.', 201, 4, 94000000, 1133027325, 11, 11);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (74, N'The Lord of the Rings: The Two Towers', sp_ConvertSQLServerDate(0x000092E600000000), 12, 1, 167, 14, N'Frodo and Sam continue on to Mordor in their mission to destroy the One Ring. Whilst their former companions make new allies and launch an assault on Isengard.', 179, 4, 94000000, 926284377, 6, 2);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmGenreID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (78, N'The Departed', sp_ConvertSQLServerDate(0x0000985200000000), 9, 1, 241, 6, 2, N'Two men from opposite sides of the law are undercover within the Massachusetts State Police and the Irish mafia, but violence and bloodshed boil when discoveries are made, and the moles are dispatched to find out their enemy''s identities.', 151, 6, 90000000, 290539042, 5, 4);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (80, N'Cinderella Man', sp_ConvertSQLServerDate(0x000096CA00000000), 40, 1, 241, 1, N'The story of James Braddock, a supposedly washed up boxer who came back to become a champion and an inspiration in the 1930s.', 144, 4, 88000000, 108539911, 3, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (81, N'The Bourne Supremacy', sp_ConvertSQLServerDate(0x0000954200000000), 37, 1, 241, 1, N'When Jason Bourne is framed for a botched CIA operation he is forced to take up his former life as a trained assassin to survive.', 108, 4, 85000000, 288587450, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (83, N'Cast Away', sp_ConvertSQLServerDate(0x0000902500000000), 20, 1, 241, 8, N'A FedEx executive must transform himself physically and emotionally to survive a crash landing on a deserted island.', 143, 3, 85000000, 427230516, 2, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (84, N'Ocean''s Twelve', sp_ConvertSQLServerDate(0x000095F100000000), 48, 1, 241, 6, N'Daniel Ocean recruits one more team member so he can pull off three major European heists in this sequel to Ocean''s 11.', 125, 4, 85000000, 363531634, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (85, N'Click', sp_ConvertSQLServerDate(0x0000984B00000000), 50, 1, 241, 5, N'A workaholic architect finds a universal remote that allows him to fast-forward and rewind to different parts of his life. Complications arise when the remote starts to overrule his choices.', 107, 4, 82500000, 237555633, 1, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (86, N'Bruce Almighty', sp_ConvertSQLServerDate(0x000093A500000000), 16, 1, 241, 1, N'A guy who complains about God too often is given almighty powers to teach him how difficult it is to run the world.', 101, 4, 81000000, 485004995, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (90, N'A Beautiful Mind', sp_ConvertSQLServerDate(0x000091BB00000000), 40, 1, 241, 1, N'After a brilliant but asocial mathematician accepts secret work in cryptography, his life takes a turn to the nightmarish.', 135, 3, 78000000, 316708996, 8, 4);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmGenreID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (91, N'Children of Men', sp_ConvertSQLServerDate(0x0000984400000000), 38, 1, 241, 1, 2, N'In 2027, in a chaotic world in which humans can no longer procreate, a former activist agrees to help transport a miraculously pregnant woman to a sanctuary at sea, where her child''s birth may help scientists save the future of humankind.', 109, 5, 76000000, 69450202, 3, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmGenreID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (92, N'Munich', sp_ConvertSQLServerDate(0x0000975600000000), 4, 1, 241, 8, 2, N'Based on the true story of the Black September aftermath, about the five men chosen to eliminate the ones responsible for that fateful day.', 164, 5, 75000000, 130279090, 5, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (93, N'Independence Day', sp_ConvertSQLServerDate(0x000089D400000000), 42, 1, 241, 4, N'The aliens are coming and their goal is to invade and destroy. Fighting superior technology, Man''s best weapon is the will to survive.', 145, 3, 75000000, 816969255, 2, 1);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (94, N'X-Men', sp_ConvertSQLServerDate(0x00008F9200000000), 14, 1, 241, 4, N'Two mutants come to a private academy for mutants whose resident superhero team must oppose a powerful mutant terrorist organization.', 104, 3, 75000000, 295999717, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (95, N'X2', sp_ConvertSQLServerDate(0x0000936C00000000), 14, 1, 241, 4, N'The X-Men band together to find a mutant assassin who has made an attempt on the President''s life, while the Mutant Academy is attacked by military forces.', 133, 4, 125000000, 406400513, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (96, N'The Rock', sp_ConvertSQLServerDate(0x000089A300000000), 18, 1, 241, 17, N'A group of U.S. marines, under command of a renegade general, take over Alcatraz and threat San Francisco Bay with biological weapons. A chemical weapons specialist and the only man to have ever escaped from the Rock are the only ones who can prevent chaos.', 136, 5, 75000000, 336069511, 1, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (106, N'The Abyss', sp_ConvertSQLServerDate(0x0000801800000000), 15, 1, 241, 4, N'A civilian diving team are enlisted to search for a lost nuclear submarine and face danger while encountering an alien aquatic species.', 138, 5, 70000000, 54243125, 4, 1);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmGenreID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (108, N'Who Framed Roger Rabbit?', sp_ConvertSQLServerDate(0x00007EDD00000000), 20, 1, 241, 7, 4, N'A toon hating detective is a cartoon rabbit''s only hope to prove his innocence when he is accused of murder.', 104, 2, 70000000, 351500000, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (109, N'Sleepy Hollow', sp_ConvertSQLServerDate(0x00008EB200000000), 28, 1, 241, 2, N'Ichabod Crane is sent to Sleepy Hollow to investigate the decapitations of 3 people with the culprit being the legendary apparition, the Headless Horseman.', 105, 5, 70000000, 207068340, 3, 1);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (113, N'Apollo 13', sp_ConvertSQLServerDate(0x0000889200000000), 40, 1, 241, 1, N'True story of the moon-bound mission that developed severe trouble and the men that rescued it with skill and dedication.', 140, 2, 65000000, 334100000, 9, 2);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (114, N'Saving Private Ryan', sp_ConvertSQLServerDate(0x00008CCF00000000), 4, 1, 241, 8, N'Based on a World War II drama. US soldiers try to save their comrade, paratrooper Private Ryan, who''s stationed behind enemy lines.', 170, 5, 65000000, 481635085, 11, 5);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (116, N'The Matrix', sp_ConvertSQLServerDate(0x00008DE000000000), 39, 1, 241, 6, N'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against the controllers of it.', 136, 5, 65000000, 456500000, 4, 4);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (120, N'GoldenEye', sp_ConvertSQLServerDate(0x000088D100000000), 54, 1, 240, 11, N'James Bond teams up with the lone survivor of a destroyed Russian research center to stop the hijacking of a nuclear space weapon by a fellow agent believed to be dead.', 130, 3, 60000000, 356429941, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (124, N'The Bourne Identity', sp_ConvertSQLServerDate(0x0000927F00000000), 52, 1, 241, 1, N'A man is picked up by a fishing boat, bullet-riddled and without memory, then races to elude assassins and recover from amnesia.', 119, 4, 60000000, 213300000, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (127, N'Intolerable Cruelty', sp_ConvertSQLServerDate(0x0000941C00000000), 5, 1, 241, 20, N'A revenge-seeking gold digger marries a womanizing Beverly Hills lawyer with the intention of making a killing in the divorce.', 100, 4, 60000000, 121327628, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (130, N'Superman', sp_ConvertSQLServerDate(0x000070AB00000000), 30, 1, 241, 6, N'An alien orphan is sent from his dying planet to Earth, where he grows up to become his adoptive home''s first and greatest super-hero.', 143, 2, 55000000, 300200000, 3, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (131, N'Crimson Tide', sp_ConvertSQLServerDate(0x000088BC00000000), 78, 1, 241, 17, N'On a US nuclear missile sub, a young first officer stages a mutiny to prevent his trigger happy captain from launching his missiles before confirming his orders to do so.', 116, 5, 55000000, 159387195, 3, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (132, N'Deja Vu', sp_ConvertSQLServerDate(0x0000989800000000), 78, 1, 241, 7, N'An ATF agent travels back in time to save a woman from being murdered, falling in love with her during the process.', 126, 4, 80000000, 181038616, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmGenreID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (133, N'Man On Fire', sp_ConvertSQLServerDate(0x0000957A00000000), 78, 1, 241, 4, 2, N'In Mexico City, a former assassin swears vengeance on those who committed an unspeakable act against the family he was hired to protect.', 146, 6, 60000000, 118706816, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmGenreID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (134, N'Enemy of the State', sp_ConvertSQLServerDate(0x00008D3900000000), 78, 1, 241, 7, 2, N'A lawyer becomes a target by a corrupt politician and his NSA goons when he accidentally receives key evidence to a serious politically motivated crime.', 132, 5, 85000000, 250300000, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (135, N'Kill Bill: Vol. 1', sp_ConvertSQLServerDate(0x0000941500000000), 79, 1, 241, 16, N'The Bride wakes up after a long coma. The baby that she carried before entering the coma is gone. The only thing on her mind is to have revenge on the assassination team that betrayed her - a team she was once part of.', 111, 6, 55000000, 180098138, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (137, N'Shanghai Noon', sp_ConvertSQLServerDate(0x00008F9900000000), 80, 1, 241, 7, N'Jackie Chan plays a Chinese man who travels to the Wild West to rescue a kidnapped princess. After teaming up with a train robber, the unlikely duo takes on a Chinese traitor and his corrupt boss.', 110, 3, 55000000, 71189835, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (138, N'Kill Bill: Vol. 2', sp_ConvertSQLServerDate(0x000094D200000000), 79, 1, 241, 16, N'The murderous Bride continues her vengeance quest against her ex-boss, Bill, and his two remaining associates; his younger brother Budd, and Bill''s latest flame Elle.', 136, 6, 55000000, 150907920, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmGenreID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (140, N'Flags of our Fathers', sp_ConvertSQLServerDate(0x0000989F00000000), 10, 1, 241, 8, 2, N'The life stories of the six men who raised the flag at The Battle of Iwo Jima, a turning point in WWII.', 132, 5, 53000000, 61902376, 2, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (141, N'Casino', sp_ConvertSQLServerDate(0x0000892C00000000), 9, 1, 241, 1, N'Greed, deception, money, power, and murder occur between two mobster best friends and a trophy wife over a gambling empire.', 178, 6, 52000000, 110400000, 1, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmGenreID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (142, N'Robin Hood: Prince of Thieves', sp_ConvertSQLServerDate(0x0000829C00000000), 17, 1, 241, 6, 3, N'When Robin and his Moorish companion come to England and the tyranny of the Sheriff of Nottingham, he decides to fight back as an outlaw.', 143, 2, 50000000, 390500000, 1, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (144, N'Shanghai Knights', sp_ConvertSQLServerDate(0x0000935100000000), 81, 1, 241, 7, N'When a Chinese rebel murders Chon''s estranged father and escapes to England, Chon and Roy make their way to London with revenge on their minds.', 114, 4, 50000000, NULL, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (145, N'Indiana Jones and the Last Crusade', sp_ConvertSQLServerDate(0x00007FAF00000000), 4, 1, 241, 13, N'When Dr. Henry Jones Sr. suddenly goes missing while pursuing the Holy Grail, eminent archaeologist Indiana Jones must follow in his father''s footsteps and stop the Nazis.', 127, 2, 48000000, 474171806, 3, 1);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (147, N'Blade', sp_ConvertSQLServerDate(0x00008D0E00000000), 82, 1, 241, 14, N'A half-vampire, half-mortal man becomes a protector of the mortal race, while slaying evil vampires.', 120, 6, 45000000, 131237688, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (149, N'The Fugitive', sp_ConvertSQLServerDate(0x000085BA00000000), 83, 1, 241, 6, N'Dr. Richard Kimble, unjustly accused of killing his wife, must find the real one-armed killer while avoiding Marshal Sam Gerard.', 130, 3, 44000000, 368900000, 7, 1);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (150, N'The Prestige', sp_ConvertSQLServerDate(0x0000987500000000), 27, 1, 241, 7, N'Robert and Alfred are rival magicians. When Alfred performs the ultimate magic trick, Robert tries desperately to find out the secret to the trick.', 130, 4, 40000000, 107896006, 2, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmGenreID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (153, N'Wedding Crashers', sp_ConvertSQLServerDate(0x0000969100000000), 81, 1, 241, 14, 4, N'John Beckwith and Jeremy Grey, a pair of committed womanizers who sneak into weddings to take advantage of the romantic tinge in the air, find themselves at odds with one another when John meets and falls for Claire Cleary.', 119, 5, 40000000, 283218368, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (154, N'Back to the Future Part III', sp_ConvertSQLServerDate(0x0000812700000000), 20, 1, 241, 1, N'Doctor Emmet Brown was living in peace in 1885 until he was killed by Buford "Mad Dog" Tannen. Marty McFly travels back in time to save his friend.', 118, 2, 40000000, 243700000, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (155, N'Back to the Future Part II', sp_ConvertSQLServerDate(0x0000804200000000), 20, 1, 241, 1, N'After visiting 2015, Marty must repeat his visit to 1955 to prevent disastrous changes to 1985... without interfering with his first trip.', 108, 2, 40000000, 332000000, 1, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (159, N'Serenity', sp_ConvertSQLServerDate(0x000096E600000000), 86, 1, 241, 1, N'In the future, when a passenger with a deadly secret. Six rebels on the run. An assassin in pursuit.', 119, NULL, 39000000, 38514517, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (160, N'Star Trek: Generations', sp_ConvertSQLServerDate(0x0000875E00000000), 87, 1, 241, 2, N'Capt. Picard, with the help of supposedly dead Capt. Kirk, must stop a madman willing to murder on a planetary scale in order to enter a space matrix.', 118, 2, 38000000, 120000000, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (161, N'Never Say Never Again', sp_ConvertSQLServerDate(0x000077C700000000), 88, 1, 241, 6, N'A SPECTRE agent has stolen two American nuclear warheads, and James Bond must find their targets before they are detonated.', 134, NULL, 36000000, 160000000, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (162, N'Star Trek: The Motion Picture', sp_ConvertSQLServerDate(0x0000721700000000), 89, 1, 241, 2, N'When a destructive space entity is spotted approaching Earth, Admiral Kirk resumes command of the Starship Enterprise in order to intercept, examine, and hopefully stop it.', 132, 1, 35000000, 139000000, 3, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (164, N'Lethal Weapon 3', sp_ConvertSQLServerDate(0x0000842400000000), 30, 1, 241, 6, N'Martin Riggs finally meets his match in the form of Lorna Cole, a beautiful but tough policewoman.', 118, NULL, 35000000, 319700000, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (165, N'Star Wars: Episode IV - Return of the Jedi', sp_ConvertSQLServerDate(0x000076FB00000000), 90, 1, 241, 13, N'After rescuing Han Solo from the palace of Jabba the Hutt, the Rebels attempt to destroy the Second Death Star, while Luke Skywalker tries to bring his father back to the Light Side of the Force.', 134, NULL, 32500000, 572700000, 4, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (166, N'A History of Violence', sp_ConvertSQLServerDate(0x000096DF00000000), 91, 1, 241, 14, N'A mild-mannered man becomes a local hero through an act of violence, which sets off repercussions that will shake his family to its very core.', 96, NULL, 32000000, 59993782, 2, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (167, N'Moonraker', sp_ConvertSQLServerDate(0x0000716900000000), 92, 1, 240, 22, N'James Bond investigates the mid-air theft of a space shuttle and discovers a plot to commit global genocide.', 126, NULL, 31000000, 210300000, 1, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (169, N'The Assassination of Jesse James by the Coward Robert Ford', sp_ConvertSQLServerDate(0x000099F600000000), 93, 1, 241, 6, N'Robert Ford, who''s idolized Jesse James since childhood, tries hard to join the reforming gang of the Missouri outlaw, but gradually becomes resentful of the bandit leader.', 160, NULL, 30000000, 11128555, 2, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (170, N'Million Dollar Baby', sp_ConvertSQLServerDate(0x000095DC00000000), 10, 1, 241, 6, N'A hardened trainer/manager works with a determined woman in her attempt to establish herself as a boxer.', 132, NULL, 30000000, 216763646, 7, 4);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (173, N'Ghost Busters', sp_ConvertSQLServerDate(0x0000792D00000000), 94, 1, 241, 5, N'Three unemployed parapsychology professors set up shop as a unique ghost removal service.', 105, NULL, 30000000, 291632124, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (174, N'Star Trek V: The Final Frontier', sp_ConvertSQLServerDate(0x0000801F00000000), 95, 1, 241, 2, N'Capt. Kirk and his crew must deal with Mr. Spock''s half brother who hijacks the Enterprise for an obsessive search for God.', 107, NULL, 30000000, 70200000, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (175, N'Indiana Jones and the Temple of Doom', sp_ConvertSQLServerDate(0x0000787E00000000), 4, 1, 241, 13, N'After arriving in India, Indiana Jones is asked by a desperate village to find a mystical stone. He agrees, and stumbles upon a secret cult plotting a terrible plan in the catacombs of an ancient palace.', 118, NULL, 28000000, 333080271, 2, 1);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (176, N'Blade Runner', sp_ConvertSQLServerDate(0x000075F900000000), 51, 1, 241, 6, N'Deckard, a blade runner, has to track down and terminate 4 replicants who hijacked a ship in space and have returned to earth seeking their maker.', 117, NULL, 28000000, 33139618, 2, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (180, N'Star Trek VI: The Undiscovered Country', sp_ConvertSQLServerDate(0x0000836E00000000), 96, 1, 241, 2, N'The crews of the Enterprise and the Excelsior must stop a plot to prevent a peace treaty between the Klingon Empire and the Federation.', 113, 2, 27000000, 96900000, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (181, N'The Running Man', sp_ConvertSQLServerDate(0x00007EB300000000), 97, 1, 241, 24, N'A wrongly-convicted man must try to survive a public execution gauntlet staged as a TV game show.', 101, NULL, 27000000, 38122000, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (182, N'Open Range', sp_ConvertSQLServerDate(0x000094AF00000000), 98, 1, 241, 7, N'A former gunslinger is forced to take up arms again when he and his cattle crew are threatened by a corrupt lawman.', 139, NULL, 26000000, 68293719, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (183, N'Kindergarten Cop', sp_ConvertSQLServerDate(0x000081F400000000), 94, 1, 241, 1, N'A tough cop is given his most difficult assignment: masquerade as a a kindergarten teacher in order to find a drug dealer.', 111, NULL, 26000000, 202000000, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (184, N'O Brother, Where Art Thou?', sp_ConvertSQLServerDate(0x00008FAE00000000), 5, 1, 241, 7, N'Homer''s epic poem "The Odyssey", set in the deep south during the 1930''s. In it, three escaped convicts search for hidden treasure while a relentless lawman pursues them.', 107, NULL, 26000000, 74506619, 2, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (185, N'Goodfellas', sp_ConvertSQLServerDate(0x0000816D00000000), 9, 1, 241, 6, N'Henry Hill and his friends work their way up through the mob hierarchy.', 145, NULL, 25000000, 46743809, 6, 1);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (188, N'Schindler''s List', sp_ConvertSQLServerDate(0x0000864D00000000), 4, 1, 241, 1, N'Oskar Schindler uses Jews to start a factory in Poland during the war. He witnesses the horrors endured by the Jews, and starts to save them.', 195, NULL, 25000000, 321200000, 12, 7);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (191, N'Star Trek IV: The Voyage Home', sp_ConvertSQLServerDate(0x00007C8300000000), 99, 1, 241, 2, N'To save Earth from an alien probe, Kirk and his crew go back in time to retrieve the only beings who can communicate with it, humpback whales.', 119, 2, 24000000, 133000000, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (192, N'King Kong', sp_ConvertSQLServerDate(0x00006DCD00000000), 100, 1, 241, 2, N'A petroleum exploration expedition comes to an isolated island and encounters a colossal giant gorilla.', 134, NULL, 23000000, 80014445, 2, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (193, N'Star Wars: Episode V - The Empire Strikes Back', sp_ConvertSQLServerDate(0x000072B000000000), 88, 1, 241, 13, N'While Luke takes advanced Jedi training from Yoda, his friends are relentlessly pursued by Darth Vader as part of his plan to capture Luke.', 124, NULL, 23000000, 534200000, 3, 1);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (194, N'Gandhi', sp_ConvertSQLServerDate(0x0000765300000000), 101, 1, 240, 26, N'Biography of Mahatma Gandhi, the lawyer who became the famed leader of the Indian revolts against the British through his philosophy of non-violent protest.', 188, NULL, 22000000, 52767889, 11, 8);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (195, N'Equilibrium', sp_ConvertSQLServerDate(0x0000933C00000000), 102, 1, 241, 23, N'In a Fascist future where all forms of feeling are illegal, a man in charge of enforcing the law rises to overthrow the system.', 107, NULL, 20000000, 5345869, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmGenreID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (196, N'From Dusk Till Dawn', sp_ConvertSQLServerDate(0x0000898E00000000), 103, 1, 241, 23, 6, N'Two criminals and their hostages unknowingly seek temporary refuge in an establishment populated by vampires, with chaotic results.', 108, NULL, 20000000, 25728961, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (197, N'Raiders of the Lost Ark', sp_ConvertSQLServerDate(0x0000746300000000), 4, 1, 241, 13, N'Archeologist and adventurer Indiana Jones is hired by the US government to find the Ark of the Covenant, before the Nazis.', 115, NULL, 20000000, 386800358, 8, 4);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (199, N'Back to the Future', sp_ConvertSQLServerDate(0x00007A9700000000), 20, 1, 241, 1, N'In 1985, Doc Brown invented time travel, in 1955, Marty McFly accidentally prevented his parents from meeting, putting his own existence at stake.', 117, NULL, 19000000, 381109762, 4, 1);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (200, N'Dances With Wolves', sp_ConvertSQLServerDate(0x000081FB00000000), 98, 1, 241, 27, N'Lt. John Dunbar, exiled to a remote western Civil War outpost, befriends wolves and Indians, making him an intolerable aberration in the military.', 180, NULL, 19000000, 424200000, 12, 7);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (201, N'Star Trek III: The Search For Spock', sp_ConvertSQLServerDate(0x000078A800000000), 99, 1, 241, 2, N'Admiral Kirk and his bridge crew risk their careers stealing the decommissioned Enterprise to return to the restricted Genesis planet to recover Spock''s body.', 105, 2, 18000000, 87000000, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (202, N'Borat: Cultural Learnings of America for Make Benefit Glorious Nation of Kazakhstan', sp_ConvertSQLServerDate(0x0000986D00000000), 104, 1, 241, 28, N'Kazakh TV talking head Borat is dispatched to the United States to report on the greatest country in the world. With a documentary crew in tow, Borat becomes more interested in locating and marrying Pamela Anderson.', 84, NULL, 18000000, 261509089, 1, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (203, N'Raging Bull', sp_ConvertSQLServerDate(0x000073F400000000), 9, 1, 241, 22, N'An emotionally self-destructive boxer''s journey through life, as the violence and temper that leads him to the top in the ring, destroys his life outside it.', 129, NULL, 18000000, 23380203, 8, 2);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (204, N'Aliens', sp_ConvertSQLServerDate(0x00007BA300000000), 15, 1, 241, 4, N'The planet from Alien (1979) has been colonized, but contact is lost. This time, the rescue team has impressive firepower, enough?', 137, NULL, 17000000, 183316455, 7, 2);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (205, N'Hero', sp_ConvertSQLServerDate(0x0000956C00000000), 105, 5, 48, 29, N'A series of Rashomon-like flashback accounts shape the story of how one man defeated three assassins who sought to murder the most powerful warlord in pre-unified China.', 99, NULL, 17000000, 177352140, 1, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (206, N'Hot Fuzz', sp_ConvertSQLServerDate(0x000098D500000000), 106, 1, 240, 30, N'Jealous colleagues conspire to get a top London cop transferred to a small town and paired with a witless new partner. On the beat, the pair stumble upon a series of suspicious accidents and events.', 121, NULL, 16000000, 79192988, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (208, N'High Plains Drifter', sp_ConvertSQLServerDate(0x0000691000000000), 10, 1, 241, 31, N'A gunfighting stranger comes to the small settlement of Lago and is hired to bring the townsfolk together in an attempt to hold off three outlaws who are on their way.', 105, NULL, 15700000, 15700000, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (211, N'Lethal Weapon', sp_ConvertSQLServerDate(0x00007D0F00000000), 30, 1, 241, 6, N'A veteran cop, Murtough, is partnered with a young homicidal cop, Riggs. Both having one thing in common, hating working in pairs. Now they must learn to work with one and other to stop a gang of drug smugglers.', 110, NULL, 15000000, 120192350, 1, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (212, N'Lethal Weapon 2', sp_ConvertSQLServerDate(0x00007FFC00000000), 30, 1, 241, 6, N'Riggs and Murtaugh are on the trail of South African diplomats who are using their immunity to engage in criminal activities.', 114, NULL, 25000000, 140292000, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (213, N'Crouching Tiger, Hidden Dragon', sp_ConvertSQLServerDate(0x0000901E00000000), 8, 5, 48, 5, N'Two warriors in pursuit of a stolen sword and a notorious fugitive are led to an impetuous, physically-skilled, teenage nobleman''s daughter, who is at a crossroads in her life.', 120, NULL, 15000000, 213200000, 10, 4);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (214, N'Brokeback Mountain', sp_ConvertSQLServerDate(0x0000974800000000), 8, 1, 241, 2, N'Based on the ''E. Annie Proulx'' story about a forbidden and secretive relationship between two cowboys and their lives over the years.', 134, NULL, 13900000, 180343761, 8, 3);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (215, N'Hulk', sp_ConvertSQLServerDate(0x000093BA00000000), 8, 1, 241, 1, N'A geneticist''s experimental accident curses him with the tendency to become a powerful giant green brute under emotional stress.', 138, NULL, 137000000, 245160047, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (216, N'Sense and Sensibility', sp_ConvertSQLServerDate(0x0000892C00000000), 8, 1, 240, 5, N'Rich Mr. Dashwood dies, leaving his second wife and her daughters poor by the rules of inheritance. Two daughters are the titular opposites.', 136, NULL, 16500000, 134993774, 7, 1);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (217, N'Ride with the Devil', sp_ConvertSQLServerDate(0x00008E7300000000), 8, 1, 241, 1, N'Jake Roedel and Jack Bull Chiles are friends in Missouri when the Civil War starts.', 138, NULL, 35000000, 630779, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (218, N'Twins', sp_ConvertSQLServerDate(0x00007F4600000000), 94, 1, 241, 1, N'A physically perfect, but innocent, man goes in search of his twin brother, who is a short small-time crook.', 105, NULL, 15000000, 216600000, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (219, N'28 Days Later...', sp_ConvertSQLServerDate(0x000092B700000000), 108, 1, 240, 32, N'Four weeks after a mysterious, incurable virus spreads throughout the UK, a handful of survivors try to find sanctuary.', 113, NULL, 15000000, 82719885, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (220, N'The Beach', sp_ConvertSQLServerDate(0x00008ED500000000), 108, 1, 240, 4, N'Twenty-something Richard travels to Thailand and finds himself in possession of a strange map. Rumours state that it leads to a solitary beach paradise, a tropical bliss - excited and intrigued, he sets out to find it.', 119, NULL, 50000000, 39778599, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (221, N'Trainspotting', sp_ConvertSQLServerDate(0x0000892C00000000), 108, 1, 240, 33, N'Renton, deeply immersed in the Edinburgh drug scene, tries to clean up and get out, despite the allure of the drugs and influence of friends.', 94, NULL, 3100000, 24000785, 1, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (222, N'The Spy Who Loved Me', sp_ConvertSQLServerDate(0x00006EB200000000), 92, 1, 240, 22, N'James Bond investigates the hijacking of British and Russian submarines carrying nuclear warheads with the help of a KGB agent whose lover he killed.', 125, NULL, 14000000, 185400000, 3, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (223, N'Downfall', sp_ConvertSQLServerDate(0x0000962900000000), 109, 4, 257, 34, N'Traudl Junge (Lara), the final secretary for Adolf Hitler (Ganz), tells of the Nazi dictator''s final days in his Berlin bunker at the end of WWII.', 156, NULL, 13500000, 93501940, 1, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmGenreID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (224, N'Letters from Iwo Jima', sp_ConvertSQLServerDate(0x000098DE00000000), 10, 6, 241, 8, 6, N'The story of the battle of Iwo Jima between the United States and Imperial Japan during World War II, as told from the perspective of the Japanese who fought it.', 141, NULL, 13000000, 68356082, 4, 1);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (225, N'Star Trek II: The Wrath of Khan', sp_ConvertSQLServerDate(0x000075C200000000), 96, 1, 241, 2, N'Admiral Kirk''s midlife crisis is interrupted by the return of an old enemy looking for revenge and a potentially destructive device.', 113, 3, 12000000, 96800000, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (226, N'House of Flying Daggers', sp_ConvertSQLServerDate(0x000095DC00000000), 105, 5, 48, 29, N'A romantic warrior breaks a beautiful member of a rebel army out of prison to help her rejoin her fellows, but things are not what they seem.', 119, NULL, 12000000, 93041228, 1, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (227, N'Das Boot', sp_ConvertSQLServerDate(0x0000752600000000), 25, 4, 257, 4, N'The claustrophobic world of a WWII German U-boat; boredom, filth, and sheer terror.', 149, NULL, 12000000, 84970337, 6, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (228, N'Casino Royale', sp_ConvertSQLServerDate(0x0000600C00000000), 110, 1, 240, 5, N'In an early spy spoof, aging Sir James Bond (David Niven) comes out of retirement to take on SMERSH.', 131, NULL, 12000000, 41744718, 1, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (229, N'Star Wars: Episode IV - A New Hope', sp_ConvertSQLServerDate(0x00006F4400000000), 7, 1, 241, 13, N'Luke Skywalker leaves his home planet, teams up with other rebels, and tries to save Princess Leia from the evil clutches of Darth Vader.', 121, NULL, 11000000, 797900000, 10, 6);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (230, N'E.T.: The Extra-Terrestrial', sp_ConvertSQLServerDate(0x0000765400000000), 4, 1, 241, 1, N'A group of Earth children help a stranded alien botanist return home.', 115, NULL, 10500000, 792910554, 9, 4);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (231, N'Amelie', sp_ConvertSQLServerDate(0x0000912F00000000), 111, 3, 79, 16, N'Amelie, an innocent and naive girl in Paris, with her own sense of justice, decides to help those around her and along the way, discovers love.', 122, NULL, 10350000, 152637129, 5, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (232, N'You Only Live Twice', sp_ConvertSQLServerDate(0x0000603A00000000), 92, 1, 241, 22, N'Agent 007 and the Japanese secret service ninja force must find and stop the true culprit of a series of spacejackings before nuclear war is provoked.', 117, NULL, 9500000, 111600000, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (233, N'Thunderball', sp_ConvertSQLServerDate(0x00005E2700000000), 112, 1, 240, 22, N'James Bond heads to The Bahamas to recover two nuclear warheads stolen by SPECTRE agent Emilio Largo in an international extortion scheme.', 130, NULL, 9000000, 141200000, 1, 1);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (234, N'Alien', sp_ConvertSQLServerDate(0x000071AE00000000), 51, 1, 241, 4, N'A mining ship, investigating a suspected SOS, lands on a distant planet. The crew discovers some strange creatures and investigates.', 117, NULL, 9000000, 203630630, 2, 1);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (236, N'On Her Majesty''s Secret Service', sp_ConvertSQLServerDate(0x000063D100000000), 113, 1, 240, 22, N'James Bond woos a mob boss''s daughter and goes undercover to uncover the true reason for Blofeld''s allergy research in the Swiss Alps that involves beautiful women from around the world.', 140, NULL, 8000000, 82000000, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (237, N'Pulp Fiction', sp_ConvertSQLServerDate(0x0000874200000000), 79, 1, 241, 16, N'The lives of two mob hit men, a boxer, a gangster''s wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', 154, NULL, 8000000, 212900000, 7, 1);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (238, N'Rumble in the Bronx', sp_ConvertSQLServerDate(0x00008B1D00000000), 114, 2, 48, 14, N'A young man visiting and helping his uncle in New York City finds himself forced to fight a street gang and the mob with his martial art skills.', 104, NULL, 7500000, 36238752, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (239, N'Diamonds are Forever', sp_ConvertSQLServerDate(0x000066B700000000), 115, 1, 240, 22, N'A diamond smuggling investigation leads James Bond to Las Vegas, where he uncovers an extortion plot headed by his nemesis, Ernst Stavro Blofeld.', 120, NULL, 7200000, 116000000, 1, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (240, N'Fargo', sp_ConvertSQLServerDate(0x0000898E00000000), 5, 1, 241, 4, N'Jerry Lundegaard''s inept crime falls apart due to his and his henchmen''s bungling and the persistent police work of pregnant Marge Gunderson.', 98, NULL, 7000000, 51567751, 7, 2);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (241, N'Live and Let Die', sp_ConvertSQLServerDate(0x000068E100000000), 115, 1, 240, 22, N'007 is sent to stop a diabolically brilliant heroin magnate armed with a complex organization and a reliable psychic tarot card reader.', 121, NULL, 7000000, 161800000, 1, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (242, N'The Man with the Golden Gun', sp_ConvertSQLServerDate(0x00006AF500000000), 115, 1, 240, 22, N'Bond is led to believe that he is targeted by the world''s most expensive assassin and must hunt him down to stop him.', 125, NULL, 7000000, 97600000, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (243, N'Good Night, and Good Luck', sp_ConvertSQLServerDate(0x0000976B00000000), 116, 1, 241, 6, N'Broadcast journalist Edward R. Murrow looks to bring down Senator Joseph McCarthy.', 93, NULL, 7000000, 54601218, 6, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (244, N'Pale Rider', sp_ConvertSQLServerDate(0x000079F800000000), 10, 1, 241, 31, N'A mysterious preacher protects a humble prospector village from a greedy mining company trying to encroach on their land.', 116, NULL, 6900000, 41410568, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (245, N'The Terminator', sp_ConvertSQLServerDate(0x0000795000000000), 15, 1, 241, 11, N'A human-looking, apparently unstoppable cyborg is sent from the future to kill Sarah Connor; Kyle Reese is sent to stop it.', 108, NULL, 6400000, 78019031, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (246, N'Around the World in 80 Days', sp_ConvertSQLServerDate(0x0000510700000000), 117, 1, 241, 22, N'Adaptation of Jules Verne''s novel about a Victorian Englishman who bets that with the new steamships and railways he can do what the title says.', 167, NULL, NULL, NULL, 8, 5);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (249, N'The Usual Suspects', sp_ConvertSQLServerDate(0x0000887600000000), 14, 1, 241, 11, N'A boat has been destroyed, criminals are dead, and the key to this mystery lies with the only survivor and his twisted, convoluted story beginning with five career crooks in a seemingly random police lineup.', 106, NULL, 6000000, 23341568, 2, 2);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (250, N'Memento', sp_ConvertSQLServerDate(0x00008FD100000000), 27, 1, 241, 5, N'A man, suffering from short-term memory loss, uses notes and tattoos to hunt for the man he thinks killed his wife.', 113, NULL, 5000000, 39665950, 2, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (251, N'Shaun of the Dead', sp_ConvertSQLServerDate(0x000094C400000000), 106, 1, 240, 33, N'A man decides to turn his moribund life around by winning back his ex-girlfriend, reconciling his relationship with his mother, and dealing with an entire community that has returned from the dead to eat the living.', 99, NULL, 5000000, 30039392, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmGenreID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (252, N'Four Weddings and a Funeral', sp_ConvertSQLServerDate(0x000086A100000000), 26, 1, 240, 33, 3, N'Comedy-drama about a group of British friends... the title says the rest.', 117, NULL, 4500000, 257700832, 2, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (254, N'Goldfinger', sp_ConvertSQLServerDate(0x00005CC500000000), 115, 1, 241, 22, N'Investigating a gold magnate''s gold smuggling, James Bond uncovers a plot to contaminate the Fort Knox gold reserve.', 110, NULL, 3000000, 124900000, 1, 1);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (256, N'From Russia with Love', sp_ConvertSQLServerDate(0x00005BE200000000), 112, 1, 240, 22, N'James Bond willingly falls into an assassination ploy involving a naive Russian beauty in order to retrieve a Soviet encryption device that was stolen by SPECTRE.', 110, NULL, 2000000, 78900000, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (257, N'Reservoir Dogs', sp_ConvertSQLServerDate(0x000084BE00000000), 79, 1, 241, 16, N'After a simple jewelery heist goes terribly wrong, the surviving criminals begin to suspect that one of them is a police informant.', 99, NULL, 1200000, 2832029, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (258, N'Dr. No', sp_ConvertSQLServerDate(0x00005A6100000000), 112, 1, 240, 22, N'James Bond''s investigation of a missing colleague in Jamaica leads him to the island of the mysterious Dr. No and a scheme to end the US space program.', 110, NULL, 1000000, 59567035, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (260, N'Seven Samurai', sp_ConvertSQLServerDate(0x0000512800000000), 122, 6, 37, 38, N'A poor village under attack by bandits recruits seven unemployed samurai to help them defend themselves.', 190, NULL, 500000, 271736, 2, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmGenreID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (261, N'Super Size Me', sp_ConvertSQLServerDate(0x0000955E00000000), 123, 1, 241, 39, 6, N'An irreverent look at obesity in America and one of its sources - fast food corporations.', 100, NULL, 65000, 29529368, 1, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (262, N'Kagemusha', sp_ConvertSQLServerDate(0x0000733A00000000), 122, 6, 37, 38, N'When a powerful warlord in medieval Japan dies, a poor thief recruited to impersonate him finds difficulty', 179, NULL, NULL, NULL, 2, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (263, N'Ran', sp_ConvertSQLServerDate(0x000079DD00000000), 122, 6, 37, 38, N'An elderly lord abdicates to his three sons, and the two corrupt ones turn against him.', 160, NULL, 12000000, NULL, 4, 1);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmGenreID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (264, N'Sunshine', sp_ConvertSQLServerDate(0x0000990700000000), 108, 1, 240, 4, 6, N'A team of astronauts are sent to re-ignite the dying sun 50 years into the future.', 107, 5, 40000000, 31959646, 0, 0);
INSERT Film (FilmID, FilmName, FilmReleaseDate, FilmDirectorID, FilmLanguageID, FilmCountryID, FilmStudioID, FilmSynopsis, FilmRunTimeMinutes, FilmCertificateID, FilmBudgetDollars, FilmBoxOfficeDollars, FilmOscarNominations, FilmOscarWins) VALUES (265, N'Once Were Warriors', sp_ConvertSQLServerDate(0x000087F100000000), 29, 1, 167, 40, N'A family descended from Maori warriors is bedeviled by a violent father and the societal problems of being treated as outcasts.', 99, 6, 1000000, NULL, 0, 0);



CREATE TABLE FilmCast(
	CastID int NOT NULL,
	CastFilmID integer,
	CastActorID integer,
	CastCharacterName varchar(255) NULL,
	primary key(CastID),
	Foreign Key(CastFilmID) References Film(FilmID),
	Foreign Key(CastActorID) References Actor(ActorID))
	Engine=InnoDb;

INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (1, 33, 1, N'Ray Ferrier');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (2, 1, 2, N'Dr. Alan Grant');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (3, 1, 3, N'Dr. Ellie Sattler');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (4, 1, 4, N'Dr. Ian Malcolm');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (5, 1, 5, N'John Hammond');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (6, 1, 6, N'Ray Arnold');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (7, 2, 7, N'Peter Parker');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (8, 2, 8, N'Norman Osborn');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (9, 2, 9, N'Mary Jane Watson');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (10, 3, 10, N'Ann Darrow');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (11, 3, 11, N'Carl Denham');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (12, 3, 12, N'Jack Driscoll');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (13, 3, 13, N'Kong');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (14, 5, 14, N'Clark Kent');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (15, 5, 15, N'Lois Lane');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (16, 5, 16, N'Lex Luthor');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (17, 6, 17, N'Jack Dawson');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (18, 6, 18, N'Rose DeWitt Bukater');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (19, 6, 19, N'Caledon ''Cal'' Hockley');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (20, 6, 20, N'Brock Lovett');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (21, 7, 21, N'Evan Baxter');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (22, 7, 22, N'God');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (23, 8, 23, N'Mariner');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (24, 8, 24, N'Deacon');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (25, 8, 11, N'Pilot');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (26, 9, 25, N'Captain Rafe McCawley');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (27, 9, 26, N'Captain Danny Walker');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (28, 9, 27, N'Nurse Lt. Evelyn Johnson');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (29, 9, 28, N'Petty Officer Doris Miller');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (30, 9, 29, N'President Franklin Delano Roosevelt');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (31, 9, 30, N'Lt. Col. James Doolittle');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (32, 9, 31, N'Sgt. Earl Sistern');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (33, 9, 32, N'Captain Thurman');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (34, 10, 33, N'Sam Witwicky');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (35, 10, 37, N'Mikaela Banes');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (36, 10, 29, N'Defense Secretary John Keller');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (37, 10, 34, N'Agent Simmons');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (38, 10, 35, N'Optimus Prime');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (39, 10, 36, N'Megatron');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (40, 11, 38, N'Harry Potter');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (41, 11, 39, N'Lord Voldemort');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (42, 11, 40, N'Alastor Mad-Eye Moody');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (43, 11, 41, N'Sirius Black');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (44, 11, 47, N'Hermione Granger');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (45, 11, 48, N'Ron Weasley');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (46, 11, 42, N'Albus Dumbledore');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (47, 11, 43, N'Severus Snape');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (48, 11, 44, N'Sybil Trelawney');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (49, 11, 45, N'Bellatrix Lestrange');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (50, 11, 46, N'Rubeus Hagrid');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (51, 12, 49, N'Wealthow');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (52, 12, 50, N'Hrothgar');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (53, 12, 51, N'Unferth');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (54, 12, 52, N'Beowulf');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (55, 12, 40, N'Wiglaf');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (56, 12, 53, N'Grendel''s Mother');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (57, 7, 54, N'Congressman Long');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (58, 13, 55, N'Barry B. Benson');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (59, 13, 56, N'Vanessa Bloome');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (60, 13, 57, N'Adam Flayman');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (61, 13, 54, N'Layton T. Montgomery');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (62, 13, 58, N'Mooseblood');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (63, 13, 59, N'Ray Liotta');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (64, 13, 60, N'Lou Lo Duca');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (78, 17, 73, N'Agamemnon');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (79, 17, 75, N'Achilles');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (80, 17, 40, N'Menelaus');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (81, 17, 76, N'Helen');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (82, 17, 77, N'Hector');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (83, 17, 63, N'Paris');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (84, 18, 38, N'Harry Potter');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (85, 18, 47, N'Hermione Granger');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (86, 18, 48, N'Ron Weasley');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (87, 18, 46, N'Rubeus Hagrid');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (88, 18, 42, N'Albus Dumbledore');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (89, 18, 43, N'Severus Snape');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (90, 18, 40, N'Professor Alastor Mad-Eye Moody');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (91, 18, 41, N'Sirius Black');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (92, 18, 39, N'Lord Voldemort');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (93, 19, 78, N'Bruce Wayne');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (94, 19, 79, N'Alfred');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (95, 19, 80, N'Henri Ducard');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (96, 19, 81, N'Rachel Dawes');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (97, 19, 41, N'Jim Gordon');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (98, 19, 82, N'Earle');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (99, 19, 83, N'Ra''s Al Ghul');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (100, 19, 22, N'Lucius Fox');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (101, 20, 61, N'Willy Wonka');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (102, 20, 45, N'Mrs. Bucket');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (103, 20, 84, N'Mr. Salt');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (104, 20, 85, N'Dr. Wonka');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (111, 22, 86, N'James Bond');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (112, 22, 89, N'M');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (113, 22, 90, N'R');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (114, 22, 87, N'Jinx');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (115, 22, 88, N'Miranda Frost');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (116, 22, 91, N'Damian Falco');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (117, 22, 92, N'Miss Moneypenny');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (118, 23, 93, N'Martin Riggs');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (119, 23, 94, N'Roger Murtaugh');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (120, 23, 95, N'Leo Getz');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (121, 23, 96, N'Lorna Cole');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (122, 23, 58, N'Detective Lee Butters');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (123, 23, 97, N'Wah Sing Ku');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (124, 24, 98, N'Harry S. Stamper');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (125, 24, 99, N'Dan Truman');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (126, 24, 25, N'A.J. Frost');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (127, 24, 100, N'Grace Stamper');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (128, 24, 101, N'Rockhound');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (129, 24, 102, N'Oscar Choi');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (130, 24, 103, N'Jayotis ''Bear'' Kurleenbear');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (131, 24, 104, N'Lev Andropov');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (135, 26, 7, N'Peter Parker');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (136, 26, 9, N'Mary Jane Watson');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (137, 27, 7, N'Peter Parker');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (138, 27, 9, N'Mary Jane Watson');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (139, 27, 8, N'Norman Osborn');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (161, 33, 119, N'Rachel Ferrier');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (162, 33, 120, N'Harlan Ogilvy');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (163, 34, 121, N'Jason Bourne');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (164, 34, 122, N'Nicky Parsons');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (165, 34, 123, N'Deputy Director Noah Vosen');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (166, 34, 124, N'Simon Ross');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (167, 34, 125, N'Dr. Albert Hirsch');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (168, 35, 38, N'Harry Potter');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (169, 35, 47, N'Hermione Granger');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (170, 35, 48, N'Ron Weasley');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (171, 35, 41, N'Sirius Black');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (172, 35, 43, N'Professor Severus Snape');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (173, 35, 46, N'Rubeus Hagrid');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (174, 35, 44, N'Professor Sybil Trelawney');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (175, 36, 126, N'Persephone');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (176, 36, 127, N'Morpheus');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (177, 36, 128, N'Trinity');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (178, 36, 129, N'Neo');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (179, 36, 36, N'Agent Smith');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (180, 37, 130, N'Dr. Robert Langdon');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (181, 37, 131, N'Agent Sophie Neveu');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (182, 37, 132, N'Sir Leigh Teabing');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (183, 37, 133, N'Captain Bezu Fache');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (184, 37, 118, N'Silas');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (185, 37, 134, N'Andre Vernet');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (186, 38, 135, N'Professor Albus Dumbledore');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (187, 38, 46, N'Rubeus Hagrid');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (188, 38, 38, N'Harry Potter');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (189, 38, 136, N'Mr. Ollivander');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (190, 38, 48, N'Ron Weasley');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (191, 38, 47, N'Hermione Granger');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (192, 38, 90, N'Nearly Headless Nick');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (193, 38, 43, N'Professor Severus Snape');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (194, 39, 137, N'Jack Hall');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (195, 39, 138, N'Sam Hall');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (196, 39, 70, N'Terry Rapson');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (202, 41, 1, N'Nathan Algren');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (203, 41, 83, N'Katsumoto');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (204, 264, 140, N'Kaneda');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (205, 264, 141, N'Capa');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (206, 264, 142, N'Corazon');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (207, 19, 141, N'Dr. Jonathan Crane');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (208, 41, 140, N'Ujio');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (209, 41, 139, N'Zebulon Gant');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (210, 42, 143, N'Captain Billy Tyne');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (211, 42, 144, N'Bobby Shatford');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (212, 42, 145, N'Dale ''Murph'' Murphy');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (213, 42, 146, N'Linda Greenlaw');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (214, 42, 147, N'Bob Brown');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (215, 43, 1, N'Ethan Hunt');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (216, 43, 148, N'Owen Davian');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (217, 43, 108, N'Luther');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (218, 43, 149, N'Julia');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (219, 43, 150, N'Benji');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (220, 43, 127, N'Theodore Brassel');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (221, 44, 1, N'Ethan Hunt');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (222, 44, 108, N'Luther Stickell');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (223, 44, 40, N'John C. McCloy');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (224, 45, 151, N'Christian Slater');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (225, 45, 104, N'Gunnery Sergeant Hjelmstad');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (226, 45, 152, N'Sgt. Pete ''Ox'' Anderson');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (227, 46, 153, N'Obi-Wan Kenobi');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (228, 46, 154, N'Senator Padme Amidala');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (229, 46, 155, N'Anakin Skywalker');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (230, 46, 85, N'Count Dooku');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (231, 46, 6, N'Mace Windu');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (232, 46, 156, N'Yoda');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (233, 46, 157, N'Chancellor Palpatine');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (234, 46, 158, N'Jango Fett');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (235, 265, 158, N'Jake Heke');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (236, 265, 159, N'Beth Heke');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (237, 47, 54, N'James P. "Sulley" Sullivan');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (238, 47, 160, N'Mike Wazowski');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (239, 47, 101, N'Randall Boggs');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (240, 47, 161, N'Henry J. Waternoose');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (241, 47, 156, N'Fungus');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (242, 48, 80, N'Qui-Gon Jinn');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (243, 48, 153, N'Obi-Wan Kenobi');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (244, 48, 154, N'Queen Padme Amidala');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (245, 48, 156, N'Yoda');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (246, 48, 157, N'Senator Palpatine');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (247, 48, 162, N'Darth Maul');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (248, 48, 163, N'C-3PO');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (249, 48, 164, N'R2-D2');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (250, 48, 6, N'Mace Windu');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (251, 48, 64, N'Sabe');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (252, 49, 153, N'Obi-Wan Kenobi');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (253, 49, 154, N'Padme');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (254, 49, 155, N'Anakin Skywalker');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (255, 49, 157, N'Supreme Chancellor Palpatine');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (256, 49, 6, N'Mace Windu');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (257, 49, 156, N'Yoda');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (258, 49, 163, N'C-3PO');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (259, 49, 164, N'R2-D2');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (260, 49, 85, N'Count Dooku');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (261, 49, 158, N'Commander Cody');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (262, 49, 165, N'Chewbacca');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (263, 49, 159, N'Nee Alavar');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (264, 50, 126, N'Persephone');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (265, 50, 127, N'Morpheus');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (266, 50, 128, N'Trinity');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (267, 50, 129, N'Neo');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (268, 50, 36, N'Agent Smith');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (269, 51, 86, N'James Bond');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (270, 51, 66, N'Elliot Carver');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (271, 51, 142, N'Wai Lin');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (272, 51, 166, N'Jack Wade');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (273, 51, 89, N'M');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (274, 51, 116, N'Q');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (275, 51, 92, N'Miss Moneypenny');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (276, 52, 143, N'Danny Ocean');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (277, 52, 75, N'Rusty Ryan');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (278, 52, 167, N'Reuben Tishkoff');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (279, 52, 121, N'Linus Caldwell');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (280, 52, 168, N'Terry Benedict');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (281, 52, 169, N'Tess Ocean');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (282, 52, 170, N'Basher Tarr');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (283, 53, 98, N'John McClane');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (284, 53, 171, N'Thomas Gabriel');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (285, 53, 175, N'Mai');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (286, 54, 172, N'Passepartout');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (287, 54, 173, N'Phileas Fogg');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (288, 54, 177, N'Lord Kelvin');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (289, 54, 174, N'Prince Hapi');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (290, 54, 175, N'Female Agent');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (291, 54, 176, N'Wong Fei Hung');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (292, 54, 102, N'Wilbur Wright');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (293, 54, 90, N'Grizzled Sergeant');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (294, 54, 178, N'Orville Wright');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (295, 55, 80, N'Godfrey de Ibelin');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (296, 55, 63, N'Balian de Ibelin');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (297, 55, 40, N'Reynald');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (298, 55, 179, N'Tiberias');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (299, 55, 180, N'King Baldwin');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (300, 56, 75, N'John Smith');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (301, 56, 53, N'Jane Smith');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (302, 56, 181, N'Eddie');
INSERT FilmCast (CastID, CastFilmID, CastActorID, CastCharacterName) VALUES (303, 56, 149, N'Gwen');

