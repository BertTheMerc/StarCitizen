IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Erkul')
    EXEC('CREATE SCHEMA Erkul');
GO




IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Erkul].[DamageProfile]') AND type in (N'U'))
DROP TABLE [Erkul].[DamageProfile]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Erkul].[Weapon]') AND type in (N'U'))
DROP TABLE [Erkul].[Weapon]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Erkul].[Missile]') AND type in (N'U'))
DROP TABLE [Erkul].[Missile]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Erkul].[Bomb]') AND type in (N'U'))
DROP TABLE [Erkul].[Bomb]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Erkul].[EMP]') AND type in (N'U'))
DROP TABLE [Erkul].[EMP]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Erkul].[QED]') AND type in (N'U'))
DROP TABLE [Erkul].[QED]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Erkul].[MiningLaser]') AND type in (N'U'))
DROP TABLE [Erkul].[MiningLaser]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Erkul].[TrackerBeam]') AND type in (N'U'))
DROP TABLE [Erkul].[TrackerBeam]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Erkul].[Cooler]') AND type in (N'U'))
DROP TABLE [Erkul].[Cooler]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Erkul].[QuantumDrive]') AND type in (N'U'))
DROP TABLE [Erkul].[QuantumDrive]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Erkul].[PowerPlant]') AND type in (N'U'))
DROP TABLE [Erkul].[PowerPlant]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Erkul].[Shield]') AND type in (N'U'))
DROP TABLE [Erkul].[Shield]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Erkul].[Component]') AND type in (N'U'))
DROP TABLE [Erkul].[Component]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Erkul].[Manufacturer]') AND type in (N'U'))
DROP TABLE [Erkul].[Manufacturer]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Erkul].[ComponentCategory]') AND type in (N'U'))
DROP TABLE [Erkul].[ComponentCategory]
GO





CREATE TABLE Erkul.Manufacturer
(
    ManufacturerId     INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Erkul_Manufacturer PRIMARY KEY,
    ManufacturerName   NVARCHAR(200) NOT NULL,
    ManufacturerCode   NVARCHAR(50) NULL,
    CONSTRAINT UQ_Erkul_Manufacturer UNIQUE (ManufacturerName)
);
GO

CREATE TABLE Erkul.ComponentCategory
(
    CategoryId         INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Erkul_ComponentCategory PRIMARY KEY,
    CategoryName       NVARCHAR(100) NOT NULL,
    CONSTRAINT UQ_Erkul_ComponentCategory UNIQUE (CategoryName)
);
GO

CREATE TABLE Erkul.Component
(
    ComponentId                INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Erkul_Component PRIMARY KEY,
    ComponentName              NVARCHAR(200) NOT NULL,
    ManufacturerId             INT NOT NULL,
    CategoryId                 INT NOT NULL,
    Size                       INT NULL,
    Class                      NVARCHAR(50) NULL,
    Grade                      CHAR(1) NULL,
    WeaponType                 NVARCHAR(100) NULL,
    TrackingSignalType         NVARCHAR(100) NULL,
    Health                     DECIMAL(19,4) NULL,
    Price                      DECIMAL(19,4) NULL,
    DistortionShutdownDmg      DECIMAL(19,4) NULL,
    DistortionDecayDelay       DECIMAL(19,4) NULL,
    DistortionDecayRate        DECIMAL(19,4) NULL,
    DistortionRecoveryRatio    DECIMAL(19,4) NULL,
    DistortionWarningRatio     DECIMAL(19,4) NULL,
    SourceFile                 NVARCHAR(255) NULL,
    SourceRowNumber            INT NULL,
    SCUSize                    INT NULL,
    SalePrice                  INT NULL,
    CreatedAt                  DATETIME2(0) NOT NULL CONSTRAINT DF_Erkul_Component_CreatedAt DEFAULT SYSUTCDATETIME(),
    CONSTRAINT FK_Erkul_Component_Manufacturer FOREIGN KEY (ManufacturerId) REFERENCES Erkul.Manufacturer(ManufacturerId),
    CONSTRAINT FK_Erkul_Component_Category FOREIGN KEY (CategoryId) REFERENCES Erkul.ComponentCategory(CategoryId)
    --,
    --CONSTRAINT UQ_Erkul_Component UNIQUE (ComponentName, ManufacturerId, CategoryId, ISNULL(Size, -1), ISNULL(Class, ''), ISNULL(Grade, ''), ISNULL(WeaponType, ''), ISNULL(TrackingSignalType, ''))
);
GO

