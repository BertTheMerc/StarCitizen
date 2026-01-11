CREATE TABLE [dbo].[Outposts]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	SystemId int NOT NULL,
    SubSystemId int NOT NULL,
    Area VARCHAR(60) NOT NULL,
    Outpost VARCHAR(40) NOT NULL,
    PadSizes VARCHAR(40) NOT NULL,
    Cargo BIT NOT NULL,
    Repair BIT NOT NULL,
    Garage BIT NOT NULL,
)
