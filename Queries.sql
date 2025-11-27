use retail_sales_db;
#1.Total Revenue
SELECT SUM(amount) AS total_revenue FROM payments;


#2. Top 5 Products
SELECT p.product_name, SUM(s.quantity) AS total_sold
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC LIMIT 5;
 
# 3. Show customer name and city only
SELECT name, city FROM customers;

#4. Show unique product categories
SELECT DISTINCT category FROM products;

# 5. Show products cheaper than 1000
SELECT * FROM products WHERE price < 1000;

#6. Show customers from Bhopal
SELECT * FROM customers WHERE city = 'Bhopal';




-- BASIC AGGREGATION (COUNT, SUM, AVG, MIN, MAX)


-- 7. Total number of customers
SELECT COUNT(*) AS total_customers FROM customers;

-- 8. Total number of products
SELECT COUNT(*) AS total_products FROM products;

-- 9. Average price of products
SELECT AVG(price) AS avg_price FROM products;

-- 10. Total revenue
SELECT SUM(amount) AS total_revenue FROM payments;

-- 11. Min and Max price
SELECT MIN(price), MAX(price) FROM products;



---------------------------------------------------------
-- GROUP BY QUERIES
---------------------------------------------------------

-- 12. City-wise customer count
SELECT city, COUNT(*) 
FROM customers
GROUP BY city;

-- 13. Category-wise product count
SELECT category, COUNT(*)
FROM products
GROUP BY category;

-- 14. Payment method usage
SELECT payment_method, COUNT(*)
FROM payments
GROUP BY payment_method;



-- JOINS (REAL-WORLD)

-- 15. Sales with product name
SELECT s.sale_id, p.product_name, s.quantity
FROM sales s
JOIN products p ON s.product_id = p.product_id;

-- 16. Customer with sale date
SELECT c.name, s.sale_date, s.quantity
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id;

-- 17. Customer + Product + Payment
SELECT c.name, p.product_name, pay.amount
FROM payments pay
JOIN sales s ON pay.sale_id = s.sale_id
JOIN customers c ON c.customer_id = s.customer_id
JOIN products p ON p.product_id = s.product_id;


-- ADVANCED ANALYTICS (GROUP BY + JOINS)

-- 18. Top 5 best-selling products
SELECT p.product_name, SUM(s.quantity) AS total_sold
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 5;

-- 19. Category-wise revenue
SELECT p.category, SUM(pay.amount) AS revenue
FROM sales s
JOIN payments pay ON s.sale_id = pay.sale_id
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category;

-- 20. City-wise revenue
SELECT c.city, SUM(pay.amount) AS revenue
FROM payments pay
JOIN sales s ON pay.sale_id = s.sale_id
JOIN customers c ON c.customer_id = s.customer_id
GROUP BY c.city;

-- 21. Most sold category
SELECT p.category, SUM(s.quantity) AS qty
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY qty DESC
LIMIT 1;




-- HAVING (Filters on group results)

-- 22. Customers with more than 1 order
SELECT c.name, COUNT(*) AS order_count
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.name
HAVING order_count > 1;

-- 23. Categories with revenue above 2000
SELECT p.category, SUM(pay.amount) AS revenue
FROM products p
JOIN sales s ON p.product_id = s.product_id
JOIN payments pay ON pay.sale_id = s.sale_id
GROUP BY p.category
HAVING revenue > 2000;



-- SUBQUERIES (INTERVIEW LEVEL)

-- 24. Customers who spent more than average
SELECT c.name
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
JOIN payments p ON s.sale_id = p.sale_id
GROUP BY c.name
HAVING SUM(p.amount) > (SELECT AVG(amount) FROM payments);

-- 25. Products priced above average price
SELECT * FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- 26. Highest selling product (subquery)
SELECT product_name FROM products
WHERE product_id =
    (SELECT product_id 
     FROM sales 
     GROUP BY product_id
     ORDER BY SUM(quantity) DESC
     LIMIT 1);



-- WINDOW FUNCTIONS (ADVANCED)

-- 27. Rank customers by spending
SELECT 
    c.name,
    SUM(pay.amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(pay.amount) DESC) AS rank_num
FROM payments pay
JOIN sales s ON pay.sale_id = s.sale_id
JOIN customers c ON c.customer_id = s.customer_id
GROUP BY c.name; 