-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[GetLootList]
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
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
        INNER JOIN [dbo].[LootType] AS LT ON [Loot].[ItemTypeNameID] = [LT].[Id]
        INNER JOIN [dbo].[LootSubItemType] AS ST ON [Loot].[SubItemTypeNameId] = [ST].[Id]

END
