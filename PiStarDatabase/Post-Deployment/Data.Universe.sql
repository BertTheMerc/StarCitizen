TRUNCATE TABLE [dbo].[Systems]
INSERT INTO [dbo].[Systems] (SystemName) VALUES ('Stanton');
DECLARE @StantonSystem INT = @@IDENTITY;
INSERT INTO [dbo].[Systems] (SystemName) VALUES ('Pyro')
DECLARE @PyroSystem INT = @@IDENTITY;
INSERT INTO [dbo].[Systems] (SystemName) VALUES ('NYX')
DECLARE @NyxSystem INT = @@IDENTITY;

TRUNCATE TABLE [dbo].[SubSystem]
INSERT INTO [dbo].[SubSystem] (SubSystemName) VALUES ('Crusader');
DECLARE @Crusader INT = @@IDENTITY;
INSERT INTO [dbo].[SubSystem] (SubSystemName) VALUES ('Hurston');
DECLARE @Hurston INT = @@IDENTITY;
INSERT INTO [dbo].[SubSystem] (SubSystemName) VALUES ('Microtech');
DECLARE @Microtech INT = @@IDENTITY;
INSERT INTO [dbo].[SubSystem] (SubSystemName) VALUES ('Arc Corp');
DECLARE @ArcCorp INT = @@IDENTITY;
INSERT INTO [dbo].[SubSystem] (SubSystemName) VALUES ('Pyro');
DECLARE @PyroSub INT = @@IDENTITY;
INSERT INTO [dbo].[SubSystem] (SubSystemName) VALUES ('Nyx');
DECLARE @NyxSub INT = @@IDENTITY;