CREATE INDEX IX_Erkul_Component_Category ON Erkul.Component(CategoryId, ComponentName);
CREATE INDEX IX_Erkul_Component_Manufacturer ON Erkul.Component(ManufacturerId, ComponentName);
GO


CREATE TABLE Erkul.DamageProfile
(
    ComponentId                INT NOT NULL CONSTRAINT PK_Erkul_DamageProfile PRIMARY KEY,
    DamageTotal                DECIMAL(19,4) NULL,
    DamageBiochemical          DECIMAL(19,4) NULL,
    DamageDistortion           DECIMAL(19,4) NULL,
    DamageEnergy               DECIMAL(19,4) NULL,
    DamagePhysical             DECIMAL(19,4) NULL,
    DamageStun                 DECIMAL(19,4) NULL,
    DamageThermal              DECIMAL(19,4) NULL,
    AlphaMin                   DECIMAL(19,4) NULL,
    AlphaMax                   DECIMAL(19,4) NULL,
    ChargedDamageMultiplier    DECIMAL(19,4) NULL,
    ExplosionRadius            DECIMAL(19,4) NULL,
    ExplosionRadiusMin         DECIMAL(19,4) NULL,
    ExplosionRadiusMax         DECIMAL(19,4) NULL,
    CONSTRAINT FK_Erkul_DamageProfile_Component FOREIGN KEY (ComponentId) REFERENCES Erkul.Component(ComponentId)
);
GO



CREATE TABLE Erkul.Weapon
(
    ComponentId                        INT NOT NULL CONSTRAINT PK_Erkul_Weapon PRIMARY KEY,
    BurstDPS                           DECIMAL(19,4) NULL,
    PenetrationDistance                DECIMAL(19,4) NULL,
    PenetrationNearRadius              DECIMAL(19,4) NULL,
    PenetrationFarRadius               DECIMAL(19,4) NULL,
    PowerConsumption                   DECIMAL(19,4) NULL,
    MaxAmmos                           DECIMAL(19,4) NULL,
    AmmosRegen                         DECIMAL(19,4) NULL,
    Overheat                           DECIMAL(19,4) NULL,
    FireRate                           DECIMAL(19,4) NULL,
    TotalDamageDealt                   DECIMAL(19,4) NULL,
    TotalDealtTime                     DECIMAL(19,4) NULL,
    FullChargeFireRate                 DECIMAL(19,4) NULL,
    WeaponRange                        DECIMAL(19,4) NULL,
    Speed                              DECIMAL(19,4) NULL,
    ChargeTime                         DECIMAL(19,4) NULL,
    FireOnlyOnFullCharge               BIT NULL,
    FireAutomaticallyOnFullCharge      BIT NULL,
    PelletsPerShot                     DECIMAL(19,4) NULL,
    RegenCooldown                      DECIMAL(19,4) NULL,
    SpreadFirstAttack                  DECIMAL(19,4) NULL,
    SpreadAttack                       DECIMAL(19,4) NULL,
    SpreadMin                          DECIMAL(19,4) NULL,
    SpreadMax                          DECIMAL(19,4) NULL,
    SpreadDecay                        DECIMAL(19,4) NULL,
    CONSTRAINT FK_Erkul_Weapon_Component FOREIGN KEY (ComponentId) REFERENCES Erkul.Component(ComponentId)
);
GO


CREATE TABLE Erkul.Missile
(
    ComponentId                INT NOT NULL CONSTRAINT PK_Erkul_Missile PRIMARY KEY,
    ClusterCount               DECIMAL(19,4) NULL,
    Speed                      DECIMAL(19,4) NULL,
    ArmTime                    DECIMAL(19,4) NULL,
    LockingAngle               DECIMAL(19,4) NULL,
    LockTime                   DECIMAL(19,4) NULL,
    LockRangeMin               DECIMAL(19,4) NULL,
    LockRangeMax               DECIMAL(19,4) NULL,
    IgniteTime                 DECIMAL(19,4) NULL,
    CONSTRAINT FK_Erkul_Missile_Component FOREIGN KEY (ComponentId) REFERENCES Erkul.Component(ComponentId)
);
GO


CREATE TABLE Erkul.Bomb
(
    ComponentId                INT NOT NULL CONSTRAINT PK_Erkul_Bomb PRIMARY KEY,
    ArmTime                    DECIMAL(19,4) NULL,
    IgniteTime                 DECIMAL(19,4) NULL,
    CONSTRAINT FK_Erkul_Bomb_Component FOREIGN KEY (ComponentId) REFERENCES Erkul.Component(ComponentId)
);
GO


