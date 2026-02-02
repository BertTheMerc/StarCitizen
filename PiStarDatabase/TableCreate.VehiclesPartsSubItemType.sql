CREATE TABLE [dbo].[VehiclesPartsSubItemType]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	VehiclePartsTypeId INT NOT NULL,
	VehiclePartsSubItemType VARCHAR(40)  NOT NULL
)
