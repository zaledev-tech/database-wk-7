-- Create a new table that follows First Normal Form (1NF)
CREATE TABLE ProductDetail_1NF (
    OrderID INT,               -- Unique ID for the order
    CustomerName VARCHAR(100), -- Name of the customer
    Product VARCHAR(50)        -- Single product (atomic value)
);


INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),     -- Order 101, Product: Laptop
(101, 'John Doe', 'Mouse'),      -- Order 101, Product: Mouse
(102, 'Jane Smith', 'Tablet'),   -- Order 102, Product: Tablet
(102, 'Jane Smith', 'Keyboard'), -- Order 102, Product: Keyboard
(102, 'Jane Smith', 'Mouse'),    -- Order 102, Product: Mouse
(103, 'Emily Clark', 'Phone');   -- Order 103, Product: Phone









-- Table 1: Orders_2NF (order-level data only)
-- Stores OrderID and the CustomerName (removes partial dependency)
CREATE TABLE Orders_2NF (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Insert customers and their orders
INSERT INTO Orders_2NF (OrderID, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');


-- Table 2: OrderProducts_2NF (product-level data only)
-- Each row = one product in an order with its quantity
-- Foreign key links back to Orders_2NF
CREATE TABLE OrderProducts_2NF (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders_2NF(OrderID)
);

-- Insert product details per order
INSERT INTO OrderProducts_2NF (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
