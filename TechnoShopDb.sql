--CREATE DATABASE CompyuterShopDb
--use CompyuterShopDb

--Models cədvəli yaratma və doldurma
CREATE TABLE Models
(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
);
INSERT INTO Models (Name)
VALUES
('iPhone Series'),
('Samsung Galaxy Series'),
('Redmi Series'),
('PlayStation Series'),
('Xbox Series'),
('iPhone 15 Series'),
('Samsung S24 Series'),
('Xiaomi 13 Series'),
('Huawei P60 Series'),
('OnePlus 12 Series'),
('Dell XPS Series'),
('MacBook Pro Series'),
('HP Spectre Series'),
('Lenovo ThinkPad Series'),
('Asus ROG Series'),
('Nintendo Switch Series'),
('Steam Deck Series'),
('Oculus Quest Series'),
('Meta Quest Series'),
('PS VR2 Series'),
('Canon EOS Series'),
('Nikon Z7 Series'),
('Sony A7 Series'),
('Fujifilm X-T5 Series'),
('Panasonic Lumix Series');


--Categories cədvəli yaratma və doldurma
CREATE TABLE Categories
(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
);
INSERT INTO Categories (Name)
VALUES
('Smartphone'),
('Laptop'),
('Gaming Console'),
('Headphones'),
('Tablet');

--Products cədvəli yaratma və doldurma
CREATE TABLE Products
(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	CategoryId INT NOT NULL,
	ModelId INT NOT NULL,
	CONSTRAINT Fk_Produts_Categories FOREIGN KEY (CategoryId) REFERENCES Categories(Id),
	CONSTRAINT Fk_Produts_Models FOREIGN KEY (ModelId) REFERENCES Models(Id),
	Name VARCHAR(50) NOT NULL,
	Description VARCHAR(100) NOT NULL,
	StockCount INT NOT NULL
);
ALTER TABLE Products
ADD Price DECIMAL(10,2) NOT NULL DEFAULT 0;

INSERT INTO Products (CategoryId, ModelId, Name, Description, StockCount)
VALUES
(1, 6, 'iPhone 15', 'Apple latest smartphone', 20),
(1, 7, 'Samsung Galaxy S24', 'Samsung flagship smartphone', 25),
(1, 8, 'Xiaomi 13', 'High-end Xiaomi smartphone', 30),
(1, 9, 'Huawei P60', 'Huawei premium smartphone', 18),
(1, 10, 'OnePlus 12', 'OnePlus flagship smartphone', 22),
(2, 11, 'Dell XPS 15', 'High-performance laptop', 15),
(2, 12, 'MacBook Pro 16', 'Apple laptop for professionals', 10),
(2, 13, 'HP Spectre x360', 'Convertible laptop', 12),
(2, 14, 'Lenovo ThinkPad X1', 'Business laptop', 20),
(2, 15, 'Asus ROG Zephyrus', 'Gaming laptop', 8),
(3, 16, 'Nintendo Switch', 'Portable gaming console', 15),
(3, 17, 'Steam Deck', 'Handheld PC gaming', 10),
(3, 18, 'Oculus Quest 2', 'VR headset', 12),
(3, 19, 'Meta Quest 3', 'VR headset new', 8),
(3, 20, 'PS VR2', 'PlayStation VR headset', 5),
(4, 21, 'Canon EOS R6', 'Full-frame mirrorless camera', 7),
(4, 22, 'Nikon Z7 II', 'Professional mirrorless camera', 6),
(4, 23, 'Sony A7 IV', 'High-end camera', 9),
(4, 24, 'Fujifilm X-T5', 'Mirrorless camera', 10),
(4, 25, 'Panasonic Lumix S5', 'Mirrorless camera', 8);


UPDATE Products SET Price = 1299.99 WHERE Id = 1;
UPDATE Products SET Price = 999.50  WHERE Id = 2;
UPDATE Products SET Price = 249.90  WHERE Id = 3;
UPDATE Products SET Price = 499.00  WHERE Id = 4;
UPDATE Products SET Price = 479.00  WHERE Id = 5;

