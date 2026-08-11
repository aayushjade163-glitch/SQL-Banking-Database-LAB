CREATE DATABASE BankingDB;
USE BankingDB;

CREATE TABLE Customers
(
	CustomerID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    AccountCreationDate DATE
);

DESCRIBE Customers;

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, AccountCreationDate) 
VALUES
(101, "Aayush","Jade","aayushjade@gmail.com",1234567816,"2003-12-16");

SELECT * FROM Customers;