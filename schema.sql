create database BankProject

use BankProject


----------------------------------------Core Banking Tables
create table Customers (

customer_id int primary key,
fullname varchar(100),
date_of_birth date,
email varchar(50),
phonenumber varchar(50),
address varchar(250),
national_id varchar(50) unique,
tax_id varchar(50),
employmentstatus varchar(30),
annualincome int, 
createdat datetime default getdate(), 
updatedat datetime default getdate()
)

create table Accounts (

account_id int primary key,
customer_id int,
branch_id int,
account_type varchar(50),
balance int,
currency varchar(15),
status varchar(30),
createddate date,

constraint fk_accounts_customers foreign key (customer_id) references Customers(customer_id),

constraint fk_accounts_branches foreign key (branch_id) references Branches(branch_id)
)

create table Transactions (

transaction_id int primary key,
account_id int,
transaction_type varchar(40),
amount int,
currency varchar(30),
date date, 
status varchar(15),
referenceno varchar(40),

constraint fk_transactions_accounts foreign key (account_id) references Accounts(account_id)
)

create table Branches (

branch_id int primary key,
branchname varchar(30), 
address varchar(30),
city varchar(30),
state varchar(30),
country varchar(30),
contactnumber varchar(30)
)

create table Employees (

employee_id int primary key,
branch_id int,
fullname varchar(50),
position varchar(30),
department varchar(30),
salary int,
hiredate date,
status varchar(30),

constraint fk_employees_branches foreign key (branch_id) references Branches(branch_id)
)


alter table Branches
add manager_id int

alter table Branches 
add constraint fk_branches_manager foreign key (manager_id) references Employees(employee_id) 

--------------------------------------------------------------------------------------------- Digital Banking & Payments

create table CreditCards (

card_id int primary key,
customer_id int,
card_number varchar(20),
card_type varchar(20),
cvv int,
expiry_date date,
limit varchar(20),
status varchar(20),

constraint fk_creditcards_customers foreign key (customer_id) references Customers(customer_id)
)


create table CreditCardTransactions (

transaction_id int primary key,
card_id int,
merchant varchar(20),
amount int,
currency varchar(20),
date date,
status varchar(20),

constraint fk_CreditCardTransactions_CreditCards foreign key (card_id) references CreditCards(card_id)
)


create table OnlineBankingUsers (

user_id int primary key, 
customer_id int,
username varchar(20),
passwordhash varchar(20),
lastlogin date,

constraint fk_OnlineBankingUsers_Customers foreign key (customer_id) references Customers(customer_id)
)


create table BillPayments (

payment_id int primary key,
customer_id int,
billername varchar(30), 
amount int, 
date date, 
status varchar(20),

constraint fk_BillPayments_Customers foreign key (customer_id) references Customers(customer_id)
)




create table MobileBankingTransactions (

transaction_id int primary key,
customer_id int,
device_id varchar(30), 
appversion varchar(30), 
transactiontype varchar(30), 
amount int, 
date date,

constraint fk_MobileBankingTransactions_Customers foreign key (customer_id) references Customers(customer_id)
)
------------------------------------------------------------------------------------------------------------- Loans & Credit



create table Loans (

loan_id int primary key,
customer_id int,
loan_type varchar(40),
amount int,
interest_rate varchar(10), 
StartDate date, 
EndDate date, 
Status varchar(10),

constraint fk_Loans_Customers foreign key (customer_id) references Customers(customer_id)
)



create table LoanPayments (

payment_id int primary key,
loan_id int,
amount_paid int, 
payment_date date, 
remaining_balance int,

constraint fk_LoanPayments_Loans foreign key (loan_id) references Loans(loan_id)
)


create table CreditScores (

customer_id int,
credit_score varchar(30), 
updated_at date,

constraint fk_CreditScores_Customers foreign key (customer_id) references Customers(customer_id)
)


create table DebtCollection (

dept_id int primary key,
customer_id int,
amount_due int, 
due_date date, 
collector_assigned varchar(30),

constraint fk_DebtCollection_Customers foreign key (customer_id) references Customers(customer_id)
)
--------------------------------------------------------------------------------------------------Compliance & Risk Management

create table KYC (

kyc_id int primary key,
customer_id int,
document_type varchar(30), 
document_number int, 
VerifiedBy date,

constraint fk_KYC_Customers foreign key (customer_id) references Customers(customer_id)
)



create table FraudDetection (

fraud_id int primary key,
customer_id int,
transaction_id int,
risk_level varchar(30), 
reported_date date,

constraint fk_FraudDetection_Customers foreign key (customer_id) references Customers(customer_id)
)



create table AML (

case_id int primary key,
customer_id int,
case_type varchar(30),
status varchar(30),
investigator_id int,

constraint fk_AML_Customers foreign key (customer_id) references Customers(customer_id)
)




create table RegulatoryReports (

report_id int primary key,
report_type varchar(30), 
submission_date date
)


-------------------------------------------------------------------------------------Human Resources & Payroll

create table Departments (

department_id int primary key,
department_name varchar(30), 
managerID int
)


create table Salaries (

salary_id int primary key,
employee_id int,
Base_salary int,
bonus int,
deductions varchar(30), 
payment_date date,

constraint fk_Salaries_Employees foreign key (employee_id) references Employees(employee_id)
)


create table EmployeeAttendance (

attendance_id int primary key,
employee_id int,
CheckInTime varchar(30), 
CheckOutTime varchar(30), 
TotalHours int

constraint fk_EmployeeAttendance_Employees foreign key (employee_id) references Employees(employee_id)
)

------------------------------------------------------------------------------------------------------Investments & Treasury


create table InsurancePolicies (

policy_id int primary key,
customer_id int,
insurance_type varchar(30),
premium_amount int,
coverage_amount int,

constraint fk_InsurancePolicies_Customers foreign key (customer_id) references Customers(customer_id)
)


create table Claims (

claim_id int primary key,
policy_id int,
claim_amount int, 
status varchar(30), 
filed_date date,

constraint fk_Claims_InsurancePolicies foreign key (policy_id) references InsurancePolicies(policy_id)
)



create table UserAccessLogs (

log_id int primary key,
user_id int, 
action_type varchar(30),
Timestamp varchar(30)
)


create table CyberSecurityIncidents (

incident_id int primary key, 
affected_system varchar(30), 
reported_date date, 
resolution_status varchar(30)
)

----------------------------------------------------------------------------------Insurance & Security


create table Merchants (

 merchant_id int primary key, 
 merchant_name varchar(40),
 industry varchar(40),
 location varchar(100),
 customer_id int
)


create table MerchantTransactions (

transaction_id int primary key,
merchant_id int,
amount int,
payment_method varchar(30),
date date,

constraint fk_MerchantTransactions_Merchants foreign key (merchant_id) references Merchants(merchant_id)
)
--------------------------------------------------------------------------------------------------------

create table Investments (

investment_id int primary key,
customer_id int,
investment_type varchar(30),
amount int,
ROI int, 
MaturityDate date,

constraint fk_Investments_Customers foreign key (customer_id) references Customers(customer_id)
)



create table StockTradingAccounts (

account_id int primary key,
customer_id int,
brokerage_firm varchar(30),
total_invested int,
current_value varchar(30),

constraint fk_StockTradingAccounts_Customers foreign key (customer_id) references Customers(customer_id)
)



create table ForeignExchange (

FXID int primary key,
customer_id int,
currency_pair varchar(30), 
exchange_rate varchar(30),
amount_exchanged int,

constraint fk_ForeignExchange_Customers foreign key (customer_id) references Customers(customer_id)
)

