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
SQL LAB 2
---------------
*/
CREATE TABLE Accounts (
    AccountID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
);

CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);

CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);


CREATE TABLE AccountBranches ( 
		AssignmentDate DATE
);

CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);

ALTER TABLE Customers
ADD DateOfBirth DATE;

ALTER TABLE Customers
MODIFY Phone VARCHAR(20);

ALTER TABLE Accounts
ADD CONSTRAINT chk_MinBalance
CHECK (Balance >= 1000);
show create table Accounts;

DROP TABLE AccountBranches;

ALTER TABLE Customers
ADD PRIMARY KEY (CustomerID);

-- connect accounts and customers
ALTER TABLE Accounts
ADD CustomerID INT;
ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

ALTER TABLE Customers
MODIFY FirstName VARCHAR(50) NOT NULL;

ALTER TABLE Customers
ADD CONSTRAINT uq_Email UNIQUE (Email);

-- Activity 2: Accounts --> Branches
-- connect accounts and branches
-- apply PK to BranchID
ALTER TABLE Branches
ADD primary key (BranchID);
-- add BranchID to Accounts Table
alter table Accounts
add BranchID int;
-- Add FK relation between 
alter table Accounts
add constraint FK_Accounts_Branches
foreign key (BranchID)
references Branches(BranchID);
show create table accounts;
describe Accounts;

-- Activity 3: Transactions --> Accounts
-- connect transactions and accounts
-- apply PK to AccountID
ALTER TABLE Accounts
ADD PRIMARY KEY (AccountID);
-- add AccountID to Transactions Table
ALTER TABLE Transactions
ADD AccountID INT;
-- Add FK relation between
ALTER TABLE Transactions
ADD CONSTRAINT FK_Transactions_Accounts
FOREIGN KEY (AccountID)
REFERENCES Accounts(AccountID);
SHOW CREATE TABLE Transactions;
DESCRIBE Transactions;

-- Activity 4: Loans --> Customers
-- connect loans and customers
-- add CustomerID to Loans Table
ALTER TABLE Loans
ADD CustomerID INT;
-- Add FK relation between
ALTER TABLE Loans
ADD CONSTRAINT FK_Loans_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);
SHOW CREATE TABLE Loans;
DESCRIBE Loans;

/* ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- */
/* 
---------------
SQL LAB 3
---------------
*/

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
VALUES
(102,'Rahul','Sharma','rahul@gmail.com','9876543210','1998-04-15');

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
VALUES
(103, 'Priya', 'Patil', 'priya@gmail.com', '9988776655', '2000-09-20'),
(104, 'Amit', 'Patel', 'amit.patel@gmail.com', '9876500001', '1995-06-18'),
(105, 'Sneha', 'Joshi', 'sneha.joshi@gmail.com', '9876500002', '1997-09-12'),
(106, 'Rohan', 'Kulkarni', 'rohan.k@gmail.com', '9876500003', '1993-11-25');

-- Insert 4 Records into Accounts Table
INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(202, 102, 'Current', 40000),
(203, 103, 'Savings', 35000),
(204, 104, 'Current', 60000),
(205, 105, 'Savings', 45000);

