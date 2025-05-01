-- Question 1 --

-- Original table -- 

CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(100),
    Products VARCHAR(255)
);

INSERT INTO ProductDetail (OrderID, CustomerName, Products) VALUES
(101, 'John Doe', 'Laptop, Mouse'),
(102, 'Jane Smith', 'Tablet, Keyboard, Mouse'),
(103, 'Emily Clark', 'Phone');

-- 1NF Normalized --

-- Orders Table -- 

CREATE TABLE Orders (
  OrderID INT, 
  CustomerName VARCHAR(100),
);

-- OrderProducts Table -- 
Create TABLE OrderProducts (
  OrderID INT, 
  Product VARCHAR(100)
  PRIMARY KEY (OrderID, Product),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- SQL QUERY -- 

--Orders Table -- 
INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT
    OrderID,
    CustomerName
FROM
    ProductDetail;

-- OrderProducts Table 

-- For OrderID 101 (John Doe)
INSERT INTO OrderProducts (OrderID, Product)
VALUES
(101, 'Laptop'),
(101, 'Mouse');

-- For OrderID 102 (Jane Smith)
INSERT INTO OrderProducts (OrderID, Product)
VALUES
(102, 'Tablet'),
(102, 'Keyboard'),
(102, 'Mouse');

-- For OrderID 103 (Emily Clark)
INSERT INTO OrderProducts (OrderID, Product)
VALUES
(103, 'Phone');



-- Question 2 -- 

-- Original Table -- 

CREATE TABLE OrderDetails (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT
);

INSERT INTO OrderDetails (OrderID, CustomerName, Product, Quantity) VALUES
(101, 'John Doe', 'Laptop', 2),
(101, 'John Doe', 'Mouse', 1),
(102, 'Jane Smith', 'Tablet', 3),
(102, 'Jane Smith', 'Keyboard', 1),
(102, 'Jane Smith', 'Mouse', 2),
(103, 'Emily Clark', 'Phone', 1);

-- 2NF Query -- 

-- Orders table -- 
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY, 
  CustomerName VARCHAR(100)
);

INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT
    OrderID,
    CustomerName
FROM
    OrderDetails;


CREATE TABLE OrderItems (
  OrderID INT, 
  Product VARCHAR(100),
  Quantity INT,
  PRIMARY KEY (OrderID, Product),
  FOREIGN KEY(OrderID) REFERENCES Orders(OrderID)
  );

INSERT INTO OrderItems (OrderID, Product, Quantity)
SELECT
    OrderID,
    Product,
    Quantity
FROM
    OrderDetails;

