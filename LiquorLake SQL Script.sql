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

-- DELETE FROM Product
INSERT INTO Product
(UPC,CategoryID,Name,Price,Size,CountryOfOrigin, WineSweetnessIndex, Image, Company,Description)
VALUES
(877250,2,'Crown Royal',29.99,750,NULL,NULL,'Spirits_877250.jpg','The Crown Royal Distilling Company', 'Single 750 ml bottle of Crown Royal'),
(082000734833, 2, 'Smirnoff', 23.99, 750,NULL,NULL,'Spirits_082000734833.jpg','Diageo', ' Single 750 ml bottle of Smirnoff'),
(087116069688,2,'Belvedere Vodka',49.99,0,NULL,NULL,'Spirits_liquor_placeholder.png','LVMH','Single bottle of Belvedere Vodka'),
(620213190000,2,'Bombay Sapphire Gin',27.99,750,NULL,NULL,'Spirits_620213190000.jpg','Bombay','Single 750 ml bottle of Bombay Sapphire Gin'),
(085000017739,3,'Lamarca Prosecco',17.99,750,'Italy','Medium','Wine_085000017739.jpg','Prosecco', ' 750 ml bottle of Lamarca Prosecco'),
(620213015457,2,'Bacardi White',23.99,750,NULL,NULL,'Spirits_620213015457.jpg','Bacardi',' Single 750 ml bottle of Bacardi White'),
(056327073234,1,'Molson Canadian 8 Pack',17.99,355,NULL,NULL,'Beer_056327073234.jpg','Molson Canadian','8 Pack of Molson Canadian, 355 ml per can'),
(010391100753,2,'Drambuie',34.99,750,NULL,NULL,'Spirits_010391100753.jpg','The Drambuie Liqueur Company Limited','Single 750 ml bottle of Drambuie scotch whisky'),
(786150000168,1,'Stella Artois 12 Pack',31.99,300,NULL,NULL,'Beer_786150000168.jpg','Anheuser–Busch InBev' ,'12 pack of stella artois, 300ml per bottle'),
(3245990250203,2,'Hennessy VS Cognac',49.99,750,'France',NULL,'Spirits_3245990250203.jpg','Hennessy','Single 750 ml bottle of Hennessy VS Cognac'),
(089121288122,3,'J. Lohr Seven Oaks Cabernet Sauvignon',24.99,750,'USA','Dry','Wine_089121288122.jpg','J. Lohr' ,'Single 750 ml bottle of J. Lohr Seven Oaks Cabernet Sauvignon'),
(776103000666,2,'Jose Cuervo Tequila',39.99,750,NULL,NULL,'Spirits_776103000666.jpg','Tequila Cuervo La Rojeña','Single 750 ml bottle of Jose Cuervo Tequila'),
(088544016770,2,'Southern Comfort',27.99,750,NULL,NULL,'Spirits_088544016770.jpg','Sazerac Company','Single 750 ml bottle of Southern Comfort whiskey'),
(087000150393,2,'Captain Morgan Deluxe',27.49,750,NULL,NULL,'Spirits_087000150393.jpg','Diageo','Single 750 ml bottle of Captain Morgan Deluxe dark rum'),
(089540454061,2,'Kahlua',29.99,750,NULL,NULL,'Spirits_089540454061.jpg','Pernod Ricard' ,'Single 750 ml bottle of Kahlua coffee flavoured rum'),
(9419227006275,3,'Kim Crawford Sauvignon',19.99,750,'New Zealand' ,'Extra Dry','Wine_9419227006275.jpg','Kim Crawford','Single 750 ml bottle of Kim Crawford Sauvignon white wine'),
(811538014045,2,'Virginia Black',49.99,750,NULL,NULL,'Spirits_811538014045.jpg','Virginia Black Llc','Single 750ml bottle of Virginia black whiskey'),
(087116035065,2,'Sour Puss Apple',12.49,375,NULL,NULL,'Spirits_087116035065.jpg','Phillips Beverage Company','Single 375ml bottle of Sour Puss Apple liquor'),
(087116035140,2,'Sour Puss Raspberry',12.49,375,NULL,NULL,'Spirits_087116035140.jpg','Phillips Beverage Company','Single 375ml bottle of Sour Puss Raspberry liquor'),
(087116035003,2,'Sour Puss Raspberry',25.99,1410,NULL,NULL,'Spirits_087116035003.jpg','Phillips Beverage Company','Single 1.14L bottle of Sour Puss Raspberry liquor'),
(4067700012265,2,'Jagermeister',44.99,1410,NULL,NULL,'Spirits_4067700012265.jpg','Mast-Jagermeister Ag','Single 1.14L bottle of Jagermeister liquor'),
(622153625079,2,'Tanqueray Gin',59.99,1750,NULL,NULL,'Spirits_622153625079.jpg','Udv - Laindon','Single 1.75L bottle of Tanqueray Gin'),
(622153625062,2,'Tanqueray Gin',39.99,1410,NULL,NULL,'Spirits_622153625062.jpg','Udv - Laindon','Single 1.14L bottle of Tanqueray Gin'),
(622153625048,2,'Tanqueray Gin',39.99,750,NULL,NULL,'Spirits_622153625048.jpg','Udv - Laindon','Single 750ml bottle of Tanqueray Gin'),
(811538013086,2,'Kraken Spiced',18.50,375,NULL,NULL,'Spirits_811538013086.jpg','Proximo','Single 375ml bottle of Kraken Black Spiced Rum'),
(048415345439,2,'Lambs Navy',13.50,375,NULL,NULL,'Spirits_048415345439.jpg','Corby Spirit And Wine Limited','Single 375ml bottle of Lambs Navy dark rum'),
(620213025609,2,'Bacardi',13.99,375,NULL,NULL,'Spirits_620213025609.jpg','Bacardi','Single 375ml bottle of Barcardi Gold rum'),
(620213015600,2,'Bacardi',13.99,375,NULL,NULL,'Spirits_liquor_placeholder.png','Bacardi','Single 375ml bottle of Barcardi White rum'),
(048415345552,2,'Lambs Classic',13.50,375,NULL,NULL,'Spirits_048415345552.jpg','Corby Spirit And Wine Limited','Single 375ml bottle of Lambs Classic white rum'),
(774837595373,1,'Brava 15 Can',24.50,355,NULL,NULL,'Beer_774837595373.jpg','Brava Brewing Company','15 pack of Brava beer, 355ml per can')
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

CREATE PROCEDURE ProductDetails(@UPC VARCHAR(20) = NULL)
AS
	DECLARE @ReturnCode INT
	SET @ReturnCode = 1

	IF @UPC IS NULL
		RAISERROR('ProductDetails - Required Parameter: @UPC', 16, 1)
	ELSE
		BEGIN
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
			WHERE Product.UPC = @UPC

			IF @@ERROR = 0
				SET @ReturnCode = 0
			ELSE
				RAISERROR('ProductDetails - SELECT Error', 16, 1)
		END

	RETURN @ReturnCode
GO
