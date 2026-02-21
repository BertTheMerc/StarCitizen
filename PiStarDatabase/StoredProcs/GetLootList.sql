CREATE PROCEDURE [dbo].[GetLootList]
AS
BEGIN
    SET NOCOUNT ON

    SELECT 
       [Loot].[Id]
      ,[Loot].[ItemTypeNameId]
      ,[ItemTypeName]
      ,[Loot].[SubItemTypeNameId]
      ,[ST].[SubItemTypeName]
      ,[ItemName]
      ,[SCUSize]
      ,[CargoSaleValue]
    FROM
        dbo.Loot
        INNER JOIN [dbo].[LootType] AS LT ON [Loot].[ItemTypeNameId] = [LT].[Id]
        INNER JOIN [dbo].[LootSubItemType] AS ST ON [Loot].[SubItemTypeNameId] = [ST].[Id]

END
