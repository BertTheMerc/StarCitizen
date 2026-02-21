CREATE PROCEDURE [dbo].[GetOutpostList]
AS
BEGIN
    SET NOCOUNT ON

    SELECT 
       [OP].[Id]
      ,[SY].[SystemName]
      ,[SS].[SubSystemName]
      ,[OP].[Area]
      ,[OP].[OutpostName]
      ,[OP].[PadSizes]
      ,[OP].[Cargo]
      ,[OP].[Repair]
      ,[OP].[Garage]
    FROM
        dbo.[Outposts] OP
        INNER JOIN [dbo].[Systems] AS SY ON [OP].[SystemId] = [SY].[Id]
        INNER JOIN [dbo].[SubSystem] AS SS ON [OP].[SubSystemId] = [SS].[Id]

END
