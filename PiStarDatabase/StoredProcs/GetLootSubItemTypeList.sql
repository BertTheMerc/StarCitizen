CREATE PROCEDURE [dbo].[GetLootSubTypeList]
AS
BEGIN
    SET NOCOUNT ON

    SELECT 
        [Id], 
        [ItemTypeNameId],
        [SubItemTypeName]
    FROM
        dbo.LootSubItemType

END