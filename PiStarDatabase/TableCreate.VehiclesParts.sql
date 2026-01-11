CREATE TABLE [dbo].[VehiclesParts]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	VehiclePartsTypeId INT NOT NULL,
    VehiclesPartsSubItemTypeId INT NOT NULL,
    PartName VARCHAR(40) NOT NULL,
    Manufacturer VARCHAR(60) NOT NULL,
    Class VARCHAR(40) NOT NULL,
    Grade CHAR NOT NULL,
    Size INT NOT NULL,
    Price INT NOT NULL,
)
