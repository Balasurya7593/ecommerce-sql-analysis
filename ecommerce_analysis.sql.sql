SHOW DATABASES;
CREATE DATABASE ecommerce_db;
USE ecommerce_db;
CREATE TABLE customers (
customer_id INT PRIMARY KEY,
name VARCHAR(100),
city VARCHAR(100)
);
CREATE TABLE products (
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
category VARCHAR(50),
price DECIMAL(10,2)
);
CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE
);
CREATE TABLE order_items (
order_item_id INT PRIMARY KEY,
order_id INT,
product_id INT,
quantity INT
);
INSERT INTO customers VALUES
(1,'Alice','New York'),
(2,'Bob','Chicago'),
(3,'Charlie','Los Angeles'),
(4,'David','Houston');
INSERT INTO products VALUES
(101,'Laptop','Electronics',800),
(102,'Phone','Electronics',500),
(103,'Shoes','Fashion',100),
(104,'Watch','Accessories',150);
INSERT INTO orders VALUES
(1001,1,'2024-01-10'),
(1002,2,'2024-02-15'),
(1003,3,'2024-03-05'),
(1004,1,'2024-03-10');
INSERT INTO order_items VALUES
(1,1001,101,1),
(2,1002,102,2),
(3,1003,103,3),
(4,1004,104,1);
SELECT * FROM customers;
SELECT 
o.order_id,
c.name AS customer,
p.product_name,
oi.quantity,
p.price
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;
SELECT 
SUM(p.price * oi.quantity) AS total_revenue
FROM order_items oi
JOIN products p 
ON oi.product_id = p.product_id;
SELECT 
p.product_name,
SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p 
ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;
SELECT 
c.name,
SUM(p.price * oi.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.name
ORDER BY total_spent DESC;
SELECT 
p.category,
SUM(p.price * oi.quantity) AS category_sales
FROM products p
JOIN order_items oi 
ON p.product_id = oi.product_id
GROUP BY p.category;
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM customers;