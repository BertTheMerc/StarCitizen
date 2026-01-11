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

TRUNCATE TABLE [dbo].[Outposts]
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @Crusader, 'ArcCorp Minig Area 045', 'Wala', 'M',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @Crusader, 'ArcCorp Minig Area 048', 'Wala', 'M',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @Crusader, 'ArcCorp Minig Area 056', 'Wala', 'M',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @Crusader, 'ArcCorp Minig Area 061', 'Wala', 'M',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @Crusader, 'ArcCorp Minig Area 141', 'Daymar', 'M',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @Crusader, 'ArcCorp Minig Area 157', 'Yela', 'M',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @Crusader, 'Deakins Research', 'Yela', 'L', 1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @Hurston, 'HDMS - Bezek', 'Arial', 'M/L',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @Hurston, 'HDMS - Edmond', 'Hurston', 'M/L',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @Hurston, 'HDMS - Hadley', 'Hurston', 'M/L',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @Hurston, 'HDMS - Hahn', 'Hurston', 'M/L',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @Hurston, 'HDMS - Lathan', 'Arial', 'M/L',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @Hurston, 'HDMS - Norgard', 'Aberdeen', 'M/L',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @Hurston, 'HDMS - Oparei', 'Hurston', 'M/L',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @Hurston, 'HDMS - Perlman', 'Mayda', 'M/L',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @Hurston, 'HDMS - Ryder', 'Ita', 'M/L',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @Hurston, 'HDMS - Stanhope', 'Hurston', 'M/L',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @Hurston, 'HDMS - Thedus', 'Hurston', 'M/L',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @Hurston, 'HDMS - Palomar', 'Hurston', 'M/L',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @Hurston, 'Hickes Research', 'Cellin', 'M/L',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @Hurston, 'Rayari - Anvik', 'Calliope', 'M/L',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @Microtech, 'Rayari - Deltana', 'Microtech', 'M/L',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @Microtech, 'Rayari - Cantwell', 'Cilo', 'M/L',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @Microtech, 'Rayari - Kaltag', 'Calliope', 'M/L',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @Microtech, 'Rayari - McGrath', 'Cilo', 'M/L',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @ArcCorp, 'Shubin SAL-2', 'Lyria', 'M/L',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @ArcCorp, 'Shubin SAL-5', 'Lyria', 'M/L',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @ArcCorp, 'Shubin SCD-1', 'Daymar', 'M/L',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @Microtech, 'Shubin SM0-10', 'Microtech', 'M/L',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @Microtech, 'Shubin SM0-13', 'Microtech', 'M/L',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @Microtech, 'Shubin SM0-18', 'Microtech', 'M/L',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @Microtech, 'Shubin SM0-22', 'Microtech', 'M/L',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @Microtech, 'Shubin SMCa-6', 'Calliope', 'M/L',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@StantonSystem, @Microtech, 'Shubin SMCa-8', 'Calliope', 'M/L',1, 1, 1);

INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@PyroSystem, @PyroSub, '?', '?', 'M/L',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@PyroSystem, @PyroSub, 'Stanton Jump Point', '?', 'M/L',1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@PyroSystem, @PyroSub, 'Nyx Jump Point', '?', 'M/L',1, 1, 1);

INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@NyxSystem, @NyxSub, 'Levski', '', 'M/L', 1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@NyxSystem, @NyxSub, 'Pyro Jump Point', '', 'M/L', 1, 1, 1);
INSERT INTO [dbo].[Outposts] (SystemId, SubSystemId, outpost, area,PadSizes, Cargo, Repair, Garage) VALUES (@NyxSystem, @NyxSub, 'Stanton Jump Point', '', 'M/L', 1, 1, 1);
