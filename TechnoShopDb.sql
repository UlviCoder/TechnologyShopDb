--CREATE DATABASE CompyuterShopDb
--use CompyuterShopDb

--Brands cədvəli yaratma və doldurma
CREATE TABLE Brands
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL UNIQUE
);
INSERT INTO Brands (Name)
VALUES
('Apple'),
('Samsung'),
('Xiaomi'),
('Sony'),
('Microsoft'),
('Huawei'),
('OnePlus'),
('Dell'),
('HP'),
('Lenovo'),
('Asus'),
('Nintendo'),
('Valve'),
('Meta'),
('Canon'),
('Nikon'),
('Fujifilm'),
('Panasonic');

--Models cədvəli yaratma və doldurma
CREATE TABLE Models
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    BrandId INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    CONSTRAINT FK_Models_Brands FOREIGN KEY (BrandId) REFERENCES Brands(Id)
);
-- Apple
INSERT INTO Models (BrandId, Name) VALUES
(1,'iPhone 14 Pro'),
(1,'iPhone 14'),
(1,'iPhone 13 Pro'),
(1,'iPhone 13'),
(1,'MacBook Pro 16'),
(1,'MacBook Air M2');

-- Samsung
INSERT INTO Models (BrandId, Name) VALUES
(2,'Samsung Galaxy S23'),
(2,'Samsung Galaxy S23 Ultra'),
(2,'Samsung Galaxy S22'),
(2,'Samsung Galaxy Note 20');

-- Xiaomi
INSERT INTO Models (BrandId, Name) VALUES
(3,'Redmi Note 12'),
(3,'Xiaomi 13'),
(3,'Xiaomi 12'),
(3,'Mi 11');

-- Sony / PlayStation
INSERT INTO Models (BrandId, Name) VALUES
(4,'PlayStation 5'),
(4,'PlayStation 4 Pro'),
(4,'PS VR2');

-- Microsoft / Xbox
INSERT INTO Models (BrandId, Name) VALUES
(5,'Xbox Series X'),
(5,'Xbox Series S'),
(5,'Xbox One X');

-- OnePlus
INSERT INTO Models (BrandId, Name) VALUES
(6,'OnePlus 12'),
(6,'OnePlus 11'),
(6,'OnePlus 10 Pro');

-- Huawei
INSERT INTO Models (BrandId, Name) VALUES
(7,'Huawei P60'),
(7,'Huawei P50 Pro'),
(7,'Huawei Mate 40');

-- Dell
INSERT INTO Models (BrandId, Name) VALUES
(8,'Dell XPS 15'),
(8,'Dell XPS 13'),
(8,'Dell Inspiron 16');

-- HP
INSERT INTO Models (BrandId, Name) VALUES
(9,'HP Spectre x360'),
(9,'HP Envy 13'),
(9,'HP Pavilion 15');

-- Lenovo
INSERT INTO Models (BrandId, Name) VALUES
(10,'Lenovo ThinkPad X1'),
(10,'Lenovo Legion 7'),
(10,'Lenovo Yoga 9i');

-- Asus
INSERT INTO Models (BrandId, Name) VALUES
(11,'Asus ROG Zephyrus'),
(11,'Asus ZenBook 14'),
(11,'Asus TUF Gaming F15');

-- Nintendo / Meta / Oculus / Steam etc.
INSERT INTO Models (BrandId, Name) VALUES
(12,'Nintendo Switch'),
(12,'Steam Deck'),
(12,'Oculus Quest 2'),
(12,'Meta Quest 3'),
(12,'PS VR2');

