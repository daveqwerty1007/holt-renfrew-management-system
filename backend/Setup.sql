CREATE TABLE Product (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    SellingPrice DECIMAL(10, 2) NOT NULL,
    GroupID INT,
    FOREIGN KEY (GroupID) REFERENCES `Group`(GroupID)
);

CREATE TABLE `Group` (
    GroupID INT AUTO_INCREMENT PRIMARY KEY,
    GroupName VARCHAR(255) NOT NULL
);

CREATE TABLE Delivery (
    DeliveryID INT AUTO_INCREMENT PRIMARY KEY,
    DeliveryMethod VARCHAR(255) NOT NULL,
    Cost DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Branch (
    BranchID INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Warehouse (
    WarehouseID INT AUTO_INCREMENT PRIMARY KEY,
    WarehouseLocation VARCHAR(255) NOT NULL,
    ProductName VARCHAR(255),
    NumberInStock INT
);

CREATE TABLE Customer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255),
    PhoneNumber VARCHAR(255),
    Address VARCHAR(255)
);

CREATE TABLE `Order` (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    OrderNumber VARCHAR(255) NOT NULL,
    ProductID INT,
    NumberOfItems INT,
    Price DECIMAL(10, 2),
    Branch VARCHAR(255),
    Date DATETIME,
    Time TIME,
    EmployeeID INT,
    CustomerID INT,
    Status VARCHAR(255),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Employee (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    KPI VARCHAR(255),
    Warehouse VARCHAR(255),
    OrderID INT,
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID)
);

CREATE TABLE Shipping (
    ShippingNumber INT AUTO_INCREMENT PRIMARY KEY,
    OrderNumber VARCHAR(255),
    ProductID INT,
    NumberOfItems INT,
    `From` VARCHAR(255),
    `To` VARCHAR(255),
    EmployeeID INT,
    CustomerID INT,
    Status VARCHAR(255),
    FOREIGN KEY (OrderNumber) REFERENCES `Order`(OrderNumber),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
