CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    RegistrationDate DATE
);

CREATE TABLE ShoppingCarts (
    CartID INT PRIMARY KEY,
    CustomerID INT,
    DateCreated DATE,
    LastUpdated DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    Status VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description TEXT,
    UnitPrice DECIMAL(10, 2),
    QuantityInStock INT
);


CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    SubTotal DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Inventory_Stock (
    StockID INT PRIMARY KEY,
    ProductID INT UNIQUE,
    QuantityInStock INT,
    ReorderLevel INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Customers VALUES
(1, 'Ahmed', 'Ali', 'ahmed@example.com', '2024-01-01'),
(2, 'Sara', 'Hassan', 'sara@example.com', '2024-01-10'),
(3, 'Omar', 'Saeed', 'omar@example.com', '2024-02-05'),
(4, 'Laila', 'Fahmy', 'laila@example.com', '2024-02-15'),
(5, 'Mona', 'Kamel', 'mona@example.com', '2024-03-01'),
(6, 'Youssef', 'Adel', 'youssef@example.com', '2024-03-10'),
(7, 'Hani', 'Farouk', 'hani@example.com', '2024-03-15'),
(8, 'Nora', 'Samir', 'nora@example.com', '2024-04-01'),
(9, 'Salma', 'Hassan', 'salma@example.com', '2024-04-10'),
(10, 'Ali', 'Mostafa', 'ali@example.com', '2024-04-20');

INSERT INTO Products VALUES
(101, 'Laptop', 'Gaming laptop', 2500.00, 15),
(102, 'Mouse', 'Wireless mouse', 150.00, 100),
(103, 'Keyboard', 'Mechanical keyboard', 300.00, 80),
(104, 'Monitor', '27-inch 4K Monitor', 1200.00, 30),
(105, 'Webcam', 'HD webcam', 250.00, 50),
(106, 'Headphones', 'Noise-cancelling', 500.00, 40),
(107, 'Charger', 'Laptop charger', 100.00, 60),
(108, 'USB Drive', '64GB', 50.00, 200),
(109, 'Tablet', '10-inch Android', 1200.00, 25),
(110, 'Speaker', 'Bluetooth speaker', 300.00, 35);

INSERT INTO Orders VALUES
(1001, 1, '2024-04-01', 2700.00, 'Shipped'),
(1002, 2, '2024-04-03', 350.00, 'Pending'),
(1003, 3, '2024-04-05', 1500.00, 'Delivered'),
(1004, 4, '2024-04-07', 750.00, 'Cancelled'),
(1005, 5, '2024-04-10', 500.00, 'Shipped'),
(1006, 6, '2024-04-12', 1350.00, 'Delivered'),
(1007, 7, '2024-04-13', 300.00, 'Pending'),
(1008, 8, '2024-04-14', 600.00, 'Shipped'),
(1009, 9, '2024-04-15', 900.00, 'Delivered'),
(1010, 10, '2024-04-16', 150.00, 'Pending');

INSERT INTO OrderItems VALUES
(1, 1001, 101, 1, 2500.00),
(2, 1001, 102, 2, 300.00),
(3, 1002, 103, 1, 300.00),
(4, 1003, 104, 1, 1200.00),
(5, 1003, 105, 1, 250.00),
(6, 1004, 106, 1, 500.00),
(7, 1005, 107, 2, 200.00),
(8, 1006, 108, 5, 250.00),
(9, 1006, 109, 1, 1200.00),
(10, 1007, 110, 1, 300.00);

INSERT INTO ShoppingCarts VALUES
(1, 1, '2024-03-28', '2024-04-01'),
(2, 2, '2024-03-30', '2024-04-02'),
(3, 3, '2024-04-01', '2024-04-03'),
(4, 4, '2024-04-03', '2024-04-05'),
(5, 5, '2024-04-05', '2024-04-07'),
(6, 6, '2024-04-07', '2024-04-10'),
(7, 7, '2024-04-08', '2024-04-11'),
(8, 8, '2024-04-09', '2024-04-12'),
(9, 9, '2024-04-10', '2024-04-13'),
(10, 10, '2024-04-11', '2024-04-14');


SELECT Orders.OrderID, FirstName, LastName, OrderDate, TotalAmount
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

SELECT Products.ProductName, SUM(OrderItems.Quantity) AS TotalSold
FROM OrderItems
JOIN Products ON OrderItems.ProductID = Products.ProductID
GROUP BY Products.ProductName;

SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice > 500;

SELECT COUNT(OrderID) AS TotalOrders
FROM Orders;