-- Canon / Nikon / Sony Cameras
INSERT INTO Models (BrandId, Name) VALUES
(13,'Canon EOS R6'),
(13,'Canon EOS 5D Mark IV'),
(13,'Nikon Z7 II'),
(13,'Nikon D850'),
(13,'Sony A7 IV'),
(13,'Sony A7 III'),
(13,'Fujifilm X-T5'),
(13,'Panasonic Lumix S5');

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
    Name VARCHAR(100) NOT NULL,
    Description VARCHAR(250) NOT NULL,
    StockCount INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_Products_Categories FOREIGN KEY (CategoryId) REFERENCES Categories(Id),
    CONSTRAINT FK_Products_Models FOREIGN KEY (ModelId) REFERENCES Models(Id)
);
INSERT INTO Products (CategoryId, ModelId, Name, Description, StockCount, Price) VALUES
(1,1,'iPhone 14 Pro','Apple flagship smartphone',25,1299.99),
(1,2,'iPhone 15','Apple latest smartphone',20,1399.99),
(1,5,'Samsung Galaxy S23','Samsung premium smartphone',30,999.50),
(1,6,'Samsung Galaxy S24','Samsung latest smartphone',25,1099.99),
(1,3,'Redmi Note 12','Affordable Xiaomi smartphone',50,249.90),
(1,4,'Xiaomi 13','High-end Xiaomi smartphone',30,499.00),
(2,7,'Dell XPS 15','High-performance laptop',15,1499.00),
(2,8,'Dell XPS 13','Compact laptop',12,1299.00),
(2,9,'HP Spectre x360','Convertible laptop',10,1199.00),
(2,10,'Lenovo ThinkPad X1','Business laptop',20,1399.00),
(3,11,'PlayStation 5','Sony gaming console',15,499.00),
(3,12,'PS VR2','PlayStation VR headset',5,399.00),
(3,5,'Xbox Series X','Microsoft gaming console',10,479.00),
(3,6,'Xbox Series S','Microsoft small console',8,399.00),
(1,13,'OnePlus 12','OnePlus flagship smartphone',22,699.00),
(1,14,'OnePlus 11','OnePlus previous smartphone',18,599.00),
(4,15,'Canon EOS R6','Full-frame mirrorless camera',7,2499.00),
(4,16,'Canon EOS 5D Mark IV','Pro DSLR camera',5,2299.00),
(4,17,'Nikon Z7 II','Professional mirrorless camera',6,2399.00),
(4,18,'Nikon D850','Pro DSLR camera',4,2199.00),
(4,19,'Sony A7 IV','High-end camera',9,2499.00),
(4,20,'Sony A7 III','Camera for pros',8,1999.00),
(3,21,'Nintendo Switch','Portable gaming console',15,299.00),
(3,22,'Steam Deck','Handheld PC gaming',10,399.00),
(5,23,'Oculus Quest 2','VR headset',12,299.00),
(5,24,'Meta Quest 3','VR headset new',8,399.00);



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
ADD Salary DECIMAL(10,2) DEFAULT 1000;  

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
(6, 1, 4),(6, 2, 3),(6, 3, 3),(6, 4, 3),(6, 5, 2),
(7, 1, 2),(7, 2, 2),(7, 3, 2),(7, 4, 2),(7, 5, 2),
(8, 1, 3),(8, 2, 3),(8, 3, 3),(8, 4, 2),(8, 5, 1),
(9, 1, 5),(9, 2, 5),(9, 3, 4),(9, 4, 3),(9, 5, 3),
(10,1, 2),(10,2,2),(10,3,2),(10,4,1),(10,5,1),
(11,1,5),(11,2,3),(11,3,3),(11,4,2),(11,5,2),
(12,1,2),(12,2,2),(12,3,2),(12,4,2),(12,5,2),
(1, 1, 5),(1, 2, 5),(1, 3, 5),(1, 4, 3),(1, 5, 2),
(2, 1, 8),(2, 2, 5),(2, 3, 5),(2, 4, 4),(2, 5, 3),
(3, 1, 10),(3, 2, 5),(3, 3, 5),(3, 4, 5),(3, 5, 5),
(4, 1, 5),(4, 2, 4),(4, 3, 3),(4, 4, 3),(4, 5, 3),
(5, 1, 6),(5, 2, 5),(5, 3, 4),(5, 4, 4),(5, 5, 3),
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

--Adi Murad olan isci melumatlari 
SELECT *
FROM Employees
WHERE Name = 'Murad';

--Yaşı 25-dən kiçik olan işçilərin siyahısına baxmaq üçün sorğu
SELECT *
FROM Employees
WHERE Age < 25
ORDER BY Age, Name; --prostu siralamaq ucun kicik yasdan boyuye, ad elifba sirasi

--Hər modeldən neçə məhsulun olduğunu tapın
SELECT 
    Models.Id AS ModelId,
    Models.Name AS ModelName,
    COUNT(Products.Id) AS ProductCount
