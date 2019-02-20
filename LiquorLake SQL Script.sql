/******************************************************************

	Name: Ian Rey Baguio
		  Ajaybeer Singh

	Course: BAIST-IS Capstone
	Instructor: Dave Elyk

*****************************************************************/

drop database LiquorLake
CREATE DATABASE LiquorLake
GO

CREATE TABLE Product(
	UPC nvarchar(12) NOT NULL,
	CategoryID INT NOT NULL,
	Name nvarchar(50) NOT NULL,
	Price money NOT NULL,
	Size decimal(10,2) NOT NULL,
	CountryOfOrigin nvarchar(50) NULL,
	WineSweetnessIndex nvarchar(15) NULL,
	Image nvarchar(50) NULL,
	Company nvarchar(50) NOT NULL,
	Description nvarchar(150) NULL
)

ALTER TABLE Product
	ADD CONSTRAINT PK_Product_UPC PRIMARY KEY CLUSTERED (UPC),
		CONSTRAINT FK_Product_CategoryID FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
GO

CREATE TABLE Categories(
	CategoryID INT IDENTITY(1,1) NOT NULL,
	CategoryName NVARCHAR(50) NOT NULL,
	Description NVARCHAR(50) NOT NULL
)

ALTER TABLE Categories
	ADD CONSTRAINT PK_Categories_CategoryID PRIMARY KEY CLUSTERED (CategoryID)
GO


INSERT INTO Categories
(CategoryName, Description)
VALUES
('Beer', 'Beer'),
('Spirits', 'Spirits'),
('Wine', 'Wine')

select * from Categories

INSERT INTO Product
(UPC,CategoryID,Name,Price,Size,CountryOfOrigin, WineSweetnessIndex, Image, Company,Description)
VALUES
(877250,2,'Crown Royal',29.99,750,NULL,NULL,NULL,'The Crown ROyal Distilling Company', 'Single 750 ml bottle of Crown Royal'),
(082000734833, 2, 'Smirnoff', 23.99, 750,NULL,NULL,NULL,'Diageo', ' Single 750 ml bottle of Smirnoff'),
(087116069688,2,'Belvedere Vodka',49.99,0,NULL,NULL,NULL,'LVMH','Single bottle of Belvedere Vodka'),
(620213190000,2,'Bombay Sapphire Gin',27.99,750,NULL,NULL,NULL,'Bombay','Single 750 ml bottle of Bombay Sapphire Gin'),
(085000017739,3,'Lamarca Prosecco',17.99,750,'Italy','Medium',NULL,'Prosecco', ' 750 ml bottle of Lamarca Prosecco'),
(620213015457,2,'Bacardi White',23.99,750,NULL,NULL,NULL,'Bacardi',' Single 750 ml bottle of Bacardi White'),
(056327073234,1,'Molson Canadian 8 Pack',17.99,355,NULL,NULL,NULL,'Molson Canadian','8 Pack of Molson Canadian, 355 ml per can')

select * from Product

