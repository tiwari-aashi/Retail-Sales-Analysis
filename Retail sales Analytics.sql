CREATE DATABASE retail_sales_db;
USE retail_sales_db;
                                 #CREATING TABLES
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    city VARCHAR(50),
    phone VARCHAR(12)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    sale_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    sale_id INT,
    payment_method VARCHAR(20),
    amount DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (sale_id) REFERENCES sales(sale_id)
);


                                     #DATA OF CUSTOMERS
INSERT INTO customers VALUES
(1,'Aashi',22,'Bhopal','987650001'),
(2,'Roshan',24,'Indore','987650002'),
(3,'Simran',23,'Delhi','987650003'),
(4,'Manish',27,'Pune','987650004'),
(5,'Kavya',28,'Mumbai','987650005'),
(6,'Arjun',26,'Jaipur','987650006'),
(7,'Priya',21,'Lucknow','987650007'),
(8,'Sameer',31,'Bangalore','987650008'),
(9,'Isha',22,'Kolkata','987650009'),
(10,'Rehan',29,'Chennai','987650010'),
(11,'Divya',25,'Bhopal','987650011'),
(12,'Zara',27,'Indore','987650012'),
(13,'Kabir',24,'Delhi','987650013'),
(14,'Anushka',23,'Pune','987650014'),
(15,'Rahul',30,'Lucknow','987650015'),
(16,'Neha',22,'Bangalore','987650016'),
(17,'Aman',24,'Jaipur','987650017'),
(18,'Mahima',23,'Chennai','987650018'),
(19,'Vikram',27,'Kolkata','987650019'),
(20,'Pooja',28,'Hyderabad','987650020'),
(21,'Tarun',29,'Pune','987650021'),
(22,'Sneha',26,'Delhi','987650022'),
(23,'Jatin',27,'Indore','987650023'),
(24,'Meera',21,'Mumbai','987650024'),
(25,'Ritika',23,'Bhopal','987650025'),
(26,'Aditya',24,'Lucknow','987650026'),
(27,'Harsh',22,'Pune','987650027'),
(28,'Anjali',25,'Chennai','987650028'),
(29,'Nikhil',26,'Hyderabad','987650029'),
(30,'Sana',28,'Jaipur','987650030');


                                 #PRODUCTS
INSERT INTO products VALUES
(101,'T-Shirt','Clothing',499),
(102,'Shoes','Footwear',1299),
(103,'Smart Watch','Electronics',2499),
(104,'Headphones','Electronics',899),
(105,'Bagpack','Accessories',699),
(106,'Jeans','Clothing',999),
(107,'Kurti','Clothing',799),
(108,'Bluetooth Speaker','Electronics',1499),
(109,'Mobile Cover','Accessories',199),
(110,'Sunglasses','Accessories',399),
(111,'Cap','Accessories',299),
(112,'Formal Shirt','Clothing',899),
(113,'Graphic Hoodie','Clothing',1499),
(114,'Sports Shoes','Footwear',1799),
(115,'Wallet','Accessories',499),
(116,'Earbuds','Electronics',1299),
(117,'Laptop Stand','Electronics',799),
(118,'Travel Bottle','Accessories',349),
(119,'Track Pants','Clothing',699),
(120,'Power Bank','Electronics',1599);


                                       #SALES
INSERT INTO sales VALUES
(1,1,101,2,'2024-01-05'),
(2,3,102,1,'2024-01-06'),
(3,5,103,1,'2024-01-07'),
(4,2,104,3,'2024-01-07'),
(5,4,105,1,'2024-01-09'),
(6,6,106,2,'2024-01-10'),
(7,8,107,1,'2024-01-12'),
(8,9,108,1,'2024-01-13'),
(9,10,109,4,'2024-01-13'),
(10,12,110,2,'2024-01-15'),
(11,13,111,1,'2024-01-16'),
(12,14,112,1,'2024-01-18'),
(13,15,113,2,'2024-01-19'),
(14,16,114,1,'2024-01-19'),
(15,17,115,3,'2024-01-20'),
(16,18,116,1,'2024-01-21'),
(17,19,117,1,'2024-01-22'),
(18,20,118,2,'2024-01-23'),
(19,21,119,1,'2024-01-24'),
(20,22,120,1,'2024-01-25'),
(21,23,101,1,'2024-01-25'),
(22,24,103,1,'2024-01-26'),
(23,25,104,1,'2024-01-26'),
(24,26,102,1,'2024-01-27'),
(25,27,108,1,'2024-01-27'),
(26,28,113,1,'2024-01-28'),
(27,29,115,1,'2024-01-29'),
(28,30,106,1,'2024-01-29'),
(29,1,119,1,'2024-01-30'),
(30,2,120,1,'2024-02-01'),
(31,3,114,1,'2024-02-02'),
(32,4,101,2,'2024-02-02'),
(33,5,109,3,'2024-02-03'),
(34,6,110,1,'2024-02-04'),
(35,7,105,1,'2024-02-05'),
(36,8,102,2,'2024-02-05'),
(37,9,107,1,'2024-02-06'),
(38,10,118,1,'2024-02-06'),
(39,11,120,1,'2024-02-07'),
(40,12,116,1,'2024-02-07');


                                 #PAYMENTS
INSERT INTO payments VALUES
(1001,1,'UPI',998,'Success'),
(1002,2,'Card',1299,'Success'),
(1003,3,'UPI',2499,'Success'),
(1004,4,'Cash',2697,'Success'),
(1005,5,'UPI',699,'Success'),
(1006,6,'Card',1998,'Success'),
(1007,7,'UPI',799,'Success'),
(1008,8,'Card',1499,'Success'),
(1009,9,'UPI',796,'Success'),
(1010,10,'UPI',798,'Success'),
(1011,11,'Card',299,'Success'),
(1012,12,'UPI',899,'Success'),
(1013,13,'UPI',2998,'Success'),
(1014,14,'Card',1799,'Success'),
(1015,15,'UPI',1497,'Success'),
(1016,16,'UPI',1299,'Success'),
(1017,17,'Card',799,'Success'),
(1018,18,'UPI',698,'Success'),
(1019,19,'UPI',699,'Success'),
(1020,20,'Card',1599,'Success'),
(1021,21,'UPI',499,'Success'),
(1022,22,'Cash',2499,'Success'),
(1023,23,'Card',899,'Success'),
(1024,24,'UPI',1299,'Success'),
(1025,25,'UPI',1499,'Success'),
(1026,26,'Cash',1499,'Success'),
(1027,27,'UPI',499,'Success'),
(1028,28,'UPI',999,'Success'),
(1029,29,'Card',699,'Success'),
(1030,30,'UPI',1599,'Success'),
(1031,31,'UPI',1799,'Success'),
(1032,32,'Card',998,'Success'),
(1033,33,'UPI',597,'Success'),
(1034,34,'Card',399,'Success'),
(1035,35,'UPI',699,'Success'),
(1036,36,'Card',2598,'Success'),
(1037,37,'UPI',799,'Success'),
(1038,38,'Cash',349,'Success'),
(1039,39,'UPI',1599,'Success'),
(1040,40,'Card',1299,'Success');



