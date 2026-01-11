/*
INSERT INTO [dbo].[Systems] (SystemName) VALUES ("Stanton");
SET @StantonSystem = @@IDENTITY;
INSERT INTO [dbo].[Systems] (SystemName) VALUES ("Pyro")
SET @PyroSystem = @@IDENTITY;
INSERT INTO [dbo].[Systems] (SystemName) VALUES ("NYX")
SET @NyxSystem = @@IDENTITY;

INSERT INTO [dbo].[SubSystems] (SubSystemName) VALUES ('Crusader');
SET @Crusader = @@IDENTITY;
INSERT INTO [dbo].[SubSystems] (SubSystemName) VALUES ('Hurston');
SET @Hurston = @@IDENTITY;
INSERT INTO [dbo].[SubSystems] (SubSystemName) VALUES ('Microtech');
SET @Microtech = @@IDENTITY;
INSERT INTO [dbo].[SubSystems] (SubSystemName) VALUES ('Arc Corp');
SET @ArcCorp = @@IDENTITY;
INSERT INTO [dbo].[SubSystems] (SubSystemName) VALUES ('Pyro');
SET @PyroSub = @@IDENTITY;
INSERT INTO [dbo].[SubSystems] (SubSystemName) VALUES ('Nyx');
SET @NyxSub = @@IDENTITY;


INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @Crusader, 'ArcCorp Minig Area 045', 'Wala', 'M',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @Crusader, 'ArcCorp Minig Area 048', 'Wala', 'M',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @Crusader, 'ArcCorp Minig Area 056', 'Wala', 'M',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @Crusader, 'ArcCorp Minig Area 061', 'Wala', 'M',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @Crusader, 'ArcCorp Minig Area 141', 'Daymar', 'M',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @Crusader, 'ArcCorp Minig Area 157', 'Yela', 'M',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @Crusader, 'Deakins Research', 'Yela', 'L', true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @Hurston, 'HDMS - Bezek', 'Arial', 'M/L',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @Hurston, 'HDMS - Edmond', 'Hurston', 'M/L',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @Hurston, 'HDMS - Hadley', 'Hurston', 'M/L',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @Hurston, 'HDMS - Hahn', 'Hurston', 'M/L',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @Hurston, 'HDMS - Lathan', 'Arial', 'M/L',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @Hurston, 'HDMS - Norgard', 'Aberdeen', 'M/L',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @Hurston, 'HDMS - Oparei', 'Hurston', 'M/L',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @Hurston, 'HDMS - Perlman', 'Mayda', 'M/L',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @Hurston, 'HDMS - Ryder', 'Ita', 'M/L',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @Hurston, 'HDMS - Stanhope', 'Hurston', 'M/L',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @Hurston, 'HDMS - Thedus', 'Hurston', 'M/L',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @Hurston, 'HDMS - Palomar', 'Hurston', 'M/L',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @Hurston, 'Hickes Research', 'Cellin', 'M/L',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @Hurston, 'Rayari - Anvik', 'Calliope', 'M/L',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @Microtech, 'Rayari - Deltana', 'Microtech', 'M/L',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @Microtech, 'Rayari - Cantwell', 'Cilo', 'M/L',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @Microtech, 'Rayari - Kaltag', 'Calliope', 'M/L',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @Microtech, 'Rayari - McGrath', 'Cilo', 'M/L',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @ArcCorp, 'Shubin SAL-2', 'Lyria', 'M/L',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @ArcCorp, 'Shubin SAL-5', 'Lyria', 'M/L',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @ArcCorp, 'Shubin SCD-1', 'Daymar', 'M/L',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @Microtech, 'Shubin SM0-10', 'Microtech', 'M/L',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @Microtech, 'Shubin SM0-13', 'Microtech', 'M/L',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @Microtech, 'Shubin SM0-18', 'Microtech', 'M/L',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @Microtech, 'Shubin SM0-22', 'Microtech', 'M/L',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @Microtech, 'Shubin SMCa-6', 'Calliope', 'M/L',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@StantonSystem, @Microtech, 'Shubin SMCa-8', 'Calliope', 'M/L',true, true);

INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@PyroSystem, @PyroSub, '?', '?', 'M/L',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@PyroSystem, @PyroSub, 'Stanton Jump Point', '?', 'M/L',true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@PyroSystem, @PyroSub, 'Nyx Jump Point', '?', 'M/L',true, true);

INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@NyxSystem, @NyxSub, 'Levski', '', 'M/L', true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@NyxSystem, @NyxSub, 'Pyro Jump Point', '', 'M/L', true, true);
INSERT INTO [dbo].[Outposts] (system_id, group_id, outpost, area,pad_sizes, repair, garage) VALUES (@NyxSystem, @NyxSub, 'Stanton Jump Point', '', 'M/L', true, true);
*/