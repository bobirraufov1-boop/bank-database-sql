# bank-database-sql

## Overview

Designed and implemented a banking database system in SQL Server consisting of 30 interconnected tables covering core banking operations, loans, fraud detection, compliance, investments, insurance, and merchant transactions.

## Features

- 30-table relational database schema
- Primary and foreign key constraints
- Customer and account management
- Loan and credit management
- Fraud detection analytics
- Compliance and risk monitoring
- Investment and insurance modules

## Methods

- SQL Server
- SQL
- Database Design
- Data Modeling

## Sample Analytics

- Top account balances
- Active loan monitoring
- High-risk fraud transaction detection
- Branch-level loan exposure analysis
- Suspicious transaction pattern detection

## Setup & Usage:

## Setup
- Run `schema.sql` in SQL Server to create all 30 tables.
- Ensure SQL Server is installed and running.

## Usage
- Example query: Retrieve all accounts for a customer  
  ```sql
  SELECT * FROM Accounts WHERE CustomerID = 123;

## Database Schema Diagram
![ERD](BankProject Diagram.png)
