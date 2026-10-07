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

/* ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- */
/* 
---------------
SQL LAB 3
---------------
*/

CREATE TABLE Accounts (
    AccountID INT,
    CustomerID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
);

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(201,101,'Savings',25000);

select * from Accounts;

-- Task 2.A) Update Customer Phone Number
UPDATE Customers
SET Phone='9999999999'
WHERE CustomerID=101;

select * from Customers;

-- Task 2.B) Update Customer Email ID
UPDATE Customers
SET Email='aayush.jade@gmail.com'
WHERE CustomerID=101;

select * from Customers;

CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);