FROM Models
LEFT JOIN Products ON Products.ModelId = Models.Id
GROUP BY Models.Id, Models.Name
ORDER BY ProductCount DESC;

--Hər markada hər modelin neçə məhsulu olduğunu tapın
SELECT 
    b.Name AS Brand,
    m.Name AS Model,
    COUNT(p.Id) AS ProductCount
FROM Brands b
JOIN Models m ON m.BrandId = b.Id
LEFT JOIN Products p ON p.ModelId = m.Id
GROUP BY b.Name, m.Name
ORDER BY b.Name, m.Name;

--Hər filial üzrə aylıq satış məbləğinin hesablanması
SELECT 
    br.Name AS BranchName,
    YEAR(s.SaleDate) AS SaleYear,
    MONTH(s.SaleDate) AS SaleMonth,
    SUM(s.UnitPrice * s.Quantity) AS MonthlyRevenue
FROM Sales s
JOIN Employees e ON s.EmployeeId = e.Id
JOIN Branches br ON e.BranchId = br.Id
GROUP BY br.Name, YEAR(s.SaleDate), MONTH(s.SaleDate)
ORDER BY br.Name, SaleYear, SaleMonth;

--Ay ərzində ən çox satış olunan model
WITH MonthlySales AS
(
    SELECT 
        m.Name AS ModelName,
        YEAR(s.SaleDate) AS SaleYear,
        MONTH(s.SaleDate) AS SaleMonth,
        SUM(s.Quantity) AS TotalSold
    FROM Sales s
    JOIN Products p ON s.ProductId = p.Id
    JOIN Models m ON p.ModelId = m.Id
    GROUP BY m.Name, YEAR(s.SaleDate), MONTH(s.SaleDate)
)
SELECT *
FROM MonthlySales ms
WHERE TotalSold = (
    SELECT MAX(TotalSold)
    FROM MonthlySales ms2
    WHERE ms2.SaleYear = ms.SaleYear AND ms2.SaleMonth = ms.SaleMonth
)
ORDER BY SaleYear, SaleMonth;




--Ay ərzində ən az satış edən işçi
WITH EmployeeMonthlySales AS
(
    SELECT 
        e.Id AS EmployeeId,
        e.Name + ' ' + e.Surname AS EmployeeName,
        YEAR(s.SaleDate) AS SaleYear,
        MONTH(s.SaleDate) AS SaleMonth,
        SUM(s.UnitPrice * s.Quantity) AS TotalRevenue
    FROM Sales s
    JOIN Employees e ON s.EmployeeId = e.Id
    GROUP BY e.Id, e.Name, e.Surname, YEAR(s.SaleDate), MONTH(s.SaleDate)
)
SELECT *
FROM EmployeeMonthlySales ems
WHERE TotalRevenue = (
    SELECT MIN(TotalRevenue)
    FROM EmployeeMonthlySales ems2
    WHERE ems2.SaleYear = ems.SaleYear AND ems2.SaleMonth = ems.SaleMonth
)
ORDER BY SaleYear, SaleMonth;




--Ay ərzində 3000-dən çox satış edən işçilərin siyahısı
SELECT 
    e.Id AS EmployeeId,
    e.Name + ' ' + e.Surname AS EmployeeName,
    YEAR(s.SaleDate) AS SaleYear,
    MONTH(s.SaleDate) AS SaleMonth,
    SUM(s.UnitPrice * s.Quantity) AS TotalRevenue
FROM Sales s
JOIN Employees e ON s.EmployeeId = e.Id
GROUP BY e.Id, e.Name, e.Surname, YEAR(s.SaleDate), MONTH(s.SaleDate)
HAVING SUM(s.UnitPrice * s.Quantity) > 3000
ORDER BY SaleYear, SaleMonth, TotalRevenue DESC;

--İşcilərin ad soyad və ata adlarını eyni xanada göstərən sorğu 
SELECT 
    Name + ' ' + Surname + ' ' + FatherName AS FullName
FROM Employees;

--Məhsulun ad və qarşısında adın uzunluğunu göstərən sorğu 
SELECT 
    Name AS ProductName,
    LEN(Name) AS NameLength
FROM Products;

--Ən bahalı Məhsulu göstərən sorğu 
SELECT *
FROM Products
WHERE Price = (SELECT MAX(Price) FROM Products);