--Employees cədvəli yaratma və doldurma
CREATE TABLE Employees
(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	Surname VARCHAR(50) NOT NULL,
	FatherName VARCHAR(50) NOT NULL,
	Position NVARCHAR(50)
);
ALTER TABLE Employees
ADD BranchId INT NOT NULL DEFAULT 1;
ALTER TABLE Employees
ADD CONSTRAINT FK_Employees_Branches FOREIGN KEY (BranchId) REFERENCES Branches(Id);
INSERT INTO Employees (Name, Surname, FatherName, Position)
VALUES
('Ülvi', 'Abbaslı', 'Fərhad', 'Sales Manager'),
('Elçin', 'Qasımov', 'Rəşad', 'Sales Specialist'),
('Nicat', 'Bağırov', 'Tural', 'Sales Executive'),
('Aysel', 'Hüseynova', 'Rasim', 'Sales Specialist'),
('Rəşad', 'Məmmədov', 'Sərdar', 'Sales Manager')
UPDATE Employees SET BranchId = 1 WHERE Id = 1; 
UPDATE Employees SET BranchId = 2 WHERE Id = 2; 
UPDATE Employees SET BranchId = 3 WHERE Id = 3; 
UPDATE Employees SET BranchId = 4 WHERE Id = 4; 
UPDATE Employees SET BranchId = 5 WHERE Id = 5; 
INSERT INTO Employees (Name, Surname, FatherName, Position, BranchId)
VALUES
('Elnur', 'Hüseynov', 'Rauf', 'Sales Specialist', 1),
('Leyla', 'Əliyeva', 'Ramin', 'Sales Executive', 2),
('Orxan', 'Məmmədov', 'Tural', 'Sales Specialist', 3),
('Nigar', 'Quliyeva', 'Rəşad', 'Sales Executive', 4),
('Tural', 'Abbasov', 'Elçin', 'Sales Specialist', 5),
('Səid', 'Rəhimov', 'Murad', 'Sales Specialist', 1),
('Aygün', 'Hüseynova', 'Rasim', 'Sales Executive', 2),
('Murad', 'Cavadov', 'Elşən', 'Sales Specialist', 3),
('Samir', 'Məmmədov', 'Tural', 'Sales Executive', 4),
('Kamran', 'Əliyev', 'Ramin', 'Sales Specialist', 5),
('Sevda', 'Quliyeva', 'Rəşad', 'Sales Specialist', 1),
('Farid', 'Hüseynov', 'Rauf', 'Sales Executive', 2),
('Vüsal', 'Abbasov', 'Orxan', 'Sales Specialist', 3),
('Aynur', 'Əliyeva', 'Rəşad', 'Sales Executive', 4),
('Emin', 'Məmmədov', 'Murad', 'Sales Specialist', 5),
('Rufat', 'Cavadov', 'Tural', 'Sales Executive', 1),
('Aysu', 'Hüseynova', 'Elçin', 'Sales Specialist', 2),
('Nijat', 'Əliyev', 'Ramin', 'Sales Executive', 3),
('Leyli', 'Quliyeva', 'Rəşad', 'Sales Specialist', 4),
('Elvin', 'Hüseynov', 'Rauf', 'Sales Executive', 5);
ALTER TABLE Employees
ADD Age INT NOT NULL DEFAULT 18;
UPDATE Employees
SET Age = 18 + CAST(RAND(CHECKSUM(NEWID())) * (45-18 + 1) AS INT);


--Sales cədvəli yaratma və doldurma
CREATE TABLE Sales
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeId INT NOT NULL,
    ProductId INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    UnitPrice DECIMAL(10,2) NOT NULL CHECK (UnitPrice >= 0),
    SaleDate DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_Sales_Employees FOREIGN KEY(EmployeeId) REFERENCES Employees(Id),
    CONSTRAINT FK_Sales_Products FOREIGN KEY(ProductId) REFERENCES Products(Id)
);
INSERT INTO Sales (EmployeeId, ProductId, Quantity, UnitPrice)
VALUES
(1, 1, 2, 1299.99),
(1, 2, 1, 995.50),
(2, 3, 1, 249.90),
(2, 4, 2, 499.00),
(2, 5, 1, 479.00),
(3, 1, 1, 1305.00),
(3, 3, 2, 248.50),
(4, 2, 1, 1000.00),
(4, 4, 1, 502.00),
(4, 5, 3, 475.00),
(5, 1, 1, 1298.00),
(5, 2, 2, 998.00),
(5, 3, 1, 250.50),
(5, 4, 1, 500.00),
(5, 5, 1, 480.00);


--Filiallar
CREATE TABLE Branches
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Location NVARCHAR(100)
);
INSERT INTO Branches (Name, Location)
VALUES
('Baku Main Branch', 'Baku, Nizami St. 12'),
('Ganja Branch', 'Ganja, Istiglaliyyet St. 45'),
('Sumqayit Branch', 'Sumqayit, Heydar Aliyev St. 7'),
('Lankaran Branch', 'Lankaran, H. Zardabi St. 23'),
('Shaki Branch', 'Shaki, Rashid Behbudov St. 10');

