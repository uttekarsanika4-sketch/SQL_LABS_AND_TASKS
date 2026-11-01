CREATE DATABASE BOOKSTORE_DB;

CREATE TABLE customers (
    customer_id INT,
    full_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(50),
    created_date DATE);
SELECT * FROM customers;

CREATE TABLE books (
    book_id INT,
    title VARCHAR(150),
    author VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock_qty INT);
SELECT * FROM books;

CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    status VARCHAR(20));
    SELECT * FROM orders;

CREATE TABLE order_items (
    order_item_id INT,
    order_id INT,
    book_id INT,
    quantity INT);
    SELECT * FROM order_items;
    
    
 alter table customers add column country varchar(50);
 alter table order_items add column discount decimal(5,2);
 alter table customers modify column phone varchar(15);
 alter table books rename column stock_qty to stock_quantity;
 
 