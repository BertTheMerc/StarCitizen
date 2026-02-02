TRUNCATE TABLE [dbo].[VehiclePartsType]
TRUNCATE TABLE [dbo].[VehiclePartsSubItemType]
TRUNCATE TABLE [dbo].[VehicleParts]

INSERT INTO [dbo].[VehiclePartsType] (ShipPartTypeName) VALUES ('Weapons');
DECLARE @Weapons INT = @@IDENTITY;
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Weapons, 'Ballistic Cannon');
DECLARE @BC INT = @@IDENTITY;


INSERT INTO [dbo].[VehicleParts] (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, '10-Series Greatsword', 'KnightBridge Arms', 'KBAR', '', '', 2, 0,0,0);
INSERT INTO [dbo].[VehicleParts] (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, '11-Series Broadsword', 'KnightBridge Arms', 'KBAR', '', '', 3, 0,0,0);
INSERT INTO [dbo].[VehicleParts] (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, '9-Series Longsword', 'KnightBridge Arms', 'KBAR', '', '', 1, 0,0,0);
INSERT INTO [dbo].[VehicleParts] (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'C-788', 'Behring', 'BEHR', '', '', 4, 0,0,0);
INSERT INTO [dbo].[VehicleParts] (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'Conqueror-7', 'Behring', 'BEHR', '', '', 7, 0,0,0);
INSERT INTO [dbo].[VehicleParts] (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'CVSA', 'Behring', 'BEHR', '', '', 2, 0,0,0);
INSERT INTO [dbo].[VehicleParts] (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'Deadbolt I', 'Esperia', 'ESPR', '', '', 1, 0,0,0);
INSERT INTO [dbo].[VehicleParts] (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'Deadbolt II', 'Esperia', 'ESPR', '', '', 2, 0,0,0);
INSERT INTO [dbo].[VehicleParts] (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'Deadbolt III', 'Esperia', 'ESPR', '', '', 3, 0,0,0);
INSERT INTO [dbo].[VehicleParts] (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'Deadbolt IV', 'Esperia', 'ESPR', '', '', 4, 0,0,0);
INSERT INTO [dbo].[VehicleParts] (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'Deadbolt V', 'Esperia', 'ESPR', '', '', 5, 0,0,0);
INSERT INTO [dbo].[VehicleParts] (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'Deadbolt VI', 'Esperia', 'ESPR', '', '', 6, 0,0,0);
INSERT INTO [dbo].[VehicleParts] (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'Destroyer Mass Driver', 'Klaus & Werner', 'KLWE', '', '', 10, 0,0,0);
INSERT INTO [dbo].[VehicleParts] (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'Leonids', 'Roberts Space Industries', 'RSI', '', '', 5, 0,0,0);
INSERT INTO [dbo].[VehicleParts] (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'Maris', 'Roberts Space Industries', 'RSI', '', '', 6, 0,0,0);
INSERT INTO [dbo].[VehicleParts] (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'RSI Medusa', 'Roberts Space Industries', 'RSI', '', '', 8, 0,0,0);
INSERT INTO [dbo].[VehicleParts] (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'Salyer', 'Hurston Dynamics', 'HRST', '', '', 5, 0,0,0);
INSERT INTO [dbo].[VehicleParts] (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'Sledge I Mass Driver', 'Klaus & Werner', 'KLWE', '', '', 1, 0,0,0);	 
INSERT INTO [dbo].[VehicleParts] (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'Sledge II Mass Driver', 'Klaus & Werner', 'KLWE', '', '', 2, 0,0,0);	 
INSERT INTO [dbo].[VehicleParts] (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'Sledge III Mass Driver', 'Klaus & Werner', 'KLWE', '', '', 3, 0,0,0);	 
INSERT INTO [dbo].[VehicleParts] (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'Strife Mass Driver', 'Apocalypse Arms', 'APAR', '', '', 2, 0,0,0);	 

INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Weapons, 'Ballistic Gatling');
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Weapons, 'Ballistic Repeater');
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Weapons, 'Ballistic Scattergun');
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Weapons, 'Distortion Cannon');
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Weapons, 'Distortion Repeater');
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Weapons, 'Distortion Scattergun');
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Weapons, 'Laser Beam');
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Weapons, 'Laser Cannon');
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Weapons, 'Laser Gatling');
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Weapons, 'Laser Repeater');
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Weapons, 'Laser Scattergun');
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Weapons, 'Plasma Cannon');
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Weapons, 'Rocket Pod');
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Weapons, 'Tachyon Cannon');
	l

INSERT INTO [dbo].[VehiclePartsType] (ShipPartTypeName) VALUES ('Missiles');
DECLARE @Missiles INT = @@IDENTITY;

INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Missiles, 'Crosssection');
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Missiles, 'Electromagnetic');
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Missiles, 'Infrared');


INSERT INTO [dbo].[VehiclePartsType] (ShipPartTypeName) VALUES ('Bombs');
DECLARE @Bombs INT = @@IDENTITY;
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Bombs , '');

INSERT INTO [dbo].[VehiclePartsType] (ShipPartTypeName) VALUES ('EMPS');
DECLARE @EMPS INT = @@IDENTITY;
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@EMPS , '');

INSERT INTO [dbo].[VehiclePartsType] (ShipPartTypeName) VALUES ('QEDS');
DECLARE @QEDS INT = @@IDENTITY;
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@QEDS , '');

INSERT INTO [dbo].[VehiclePartsType] (ShipPartTypeName) VALUES ('Shields');
DECLARE @Shields INT = @@IDENTITY;
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Shields , 'Civilian');
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Shields , 'Military');
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Shields , 'Industrial');
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Shields , 'Competiion');
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Shields , 'Stealth');

INSERT INTO [dbo].[VehiclePartsType] (ShipPartTypeName) VALUES ('Power Plant');
DECLARE @Power INT = @@IDENTITY;
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Power , 'Civilian');
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Power , 'Military');
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Power , 'Industrial');
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Power , 'Competiion');
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Power , 'Stealth');

INSERT INTO [dbo].[VehiclePartsType] (ShipPartTypeName) VALUES ('Cooler');
DECLARE @Cooler INT = @@IDENTITY;
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Cooler , 'Civilian');
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Cooler , 'Military');
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Cooler , 'Industrial');
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Cooler , 'Competiion');
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Cooler , 'Stealth');

INSERT INTO [dbo].[VehiclePartsType] (ShipPartTypeName) VALUES ('Quantum Drive');
DECLARE @QD INT = @@IDENTITY;
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@QD , 'Civilian');
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@QD , 'Military');
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@QD , 'Industrial');
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@QD , 'Competiion');
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@QD , 'Stealth');


TRUNCATE TABLE [dbo].[VehicleParts]

INSERT INTO [dbo].[VehicleParts] (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, Class, Grade, Size, Price, SCUSize, SalePrice) 
VALUES (@StantonSystem, @Crusader, 'ArcCorp Minig Area 045', 'Wala', 'M',true, true);


/*



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