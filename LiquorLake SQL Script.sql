/******************************************************************

	Name: Ian Rey Baguio
		  Ajaybeer Singh

	Course: BAIST-IS Capstone
	Instructor: Dave Elyk

*****************************************************************/
USE Master
-- DROP DATABASE LiquorLake
CREATE DATABASE LiquorLake
GO

USE LiquorLake
GO

-- Table Creations
CREATE TABLE Categories(
	CategoryID INT IDENTITY(1,1) NOT NULL,
	CategoryName NVARCHAR(50) NOT NULL,
	Description NVARCHAR(50) NOT NULL
)

ALTER TABLE Categories
	ADD CONSTRAINT PK_Categories_CategoryID PRIMARY KEY CLUSTERED (CategoryID)
GO


CREATE TABLE Product(
	UPC VARCHAR(20) NOT NULL,
	CategoryID INT NOT NULL,
	Name nvarchar(50) NOT NULL,
	Price money NOT NULL,
	Size INT NOT NULL,
	CountryOfOrigin nvarchar(50) NULL,
	WineSweetnessIndex nvarchar(15) NULL,
	Image nvarchar(50) NULL,
	Company nvarchar(100) NOT NULL,
	Description nvarchar(250) NULL
)

ALTER TABLE Product
	ADD CONSTRAINT PK_Product_UPC PRIMARY KEY CLUSTERED (UPC),
		CONSTRAINT FK_Product_CategoryID FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
GO

-- Insert Data
INSERT INTO Categories
(CategoryName, Description)
VALUES
('Beer', 'Beer'),
('Spirits', 'Spirits'),
('Wine', 'Wine')

DELETE FROM Product
INSERT INTO Product
(UPC,CategoryID,Name,Price,Size,CountryOfOrigin, WineSweetnessIndex, Image, Company,Description)
VALUES
(877250,2,'Crown Royal',29.99,750,NULL,NULL,NULL,'The Crown Royal Distilling Company', 'Single 750 ml bottle of Crown Royal'),
(082000734833, 2, 'Smirnoff', 23.99, 750,NULL,NULL,NULL,'Diageo', ' Single 750 ml bottle of Smirnoff'),
(087116069688,2,'Belvedere Vodka',49.99,0,NULL,NULL,NULL,'LVMH','Single bottle of Belvedere Vodka'),
(620213190000,2,'Bombay Sapphire Gin',27.99,750,NULL,NULL,NULL,'Bombay','Single 750 ml bottle of Bombay Sapphire Gin'),
(085000017739,3,'Lamarca Prosecco',17.99,750,'Italy','Medium',NULL,'Prosecco', ' 750 ml bottle of Lamarca Prosecco'),
(620213015457,2,'Bacardi White',23.99,750,NULL,NULL,NULL,'Bacardi',' Single 750 ml bottle of Bacardi White'),
(056327073234,1,'Molson Canadian 8 Pack',17.99,355,NULL,NULL,NULL,'Molson Canadian','8 Pack of Molson Canadian, 355 ml per can'),
(010391100753,2,'Drambuie',34.99,750,NULL,NULL,NULL,'The Drambuie Liqueur Company Limited','Single 750 ml bottle of Drambuie scotch whisky'),
(786150000168,1,'Stella Artois 12 Pack',31.99,300,NULL,NULL,NULL,'Anheuser–Busch InBev' ,'12 pack of stella artois, 300ml per bottle'),
(3245990250203,2,'Hennessy VS Cognac',49.99,750,'France',NULL,NULL,'Hennessy','Single 750 ml bottle of Hennessy VS Cognac'),
(089121288122,3,'J. Lohr Seven Oaks Cabernet Sauvignon',24.99,750,'USA','Dry',NULL,'J. Lohr' ,'Single 750 ml bottle of J. Lohr Seven Oaks Cabernet Sauvignon'),
(776103000666,2,'Jose Cuervo Tequila',39.99,750,NULL,NULL,NULL,'Tequila Cuervo La Rojeña','Single 750 ml bottle of Jose Cuervo Tequila'),
(088544016770,2,'Southern Comfort',27.99,750,NULL,NULL,NULL,'Sazerac Company','Single 750 ml bottle of Southern Comfort whiskey'),
(087000150393,2,'Captain Morgan Deluxe',27.49,750,NULL,NULL,NULL,'Diageo','Single 750 ml bottle of Captain Morgan Deluxe dark rum'),
(089540454061,2,'Kahlua',29.99,750,NULL,NULL,NULL,'Pernod Ricard' ,'Single 750 ml bottle of Kahlua coffee flavoured rum'),
(9419227006275,3,'Kim Crawford Sauvignon',19.99,750,'New Zealand' ,'Extra Dry',NULL,'Kim Crawford','Single 750 ml bottle of Kim Crawford Sauvignon white wine')
GO

/*******************************************************************************************************************************

					STORED PROCEDURES

*******************************************************************************************************************************/

--DROP PROCEDURE GetProducts
CREATE PROCEDURE GetProducts(@CategoryID INT = NULL)
AS
	SELECT Product.UPC,
		   Categories.CategoryID,
		   Categories.CategoryName,
		   Product.Price,
		   Product.Name,
		   Product.Size,
		   ISNULL(Product.CountryOfOrigin, 'N/A') AS CountryOfOrigin,
		   ISNULL(Product.WineSweetnessIndex, 'N/A') AS WineSweetnessIndex,
		   ISNULL(Product.Image, 'N/A') AS Image,
		   Product.Company,
		   Product.Description	   
	FROM Product
	INNER JOIN Categories ON Product.CategoryID = Categories.CategoryID
	WHERE Product.CategoryID = CASE WHEN @CategoryID IS NULL OR @CategoryID = 0 THEN Product.CategoryID ELSE @CategoryID END
GO


CREATE PROCEDURE GetCategories
AS
	SELECT CategoryID,
		   CategoryName,
		   Description
	FROM Categories
GO

EXEC GetProducts 2

DROP PROCEDURE SearchProducts
CREATE PROCEDURE SearchProducts(@Keyword varchar(100) = NULL)
AS

IF @Keyword IS NULL
	RAISERROR('SearchProducts - Required parameter: @Keyword',16,1)
ELSE
	SELECT
		   Product.UPC,
		   Categories.CategoryID,
		   Categories.CategoryName,
		   Product.Price,
		   Product.Name,
		   Product.Size,
		   ISNULL(Product.CountryOfOrigin, 'N/A') AS CountryOfOrigin,
		   ISNULL(Product.WineSweetnessIndex, 'N/A') AS WineSweetnessIndex,
		   ISNULL(Product.Image, 'N/A') AS Image,
		   Product.Company,
		   Product.Description	
	FROM Product
	INNER JOIN Categories ON Product.CategoryID = Categories.CategoryID
	WHERE Product.Name LIKE '%'+ @Keyword +'%' OR Product.Description LIKE '%' + @Keyword + '%'
GO

EXEC SearchProducts 'Whisky'

select * from Product
select * from Categories