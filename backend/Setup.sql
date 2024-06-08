CREATE TABLE Brand (
    BrandID INT PRIMARY KEY,
    BrandName VARCHAR(100)
);

CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2),
    BrandID INT,
    FOREIGN KEY (BrandID) REFERENCES Brand(BrandID)
);

CREATE TABLE Branch (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100),
    Location VARCHAR(255)
);

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(255)
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    BranchID INT,
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

CREATE TABLE `Order` (
    OrderNum INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME,
    EmployeeID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE OrderDetails (
    OrderNum INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderNum) REFERENCES `Order`(OrderNum),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    PRIMARY KEY (OrderNum, ProductID)
);

CREATE TABLE Delivery (
    DeliveryMethodID INT PRIMARY KEY,
    MethodName VARCHAR(100),
    Cost DECIMAL(10, 2)
);

CREATE TABLE Shipping (
    ShippingID INT PRIMARY KEY,
    OrderNum INT,
    DeliveryMethodID INT,
    CarrierName VARCHAR(100),
    ShipDate DATETIME,
    FOREIGN KEY (OrderNum) REFERENCES `Order`(OrderNum),
    FOREIGN KEY (DeliveryMethodID) REFERENCES Delivery(DeliveryMethodID)
);