CREATE TABLE Erkul.EMP
(
    ComponentId                INT NOT NULL CONSTRAINT PK_Erkul_EMP PRIMARY KEY,
    Damage                     DECIMAL(19,4) NULL,
    PowerConsumption           DECIMAL(19,4) NULL,
    EmpRadiusMin               DECIMAL(19,4) NULL,
    EmpRadiusMax               DECIMAL(19,4) NULL,
    ChargeTime                 DECIMAL(19,4) NULL,
    UnleashTime                DECIMAL(19,4) NULL,
    Cooldown                   DECIMAL(19,4) NULL,
    CONSTRAINT FK_Erkul_EMP_Component FOREIGN KEY (ComponentId) REFERENCES Erkul.Component(ComponentId)
);
GO


CREATE TABLE Erkul.QED
(
    ComponentId                    INT NOT NULL CONSTRAINT PK_Erkul_QED PRIMARY KEY,
    JammerRange                    DECIMAL(19,4) NULL,
    SnareRadius                    DECIMAL(19,4) NULL,
    JammerGreenZoneCheckRange      DECIMAL(19,4) NULL,
    SnareGreenZoneCheckRadius      DECIMAL(19,4) NULL,
    PowerConsumption               DECIMAL(19,4) NULL,
    SnareChargeTime                DECIMAL(19,4) NULL,
    SnareActivationTime            DECIMAL(19,4) NULL,
    SnareDisperseChargeTime        DECIMAL(19,4) NULL,
    SnareDischargeTime             DECIMAL(19,4) NULL,
    SnareCooldownTime              DECIMAL(19,4) NULL,
    CONSTRAINT FK_Erkul_QED_Component FOREIGN KEY (ComponentId) REFERENCES Erkul.Component(ComponentId)
);
GO


CREATE TABLE Erkul.MiningLaser
(
    ComponentId                INT NOT NULL CONSTRAINT PK_Erkul_MiningLaser PRIMARY KEY,
    OutputPowerPerSecond       DECIMAL(19,4) NULL,
    GadgetSlots                DECIMAL(19,4) NULL,
    PowerConsumption           DECIMAL(19,4) NULL,
    FullDamageRange            DECIMAL(19,4) NULL,
    ZeroDamageRange            DECIMAL(19,4) NULL,
    ThrottleLerpSpeed          DECIMAL(19,4) NULL,
    Resistance                 DECIMAL(19,4) NULL,
    LaserInstability           DECIMAL(19,4) NULL,
    OptimalChargeSize          DECIMAL(19,4) NULL,
    OptimalChargeRate          DECIMAL(19,4) NULL,
    InertMaterials             DECIMAL(19,4) NULL,
    CONSTRAINT FK_Erkul_MiningLaser_Component FOREIGN KEY (ComponentId) REFERENCES Erkul.Component(ComponentId)
);
GO


CREATE TABLE Erkul.TrackerBeam
(
    ComponentId                INT NOT NULL CONSTRAINT PK_Erkul_TrackerBeam PRIMARY KEY,
    MaxForce                   DECIMAL(19,4) NULL,
    MinForce                   DECIMAL(19,4) NULL,
    PowerConsumption           DECIMAL(19,4) NULL,
    MinDistance                DECIMAL(19,4) NULL,
    MaxDistance                DECIMAL(19,4) NULL,
    FullStrengthDistance       DECIMAL(19,4) NULL,
    MaxAngle                   DECIMAL(19,4) NULL,
    SafeRangeValueFactor       DECIMAL(19,4) NULL,
    TetherBreakTime            DECIMAL(19,4) NULL,
    VolumeForceCoef            DECIMAL(19,4) NULL,
    CONSTRAINT FK_Erkul_TrackerBeam_Component FOREIGN KEY (ComponentId) REFERENCES Erkul.Component(ComponentId)
);
GO


