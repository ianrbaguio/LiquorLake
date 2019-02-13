/******************************************************************

	Name: Ian Rey Baguio
		  Ajaybeer Singh

	Course: BAIST-IS Capstone
	Instructor: Dave Elyk

*****************************************************************/

CREATE DATABASE LiquorLake
GO

CREATE TABLE Product(
	UPC nvarchar(12) NOT NULL,
	CategoryID INT NOT NULL,
	Name nvarchar(50) NOT NULL,
	Price money NOT NULL,
	Size decimal(10,2) NOT NULL,
	CountryOfOrigin nvarchar(50) NOT NULL,
	WineSweetnessIndex INT NOT NULL,
	Image nvarchar(50) NOT NULL,
	Company nvarchar(50) NOT NULL
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

