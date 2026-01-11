CREATE TABLE [dbo].[LootSubItemType]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[ItemTypeNameId] INT,
	[SubItemTypeName] VARCHAR(40),
)
