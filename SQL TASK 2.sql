-- TASK 2 WINDOWS FUNCTION PRACTICE
CREATE TABLE emp_sales (
    sale_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    sale_date DATE,
    amount INT);
    
INSERT INTO emp_sales (sale_id, emp_name, department, sale_date, amount) VALUES
(1, 'Amit', 'Electronics', '2026-01-05', 5000),
(2, 'Neha', 'Electronics', '2026-01-12', 7000),
(3, 'Ravi', 'Electronics', '2026-01-20', 7000),
(4, 'Sara', 'Electronics', '2026-02-03', 3000),
(5, 'John', 'Clothing', '2026-01-08', 4000),
(6, 'Priya', 'Clothing', '2026-01-15', 6000),
(7, 'Karan', 'Clothing', '2026-02-01', 6000),
(8, 'Meena', 'Clothing', '2026-02-10', 2000),
(9, 'Dev', 'Grocery', '2026-01-10', 1500),
(10, 'Anil', 'Grocery', '2026-01-25', 2500),
(11, 'Pooja', 'Grocery', '2026-02-05', 2500),
(12, 'Rahul', 'Grocery', '2026-02-15', 1000);

SELECT * FROM EMP_SALES;

SELECT 
    emp_name, 
    department, 
    amount,
    ROW_NUMBER() OVER (
	PARTITION BY department 
	ORDER BY amount DESC, sale_date ASC
    ) AS row_num
FROM emp_sales;

SELECT 
    emp_name, 
    amount,
    RANK() OVER (
	ORDER BY amount DESC) AS rnk
FROM emp_sales;

SELECT 
    emp_name, 
    amount,
    DENSE_RANK() OVER (
	ORDER BY amount DESC) AS dense_rnk
FROM emp_sales;

SELECT 
emp_name, department, sale_date, amount,
SUM(amount) OVER (PARTITION BY department 
ORDER BY sale_date) AS running_total
FROM emp_sales;

SELECT 
    emp_name, department, amount,
    AVG(amount) OVER (PARTITION BY department) AS dept_avg
FROM emp_sales;

SELECT 
emp_name, department, amount,
MIN(amount) OVER (PARTITION BY department) AS dept_min
FROM emp_sales;

select 
emp_name, department, amount,
lag (amount) over (partition by department order by sale_date) as prev_amt,
amount - lag(amount) over (partition by department order by sale_date) as ChangeS 
from emp_sales;

SELECT 
emp_name, department, amount,
LEAD(amount) OVER (PARTITION BY department ORDER BY sale_date) AS next_amount
FROM emp_sales;