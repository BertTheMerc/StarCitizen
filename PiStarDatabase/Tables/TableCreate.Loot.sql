CREATE TABLE [dbo].[Loot]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
    ItemTypeNameId INT,
    SubItemTypeNameId INT,
	ItemName VARCHAR(40),
    SCUSize INT,
    CargoSaleValue INT,
)
