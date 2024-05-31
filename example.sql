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