CREATE TABLE Erkul.QuantumDrive
(
    ComponentId                    INT NOT NULL CONSTRAINT PK_Erkul_QuantumDrive PRIMARY KEY,
    MaxSpeedKmPerSecond            DECIMAL(19,4) NULL,
    MaxSpeedC                      DECIMAL(19,8) NULL,
    PowerConsumption               DECIMAL(19,4) NULL,
    QuantumFuelRequirement         DECIMAL(19,4) NULL,
    Efficiency                     DECIMAL(19,4) NULL,
    SplineMaxSpeedKmPerSecond      DECIMAL(19,4) NULL,
    StageOneAcceleration           DECIMAL(19,4) NULL,
    StageTwoAcceleration           DECIMAL(19,4) NULL,
    SpoolUpTime                    DECIMAL(19,4) NULL,
    CooldownTime                   DECIMAL(19,4) NULL,
    CalibrationDelay               DECIMAL(19,4) NULL,
    CalibrationRate                DECIMAL(19,4) NULL,
    CalibrationMin                 DECIMAL(19,4) NULL,
    CalibrationMax                 DECIMAL(19,4) NULL,
    DisconnectRange                DECIMAL(19,4) NULL,
    InterdictionEffectTime         DECIMAL(19,4) NULL,
    EMSignature                    DECIMAL(19,4) NULL,
    CONSTRAINT FK_Erkul_QuantumDrive_Component FOREIGN KEY (ComponentId) REFERENCES Erkul.Component(ComponentId)
);
GO


CREATE TABLE Erkul.Cooler
(
    ComponentId                    INT NOT NULL CONSTRAINT PK_Erkul_Cooler PRIMARY KEY,
    CoolingGeneration              DECIMAL(19,4) NULL,
    PowerSegmentConsumption        DECIMAL(19,4) NULL,
    EMSignature                    DECIMAL(19,4) NULL,
    IRSignature                    DECIMAL(19,4) NULL,
    CONSTRAINT FK_Erkul_Cooler_Component FOREIGN KEY (ComponentId) REFERENCES Erkul.Component(ComponentId)
);
GO


CREATE TABLE Erkul.PowerPlant
(
    ComponentId                    INT NOT NULL CONSTRAINT PK_Erkul_PowerPlant PRIMARY KEY,
    PowerGeneration                DECIMAL(19,4) NULL,
    EMMax                          DECIMAL(19,4) NULL,
    CONSTRAINT FK_Erkul_PowerPlant_Component FOREIGN KEY (ComponentId) REFERENCES Erkul.Component(ComponentId)
);
GO



CREATE TABLE Erkul.Shield
(
    ComponentId                        INT NOT NULL CONSTRAINT PK_Erkul_Shield PRIMARY KEY,
    PoolHP                             DECIMAL(19,4) NULL,
    MaxShieldGeneration                DECIMAL(19,4) NULL,
    MinRegenTimeZeroToFull             DECIMAL(19,4) NULL,
    PowerConsumption                   DECIMAL(19,4) NULL,
    DamagedRegenDelay                  DECIMAL(19,4) NULL,
    DownedRegenDelay                   DECIMAL(19,4) NULL,
    PhysicalResistanceMin              DECIMAL(19,4) NULL,
    PhysicalResistanceMax              DECIMAL(19,4) NULL,
    EnergyResistanceMin                DECIMAL(19,4) NULL,
    EnergyResistanceMax                DECIMAL(19,4) NULL,
    DistortionResistanceMin            DECIMAL(19,4) NULL,
    DistortionResistanceMax            DECIMAL(19,4) NULL,
    PhysicalAbsorptionMin              DECIMAL(19,4) NULL,
    PhysicalAbsorptionMax              DECIMAL(19,4) NULL,
    EnergyAbsorptionMin                DECIMAL(19,4) NULL,
    EnergyAbsorptionMax                DECIMAL(19,4) NULL,
    DistortionAbsorptionMin            DECIMAL(19,4) NULL,
    DistortionAbsorptionMax            DECIMAL(19,4) NULL,
    EMSignature                        DECIMAL(19,4) NULL,
    CONSTRAINT FK_Erkul_Shield_Component FOREIGN KEY (ComponentId) REFERENCES Erkul.Component(ComponentId)
);
GO

INSERT INTO Erkul.ComponentCategory (CategoryName)
SELECT v.CategoryName
FROM (VALUES
    ('Weapon'),
    ('Missile'),
    ('Bomb'),
    ('EMP'),
    ('QED'),
    ('Mining Laser'),
    ('Tracker Beam'),
    ('Quantum Drive'),
    ('Cooler'),
    ('Power Plant'),
    ('Shield')
) v(CategoryName)
WHERE NOT EXISTS
(
    SELECT 1
    FROM Erkul.ComponentCategory c
    WHERE c.CategoryName = v.CategoryName
);
GO
