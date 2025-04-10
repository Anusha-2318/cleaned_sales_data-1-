
CREATE TABLE sample_sales_data (
    OrderID INT,
    CustomerName TEXT,
    Product TEXT,
    Category TEXT,
    Quantity INT,
    Price NUMERIC,
    OrderDate DATE
);


INSERT INTO sample_sales_data (OrderID, CustomerName, Product, Quantity, Price, OrderDate) VALUES
(1, 'Alice', 'Laptop', 1, 800.00, '2023-01-10'),
(2, 'Bob', 'Mouse', 2, 25.00, '2023-01-12'),
(3, 'Charlie', 'Keyboard', 1, 45.00, '2023-01-15'),
(4, 'David', 'Monitor', 2, 150.00, '2023-01-20'),
(5, 'Eve', 'Laptop', 1, 900.00, '2023-01-22'),
(6, 'Frank', 'Mouse', 3, 25.00, '2023-01-25'),
(7, 'Grace', 'Keyboard', 1, 45.00, '2023-01-27'),
(8, 'Heidi', 'Monitor', 1, 150.00, '2023-01-28'),
(9, 'Ivan', 'Laptop', 2, 850.00, '2023-02-01'),
(10, 'Judy', 'Mouse', 1, 25.00, '2023-02-05'),
(11, 'Kevin', 'Monitor', 1, 155.00, '2023-02-06'),
(12, 'Lily', 'Keyboard', 2, 50.00, '2023-02-07'),
(13, 'Mallory', 'Mouse', 5, 20.00, '2023-02-08'),
(14, 'Nina', 'Laptop', 1, 870.00, '2023-02-10'),
(15, 'Oscar', 'Monitor', 1, 145.00, '2023-02-12'),
(16, 'Peggy', 'Keyboard', 3, 42.00, '2023-02-14'),
(17, 'Quinn', 'Laptop', 1, 910.00, '2023-02-16'),
(18, 'Rita', 'Mouse', 2, 30.00, '2023-02-18'),
(19, 'Steve', 'Monitor', 2, 148.00, '2023-02-20'),
(20, 'Trudy', 'Keyboard', 1, 47.00, '2023-02-22');



SELECT * FROM sample_sales_data;


-- Total Revenue
SELECT SUM(Quantity * Price) AS Total_Revenue FROM sample_sales_data;


-- Revenue by Category

SELECT *
FROM sample_sales_data
WHERE Quantity * Price = (
    SELECT MAX(Quantity * Price) FROM sample_sales_data
);

SELECT * 
FROM sample_sales_data
ORDER BY Price DESC;








--aggregate functions
SELECT MAX(Price) AS MaxPrice, MIN(Price) AS MinPrice
FROM sample_sales_data;

SELECT AVG(Quantity) AS AverageQuantity
FROM sample_sales_data;

SELECT SUM(Quantity * Price) AS TotalSales
FROM sample_sales_data;



--subqueries
SELECT *
FROM sample_sales_data
WHERE Quantity * Price = (
    SELECT MAX(Quantity * Price) FROM sample_sales_data
);

----create an view
CREATE VIEW view_order_summary AS
SELECT 
    OrderID,
    CustomerName,
    Product,
    Quantity,
    Price,
    Quantity * Price AS TotalAmount,
    OrderDate
FROM sample_sales_data;


--create an index

CREATE INDEX idx_order_id
ON sample_sales_data (OrderID);

----joins



CREATE TABLE product_details (
    Product VARCHAR(100),
    Category VARCHAR(50),
    Supplier VARCHAR(100)
);



INSERT INTO product_details (Product, Category, Supplier) VALUES
('Laptop', 'Electronics', 'TechCorp'),
('Mobile', 'Electronics', 'PhoneHouse'),
('Keyboard', 'Accessories', 'KeyCo'),
('Monitor', 'Electronics', 'DisplayWorld');


SELECT s.OrderID, s.CustomerName, s.Product, p.Category, p.Supplier, s.Quantity, s.Price
FROM sample_sales_data s
INNER JOIN product_details p
ON CAST(s.Product AS VARCHAR(100)) = p.Product;

SELECT s.OrderID, s.CustomerName, s.Product, p.Category, p.Supplier, s.Quantity, s.Price, s.OrderDate
FROM sample_sales_data s
LEFT JOIN product_details p
ON CAST(s.Product AS VARCHAR(100)) = p.Product;

SELECT s.OrderID, s.CustomerName, s.Product, s.Quantity, s.Price, s.OrderDate,
       p.Category, p.Supplier
FROM sample_sales_data s
RIGHT JOIN product_details p
ON CAST(s.Product AS VARCHAR(100)) = p.Product;



