-- Insert 5 Records into Transactions Table
INSERT INTO Transactions
(TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES
(301, 201, '2025-05-10', 5000, 'Deposit'),
(302, 202, '2025-05-11', 2500, 'Withdraw'),
(303, 203, '2025-05-12', 10000, 'Deposit'),
(304, 204, '2025-05-13', 3000, 'Withdraw'),
(305, 205, '2025-05-14', 7000, 'Deposit');

-- Insert 5 Records into Branches Table
INSERT INTO Branches
(BranchID, BranchName, BranchAddress, BranchPhone)
VALUES
(1, 'Mumbai Branch', 'Andheri, Mumbai', '0221111111'),
(2, 'Pune Branch', 'Shivaji Nagar, Pune', '0202222222'),
(3, 'Nashik Branch', 'College Road, Nashik', '0253222222'),
(4, 'Nagpur Branch', 'Sitabuldi, Nagpur', '0712333333'),
(5, 'Navi Mumbai Branch', 'Vashi, Navi Mumbai', '0224444444');

-- Insert 5 Records into Loans Table
INSERT INTO Loans
(LoanID, LoanAmount, InterestRate, StartDate, EndDate, CustomerID)
VALUES
(301, 500000, 8.50, '2025-01-15', '2030-01-15', 101),
(302, 300000, 9.25, '2025-02-10', '2028-02-10', 102),
(303, 750000, 8.75, '2025-03-20', '2032-03-20', 103),
(304, 250000, 10.00, '2025-04-05', '2029-04-05', 104),
(305, 1000000, 7.95, '2025-05-12', '2035-05-12', 105);


INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(201,101,'Savings',25000);


select * from Accounts;
select * from Customers;
select * from Transactions;
select * from Branches;
select * from Loans;

-- Update Customer Phone Number
UPDATE Customers
SET Phone='9999999999'
WHERE CustomerID=101;
select * from Customers;

-- Update Customer Email ID
UPDATE Customers
SET Email='aayush.jade@gmail.com'
WHERE CustomerID=101;
select * from Customers;

-- Update AccountID 201 Balance to 30000
update Accounts 
set balance=30000 
where AccountID=201;
select * from Accounts;

DELETE FROM Transactions
WHERE TransactionID = 302;
SELECT * FROM Transactions;

DELETE FROM Accounts
WHERE AccountID = 202;
SELECT * FROM Accounts;

/* ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- */
/* 
---------------
SQL LAB 4
---------------
*/

-- View Only Required Customer Details
SELECT FirstName, LastName, Email, Phone
FROM Customers;

-- Retrieve only the following details from the 
-- Accounts table: AccountID, AccountType, and Balance.
select AccountID, AccountType, Balance 
from Accounts;

-- Retrieve Customers with Savings Accounts
SELECT *
FROM Accounts
WHERE AccountType = 'Savings';

-- Retrieve Accounts with Balance Greater Than 25000
SELECT *
FROM Accounts
WHERE Balance > 25000;

-- Retrieve Transactions Between Specific Amounts
SELECT *
FROM Transactions
WHERE Amount BETWEEN 5000 AND 20000;

-- Retrieve Records for Selected Customers
SELECT *
FROM Customers
WHERE CustomerID IN (101,102,103);

-- Search Customers Using Partial Name Matching
SELECT *
FROM Customers
WHERE FirstName LIKE 'R%';

-- Retrieve all current account records
select * from Accounts;
-- Find accounts with balance less than 15000
select * from Accounts where Balance < 15000;
-- Display transactions between 1000 and 10000
select * from Transactions where amount between 1000 and 10000;
-- Retrieve customer records for CustomerID 104 and 105
select * from Customers where CustomerID in (104, 105);
-- Display customers whose last name starts with S
select * from Customers where lastname like 'S%';

-- Display Customers in Alphabetical Order
SELECT *
FROM Customers
ORDER BY FirstName ASC;

-- Display Accounts with Highest Balance First
SELECT *
FROM Accounts
ORDER BY Balance DESC;

-- Retrieve Unique Account Types
SELECT DISTINCT AccountType
FROM Accounts;

-- Display Top 3 Highest Balance Accounts
SELECT *
FROM Accounts
ORDER BY Balance DESC
LIMIT 3;

-- Skip Initial Records While Viewing Transactions
SELECT *
FROM Transactions
LIMIT 5 OFFSET 2;

-- Display customers sorted by LastName
select * from Customers order by lastname asc;
-- Retrieve top 5 transactions with highest amount
select * from Transactions order by amount desc;
-- Display unique transaction types
select distinct TransactionType from Transactions;
-- Skip the first 3 transaction records and display the next 4 records
select * from Transactions limit 4 offset 3;

-- Find Customers Without Phone Numbers
SELECT *
FROM Customers
WHERE Phone IS NULL;

-- Find Customers Having Email Addresses
SELECT *
FROM Customers
WHERE Email IS NOT NULL;

-- Find customers without email addresses
select * from Customers where Email is null;
-- Display all accounts where balance information is available
select * from Accounts where Balance is not null;

-- Categorize Accounts Using Balance
SELECT AccountID, Balance,
       CASE
           WHEN Balance >= 50000 THEN 'Premium Account'
           WHEN Balance >= 25000 THEN 'Standard Account'
           ELSE 'Basic Account'
       END AS AccountCategory
FROM Accounts;

-- Create a report that categorizes transactions as:
-- High Transaction
-- Medium Transaction
-- Low Transaction
-- based on transaction amount.
select *, case
	when Amount >= 7000 then 'High Transaction'
    when Amount >= 3000 then 'Medium Transaction'
    else 'Low Transaction'
end as Transaction_Type
from Transactions;

-- Assign Rank Based on Account Balance
SELECT AccountID, Balance,
       RANK() OVER (ORDER BY Balance DESC) AS BalanceRank
FROM Accounts;

-- Calculate Running Total of Transactions
SELECT TransactionID, Amount,
       SUM(Amount) OVER (ORDER BY TransactionDate) AS RunningTotal
FROM Transactions;

-- Display Average Transaction Amount
SELECT TransactionID, Amount,
       AVG(Amount) OVER () AS AverageTransaction
FROM Transactions;

-- Rank customers based on account balance
select *, rank() over(order by Balance desc) as Balance_Rank from Accounts;
-- Generate running total for account balances
select *, sum(Balance) over(order by AccountID) as Running_Total from Accounts;
-- Display maximum transaction amount using a window function
select TransactionID, Amount, max(Amount) over() as Maximum_Transaction from Transactions;

/* ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- */
/* 
---------------
SQL LAB 5
---------------
*/
-- TASK 1
-- Search Customers Whose First Name Starts with “A”
SELECT *
FROM Customers
WHERE FirstName LIKE 'A%';

-- Search Customers Whose Email Contains “gmail”
SELECT *
FROM Customers
WHERE Email LIKE '%gmail%';

-- Search Customers Whose Last Name Ends with “kar”
SELECT *
FROM Customers
WHERE LastName LIKE '%kar';

-- Display customers whose first name starts with R
select * from Customers where FirstName like 'R%';
-- Find customers whose email contains yahoo
select * from Customers where Email like '%yahoo';
-- Display customers whose last name starts with P
select * from Customers where LastName like '%P';
-- Search customers whose phone number ends with 99
select * from Customers where Phone like '%99';

-- TASK 2
-- Retrieve Records for Selected Account Types
SELECT *
FROM Accounts
WHERE AccountType IN ('Savings', 'Current');

-- Retrieve Transactions for Selected Transaction Types
SELECT *
FROM Transactions
WHERE TransactionType IN ('Deposit', 'Withdrawal');

-- Retrieve Records for Selected Customers
SELECT *
FROM Customers
WHERE CustomerID IN (101,102,105);

-- Display accounts belonging to Salary and Savings account types
select * from Accounts where AccountType in ('Salary', 'Savings');
-- Retrieve transactions for Payment and Deposit categories
select * from Transactions where TransactionType in ('Payment', 'Deposit');
-- Display customer records for CustomerID 103 and 104
select * from Customers where CustomerID in (103, 104);
-- Retrieve selected account records using AccountID values
select * from Accounts where AccountID in(203);

-- TASK 3
-- Display Customers in Ascending Order of Last Name
SELECT *
FROM Customers
ORDER BY LastName ASC;

-- Display Accounts with Highest Balance First
SELECT *
FROM Accounts
ORDER BY Balance DESC;

-- Display Transactions Sorted by Transaction Date
SELECT *
FROM Transactions
ORDER BY TransactionDate DESC;

-- Display customers sorted by FirstName
select * from Customers order by FirstName asc;
-- Display accounts sorted by AccountType
select * from Accounts order by AccountType asc;
-- Display transactions sorted by Amount in descending order
select * from Transactions order by Amount desc;
-- Display customers sorted by DateOfBirth
select * from Customers order by DateOfBirth asc;

-- TASK 4
-- Display Only Top 5 Highest Balance Accounts
SELECT *
FROM Accounts
ORDER BY Balance DESC
LIMIT 5;

-- Display First 3 Customer Records
SELECT *
FROM Customers
LIMIT 3;

-- Skip Initial Transaction Records While Viewing Data
SELECT *
FROM Transactions
LIMIT 5 OFFSET 3;

-- Display top 3 transactions with highest amount
select * from Transactions order by Amount limit 3;
-- Retrieve only 4 customer records
select * from Customers limit 4;
-- Skip first 2 account records and display next 3 records
select * from Customers limit 2 offset 3;
-- Display top 5 latest transactions
select * from Transactions order by TransactionDate desc limit 5;

-- TASK 5
-- Display Savings Account Customers Sorted by Balance
SELECT *
FROM Accounts
WHERE AccountType = 'Savings'
ORDER BY Balance DESC;

-- Search Customers Using Partial Name and Limit Results
SELECT *
FROM Customers
WHERE FirstName LIKE 'S%'
LIMIT 5;

-- Display Selected Transactions in Sorted Order
SELECT *
FROM Transactions
WHERE TransactionType IN ('Deposit','Withdrawal')
ORDER BY TransactionDate DESC;

/* ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- */
/* 
---------------
SQL LAB 6
---------------
*/
-- TASK 1(STRING FUNCTION)
-- Display customer Table
select * from customers;

-- Display all customer FirstName in uppercase
SELECT FirstName, UPPER(FirstName) AS UpperCaseName
FROM customers;

-- Display all customer FirstName in lowercase
SELECT FirstName, LOWER(FirstName) AS LowerCaseName
FROM customers;

-- Find the total number of characters in each customer FirstName 
SELECT FirstName, LENGTH(FirstName) AS NameLength
FROM customers;

-- Display only the first three characters of customer FirstName 
SELECT FirstName, LEFT(FirstName, 3) AS Initials
FROM customers;

-- Combine customer's FirstName with LastName.
SELECT CONCAT(FirstName,' - ',LastName) AS FullName
FROM customers;

-- MATH FUNCTION

-- ROUND()
SELECT ROUND(1256.75) AS Rounded_Value;

-- CEIL()
SELECT CEIL(1256.25) AS Ceiling_Value;

-- FLOOR()
SELECT FLOOR(1256.75) AS Floor_Value;

-- ABS()
SELECT ABS(-2500) AS Absolute_Value;

-- MOD()
SELECT MOD(25,4) AS Remainder;

-- DATE FUNCTIONS
-- Display customer table
select * from customers;

-- Current system date
SELECT CURDATE();

-- Display the current system date and time
SELECT NOW();

-- Display the Birth of year
SELECT CustomerID, YEAR(DateOfBirth) AS BirthYear
FROM customers;

-- Display the birth month
SELECT CustomerID, MONTH(DateOfBirth) AS BirthMonth
FROM customers;

-- Calculate the number of days since BirthDate
SELECT CustomerID, DATEDIFF(CURDATE(),DateOfBirth) AS Days
FROM customers;

-- COMPARISON FUNCTIONS
-- Categorize customers as Adult or Young based on their birth year
SELECT FirstName, DateOfBirth, IF(YEAR(DateOfBirth) <= 1995, 'Adult', 'Young') AS Category
FROM Customers;

-- Display 'Not Available' if a phone number is NULL
SELECT FirstName, IFNULL(Phone, 'Not Available') AS PhoneNumber
FROM Customers;

-- Find the latest birth date
SELECT GREATEST(
'2000-09-20',
'1995-06-18',
'1997-09-12',
'1993-11-25'
) AS LatestBirthDate;

-- Find the earliest birth date
SELECT LEAST(
'2000-09-20',
'1995-06-18',
'1997-09-12',
'1993-11-25'
) AS EarliestBirthDate;

-- Compare two customer names
SELECT FirstName, NULLIF(FirstName,'Priya') AS Result
FROM Customers;

-- TASK 2
-- Calculate the total balance maintained across all customer accounts.
SELECT SUM(Balance) as total_balance
FROM Accounts;

-- Calculate the average balance maintained across all customer 
-- accounts to understand the typical amount held by customers.
SELECT AVG(Balance) AS average_balance
FROM Accounts;

-- Identify the highest balance maintained in any customer account.
SELECT MAX(Balance) AS highest_balance
FROM Accounts;

-- Identify the lowest balance maintained in any customer account.
SELECT MIN(Balance) AS lowest_balance
FROM Accounts;

-- Determine the total number of customer accounts available in the system.
SELECT COUNT(*) AS total_accounts
FROM Accounts;

-- TASK 3
-- The bank wants to calculate the total account balance for each AccountType by 
-- grouping the records based on AccountType and identify which account type is 
-- attracting the highest total deposits from customers.
SELECT AccountType, SUM(Balance) AS TotalBalance
FROM Accounts
GROUP BY AccountType;

-- TASK 4
-- The bank management wants to identify only those account types 
-- whose total customer deposits exceed ₹25,000.
SELECT AccountType, SUM(Balance) AS TotalBalance
FROM Accounts
GROUP BY AccountType
HAVING SUM(Balance) > 25000;

/* ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- */
/* 
---------------
SQL LAB 7
---------------
*/

-- TASK 2
-- Rank Customer Loans Using RANK()
select * from Loans;
Select LoanID, CustomerID, LoanAmount, 
RANK() OVER(ORDER BY LoanAmount DESC) AS LoanRank
FROM Loans;

-- TASK 3
-- Rank Customer Loans Using DENSE_RANK()
SELECT LoanID, CustomerID, LoanAmount,
    DENSE_RANK() OVER(ORDER BY LoanAmount DESC) AS DenseRank
FROM Loans;

-- TASK 4
-- Assign Row Numbers Using ROW_NUMBER()
SELECT LoanID, CustomerID, LoanAmount,
    ROW_NUMBER() OVER(ORDER BY LoanAmount DESC) AS RowNumber
FROM Loans;

-- TASK 5
-- Use of Partition_By()
SELECT LoanID, CustomerID, LoanAmount,
    ROW_NUMBER() OVER(PARTITION BY CustomerID ORDER BY LoanAmount DESC) AS RowNum
FROM Loans;

-- TASK 6
-- Calculate Running Total Using SUM() OVER()
SELECT LoanID, CustomerID,LoanAmount,
    SUM(LoanAmount) OVER(ORDER BY LoanAmount DESC) AS RunningTotal
FROM Loans;

-- TASK 7
-- Compare Previous Loan Records Using LAG()
SELECT LoanID, CustomerID, LoanAmount,
    LAG(LoanAmount) OVER(ORDER BY LoanAmount DESC) AS PreviousLoanAmount
FROM Loans;

-- TASK 8
-- Compare Next Loan Records Using LEAD()
SELECT LoanID, CustomerID, LoanAmount,
    LEAD(LoanAmount) OVER(ORDER BY LoanAmount DESC) AS NextLoanAmount
FROM Loans;

/* ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- */
/* 
---------------
SQL LAB 8
---------------
*/

-- TASK 1
-- Generate Accounts Transaction Reports Using INNER JOIN()
SELECT a.AccountID, a.AccountType, a.Balance, t.TransactionID, t.TransactionDate, t.TransactionType, t.Amount
FROM Accounts a
INNER JOIN Transactions t
ON a.AccountID = t.AccountID;

-- TASK 2
-- Display All Accounts Including Those Without Transactions Using LEFT JOIN()
SELECT a.AccountID, a.AccountType, a.Balance, t.TransactionID, t.TransactionDate, t.TransactionType, t.Amount
FROM Accounts a
LEFT JOIN Transactions t
ON a.AccountID = t.AccountID;

-- TASK 3
-- Generate Deposit Transaction Reports Using INNER JOIN()
SELECT *
FROM Accounts a
INNER JOIN Transactions t
ON a.AccountID = t.AccountID
WHERE t.TransactionType = 'Deposit';

-- TASK 4
-- Generate High Balance Account Transaction Reports Using JOIN() & WHERE()
SELECT *
FROM Accounts a
INNER JOIN Transactions t
ON a.AccountID = t.AccountID
WHERE a.Balance > 30000
ORDER BY a.Balance DESC;

/* ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- */
/* 
---------------
SQL LAB 9
---------------
*/

-- TASK 1
-- Identify Transactions Above the Average Transaction Amount
SELECT AVG(Amount)
FROM Transactions;
SELECT *
FROM Transactions
WHERE Amount >
(
    SELECT AVG(Amount)
    FROM Transactions
);

-- TASK 2
-- Identify Accounts with Above-Average Balance
SELECT AccountID, AccountType, Balance, CustomerID
FROM Accounts
WHERE Balance >
(
    SELECT AVG(Balance)
    FROM Accounts
)
ORDER BY Balance DESC;

-- TASK 3
-- Identify Deposit Accounts Using a Multi-Row Subquery
SELECT AccountID, AccountType, Balance, CustomerID
FROM Accounts
WHERE AccountID IN
(
    SELECT AccountID
    FROM Transactions
    WHERE TransactionType = 'Deposit'
);

-- TASK 4
-- Identify the Account with the Highest Balance
SELECT AccountID, AccountType, Balance, CustomerID
FROM Accounts
WHERE Balance =
(
    SELECT MAX(Balance)
    FROM Accounts
);

/* ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- */
/* 
---------------
SQL LAB 10
---------------
*/

-- TASK 1
-- Create a View for High-Balance Accounts
CREATE VIEW High_Balance_Accounts AS
SELECT AccountID, AccountType, Balance, CustomerID
FROM Accounts
WHERE Balance > 30000;

-- TASK 2
-- Retrieve Data Using the View
SELECT *
FROM High_Balance_Accounts;

-- TASK 3
-- Modify the View to Include Transaction Details
CREATE OR REPLACE VIEW High_Balance_Accounts AS
SELECT a.AccountID, a.AccountType, a.Balance, a.CustomerID, t.TransactionID, t.TransactionDate, t.TransactionType, t.Amount
FROM Accounts a
INNER JOIN Transactions t
ON a.AccountID = t.AccountID
WHERE a.Balance > 30000;

-- TASK 4
-- Generate Banking Reports Using the View
SELECT AccountID, AccountType, Balance, CustomerID, TransactionID, TransactionDate, TransactionType, Amount
FROM High_Balance_Accounts
ORDER BY Balance DESC;
