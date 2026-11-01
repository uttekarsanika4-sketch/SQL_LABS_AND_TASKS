-- Display customer Table
SELECT* FROM CUSTOMER;

-- 2. Display all customer FirstName in uppercase.
SELECT FIRST_NAME, UPPER (FIRST_NAME) AS NEW_NAME FROM customer;

-- 3. Display all customer FirstName in lowercase.d
SELECT FIRST_NAME, LOWER (FIRST_NAME) AS L_NAME FROM customer;

-- 4. Find the total number of characters in each customer FirstName
SELECT FIRST_NAME, LENGTH (FIRST_NAME) AS LengthOfNAME FROM customer;

-- 5. Display only the first three characters of customer FirstName .
SELECT FIRST_NAME, left(first_name,3) from customer;

-- 6. Combine customer's FirstName with LastName.
select concat(FIRST_NAME," ",LAST_NAME)AS COMBINE FROM customer;

-- TRIM
SELECT UPPER("  HELLO"),LENGTH("  HELLO"),trim("  HELLO"),length(TRIM("  HELLO"));
SELECT FIRST_NAME, TRIM(first_name) AS TRIM from customer;

-- RIGHT
SELECT FIRST_NAME, RIGHT(first_name,3) from customer;

-- MID
SELECT FIRST_NAME, MID(first_name,2) from customer;

-- UPPER LOWER LEFT RIGHT MID CONCATE

SELECT round(15.4),ceil(15.1),floor(15.1),abs(-15.5),mod(14,8);

-- 1 Display customer Table
SELECT* FROM CUSTOMER;

-- 2. Display the current system date
SELECT current_date FROM CUSTOMER;

-- 3. Display the current system date and time.
SELECT now() FROM CUSTOMER;

-- 5. Display the Birth YEAR AND MONTH
SELECT year(DATE_OF_BIRTH) FROM CUSTOMER;
SELECT MONTH (DATE_OF_BIRTH) FROM CUSTOMER;

-- 6. Calculate the number of days since BirthDate
select  DATE_OF_BIRTH, datediff(CURDATE(),DATE_OF_BIRTH) FROM CUSTOMER;

-- 7. Find the latest birth date.
SELECT max(DATE_OF_BIRTH) FROM CUSTOMER;

-- 8. Find the earliest birth date
SELECT min(DATE_OF_BIRTH) FROM CUSTOMER;

-- QUES
-- 1 Categorize customers as Adult or Young based on their birth yeaR
SELECT year(DATE_OF_BIRTH),
CASE
WHEN year(DATE_OF_BIRTH)>=1998 THEN "YOUNG"
WHEN year(DATE_OF_BIRTH)<1998 THEN "ADULT" END TYPE FROM CUSTOMER;

-- 2. Display 'Not Available' if a phone number is NULL
SELECT ifnull(PHONE,"NOTavailable") from customer;

-- 4. Calculate the total balance maintained across all customer accounts.
SELECT sum(BALANCE) FROM account;

-- 5. Calculate the average balance maintained across all customer accounts to understand the typical amount held by customers.
SELECT avg(BALANCE) FROM account;

-- 6. Identify the highest balance maintained in any customer account.
select max(BALANCE) FROM ACCOUNT;
-- 7. Identify the lowest balance maintained in any customer account
select min(BALANCE) FROM ACCOUNT;

-- 8. Determine the total number of customer accounts available in the system.
select count(distinct(ACCOUNT_ID)) FROM account;

-- 9.The bank wants to calculate the total account balance for each AccountType by grouping the records based on AccountType and identify which account type is attracting the highest total deposits from customers.
SELECT ACCOUNT_TYPE,sum(BALANCE) FROM account
group by ACCOUNT_TYPE;

-- 10. The bank management wants to identify only those account types whose total customer deposits exceed ₹25,000.
select account_type,sum(balance) from account
group by ACCOUNT_TYPE
HAVING sum(BALANCE)>25000;