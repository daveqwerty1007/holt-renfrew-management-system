-- Create the database
CREATE DATABASE OnlineRetailDB;
USE OnlineRetailDB;

-- Create the Products table
CREATE TABLE Products (
    productID INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_level INT NOT NULL,
    category VARCHAR(50)
);

-- Create the Customers table
CREATE TABLE Customers (
    customerID INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    shipping_address TEXT,
    billing_address TEXT
);

-- Create the Orders table
CREATE TABLE Orders (
    orderID INT PRIMARY KEY AUTO_INCREMENT,
    customerID INT,
    order_date DATE NOT NULL,
    order_total DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20),
    FOREIGN KEY (customerID) REFERENCES Customers(customerID)
);

-- Create the OrderItems table
CREATE TABLE OrderItems (
    orderID INT,
    productID INT,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (orderID, productID),
    FOREIGN KEY (orderID) REFERENCES Orders(orderID),
    FOREIGN KEY (productID) REFERENCES Products(productID)
);

-- Create the Users table for secure login functionality
CREATE TABLE Users (
    userID INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL
);

-- Create the ShoppingCart table
CREATE TABLE ShoppingCart (
    cartID INT PRIMARY KEY AUTO_INCREMENT,
    customerID INT,
    FOREIGN KEY (customerID) REFERENCES Customers(customerID)
);

-- Create the CartItems table
CREATE TABLE CartItems (
    cartID INT,
    productID INT,
    quantity INT NOT NULL,
    PRIMARY KEY (cartID, productID),
    FOREIGN KEY (cartID) REFERENCES ShoppingCart(cartID),
    FOREIGN KEY (productID) REFERENCES Products(productID)
);

----------------------------------------------------------------------
-- Insert sample products
INSERT INTO Products (name, description, price, stock_level, category)
VALUES 
('Laptop', 'High performance laptop', 1000.00, 50, 'Electronics'),
('Smartphone', 'Latest model smartphone', 700.00, 100, 'Electronics'),
('Tablet', '10-inch display tablet', 300.00, 200, 'Electronics');

-- Insert sample customers
INSERT INTO Customers (name, email, shipping_address, billing_address)
VALUES 
('John Doe', 'john@example.com', '123 Maple Street', '123 Maple Street'),
('Jane Smith', 'jane@example.com', '456 Oak Street', '456 Oak Street');

-- Insert a sample order
INSERT INTO Orders (customerID, order_date, order_total, status)
VALUES 
(1, '2024-05-30', 1700.00, 'Processing');

-- Insert sample order items
INSERT INTO OrderItems (orderID, productID, quantity, unit_price)
VALUES 
(1, 1, 1, 1000.00),
(1, 2, 1, 700.00);

-- Insert sample user
-- Assume `hash_password` is a function that hashes the password securely
-- For this example, we're using a plain text password for simplicity
INSERT INTO Users (username, email, password_hash)
VALUES 
('john_doe', 'john_doe@example.com', 'hashed_password');

-- Insert a sample shopping cart
INSERT INTO ShoppingCart (customerID)
VALUES 
(1);

-- Insert sample cart items
INSERT INTO CartItems (cartID, productID, quantity)
VALUES 
(1, 1, 1),
(1, 2, 1);

