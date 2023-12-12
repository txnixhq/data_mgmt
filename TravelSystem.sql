
-- Database Creation
CREATE DATABASE IF NOT EXISTS `cs336_project`;
USE `cs336_project`;

-- CustomerUser Table
CREATE TABLE CustomerUser (
  uid INT PRIMARY KEY AUTO_INCREMENT,
  c_usr VARCHAR(30),
  c_pass VARCHAR(30)
);

-- CustomerRepresentative Table
CREATE TABLE CustomerRepresentative (
  uid INT PRIMARY KEY AUTO_INCREMENT,
  crep_usr VARCHAR(30),
  crep_pass VARCHAR(30)
);

-- Admin Table
CREATE TABLE Admin (
  uid INT PRIMARY KEY AUTO_INCREMENT,
  admin_usr VARCHAR(30),
  admin_pass VARCHAR(30)
);

-- ReservationPortfolio Table
CREATE TABLE ReservationPortfolio (
  uid INT NOT NULL,
  FOREIGN KEY (uid) REFERENCES CustomerUser(uid) 
);

-- Ticket Table
CREATE TABLE Ticket (
  tid INT PRIMARY KEY,
  class CHAR(1),
  seat_number INT,
  total_fare FLOAT,
  purchase_datetime DATETIME,
  booking_fee FLOAT,
  uid INT NOT NULL,
  FOREIGN KEY (uid) REFERENCES CustomerUser(uid)
);

-- Aircraft Table
CREATE TABLE Aircraft (
  pid INT PRIMARY KEY,
  number_of_seats INT,
  days_of_operation CHAR(7),
  cid CHAR(2) NOT NULL,
  FOREIGN KEY (cid) REFERENCES AirlineCompany(cid) 
);

-- Seat Table
CREATE TABLE Seat (
  seat_number INT,
  available BOOLEAN,
  class CHAR(1),
  pid INT NOT NULL,
  PRIMARY KEY (seat_number, pid),
  FOREIGN KEY (pid) REFERENCES Aircraft(pid)
);

-- AirlineCompany Table
CREATE TABLE AirlineCompany (
  cid CHAR(2) PRIMARY KEY
);

-- AirlineWithAirport Table
CREATE TABLE AirlineWithAirport (
  cid CHAR(2) NOT NULL,
  aid CHAR(3) NOT NULL,
  PRIMARY KEY (cid, aid),
  FOREIGN KEY (cid) REFERENCES AirlineCompany(cid),
  FOREIGN KEY (aid) REFERENCES Airport(aid)
);

-- Airport Table
CREATE TABLE Airport (
  aid CHAR(3) PRIMARY KEY
);

-- Waitlist Table
CREATE TABLE Waitlist (
  fnum INT NOT NULL,
  cid CHAR(2) NOT NULL,
  PRIMARY KEY (fnum, cid),
  FOREIGN KEY (fnum, cid) REFERENCES Flight(fnum, cid)
);

-- TicketsInWaitlist Table
CREATE TABLE TicketsInWaitlist (
  tid INT NOT NULL,
  fnum INT NOT NULL,
  cid CHAR(2) NOT NULL,
  PRIMARY KEY (tid, fnum, cid),
  FOREIGN KEY (tid) REFERENCES Ticket(tid),
  FOREIGN KEY (fnum, cid) REFERENCES Waitlist(fnum, cid)
);

-- Flight Table
CREATE TABLE Flight (
  fnum INT NOT NULL,
  ftype CHAR(1),
  departure_airport CHAR(3),
  destination_airport CHAR(3),
  departure_time DATETIME,
  arrival_time DATETIME,
  pid INT NOT NULL,
  cid CHAR(2) NOT NULL,
  PRIMARY KEY (fnum, cid),
  FOREIGN KEY (pid) REFERENCES Aircraft(pid),
  FOREIGN KEY (cid) REFERENCES AirlineCompany(cid),
  FOREIGN KEY (fnum, cid) REFERENCES Waitlist(fnum, cid)
);

-- TicketsForFlight Table
CREATE TABLE TicketsForFlight (
  tid INT NOT NULL,
  fnum INT NOT NULL,
  cid CHAR(2) NOT NULL,
  PRIMARY KEY (tid, fnum, cid),
  FOREIGN KEY (tid) REFERENCES Ticket(tid),
  FOREIGN KEY (fnum, cid) REFERENCES Flight(fnum, cid)
);