-- Ən bahalı və ən ucuz məhsulu eyni nəticədə göstərmək
SELECT 'Expensive' AS Type, *
FROM Products
WHERE Price = (SELECT MAX(Price) FROM Products)
UNION ALL
SELECT 'Cheap' AS Type, *
FROM Products
WHERE Price = (SELECT MIN(Price) FROM Products);

--Məhsulları qiymətinə görə kateqoriyalara bölme
SELECT 
    Name AS ProductName,
    Price,
    CASE 
        WHEN Price < 1000 THEN 'Münasib'
        WHEN Price BETWEEN 1000 AND 2400 THEN 'Orta qiymətli'
        ELSE 'Baha'
    END AS PriceCategory
FROM Products
ORDER BY Price DESC;

--Cari ayda olan bütün satışların cəmi
SELECT SUM(UnitPrice * Quantity) AS TotalRevenueThisMonth
FROM Sales
WHERE YEAR(SaleDate) = YEAR(GETDATE())
  AND MONTH(SaleDate) = MONTH(GETDATE());


--Cari ayda ən çox satış edən işçinin məlumatlarını çıxaran sorğu
WITH EmployeeMonthlySales AS
(
    SELECT 
        e.Id,
        e.Name,
        e.Surname,
        e.FatherName,
        SUM(s.Quantity) AS TotalSold
    FROM Sales s
    JOIN Employees e ON s.EmployeeId = e.Id
    WHERE YEAR(s.SaleDate) = YEAR(GETDATE())
      AND MONTH(s.SaleDate) = MONTH(GETDATE())
    GROUP BY e.Id, e.Name, e.Surname, e.FatherName
)
SELECT *
FROM EmployeeMonthlySales
WHERE TotalSold = (SELECT MAX(TotalSold) FROM EmployeeMonthlySales);

--Cari ayda ən çox qazanc gətirən işçinin məlumatlarını çıxaran sorğu 
WITH EmployeeRevenue AS
(
    SELECT 
        e.Id,
        e.Name,
        e.Surname,
        e.FatherName,
        e.Salary,
        SUM(s.UnitPrice * s.Quantity) AS TotalRevenue
    FROM Sales s
    JOIN Employees e ON s.EmployeeId = e.Id
    WHERE YEAR(s.SaleDate) = YEAR(GETDATE())
      AND MONTH(s.SaleDate) = MONTH(GETDATE())
    GROUP BY e.Id, e.Name, e.Surname, e.FatherName, e.Salary
)
SELECT *
FROM EmployeeRevenue
WHERE TotalRevenue = (SELECT MAX(TotalRevenue) FROM EmployeeRevenue);


--Ən çox satış edən işçinin cari ay maaşını 50% artırın

UPDATE Employees
SET Salary = 1000
WHERE Salary IS NULL;
WITH EmployeeMonthlySales AS
(
    SELECT 
        e.Id,
        SUM(s.Quantity) AS TotalSold
    FROM Sales s
    JOIN Employees e ON s.EmployeeId = e.Id
    WHERE YEAR(s.SaleDate) = YEAR(GETDATE())
      AND MONTH(s.SaleDate) = MONTH(GETDATE())
    GROUP BY e.Id
)
UPDATE e
SET e.Salary = e.Salary * 1.5
FROM Employees e
JOIN EmployeeMonthlySales ems ON e.Id = ems.Id
WHERE ems.TotalSold = (
    SELECT MAX(TotalSold) FROM EmployeeMonthlySales
);


--Imenni o isci
WITH EmployeeRevenue AS
(
    SELECT 
        e.Id,
        e.Name,
        e.Surname,
        e.FatherName,
        e.Salary,
        SUM(s.UnitPrice * s.Quantity) AS TotalRevenue
    FROM Sales s
    JOIN Employees e ON s.EmployeeId = e.Id
    WHERE YEAR(s.SaleDate) = YEAR(GETDATE())
      AND MONTH(s.SaleDate) = MONTH(GETDATE())
    GROUP BY e.Id, e.Name, e.Surname, e.FatherName, e.Salary
)
SELECT *
FROM EmployeeRevenue
WHERE TotalRevenue = (SELECT MAX(TotalRevenue) FROM EmployeeRevenue);
