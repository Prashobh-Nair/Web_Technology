-- Enable foreign key support in SQLite
PRAGMA foreign_keys = ON;

-- 1. Drop tables if they exist (to avoid errors in case they exist already)
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Shippings;

-- 2. Create tables
CREATE TABLE Customers (
    CustomerID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT,
    City TEXT,
    RegisteredDate TEXT
);

CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY AUTOINCREMENT,
    CustomerID INTEGER,
    OrderDate TEXT,
    Amount REAL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Shippings (
    ShippingID INTEGER PRIMARY KEY AUTOINCREMENT,
    CustomerID INTEGER,
    ShippingAddress TEXT,
    ShippingDate TEXT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- 3. Insert data into Customers
INSERT INTO Customers (Name, City, RegisteredDate) VALUES
('Amit Shah', 'Ahmedabad', '2023-12-10'),
('Sara Khan', 'Mumbai', '2024-01-15'),
('John Mathew', 'Kochi', '2024-03-22');

-- 4. Insert data into Orders
INSERT INTO Orders (CustomerID, OrderDate, Amount) VALUES
(1, '2024-04-01', 2500.50),
(1, '2024-04-15', 1500.00),
(2, '2024-04-10', 3200.75),
(3, '2024-04-18', 2100.00);

-- 5. Insert data into Shippings
INSERT INTO Shippings (CustomerID, ShippingAddress, ShippingDate) VALUES
(1, '123 Street, Ahmedabad', '2024-04-02'),
(2, '456 Avenue, Mumbai', '2024-04-12'),
(3, '789 Road, Kochi', '2024-04-20');

-- 6. Aggregate Functions
SELECT COUNT(*) AS TotalCustomers FROM Customers;
SELECT SUM(Amount) AS TotalSales FROM Orders;
SELECT AVG(Amount) AS AvgOrderAmount FROM Orders;

-- 7. Date-Time Functions
SELECT DATE('now') AS Today;
SELECT Name, (JULIANDAY('now') - JULIANDAY(RegisteredDate)) AS DaysSinceRegistration FROM Customers;

-- 8. Numeric Functions
SELECT OrderID, Amount, ROUND(Amount) AS RoundedAmount FROM Orders;
SELECT Amount, CEIL(Amount) AS CeilAmount, FLOOR(Amount) AS FloorAmount FROM Orders;

-- 9. JOIN Operations
-- Inner Join: Customer with Orders
SELECT o.OrderID, c.Name, o.Amount, o.OrderDate
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID;

-- Left Join: All Customers with or without Orders
SELECT c.Name, o.OrderID, o.Amount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- Inner Join: Customer with Shippings
SELECT s.ShippingID, c.Name, s.ShippingAddress, s.ShippingDate
FROM Shippings s
INNER JOIN Customers c ON s.CustomerID = c.CustomerID;
