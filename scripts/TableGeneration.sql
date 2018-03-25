DROP SCHEMA MusicDB;
CREATE SCHEMA MusicDB;
USE MusicDB;

CREATE TABLE IF NOT EXISTS Genre (
  Genre_ID   INT AUTO_INCREMENT,
  Genre_Name VARCHAR(30) NOT NULL,
  PRIMARY KEY (Genre_ID)
);

CREATE TABLE IF NOT EXISTS Country (
  Country_ID   INT         AUTO_INCREMENT,
  Country_Name VARCHAR(30) NOT NULL ,
  PRIMARY KEY (Country_ID)
);
CREATE TABLE IF NOT EXISTS Label (
  Label_ID INT AUTO_INCREMENT,
  Label_Name VARCHAR(30) NOT NULL,
  PRIMARY KEY (Label_ID)
);

CREATE TABLE IF NOT EXISTS Artist (
  Artist_ID   INT AUTO_INCREMENT,
  Artist_Name VARCHAR(45) NOT NULL,
  Country_ID  INT,
  Label_ID INT,
  PRIMARY KEY (Artist_ID),
  FOREIGN KEY (Country_ID) REFERENCES Country (Country_ID),
  FOREIGN KEY (Label_ID) REFERENCES Label(Label_ID)
);

CREATE TABLE IF NOT EXISTS Type (
  Type_ID   INT AUTO_INCREMENT,
  Type_Name VARCHAR(30) NOT NULL,
  PRIMARY KEY (Type_ID)
);

CREATE TABLE IF NOT EXISTS Album (
  Album_ID   INT AUTO_INCREMENT,
  Album_Name VARCHAR(45) NOT NULL,
  Genre_ID   INT,
  Type_ID    INT         NOT NULL,
  PRIMARY KEY (Album_ID),
  FOREIGN KEY (Genre_ID) REFERENCES Genre (Genre_ID),
  FOREIGN KEY (Type_ID) REFERENCES Type (Type_ID)
);

CREATE TABLE IF NOT EXISTS AlbumArtist (
  AA_ID     INT AUTO_INCREMENT,
  Album_ID  INT NOT NULL,
  Artist_ID INT NOT NULL,
  PRIMARY KEY (AA_ID),
  FOREIGN KEY (Artist_ID) REFERENCES Artist (Artist_ID),
  FOREIGN KEY (Album_ID) REFERENCES Album (Album_ID)
);

CREATE TABLE IF NOT EXISTS Track (
  Track_ID     INT AUTO_INCREMENT,
  Track_Number INT         NOT NULL,
  Track_Name   VARCHAR(45) NOT NULL,
  Track_Length TIME        NOT NULL,
  Album_ID     INT         NOT NULL,
  PRIMARY KEY (Track_ID),
  FOREIGN KEY (Album_ID) REFERENCES Album (Album_ID)
);

CREATE TABLE IF NOT EXISTS Format (
  Format_ID   INT AUTO_INCREMENT,
  Format_Name VARCHAR(30) NOT NULL,
  PRIMARY KEY (Format_ID)
);

CREATE TABLE IF NOT EXISTS AlbumRelease (
  Release_ID      INT AUTO_INCREMENT,
  Album_ID        INT      NOT NULL,
  Format_ID       INT      NOT NULL,
  Release_Descrip VARCHAR(45),
  Release_Date    DATETIME NOT NULL,
  PRIMARY KEY (Release_ID),
  FOREIGN KEY (Album_ID) REFERENCES Album (Album_ID),
  FOREIGN KEY (Format_ID) REFERENCES Format (Format_ID)
);


CREATE TABLE IF NOT EXISTS Review (
  Review_ID      INT AUTO_INCREMENT,
  Review_Score   INT NOT NULL,
  Review_Comment VARCHAR(50),
  Review_Authour VARCHAR(30),
  Album_ID       INT NOT NULL,
  PRIMARY KEY (Review_ID),
  FOREIGN KEY (Album_ID) REFERENCES Album (Album_ID)
);
