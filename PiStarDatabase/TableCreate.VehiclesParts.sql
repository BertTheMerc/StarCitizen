CREATE TABLE [dbo].[VehiclesParts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VehiclePartsTypeId] [int] NOT NULL,
	[VehiclesPartsSubItemTypeId] [int] NOT NULL,
	[PartName] [varchar](40) NOT NULL,
	[Manufacturer] [varchar](60) NOT NULL,
    [ManufacturerCode] [char](5) NOT NULL,
	[Class] [varchar](40) NOT NULL,
	[Grade] [char](1) NOT NULL,
	[Size] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[SCUSize] [int] NOT NULL,
	[SalePrice] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
