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
 
 
 ALTER TABLE customers ADD PRIMARY KEY (customer_id);
ALTER TABLE books ADD PRIMARY KEY (book_id);
ALTER TABLE orders ADD PRIMARY KEY (order_id);
ALTER TABLE order_items ADD PRIMARY KEY (order_item_id);
 
 ALTER TABLE orders ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id);
ALTER TABLE order_items ADD FOREIGN KEY (order_id) REFERENCES orders(order_id);
ALTER TABLE order_items ADD FOREIGN KEY (book_id) REFERENCES books(book_id);

ALTER TABLE customers ADD CONSTRAINT unique_email UNIQUE (email);

ALTER TABLE customers MODIFY full_name VARCHAR(100) NOT NULL;
ALTER TABLE books MODIFY title VARCHAR(150) NOT NULL;
ALTER TABLE books MODIFY price DECIMAL(10, 2) NOT NULL;
ALTER TABLE orders MODIFY order_date DATE NOT NULL;

ALTER TABLE books ADD CONSTRAINT chk_price CHECK (price > 0);
ALTER TABLE order_items ADD CONSTRAINT chk_quantity CHECK (quantity > 0);
ALTER TABLE books ADD CONSTRAINT chk_stock CHECK (stock_quantity >= 0);

ALTER TABLE orders ALTER COLUMN status SET DEFAULT 'Pending';
ALTER TABLE customers ALTER COLUMN created_date SET DEFAULT (CURRENT_DATE);


INSERT INTO customers (customer_id, full_name, email, city) VALUES (1, 'Test User', 'dup@email.com', 'Pune');
INSERT INTO customers (customer_id, full_name, email, city) VALUES (2, 'Test User 2', 'dup@email.com', 'Mumbai');

INSERT INTO books (book_id, title, price, stock_quantity) VALUES (1, 'Bad Book', -10.00, 5);

INSERT INTO orders (order_id, customer_id) VALUES (1, 9999);

INSERT INTO customers (customer_id, full_name, email) VALUES (3, NULL, 'noname@email.com');


INSERT INTO customers (customer_id, full_name, email, phone, city, country) VALUES 
(6, 'Aarav Sharma', 'aarav@gmail.com', '9876543210', 'Pune', 'India'),
(7, 'Priya Patil', 'priya@yahoo.com', '9123456789', 'Mumbai', 'India');

INSERT INTO customers (customer_id, full_name, email, phone, city, country) VALUES (8, 'Rohan Mehta', 'rohan@gmail.com', '9988776655', 'Delhi', 'India');
INSERT INTO customers (customer_id, full_name, email, phone, city, country) VALUES (9, 'Neha Verma', 'neha@gmail.com', '9811223344', 'Bangalore', 'India');
INSERT INTO customers (customer_id, full_name, email, phone, city, country) VALUES (10, 'Amit Deshmukh', 'amit@gmail.com', '9700112233', 'Pune', 'India');

INSERT INTO books (book_id, title, author, category, price, stock_quantity) VALUES 
(6, 'Database Systems', 'Navathe', 'Tech', 550.00, 25),
(7, 'Clean Code', 'Robert Martin', 'Tech', 450.00, 15),
(8, 'Atomic Habits', 'James Clear', 'Self-Help', 300.00, 40),
(9, 'The Alchemist', 'Paulo Coelho', 'Fiction', 250.00, 30),
(10, 'Rich Dad Poor Dad', 'Robert Kiyosaki', 'Finance', 350.00, 20),
(11, 'Introduction to Algorithms', 'Cormen', 'Tech', 800.00, 10),
(12, 'Sapiens', 'Yuval Noah Harari', 'History', 400.00, 25),
(13, 'Psychology of Money', 'Morgan Housel', 'Finance', 299.00, 50),
(14, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 220.00, 12),
(15, 'Wings of Fire', 'A.P.J. Abdul Kalam', 'Biography', 280.00, 35);


INSERT INTO orders (order_id, customer_id, status) VALUES 
(1, 1, 'Pending'),
(2, 6, 'Pending'),
(3, 7, 'Processing'),
(4, 1, 'Pending'),
(5, 8, 'Pending'),
(6, 9, 'Pending');
ALTER TABLE ORDERS modify COLUMN ORDER_DATE datetime default current_timestamp;

INSERT INTO order_items (order_item_id, order_id, book_id, quantity, discount) VALUES 
(1, 1, 2, 1, 0.00),
(2, 1, 3, 2, 10.00),
(3, 2, 2, 1, 5.00),
(4, 2, 5, 1, 0.00),
(5, 3, 4, 3, 15.00),
(6, 4, 6, 1, 0.00),
(7, 4, 8, 2, 5.00),
(8, 5, 7, 1, 0.00),
(9, 5, 9, 2, 10.00),
(10, 6, 10, 1, 0.00);


UPDATE books SET price = price * 1.10 WHERE category = 'Tech';

UPDATE orders SET status = 'Shipped' WHERE order_id = 1;

UPDATE customers SET city = 'Nagpur' WHERE customer_id = 6;
