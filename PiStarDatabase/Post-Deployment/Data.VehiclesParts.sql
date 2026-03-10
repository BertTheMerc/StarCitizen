TRUNCATE TABLE [dbo].[VehiclesPartsType]
TRUNCATE TABLE [dbo].[VehiclesPartsSubItemType]
TRUNCATE TABLE [dbo].[VehiclesParts]

INSERT INTO [dbo].[VehiclesPartsType] (ShipPartTypeName) VALUES ('Weapons');
DECLARE @Weapons INT = @@IDENTITY;

INSERT INTO [dbo].[VehiclesPartsSubItemType] (VehiclePartsTypeId, VehiclePartsSubItemType) VALUES (@Weapons, 'Ballistic Cannon');
DECLARE @BC INT = @@IDENTITY;
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, '10-Series Greatsword', 'KnightBridge Arms', 'KBAR', '', '', 2, 0,0,0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, '11-Series Broadsword', 'KnightBridge Arms', 'KBAR', '', '', 3, 0,0,0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, '9-Series Longsword', 'KnightBridge Arms', 'KBAR', '', '', 1, 0,0,0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'C-788', 'Behring', 'BEHR', '', '', 4, 0,0,0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'Conqueror-7', 'Behring', 'BEHR', '', '', 7, 0,0,0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'CVSA', 'Behring', 'BEHR', '', '', 2, 0,0,0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'Deadbolt I', 'Esperia', 'ESPR', '', '', 1, 0,0,0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'Deadbolt II', 'Esperia', 'ESPR', '', '', 2, 0,0,0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'Deadbolt III', 'Esperia', 'ESPR', '', '', 3, 0,0,0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'Deadbolt IV', 'Esperia', 'ESPR', '', '', 4, 0,0,0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'Deadbolt V', 'Esperia', 'ESPR', '', '', 5, 0,0,0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'Deadbolt VI', 'Esperia', 'ESPR', '', '', 6, 0,0,0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'Destroyer Mass Driver', 'Klaus & Werner', 'KLWE', '', '', 10, 0,0,0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'Leonids', 'Roberts Space Industries', 'RSI', '', '', 5, 0,0,0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'Maris', 'Roberts Space Industries', 'RSI', '', '', 6, 0,0,0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'RSI Medusa', 'Roberts Space Industries', 'RSI', '', '', 8, 0,0,0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'Salyer', 'Hurston Dynamics', 'HRST', '', '', 5, 0,0,0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'Sledge I Mass Driver', 'Klaus & Werner', 'KLWE', '', '', 1, 0,0,0);	 
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'Sledge II Mass Driver', 'Klaus & Werner', 'KLWE', '', '', 2, 0,0,0);	 
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'Sledge III Mass Driver', 'Klaus & Werner', 'KLWE', '', '', 3, 0,0,0);	 
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BC, 'Strife Mass Driver', 'Apocalypse Arms', 'APAR', '', '', 2, 0,0,0);	


INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Weapons, 'Ballistic Gatling');
DECLARE @BG INT = @@IDENTITY;
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BG, 'TMSB-5 Gatling','Behring', 'BEHR',	'', '', 4, 115330,0,0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BG, 'Tigerstrike T-19P', 'Kruger Intergalatic','KRIG', '','', 2, 12896, 0, 0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BG, 'SF7B', 'Behring','BEHR', '', '', 7, 0, 0, 0)
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BG, 'Scorpion GT-215', 'Gallenson Tactical Systems', 'GATS', '', '', 2, 12494, 0, 0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BG, 'Revenant', 'Apocalypse Arms', 'APAR', '', '', 4, 56955, 0, 0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BG, 'Relentless L-21', 'Kruger Intergalatic', 'KRIG', '', '', 4, 0, 0, 0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BG, 'NV57', 'Behring', 'BEHR','', '', 5, 121740, 0, 0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BG, 'MRX "Torrent"', 'Behring', 'BEHR', '', '',	1, 0, 0, 0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BG, 'Mantis GT-220', 'Gallenson Tactical Systems', 'GATS', '', '', 3, 28116, 0, 0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BG, 'Draugar', 'Apocalypse Arms',  'APAR', '', '', 	6, 300284, 0, 0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BG, 'Breakneck S4',	'Grey''s Market', 'GREY', '', '', 4, 0, 0, 0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BG, 'AD6B', 'Behring', 'BEHR', '', '', 	6, 273910, 0, 0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BG, 'AD5B', 'Behring', 'BEHR', '', '', 	5, 121735, 0, 0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BG, 'AD4B', 'Behring', 'BEHR', '', '', 	4, 54105, 0, 0);

INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Weapons, 'Ballistic Repeater');
DECLARE @BR INT = @@IDENTITY;

INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BR, 'SW16BR3 "Shredder"', 'Behring', 'BEHR', '', '', 3, 37566, 0 ,0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BR, 'SW16BR2 "Sawbuck"', 'Behring', 'BEHR', '', '', 2, 16695, 0, 0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BR, 'SW16BR1 "Buzzsaw"', 'Behring', 'BEHR', '', '', 1, 7125, 0, 0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BR, 'BRVS', 'Behring' ,'BEHR', '', '', 2, 16030, 0, 0);

INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Weapons, 'Ballistic Scattergun');
DECLARE @BS INT = @@IDENTITY;

INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BS, 'Predator', 'Apocalypse Arms', 'APAR', '', '',	3, 50625, 0, 0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BS, 'Hellion', 'Apocalypse Arms', 'APAR', '', '', 2, 22500, 0, 0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @BS, 'Havoc', 'Apocalypse Arms','APAR', '', '', 1, 10000, 0, 0);
	
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Weapons, 'Distortion Cannon');	
DECLARE @DC INT = @@IDENTITY;


INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @DC, 'Suckerpunch-XL', 'Joker Engineering', 'JOKR', '', '', 3, 94920, 0, 0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @DC, 'Suckerpunch-L',  'Joker Engineering', 'JOKR', '', '', 2, 42190, 0, 0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @DC, 'Suckerpunch',  'Joker Engineering', 'JOKR', '', '', 1, 18750, 0, 0);
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @DC, 'EVSD', 'Behring', 'BEHR', '', '', 2, 40080, 0, 0);


INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Weapons, 'Distortion Repeater');	
DECLARE @DR INT = @@IDENTITY;


INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @DR, 'DR Model-XJ3', 'Associated Science and Development', 'ASD', '', '', 3,	65495, 0, 0)
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @DR, 'DR Model-XJ2', 'Associated Science and Development', 'ASD', '', '', 2, 29110, 0, 0)
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @DR, 'DR Model-XJ1', 'Associated Science and Development', 'ASD', '', '', 1, 12940, 0, 0)
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @DR, 'ATVS', 'Behring', 'BEHR', '', '', 2, 24045, 0, 0)

INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Weapons, 'Distortion Scattergun');	
DECLARE @DS INT = @@IDENTITY;

INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @DS, 'Salvation',	'Preacher Armament', 'PRAR', '', '', 4, 0, 0, 0)
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @DS, 'Condemnation',	'Preacher Armament', 'PRAR', '', '', 6, 0, 0, 0)
INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @DS, 'Absolution',	'Preacher Armament', 'PRAR', '', '', 5, 0, 0, 0)


INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Weapons, 'Laser Beam');	
DECLARE @LB INT = @@IDENTITY;

INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @LB, 'Exodus-10', 'Hurston Dynamics', 'HRST', '', '', 10, 0, 0, 0);

INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Weapons, 'Laser Cannon');	
DECLARE @LC INT = @@IDENTITY;

