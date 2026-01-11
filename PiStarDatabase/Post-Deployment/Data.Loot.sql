DECLARE @personal INT 
DECLARE @armour INT
DECLARE @clothing INT
DECLARE @ordance INT
DECLARE @components INT
DECLARE @other INT

DECLARE @sidearm INT
DECLARE @primary INT
DECLARE @special INT
DECLARE @melee INT
DECLARE @attachments INT
DECLARE @throwables INT

DECLARE @undersuits INT
DECLARE @helmets INT
DECLARE @core INT
DECLARE @arms INT
DECLARE @legs INT
DECLARE @backpacks INT
DECLARE @flair INT

DECLARE @headwear INT
DECLARE @shirts INT
DECLARE @jackets INT
DECLARE @gloves INT
DECLARE @legwear INT
DECLARE @footwear INT
DECLARE @eyewear INT

DECLARE @ordnance INT
DECLARE @turrets INT
DECLARE @weapons INT
DECLARE @cm INT
DECLARE @racks INT

DECLARE @coolers INT
DECLARE @emp INT
DECLARE @mining INT
DECLARE @power INT
DECLARE @shields INT
DECLARE @qd INT
DECLARE @liveries INT
DECLARE @jump INT

TRUNCATE TABLE [dbo].[LootType];								 

INSERT INTO [dbo].[LootType] (ItemTypeName) VALUES ('Personal Weapon'); SET @personal = @@IDENTITY;
INSERT INTO [dbo].[LootType] (ItemTypeName) VALUES ('Armour');SET  @armour = @@IDENTITY;
INSERT INTO [dbo].[LootType] (ItemTypeName) VALUES ('Clothing');SET  @clothing = @@IDENTITY;
INSERT INTO [dbo].[LootType] (ItemTypeName) VALUES ('Vehicle Ordance'); SET  @ordance = @@IDENTITY;
INSERT INTO [dbo].[LootType] (ItemTypeName) VALUES ('Vehicle Component');SET  @components = @@IDENTITY;
INSERT INTO [dbo].[LootType] (ItemTypeName) VALUES ('Other'); SET  @other = @@IDENTITY;

TRUNCATE TABLE [dbo].[LootSubItemType];
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@personal, 'Sidearm'); SET  @sidearm = @@IDENTITY;
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@personal, 'Primary'); SET @primary = @@IDENTITY;
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@personal, 'Special'); SET @special = @@IDENTITY;
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@personal, 'Melee'); SET @melee = @@IDENTITY;
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@personal, 'Attachments'); SET @attachments = @@IDENTITY;
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@personal, 'Throwables'); SET @throwables = @@IDENTITY;
									 
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@armour, 'Undersuits'); SET @undersuits = @@IDENTITY;
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@armour, 'Helmets'); SET @helmets = @@IDENTITY;
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@armour, 'Core'); SET @core = @@IDENTITY;
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@armour, 'Arms'); SET @arms = @@IDENTITY;
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@armour, 'Legs');SET @legs = @@IDENTITY;
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@armour, 'Backpacks'); SET @backpacks = @@IDENTITY;
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@armour, 'Flair'); SET @flair = @@IDENTITY;
									 
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@clothing, 'Headwear'); SET @headwear = @@IDENTITY;
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@clothing, 'Shirts'); SET @shirts = @@IDENTITY;
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@clothing, 'Jackets'); SET @jackets = @@IDENTITY;
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@clothing, 'Gloves'); SET @gloves = @@IDENTITY;
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@clothing, 'Legwear'); SET @legwear = @@IDENTITY;
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@clothing, 'Footwear'); SET @footwear = @@IDENTITY;
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@clothing, 'Eyewear'); SET @eyewear = @@IDENTITY;
									 
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@ordance, 'Ordnance'); SET @ordnance = @@IDENTITY;
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@ordance, 'Turrets'); SET @turrets = @@IDENTITY;
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@ordance, 'Weapons'); SET @weapons = @@IDENTITY;
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@ordance, 'CM Launchers'); SET @cm = @@IDENTITY;
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@ordance, 'Missile Racks'); SET @racks = @@IDENTITY;
									 
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@components, 'Coolers'); SET @coolers = @@IDENTITY;
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@components, 'EMP'); SET @emp = @@IDENTITY;
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@components, 'Minig'); SET @mining = @@IDENTITY;
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@components, 'Power Plants'); SET @power = @@IDENTITY;
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@components, 'Quantum Drives'); SET @qd = @@IDENTITY;
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@components, 'Shields'); SET @shields = @@IDENTITY;
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@components, 'Liveries'); SET @liveries = @@IDENTITY;
INSERT INTO [dbo].[LootSubItemType] (ItemTypeNameId, SubItemTypeName) VALUES (@components, 'Jump Modules'); SET @jump = @@IDENTITY;

TRUNCATE TABLE [dbo].[Loot];

INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Arclight Pistol', @personal, @sidearm, 25, 245);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('LH86 Pistol', @personal, @sidearm, 25, 240);

INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('P6-LR', @personal, @primary, 19000, 2542);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Gallant',@personal , @primary, 13000, 1716);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Gallant "Desert Shadow"', @personal, @primary, 13000, 1414);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Gallant "Red Alert"', @personal, @primary, 13000, 1716);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('A3', @personal, @primary, 19000, 2475);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Custodian Boneyard', @personal, @primary, 7500, 748);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Custodian Brimstone', @personal, @primary, 7500, 908);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Custodian SMG', @personal, @primary, 7500, 936);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('FS-9', @personal, @primary, 18000, 2169);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('F55', @personal, @primary, 19000, 2112);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('C54', @personal, @primary, 75000, 823);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('P4-AR', @personal, @primary, 13000, 1313);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('P4-AR "Desert Shadow"', @personal, @primary, 13000, 1313);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('P4-AR "Nightstalker', @personal, @primary, 13000, 1313);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('P4-AR', @personal, @primary, 13000, 1313);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('P8-SC SMG', @personal, @primary, 7500, 845);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Karna', @personal, @primary, 13000, 1263);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Karna "Brimstone', @personal, @primary, 13000, 1532);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Ravager', @personal, @primary, 16000, 1452);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('BR-2', @personal, @primary, 16000, 1423);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('R97', @personal, @primary, 16000, 1330);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('212 "Bright Star"', @personal, @primary, 16000, 1);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('212 "Red Alert"', @personal, @primary, 16000, 1452);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('212', @personal, @primary, 16000, 1197);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Devastator', @personal, @primary, 16000, 1818);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Atzkav', @personal, @primary, 19000, 2362);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Deadrig Shotgun', @personal, @primary, 16000, 1134);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Arrowhead', @personal, @primary, 19000, 2520);
																   
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Animus Rocket Launcher', @personal, @special, 35000, 5910);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Scourge Railgun', @personal, @special, 35000, 5385);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Scourge "Quite Useful" Railgun', @personal, @special, 35000, 15401);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Max Lift', @personal, @special,17000, 9110);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Cambio SRT', @personal, @special, 13000, 6270);
																   
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Cambio-Lite SRT', @personal, @attachments, 3400, 112);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Orbit Minning', @personal, @attachments, 3400, 179);
																   
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('MK-4', @personal, @throwables, 900, 84);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Pink Quickflare', @personal, @throwables, 2200, 6);
																   
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Beacon Dark Grey', @armour, @undersuits, 23000, 300);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Beacon White', @armour, @undersuits, 23000, 30);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('FBL-8U Imperial Red', @armour, @undersuits, 23000, 375);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Venture Black/Red', @armour, @undersuits, 23000, 300);
																   
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Balor HCH', @armour, @helmets, 19000, 1591);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Defiance', @armour, @helmets, 19000, 1833);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Morningstar', @armour, @helmets, 17000, 1081);
																   
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('ADP Grey', @armour, @core,	55000,	2739);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('ADP Hurston Ed', @armour, @core, 55000, 1);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('ADP Imperial', @armour, @core,	55000, 1707);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('ADP Orange', @armour,@core, 55000, 1707);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('ADP Purple', @armour,@core,55000, 2729);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('ADP Red', @armour,@core,55000, 2322);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('ADP White', @armour,@core,55000, 2320);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('ADP-MK4', @armour,@core,55000, 2113);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('ADP-MK4 Justified', @armour,@core,55000, 1);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('ADP-MK4 Woodland', @armour,@core,55000, 2679);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Aril', @armour,@core,42000, 1550);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Aril Hazard', @armour,@core,42000, 1550);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Artimex', @armour,@core,42000, 1403);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Citadel', @armour,@core,55000, 1745);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Citadel Roughshod', @armour,@core,55000, 1);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Clash', @armour,@core,42000, 1198);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('DCP Armour Camo', @armour,@core,55000, 4188);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Defiance Firestarter', @armour,@core,55000, 1951);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Defiance Tactical', @armour,@core,55000, 1951);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Dustup Tactical', @armour,@core,42000, 1287);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Inquisitor', @armour,@core,42000, 1207);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Morozov-SH', @armour,@core,55000, 2876);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Morozov-SH Iceflow', @armour,@core, 55000, 1);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Morozov-SH Redshift', @armour,@core, 55000, 4978);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Morozov-SH Spitfire', @armour,@core, 55000, 1);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('ORC-MKV', @armour,@core,42000, 960);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('ORC-MKV Crusader Ed', @armour,@core,42000, 960);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('ORC-MKV Desert', @armour,@core,42000, 960);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('ORC-MKV Hurston Ed', @armour,@core,42000, 1);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('ORC-MKV Imperial', @armour,@core,42000, 1534);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('ORC-MKV Purple', @armour,@core,42000, 1304);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('ORC-MKV Sienna', @armour,@core,42000, 1534);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('ORC-MKV Yellow', @armour,@core,42000, 960);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('ORC-MKX Xenothreat V2', @armour,@core,42000, 1307);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('ORC-MKX Autumn', @armour,@core,42000, 1307);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('ORC-MKX Justified', @armour,@core,42000, 1);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('PAB-1 Dark Red', @armour,@core,34000, 730);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('PAB-1 Grey', @armour,@core,34000, 456);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('Strata Core Crusader Ed', @armour,@core, 42000, 3216);
																   
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('ADP Arms Crusader Ed', @armour, @arms, 16000, 467);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('ADP Arms Hurston Ed', @armour, @arms, 16000,	1);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('AFP Arms Olive', @armour, @arms, 16000,	635);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('ADP Arms Purple', @armour, @arms, 16000,	747);
INSERT INTO [dbo].[Loot] (ItemName, ItemTypeNameId, SubItemTypeNameId, SCUSize, CargoSaleValue) VALUES ('ADP Arms Sienna', @armour, @arms, 16000,	747);