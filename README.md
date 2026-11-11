# BankingDB – Banking Database Management & SQL Practice

This project is based on a Banking Database Management System developed using MySQL as part of my SQL learning module at IT Vedant.

The project focuses on database creation, table management, relational database design, data manipulation, SQL querying, and analytical operations through practical banking-related exercises.

## Project Overview

The BankingDB database represents a basic banking system that manages customer information, bank accounts, transactions, branch details, and loan records.

It provides practical experience in working with relational databases and retrieving meaningful information using SQL queries.

## Database Tables

The project includes the following tables:

1. **Customers** – Stores customer details such as customer ID, first name, last name, email, phone number, account creation date, and date of birth.
2. **Accounts** – Stores account information, including account ID, customer ID, account type, and account balance.
3. **Transactions** – Maintains transaction records, including transaction ID, account ID, transaction date, amount, and transaction type.
4. **Branches** – Stores bank branch information, including branch ID, branch name, address, and phone number.
5. **Loans** – Maintains loan information such as loan ID, customer ID, loan amount, interest rate, start date, and end date.

## SQL Concepts Covered

### 1. Database & Table Management
- CREATE DATABASE and USE
- CREATE TABLE
- ALTER TABLE
- DROP TABLE
- DESCRIBE
- SHOW CREATE TABLE

### 2. Constraints & Relationships
- Primary Key (PK)
- Foreign Key (FK)
- NOT NULL constraint
- UNIQUE constraint
- CHECK constraint
- Relationships between customers, accounts, branches, transactions, and loans

### 3. Data Manipulation
- INSERT INTO
- UPDATE
- DELETE
- Retrieving records using SELECT

### 4. Filtering & Sorting
- WHERE clause
- AND, OR and comparison conditions
- BETWEEN and IN operators
- LIKE operator and pattern matching
- IS NULL and IS NOT NULL
- ORDER BY
- DISTINCT
- LIMIT and OFFSET

### 5. SQL Functions
- String functions: UPPER, LOWER, LENGTH, LEFT, CONCAT
- Mathematical functions: ROUND, CEIL, FLOOR, ABS, MOD
- Date functions: CURDATE, NOW, YEAR, MONTH, DATEDIFF
- Conditional and comparison functions: IF, IFNULL, NULLIF, GREATEST, LEAST
- Aggregate functions: SUM, AVG, MAX, MIN, COUNT

### 6. Grouping & Conditional Analysis
- GROUP BY
- HAVING
- CASE statements
- Categorization of account balances and transaction amounts

### 7. Window Functions
- RANK()
- DENSE_RANK()
- ROW_NUMBER()
- PARTITION BY
- SUM() OVER()
- LAG()
- LEAD()
- Running totals and ranking analysis

### 8. Joins
- INNER JOIN
- LEFT JOIN
- Combining account and transaction information
- Generating banking reports using multiple tables

### 9. Subqueries
- Single-row subqueries
- Multi-row subqueries
- Nested SELECT statements
- Identifying above-average balances and transactions
- Finding accounts with the highest balance

### 10. Views
- CREATE VIEW
- SELECT from views
- CREATE OR REPLACE VIEW
- Generating banking reports through views

## Practical Banking Analysis

The project includes SQL exercises to:

- Retrieve customer and account information.
- Identify savings and current accounts.
- Analyse account balances and transaction amounts.
- Categorize accounts based on balance.
- Categorize transactions based on transaction value.
- Calculate total and average account balances.
- Rank customer loans based on loan amounts.
- Generate running totals and compare loan records.
- Identify above-average transactions and account balances.
- Generate high-balance account reports with transaction details.

## Tools & Technologies

- **Database:** MySQL
- **SQL Environment:** MySQL Workbench
- **Database Name:** BankingDB
- **Language:** SQL

## Learning Objectives

- Understand relational database management.
- Practise database creation and modification.
- Implement primary and foreign key relationships.
- Develop SQL querying and data manipulation skills.
- Apply SQL functions for data processing.
- Perform analytical operations using joins, subqueries, and window functions.
- Generate meaningful banking reports using SQL views.

---

**Project Type:** Educational SQL Practice Project

**Course:** Data Science & Data Analytics – IT Vedant

*This project is maintained for learning, practice, and future revision of MySQL concepts.*