/*
	
	SF7E	Behring (BEHR) 	Laser Cannon	7	4 721	5 150 	5 150 	10.5 	0.5 	1.1 	2.93 	25 			55 	∞ 	∞ 		3 999 	860 					0 		0 	0 	0 	0 	0 	0 	1.94 	0.025 	0.025 	0.4 	0.4 	0.05 	6 750	500 000	0	500 000	0	0.75	
	Quarreler	Kruger Intergalatic (KRIG) 	Laser Cannon	3	547	219 	219 	2.25 	0.1 	0.2 	1.73 	25 			150 	∞ 	∞ 		2 604 	1 400 					0 		0 	0 	0 	0 	0 	0 	1.76 	0.025 	0.025 	0.45 	0.45 	0.05 	2 850	500 000	0	500 000	0	0.75	
90 653
	Omnisky XVIII	Amon & Reese Co. (AMRS) 	Laser Cannon	6	1 846	738 	738 	7.5 	0.4 	0.8 	2.4 	25 			150 	∞ 	∞ 		3 597 	1 232 					0 		0 	0 	0 	0 	0 	0 	0.5 	0.025 	0.025 	0.45 	0.45 	0.05 	4 224	500 000	0	500 000	0	0.75	
891 466
	Omnisky XV	Amon & Reese Co. (AMRS) 	Laser Cannon	5	1 230	492 	492 	4.5 	0.2 	0.5 	2.1 	25 			150 	∞ 	∞ 		3 310 	1 288 					0 		0 	0 	0 	0 	0 	0 	0.5 	0.025 	0.025 	0.45 	0.45 	0.05 	2 500	500 000	0	500 000	0	0.75	
380 430
	Omnisky XII	Amon & Reese Co. (AMRS) 	Laser Cannon	4	820	328 	328 	3 	0.2 	0.3 	1.3 	25 			150 	∞ 	∞ 		2 997 	1 344 					0 		0 	0 	0 	0 	0 	0 	0.5 	0.025 	0.025 	0.45 	0.45 	0.05 	1 650	500 000	0	500 000	0	0.75	
176 093
	Omnisky VI	Amon & Reese Co. (AMRS) 	Laser Cannon	2	365	146 	146 	1.2 	0.1 	0.1 	1.2 	25 			150 	∞ 	∞ 		2 296 	1 400 					0 		0 	0 	0 	0 	0 	0 	0.5 	0.025 	0.025 	0.45 	0.45 	0.05 	850	500 000	0	500 000	0	0.75	
34 786
	Omnisky IX	Amon & Reese Co. (AMRS) 	Laser Cannon	3	547	219 	219 	2.25 	0.1 	0.2 	1.5 	25 			150 	∞ 	∞ 		2 604 	1 400 					0 		0 	0 	0 	0 	0 	0 	0.5 	0.025 	0.025 	0.45 	0.45 	0.05 	1 024	500 000	0	500 000	0	0.75	
78 262
	Omnisky III	Amon & Reese Co. (AMRS) 	Laser Cannon	1	243	97 	97 	0.9 	0.1 	0.1 	0.9 	25 			150 	∞ 	∞ 		2 002 	1 400 					0 		0 	0 	0 	0 	0 	0 	0.5 	0.025 	0.025 	0.45 	0.45 	0.5 	550	500 000	0	500 000	0	0.75	
15 461
	NN-14	maxOx (MXOX) 	Laser Cannon	2	382	153 	153 	0.34 	0.1 	0.1 	0.8 	90 			150 	∞ 	∞ 		2 296 	1 400 					0 		0 	0 	0 	0 	0 	0 	0.38 	0.025 	0.025 	0.45 	0.45 	0.05 	850	500 000	0	500 000	0	0.75	
	NN-13	maxOx (MXOX) 	Laser Cannon	1	253	101 	101 	0.28 	0.1 	0.1 	0.6 	25 			150 	∞ 	∞ 		2 002 	1 400 					0 		0 	0 	0 	0 	0 	0 	0.5 	0.025 	0.025 	0.45 	0.45 	0.05 	550	500 000	0	500 000	0	0.75	
	MVSA	Behring (BEHR) 	Laser Cannon	2	455	273 	273 	1.2 	0.1 	0.1 	1.43 	25 			100 	∞ 	∞ 		2 301 	1 300 					0 		0 	0 	0 	0 	0 	0 	1.52 	0.025 	0.025 	0.4 	0.4 	0.05 	850	500 000	0	500 000	0	0.75	
33 400
	M9A	Behring (BEHR) 	Laser Cannon	7	3 460	2 076 	2 076 	10.5 	0.5 	1.1 	2.5 	25 			100 	∞ 	∞ 		3 998 	840 					0 		0 	0 	0 	0 	0 	0 	1.62 	0.025 	0.025 	0.4 	0.4 	0.05 	6 750	500 000	0	500 000	0	0.75	
	M8A	Behring (BEHR) 	Laser Cannon	6	2 306	1 383 	1 383 	7.5 	0.4 	0.8 	2.2 	25 			100 	∞ 	∞ 		3 599 	880 					0 		0 	0 	0 	0 	0 	0 	1.54 	0.025 	0.025 	0.4 	0.4 	0.05 	4 224	500 000	0	500 000	0	0.75	
855 965
	M7A	Behring (BEHR) 	Laser Cannon	5	1 536	922 	922 	4.5 	0.2 	0.5 	1.9 	25 			100 	∞ 	∞ 		3 303 	920 					0 		0 	0 	0 	0 	0 	0 	1.47 	0.025 	0.025 	0.4 	0.4 	0.05 	2 500	500 000	0	500 000	0	0.75	
396 209
	M6A	Behring (BEHR) 	Laser Cannon	4	1 025	615 	615 	3 	0.2 	0.3 	1.6 	25 			100 	∞ 	∞ 		3 005 	960 					0 		0 	0 	0 	0 	0 	0 	1.4 	0.025 	0.025 	0.4 	0.4 	0.05 	2 000	500 000	0	500 000	0	0.75	
176 093
	M5A	Behring (BEHR) 	Laser Cannon	3	684	410 	410 	2.25 	0.1 	0.2 	1.3 	25 			100 	∞ 	∞ 		2 600 	1 000 					0 		0 	0 	0 	0 	0 	0 	1.33 	0.025 	0.025 	0.4 	0.4 	0.05 	1 024	500 000	0	500 000	0	0.75	
78 262
	M4A	Behring (BEHR) 	Laser Cannon	2	456	273 	273 	1.2 	0.1 	0.1 	1 	25 			100 	∞ 	∞ 		2 300 	1 000 					0 		0 	0 	0 	0 	0 	0 	0.75 	0.025 	0.025 	0.4 	0.4 	0.05 	850	500 000	0	500 000	0	0.75	
34 786
	M3A	Behring (BEHR) 	Laser Cannon	1	304	182 	182 	0.9 	0.1 	0.1 	0.7 	25 			100 	∞ 	∞ 		2 000 	1 000 					0 		0 	0 	0 	0 	0 	0 	0.75 	0.025 	0.025 	0.4 	0.4 	0.05 	550	500 000	0	500 000	0	0.75	
15 461
	M11A	Behring (BEHR) 	Laser Cannon	9	7 784	4 670 	4 670 	15 	0.8 	1.5 	3.1 	25 			100 	∞ 	∞ 		3 800 	760 					0 		0 	0 	0 	0 	0 	0 	1.79 	0.025 	0.025 	0.4 	0.4 	0.05 	17 300	500 000	0	500 000	0	0.75	
	M10A	Behring (BEHR) 	Laser Cannon	8	5 189	3 114 	3 114 	13.5 	0.7 	1.4 	2.8 	25 			100 	∞ 	∞ 		4 504 	800 					0 		0 	0 	0 	0 	0 	0 	1.7 	0.025 	0.025 	0.4 	0.4 	0.05 	10 810	500 000	0	500 000	0	0.75	
	Lightstrike VI	Esperia (ESPR) 	Laser Cannon	6	1 559	374 	374 	7.5 	0.4 	0.8 	2.4 	25 			250 	∞ 	∞ 		3 596 	1 584 					0 		0 	0 	0 	0 	0 	0 	1.54 	0.025 	0.025 	0.5 	0.5 	0.05 	550	500 000	0	500 000	0	0.75	
810 915
	Lightstrike V	Esperia (ESPR) 	Laser Cannon	5	1 036	249 	249 	4.5 	0.2 	0.5 	2.1 	25 			250 	∞ 	∞ 		3 295 	1 656 					0 		0 	0 	0 	0 	0 	0 	1.47 	0.025 	0.025 	0.5 	0.5 	0.05 	550	500 000	0	500 000	0	0.75	
360 405
	Lightstrike IV	Esperia (ESPR) 	Laser Cannon	4	693	166 	166 	3 	0.2 	0.3 	1.8 	25 			250 	∞ 	∞ 		3 007 	1 728 					0 		0 	0 	0 	0 	0 	0 	1.4 	0.025 	0.025 	0.5 	0.5 	0.05 	550	500 000	0	500 000	0	0.75	
160 180
	Lightstrike III	Esperia (ESPR) 	Laser Cannon	3	462	111 	111 	2.25 	0.1 	0.2 	1.5 	25 			250 	∞ 	∞ 		2 592 	1 800 					0 		0 	0 	0 	0 	0 	0 	1.33 	0.025 	0.025 	0.5 	0.5 	0.05 	550	500 000	0	500 000	0	0.75	
71 190
	Lightstrike II	Esperia (ESPR) 	Laser Cannon	2	308	74 	74 	1.2 	0.1 	0.1 	1.2 	25 			250 	∞ 	∞ 		2 304 	1 800 					0 		0 	0 	0 	0 	0 	0 	1.27 	0.025 	0.025 	0.5 	0.5 	0.05 	550	500 000	0	500 000	0	0.75	
31 640
	Lightstrike I	Esperia (ESPR) 	Laser Cannon	1	205	49 	49 	0.9 	0.1 	0.1 	0.9 	25 			250 	∞ 	∞ 		1 998 	1 800 					0 		0 	0 	0 	0 	0 	0 	1.21 	0.025 	0.025 	0.5 	0.5 	0.05 	550	500 000	0	500 000	0	0.75	
14 065
	FL-33	Kroneg (KRON) 	Laser Cannon	3	462	111 	111 	2.25 	0.1 	0.2 	1.5 	25 			250 	∞ 	∞ 		2 592 	1 800 					0 		0 	0 	0 	0 	0 	0 	1.76 	0.025 	0.025 	0.5 	0.5 	0.5 	1 024	500 000	0	500 000	0	0.75	
79 100
	FL-22	Kroneg (KRON) 	Laser Cannon	2	308	74 	74 	1.2 	0.1 	0.1 	1.2 	25 			250 	∞ 	∞ 		2 304 	1 800 					0 		0 	0 	0 	0 	0 	0 	1.68 	0.025 	0.025 	0.5 	0.5 	0.5 	850	500 000	0	500 000	0	0.75	
35 155
	FL-11	Kroneg (KRON) 	Laser Cannon	1	205	49 	49 	0.9 	0.1 	0.1 	0.9 	25 			250 	∞ 	∞ 		1 998 	1 800 					0 		0 	0 	0 	0 	0 	0 	1.6 	0.025 	0.025 	0.5 	0.5 	0.5 	550	500 000	0	500 000	0	0.75	
15 625
	'WEAK'	Vanduul (VNCL) 	Laser Cannon	1	425	73 	73 	0.9 	0.1 	0.1 	1.13 	25 			350 	∞ 	∞ 		1 998 	1 800 					0 		0 	0 	0 	0 	0 	0 	1.74 	0.025 	0.025 	0.5 	0.5 	0.05 	550	500 000	0	500 000	0	0.75	
	'WASP'	Vanduul (VNCL) 	Laser Cannon	2	520	89 	89 	1.2 	0.1 	0.1 	1.2 	25 			350 	∞ 	∞ 		2 304 	1 800 					0 		0 	0 	0 	0 	0 	0 	1.98 	0.025 	0.025 	0.5 	0.5 	0.05 	850	500 000	0	500 000	0	0.75	
	'WAR'	Vanduul (VNCL) 	Laser Cannon	5	945	567 	567 	2.4 	0.1 	0.2 	1.4 	25 			100 	∞ 	∞ 		3 478 	1 288 					0 		0 	0 	0 	0 	0 	0 	0.49 	0.025 	0.025 	0.45 	0.45 	0.05 	2 640	500 000	0	500 000	0	0.75	
*/

INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Weapons, 'Laser Gatling');	
DECLARE @LG INT = @@IDENTITY;

INSERT INTO [dbo].VehiclesParts (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, ManufacturerCode, Class, Grade, Size, Price, SCUSize, SalePrice) VALUES (@Weapons, @LG, 'Thlilye Laser', 'Aopoa', 'XIAN', '', '', 2, 0, 0 ,0)


INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Weapons, 'Laser Repeater');	
DECLARE @LR INT = @@IDENTITY;
	
	/*
	Yeng’tu	Aopoa (XIAN) 	Laser Repeater	3	456	36 	36 	0.75 	0 	0.1 	0.65 	75 			750 	∞ 	∞ 		2 592 	1 800 					0 		0 	0 	0 	0 	0 	0 	0.67 	0.022 	0.022 	0.6 	0.6 	2 	1 024	500 000	0	500 000	0	0.75	
	Tormenter S3	Grey's Market (GREY) 	Laser Repeater	3	494	40 	40 	0.75 	0 	0.1 	1 	75 			750 	∞ 	∞ 		2 592 	1 800 					0 		0 	0 	0 	0 	0 	0 	0.25 	0.022 	0.022 	0.62 	0.62 	2 	1 200	500 000	0	500 000	0	0.75	
	Reign-3	Hurston Dynamics (HRST) 	Laser Repeater	3	2 042	350 	350 	0.75 	0 	0.1 	0.86 	75 			350 	∞ 	∞ 		5 000 	1 000 					0 		0 	0 	0 	0 	0 	0 	0.8 	0.022 	0.022 	0.5 	0.5 	2 	1 024	500 000	0	500 000	0	0.75	
	NDB-30	maxOx (MXOX) 	Laser Repeater	3	713	86 	86 	1.5 	0.1 	0.2 	0.75 	75 			500 	∞ 	∞ 		2 604 	1 400 					0 		0 	0 	0 	0 	0 	0 	0.8 	0.022 	0.022 	0.55 	0.55 	2 	1 024	500 000	0	500 000	0	0.75	
	NDB-28	maxOx (MXOX) 	Laser Repeater	2	475	57 	57 	0.8 	0 	0.1 	0.6 	75 			500 	∞ 	∞ 		2 296 	1 400 					0 		0 	0 	0 	0 	0 	0 	0.76 	0.022 	0.022 	0.55 	0.55 	2 	850	500 000	0	500 000	0	0.75	
	NDB-26	maxOx (MXOX) 	Laser Repeater	1	317	38 	38 	0.6 	0 	0.1 	0.45 	75 			500 	∞ 	∞ 		2 002 	1 400 					0 		0 	0 	0 	0 	0 	0 	0.73 	0.022 	0.022 	0.55 	0.55 	2 	525	500 000	0	500 000	0	0.75	
	M2C "Swarm"	Behring (BEHR) 	Laser Repeater	1	167	10 	10 	0.3 	0 	0 	0.35 	75 			1 000 	∞ 	∞ 		1 998 	1 800 					0 		0 	0 	0 	0 	0 	0 	0.61 	0.022 	0.022 	0.1 	0.1 	2 	800	500 000	0	500 000	0	0.75	
15 700
	GVSR	Behring (BEHR) 	Laser Repeater	2	582	100 	100 	0.4 	0 	0 	0.71 	75 			350 	∞ 	∞ 		2 300 	1 000 					0 		0 	0 	0 	0 	0 	0 	0.76 	0.022 	0.022 	0.5 	0.5 	2 	850	500 000	0	500 000	0	0.75	
20 040
	CF-667 Mammoth	Klaus & Werner (KLWE) 	Laser Repeater	6	1 842	147 	147 	2.5 	0.1 	0.3 	1.2 	75 			750 	∞ 	∞ 		3 600 	1 800 					0 		0 	0 	0 	0 	0 	0 	0.93 	0.022 	0.022 	0.6 	0.6 	2 	4 224	500 000	0	500 000	0	0.75	
413 569
	CF-557 Galdereen	Klaus & Werner (KLWE) 	Laser Repeater	5	1 227	98 	98 	1.5 	0.1 	0.2 	1.05 	75 			750 	∞ 	∞ 		3 294 	1 800 					0 		0 	0 	0 	0 	0 	0 	0.88 	0.022 	0.022 	0.6 	0.6 	2 	2 640	500 000	0	500 000	0	0.75	
183 809
	CF-447 Rhino	Klaus & Werner (KLWE) 	Laser Repeater	4	818	65 	65 	1 	0.1 	0.1 	0.9 	75 			750 	∞ 	∞ 		3 006 	1 800 					0 		0 	0 	0 	0 	0 	0 	0.84 	0.022 	0.022 	0.6 	0.6 	2 	1 650	500 000	0	500 000	0	0.75	
81 694
	CF-337 Panther	Klaus & Werner (KLWE) 	Laser Repeater	3	546	44 	44 	0.75 	0 	0.1 	1 	75 			750 	∞ 	∞ 		2 592 	1 800 					0 		0 	0 	0 	0 	0 	0 	0.25 	0.022 	0.022 	0.6 	0.6 	2 	1 500	500 000	0	500 000	0	0.75	
36 308
	CF-227 Badger	Klaus & Werner (KLWE) 	Laser Repeater	2	328	26 	26 	0.4 	0 	0 	0.6 	75 			750 	∞ 	∞ 		2 304 	1 800 					0 		0 	0 	0 	0 	0 	0 	0.76 	0.022 	0.022 	0.6 	0.6 	2 	850	500 000	0	500 000	0	0.75	
16 138
	CF-117 Bulldog	Klaus & Werner (KLWE) 	Laser Repeater	1	219	17 	17 	0.3 	0 	0 	0.45 	75 			750 	∞ 	∞ 		1 998 	1 800 					0 		0 	0 	0 	0 	0 	0 	0.73 	0.022 	0.022 	0.6 	0.6 	2 	525	500 000	0	500 000	0	0.75	
7 175
	Axiom L-22	Kruger Intergalatic (KRIG) 	Laser Repeater	4	1 063	85 	85 	1 	0.1 	0.1 	1.2 	75 			750 	∞ 	∞ 		3 003 	1 650 					0 		0 	0 	0 	0 	0 	0 	0.25 	0.022 	0.022 	0.55 	0.55 	2 	1 650	500 000	0	500 000	0	0.75	
	Attrition-6	Hurston Dynamics (HRST) 	Laser Repeater	6	2 948	505 	505 	2.5 	0.1 	0.3 	1.2 	75 			350 	∞ 	∞ 		3 600 	1 000 					0 		0 	0 	0 	0 	0 	0 	0.84 	0.022 	0.022 	0.5 	0.5 	2 	4 224	500 000	0	500 000	0	0.75	
621 700
	Attrition-5	Hurston Dynamics (HRST) 	Laser Repeater	5	1 965	337 	337 	1.5 	0.1 	0.2 	1.05 	75 			350 	∞ 	∞ 		3 300 	1 000 					0 		0 	0 	0 	0 	0 	0 	0.8 	0.022 	0.022 	0.5 	0.5 	2 	2 640	500 000	0	500 000	0	0.75	
262 495
	Attrition-4	Hurston Dynamics (HRST) 	Laser Repeater	4	1 179	202 	202 	1 	0.1 	0.1 	0.9 	75 			350 	∞ 	∞ 		3 000 	1 000 					0 		0 	0 	0 	0 	0 	0 	0.76 	0.022 	0.022 	0.5 	0.5 	2 	1 650	500 000	0	500 000	0	0.75	
116 665
	Attrition-3	Hurston Dynamics (HRST) 	Laser Repeater	3	786	135 	135 	0.75 	0 	0.1 	0.75 	75 			350 	∞ 	∞ 		2 600 	1 000 					0 		0 	0 	0 	0 	0 	0 	0.73 	0.022 	0.022 	0.5 	0.5 	2 	1 024	500 000	0	500 000	0	0.75	
51 851
	Attrition-2	Hurston Dynamics (HRST) 	Laser Repeater	2	582	100 	100 	0.4 	0 	0 	0.6 	75 			350 	∞ 	∞ 		2 300 	1 000 					0 		0 	0 	0 	0 	0 	0 	0.69 	0.022 	0.022 	0.5 	0.5 	2 	850	500 000	0	500 000	0	0.75	
23 047
	Attrition-1	Hurston Dynamics (HRST) 	Laser Repeater	1	388	67 	67 	0.3 	0 	0 	0.45 	75 			350 	∞ 	∞ 		2 000 	1 000 					0 		0 	0 	0 	0 	0 	0 	0.66 	0.022 	0.022 	0.5 	0.5 	2 	524	500 000	0	500 000	0	0.75	
10 241
	Ardor-3 Salvaged	Hurston Dynamics (HRST) 	Laser Repeater	3	884	152 	152 	0.75 	0 	0.1 	0.75 	75 			350 	∞ 	∞ 		2 600 	1 000 					0 		0 	0 	0 	0 	0 	0 	0.73 	0.022 	0.022 	0.3 	0.3 	2 	1 024	500 000	0	500 000	0	0.75	
	Ardor-2 Salvaged	Hurston Dynamics (HRST) 	Laser Repeater	2	640	110 	110 	0.4 	0 	0 	0.6 	75 			350 	∞ 	∞ 		2 300 	1 000 					0 		0 	0 	0 	0 	0 	0 	0.69 	0.022 	0.022 	0.3 	0.3 	2 	850	500 000	0	500 000	0	0.75	
	Ardor-1 Salvaged	Hurston Dynamics (HRST) 	Laser Repeater	1	427	73 	73 	0.3 	0 	0 	0.45 	75 			350 	∞ 	∞ 		2 000 	1 000 					0 		0 	0 	0 	0 	0 	0 	0.66 	0.022 	0.022 	0.3 	0.3 	2 	524	500 000	0	500 000	0	0.75	
*/

INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Weapons, 'Laser Scattergun');	
DECLARE @LS INT = @@IDENTITY;
/*

	PyroBurst	Amon & Reese Co. (AMRS) 	Laser Scattergun	3	462	396 	396 	0.6 	0 	0.1 	1 	75 			70 	∞ 	∞ 		2 400 	1 200 					8 		0 	0 	396 	0 	0 	0 	0.36 	0.5 	0.45 	4 	4 	0.6 	1 550	500 000	0	500 000	0	0.75	
60 115
	Dominance-3	Hurston Dynamics (HRST) 	Laser Scattergun	3	930	1 116 	1 116 	0.6 	0 	0.1 	1 	75 			50 	∞ 	∞ 		2 000 	1 000 					8 		0 	0 	1 116 	0 	0 	0 	0.36 	0.5 	0.45 	4 	4 	0.6 	1 550	500 000	0	500 000	0	0.75	
69 137
	Dominance-2	Hurston Dynamics (HRST) 	Laser Scattergun	2	660	792 	792 	0.32 	0 	0 	0.8 	75 			50 	∞ 	∞ 		2 000 	1 000 					8 		0 	0 	792 	0 	0 	0 	0.35 	0.5 	0.45 	4 	4 	0.6 	1 550	500 000	0	500 000	0	0.75	
32 345
	Dominance-1	Hurston Dynamics (HRST) 	Laser Scattergun	1	420	504 	504 	0.24 	0 	0 	0.6 	75 			50 	∞ 	∞ 		2 000 	1 000 					8 		0 	0 	504 	0 	0 	0 	0.33 	0.5 	0.45 	4 	4 	0.6 	1 550	500 000	0	500 000	0	0.75	
13 657
*/
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Weapons, 'Plasma Cannon');	
DECLARE @PC INT = @@IDENTITY;
/*

	'WRATH'	Vanduul (VNCL) 	Plasma Cannon	5	810	972 	972 	4.5 	0.2 	0.5 	2.1 	25 			50 	∞ 	∞ 		2 795 	1 288 					0 		0 	0 	0 	0 	0 	0 	3 	0.025 	0.025 	0.45 	0.45 	0.5 	5 500	500 000	0	500 000	0	0.75	
	'WRATH'	Vanduul (VNCL) 	Plasma Cannon	5	810	972 	972 	4.5 	0.2 	0.5 	2.1 	25 			50 	∞ 	∞ 		2 795 	1 288 					0 		0 	0 	0 	0 	0 	0 	3 	0.025 	0.025 	0.45 	0.45 	0.5 	1 050	500 000	0	500 000	0	0.75	
	'WHIP'	Vanduul (VNCL) 	Plasma Cannon	2	455	273 	273 	1.2 	0.1 	0.1 	1.2 	25 			100 	∞ 	∞ 		2 300 	1 000 					0 		0 	0 	0 	0 	0 	0 	0.75 	0.025 	0.025 	0.4 	0.4 	0.05 	850	500 000	0	500 000	0	0.75	
	'WARLORD'	Vanduul (VNCL) 	Plasma Cannon	3	878	527 	527 	2.25 	0.1 	0.2 	1.5 	25 			100 	∞ 	∞ 		2 600 	1 600 					0 		0 	0 	0 	0 	0 	0 	3 	0.025 	0.025 	0.5 	0.5 	0.05 	1 024	500 000	0	500 000	0	0.75	
*/
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Weapons, 'Rocket Pod');	
DECLARE @RP INT = @@IDENTITY;
/*
	
	Yebira II	FireStorm Kinetics (FSKI) 	Rocket Pod	2	150	150 	150 	0 	0.5 	5 	0 	12 			60 	1 800 	12 		2 100 	700 					0 	4 	0 	0 	0 	0 	0 	0 		0.022 	0.022 	0 	2 	2 	750	500 000	0	500 000	0	0.75	
	Yebira I	FireStorm Kinetics (FSKI) 	Rocket Pod	1	150	150 	150 	0 	0.5 	5 	0 	6 			60 	900 	6 		2 100 	700 					0 	4 	0 	0 	0 	0 	0 	0 		0.022 	0.022 	0 	2 	2 	500	500 000	0	500 000	0	0.75	
	Liberator Ultra	Thermyte Concern (THCN) 	Rocket Pod	3	150	150 	150 	0 	0.5 	5 	0 	24 			60 	3 600 	24 		2 100 	700 					0 	4 	0 	0 	0 	0 	0 	0 		0.022 	0.022 	0 	2 	2 	1 000	500 000	0	500 000	0	0.75	
	Liberator Prime	Thermyte Concern (THCN) 	Rocket Pod	2	150	150 	150 	0 	0.5 	5 	0 	16 			60 	2 400 	16 		2 100 	700 					0 	4 	0 	0 	0 	0 	0 	0 		0.022 	0.022 	0 	2 	2 	750	500 000	0	500 000	0	0.75	
	Liberator	Thermyte Concern (THCN) 	Rocket Pod	1	150	150 	150 	0 	0.5 	5 	0 	8 			60 	1 200 	8 		2 100 	700 					0 	4 	0 	0 	0 	0 	0 	0 		0.022 	0.022 	0 	2 	2 	500	500 000	0	500 000	0	0.75	
	Jericho XL	FireStorm Kinetics (FSKI) 	Rocket Pod	3	150	150 	150 	0 	0.5 	5 	0 	18 			60 	2 700 	18 		2 100 	700 					0 	4 	0 	0 	0 	0 	0 	0 		0.022 	0.022 	0 	2 	2 	1 000	500 000	0	500 000	0	0.75	
	Jericho XL	Hurston Dynamics (HRST) 	Rocket Pod	3	150	150 	150 	0 	0.5 	5 	0 	36 			60 	5 400 	36 		2 100 	700 					0 	4 	0 	0 	0 	0 	0 	0 		0.022 	0.022 	0 	2 	2 	1 000	500 000	0	500 000	0	0.75	
	Jericho X	Hurston Dynamics (HRST) 	Rocket Pod	2	150	150 	150 	0 	0.5 	5 	0 	24 			60 	3 600 	24 		2 100 	700 					0 	4 	0 	0 	0 	0 	0 	0 		0.022 	0.022 	0 	2 	2 	750	500 000	0	500 000	0	0.75	
	Jericho	Hurston Dynamics (HRST) 	Rocket Pod	1	150	150 	150 	0 	0.5 	5 	0 	12 			60 	1 800 	12 		2 100 	700 					0 	4 	0 	0 	0 	0 	0 	0 		0.022 	0.022 	0 	2 	2 	500	500 000	0	500 000	0	0.75	
	*/
