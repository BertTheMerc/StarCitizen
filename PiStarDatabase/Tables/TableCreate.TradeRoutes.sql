CREATE TABLE [dbo].[TradeRoutes]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	OutpostPickUpId INT NOT NULL,
    OutpostDropOffId INT NOT NULL,
    Goods VARCHAR(40) NOT NULL,
    Buy INT NOT NULL,
    Sell INT NOT NULL,
    ScuSizes VARCHAR(16) NOT NULL,
)
