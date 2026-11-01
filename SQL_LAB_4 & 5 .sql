use BANK;
SELECT *FROM account;
SELECT *FROM branches;
SELECT *FROM Customer;
SELECT *FROM loans;
SELECT *FROM Transactions;


-- que1--

SELECT AccountID,Accounttype,Balance FROM account;
SELECT * FROM account
WHERE Account_type="Savings";

SELECT * FROM Transactions
WHERE amount >=5000
AND amount<=20000;

select * from Transactions
WHERE Amount between 500 and 20000;

SELECT * FROM account
WHERE Balance>5000
AND Balance>=20000;

SELECT * FROM Customer
WHERE Customer_id IN (101,102,103,104);

SELECT * FROM Customer
WHERE Customer_id between 101 AND 104;

SELECT * FROM Customer
WHERE Customer_id=101 or Customer_id=102 or Customer_id=103 or Customer_id=104;

SELECT * FROM account
WHERE ACCOUNT_TYPE="Current";

SELECT * FROM account
WHERE Balance>15000;

select * from Transactions
where Amount  between 1000 AND 10000;

SELECT * FROM Customer
WHERE Customer_id=105 or Customer_id=104;

--QUE1--
SELECT * FROM loans WHERE Interest_Rate>9 AND loan_Amount>5000;

SELECT * FROM branches WHERE BRANCH_ADD ="shivaji_nagar,pune";

select * from account WHERE Balance between 500 and 5000;

SELECT * FROM account WHERE Balance>25000 and Account_type="Savings";

SELECT * FROM loans WHERE Interest_Rate<8.50;
SELECT * FROM customer WHERE Date_of_Birth >"1998-01-01";
SELECT * FROM branches WHERE BranchID between 2 and 4;
SELECT Branch_Name,Branch_Phone from branches;
SELECT * FROM Transactions WHERE Transaction_type="Deposit";
SELECT * FROM Transactions limit 3 offset 2;
SELECT Amount from Transactions where Amount>5000;
SELECT * FROM Customer where first_name="Rahul" or first_name="Sneha";
SELECT * FROM Transactions  WHERE Amount>3000 and Transaction_type="Deposit";


-- QUE--This displays customers whose names start with the letter R.
 SELECT * FROM Customer
 where first_name regexp "^R%";
 
-- 1.-- Retrieve all current account records
select * from account
where Account_type ="Current";

-- 2.-- Find accounts with balance less than 15000
select * from account
where Balance<15000;

-- 3.-- Display transactions between 1000 and 10000
select * from transactions
where Amount between 1000 and 10000;

-- 4. --Retrieve customer records for CustomerID 104 and 105
select * from customer
where Customer_id=104 or Customer_id=105;

-- 5.-- Display customers whose last name starts with S
 select * from customer
 where Last_name regexp "^s";
 
-- 6 Display Customers in Alphabetical Order
select * from customer 
order by first_name asc;

-- Display Accounts with Highest Balance First
select * from account
order by Balance desc;

-- Retrieve Unique Account Types
select  distinct Account_type
from account;

-- Display Top 3 Highest Balance Accounts
select * from account
order by Balance desc
limit 3;

-- Skip Initial Records While Viewing Transactions
 select * from transactions
 limit 1 offset 2;
 
 
 
-- 1. -- Display customers sorted by LastName
select * from customer
order by Last_name asc;

-- 2. -- Retrieve top 5 transactions with highest amount
select * from transactions
order by Amount desc  limit 5;

-- 3. -- Display unique transaction types
select  distinct transaction_type
from transactions;

-- 4. -- Skip the first 3 transaction records and display the next 4 records
select * from transactions
limit 4 offset 3;

 
-- Find Customers Without Phone Numbers
select * from customer
where phone is null;

-- Find Customers Having Email Addresses
select * from customer
where email is  not null;
 
-- 1 
select * from customer
where email is  null;

-- 2. -- Display all accounts where balance information is available
 select * from account
 where Balance is not null;
 
 -- Search Customers Whose First Name Starts with “A”
 select * from customer
 where first_name regexp "^A";
 
-- Search Customers Whose Email Contains “gmail”
select * from customer
where email like "%gmail%";

-- Search Customers Whose Last Name Ends with “kar”
 select * from customer
 where Last_name like "%tel";
 
 
 
 -- 1. -- Display customers whose first name starts with R
select * from customer
 where first_name regexp "^R";
 
-- 2. -- Find customers whose email contains yahoo
select * from customer
 where  email like "%yahoo%";
 
-- 3. -- Display customers whose last name starts with P
 select * from customer
 where Last_name regexp "^P";
 
-- 4. -- Search customers whose phone number ends with 99
  select * from customer
 where phone like "98%";
 
 -- The finance team wants to review only Savings and Current account holders.
 select * from account
 where account_type in ("Savings","Current");
 
--  The audit department wants to investigate only Deposit and Withdrawal transactions.
select * from transactions
where Transaction_Type in ("Deposit","Withdrawal");

-- The customer relationship team wants to review records for a specific set of customers. 101,102,105
 select * from customer
 where Customer_id in (101,102,105);
 
-- 1. --  Display accounts belonging to Salary and Savings account types
select * from account 
where  account_type in ("Salary","Saving");

-- 2. -- Retrieve transactions for Payment and Deposit categories
select * from transactions
where Transaction_Type in ("Payment","Deposit");

-- 3. -- Display customer records for CustomerID 103 and 104
select * from customer
where Customer_id in(103,104);

-- 4. -- Retrieve selected account records using AccountID values
 select * from account
 where Account_ID in(202,203,204);
 
 -- Display Customers in Ascending Order of Last Name
 select * from customer
 order by  Last_name asc;
 
 -- Display Accounts with Highest Balance First
 select * from account
 order by balance desc;
 
-- Display Transactions Sorted by Transaction Date
select * from transactions
order by Transaction_Date asc;


-- 1. -- Display customers sorted by FirstName
select * from customer
order by first_name asc;

-- 2. -- Display accounts sorted by AccountType
select * from account
order by Account_Type desc;

-- 3. -- Display transactions sorted by Amount in descending order
select * from transactions
order by Amount desc;

-- 4. -- Display customers sorted by DateOfBirth
 select * from customer
 order by Date_of_Birth desc;
 
 -- Display Only Top 5 Highest Balance Accounts
 select * from account
 order by Balance desc
 limit 5;
 
-- Display First 3 Customer Records
select * from customer
limit 3;

-- Skip Initial Transaction Records 3 While Viewing Data record 2
select * from transactions
limit 3 offset 2;
 
-- 1.  -- Display top 3 transactions with highest amount
select * from transactions
order by Amount desc limit 3;

-- 2. -- Retrieve only 4 customer records
select * from customer
limit 4;

-- 3. -- Skip first 2 account records and display next 3 records
select * from account
limit 3 offset 2;

-- 4. --  Display top 5 latest transactions
select * from transactions
order by Amount limit 5;

 
-- Display Savings Account Customers Sorted by Balance
select * from account
where account_type ="Savings"
order by Balance asc;

-- Categorize Accounts Using Balance
--  Balance >50000 then premium account
--  Balance >2500 then standar account
 select Account_ID, Balance,
 case
 when Balance >50000 then "premium account"
 when Balance >25000 then "standard account"
 end as "basic account" from account;
 
-- · High Transaction
-- · Medium Transaction
-- · Low Transaction
-- based on transaction amount.
select transaction_ID,Amount,
case
when Amount>8000 then"high"
when Amount>5000 then"mid"
when Amount>1000 then"low"
end as transaction_mode from transactions;
