SELECT OrderID, CustomerName, TRIM(product) AS Product
FROM ProductDetail,
     JSON_TABLE(
         CONCAT('["', REPLACE(Products, ', ', '","'), '"]'),
         '$[*]' COLUMNS (product VARCHAR(50) PATH '$')
     ) AS jt;



-- Step 1: Create Orders table
CREATE TABLE Orders AS
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

-- Step 2: Create OrderItems table
CREATE TABLE OrderItems AS
SELECT OrderID, Product, Quantity
FROM OrderDetails;