--Filiala uygun mehsul stoklari
CREATE TABLE ProductStocks
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    ProductId INT NOT NULL,
    BranchId INT NOT NULL,
    StockCount INT NOT NULL CHECK (StockCount >= 0),
    CONSTRAINT FK_ProductStocks_Products FOREIGN KEY(ProductId) REFERENCES Products(Id),
    CONSTRAINT FK_ProductStocks_Branches FOREIGN KEY(BranchId) REFERENCES Branches(Id)
);
INSERT INTO ProductStocks (ProductId, BranchId, StockCount)
VALUES
(1, 1, 5),(1, 2, 5),(1, 3, 5),(1, 4, 3),(1, 5, 2),
(2, 1, 8),(2, 2, 5),(2, 3, 5),(2, 4, 4),(2, 5, 3),
(3, 1, 10),(3, 2, 5),(3, 3, 5),(3, 4, 5),(3, 5, 5),
(4, 1, 5),(4, 2, 4),(4, 3, 3),(4, 4, 3),(4, 5, 3),
(5, 1, 6),(5, 2, 5),(5, 3, 4),(5, 4, 4),(5, 5, 3),
--(6, 1, 4),(6, 2, 3),(6, 3, 3),(6, 4, 3),(6, 5, 2),
--(7, 1, 2),(7, 2, 2),(7, 3, 2),(7, 4, 2),(7, 5, 2),
--(8, 1, 3),(8, 2, 3),(8, 3, 3),(8, 4, 2),(8, 5, 1),
--(9, 1, 5),(9, 2, 5),(9, 3, 4),(9, 4, 3),(9, 5, 3),
--(10,1, 2),(10,2,2),(10,3,2),(10,4,1),(10,5,1),
--(11,1,5),(11,2,3),(11,3,3),(11,4,2),(11,5,2),
--(12,1,2),(12,2,2),(12,3,2),(12,4,2),(12,5,2),
(13,1,3),(13,2,3),(13,3,3),(13,4,2),(13,5,1),
(14,1,5),(14,2,5),(14,3,4),(14,4,3),(14,5,3),
(15,1,2),(15,2,2),(15,3,2),(15,4,1),(15,5,1),
(16,1,5),(16,2,3),(16,3,3),(16,4,2),(16,5,2),
(17,1,2),(17,2,2),(17,3,2),(17,4,2),(17,5,2),
(18,1,3),(18,2,3),(18,3,3),(18,4,2),(18,5,1),
(19,1,2),(19,2,2),(19,3,2),(19,4,1),(19,5,1),
(20,1,1),(20,2,1),(20,3,1),(20,4,1),(20,5,1),
(21, 1, 2),(21, 2, 2),(21, 3, 1),(21, 4, 1),(21, 5, 1),
(22, 1, 1),(22, 2, 1),(22, 3, 1),(22, 4, 1),(22, 5, 2),
(23, 1, 2),(23, 2, 2),(23, 3, 2),(23, 4, 2),(23, 5, 1),
(24, 1, 2),(24, 2, 2),(24, 3, 2),(24, 4, 2),(24, 5, 2),
(25, 1, 1),(25, 2, 1),(25, 3, 2),(25, 4, 2),(25, 5, 2),
(26, 1, 3),(26, 2, 3),(26, 3, 3),(26, 4, 2),(26, 5, 2),
(27, 1, 2),(27, 2, 2),(27, 3, 2),(27, 4, 2),(27, 5, 1),
(28, 1, 4),(28, 2, 3),(28, 3, 3),(28, 4, 2),(28, 5, 2),
(29, 1, 2),(29, 2, 2),(29, 3, 1),(29, 4, 1),(29, 5, 1),
(30, 1, 3),(30, 2, 2),(30, 3, 2),(30, 4, 2),(30, 5, 1),
(31, 1, 2),(31, 2, 2),(31, 3, 2),(31, 4, 1),(31, 5, 1),
(32, 1, 1),(32, 2, 1),(32, 3, 1),(32, 4, 1),(32, 5, 1);


CREATE TRIGGER TRG_ProductStocks_InsertUpdate
ON ProductStocks
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Əgər filial stoku məhsulun ümumi stokundan böyükdürsə
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Products p ON i.ProductId = p.Id
        WHERE i.StockCount > p.StockCount
    )
    BEGIN
        RAISERROR('Filial stoku məhsulun ümumi stokundan böyük ola bilməz!', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;

--Butun tablelere baxmaq
SELECT * FROM Categories;
SELECT * FROM Models;
SELECT * FROM Products;
SELECT * FROM ProductStocks;
SELECT * FROM Branches;
SELECT * FROM Employees;
SELECT * FROM Sales;

--Məhsullara kateqoriyaları ilə birgə baxmaq üçün sorğu
SELECT 
    p.Id AS ProductId,
    p.Name AS ProductName,
    p.Description,
    p.StockCount,
    c.Name AS CategoryName
FROM Products p
LEFT JOIN Categories c ON p.CategoryId = c.Id
ORDER BY c.Name, p.Name;

--Məhsullara modeller ilə birgə baxmaq üçün sorğu
SELECT 
    p.Id AS ProductId,
    p.Name AS ProductName,
    p.Description,
    p.StockCount,
    m.Name AS ModelName
FROM Products p
LEFT JOIN Models m ON p.ModelId = m.Id
ORDER BY m.Name, p.Name;
