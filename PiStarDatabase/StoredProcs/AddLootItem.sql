CREATE PROCEDURE dbo.InsertLootItem
    @ItemTypeNameId INT,
    @SubItemTypeNameId INT,
    @ItemName NVARCHAR(100),
    @Size INT,
    @CargoSaleValue INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.Loot
        (ItemTypeNameId, SubItemTypeNameId, ItemName, Size, CargoSaleValue)
    VALUES
        (@ItemTypeNameId, @SubItemTypeNameId, @ItemName, @Size, @CargoSaleValue);

    SELECT CAST(SCOPE_IDENTITY() AS INT) AS Id;
END