INSERT INTO [dbo].[VehiclePartsSubItemType] (VehiclePartsTypeId, ShipPartTypeName) VALUES (@Weapons, 'Tachyon Cannon');	
DECLARE @TC INT = @@IDENTITY;
	/*
	Singe-3	Banu (BANU) 	Tachyon Cannon	3	320	1 013 	1 013 	2.625 	0.1 	0.3 	2 	25 			18.9 	∞ 	∞ 	18.9 	1 500 	3 000 	1 	2.5 			1 		0 	0 	1 013 	0 	0 	0 	1.82 	0 	0 	0.1 	0.1 	0 	1 024	500 000	0	500 000	0	0.75	
	Singe-2	Banu (BANU) 	Tachyon Cannon	2	196	473 	473 	1.4 	0.1 	0.1 	1.6 	25 			24.8 	∞ 	∞ 	24.8 	1 200 	3 000 	1 	1.75 			1 		0 	0 	473 	0 	0 	0 	1.73 	0 	0 	0.1 	0.1 	0 	850	500 000	0	500 000	0	0.75	
	Singe-1	Banu (BANU) 	Tachyon Cannon	1	122	203 	203 	1.05 	0.1 	0.1 
	*/












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

--INSERT INTO [dbo].[VehicleParts] (VehiclePartsTypeId, VehiclesPartsSubItemTypeId,PartName, Manufacturer, Class, Grade, Size, Price, SCUSize, SalePrice) 

