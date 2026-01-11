TRUNCATE TABLE [dbo].[Vehicles];

DECLARE @RC int 
DECLARE @Id int 
DECLARE @VehicleName varchar(40) = 'APOLLO MEDIVAC';
DECLARE @Manufacturer varchar(60) = 'Roberts Space Industries'
DECLARE @VehicleRole varchar(40) = 'Medical'
DECLARE @Career varchar(40) = 'Support'
DECLARE @Size char(4) = 'S5'
DECLARE @CrewSizeMin int = 1 
DECLARE @CrewSizeMax int = 3
DECLARE @ScmSpeed int = 175
DECLARE @ScmBoostForward int = 340
DECLARE @ScmBoostBackward int = 180
DECLARE @NavMax int = 1000
DECLARE @Pitch int = 27
DECLARE @Yaw int = 20
DECLARE @Roll int = 65
DECLARE @BoostedPitch int = 32
DECLARE @BoostedYaw int = 24
DECLARE @BoostedRoll int = 78
DECLARE @PowerConsumption int = 4
DECLARE @CMDecoyCount int = 48
DECLARE @CMNoiseCount int = 5
DECLARE @HitPoints int = 1222700
DECLARE @CargoSize int = 32
DECLARE @VehicleLength float = 73
DECLARE @VehicleWidth float = 54
DECLARE @VehicleHeight float = 14
DECLARE @VehicleMass int = 630456
DECLARE @HydrogenTank float = 63
DECLARE @QuantiumTank float = 4.5
DECLARE @ClaimTimeInSeconds int = 18*60+10
DECLARE @ExpediteTimeInSeconds int = 4*60+33
DECLARE @ExpediteCost int = 9370
DECLARE @Pledged bit = 1
DECLARE @InGame bit = 0


EXECUTE @RC = [dbo].[UpsertVehicle] 
   @Id
  ,@VehicleName
  ,@Manufacturer
  ,@VehicleRole
  ,@Career
  ,@Size
  ,@CrewSizeMin
  ,@CrewSizeMax
  ,@ScmSpeed
  ,@ScmBoostForward
  ,@ScmBoostBackward
  ,@NavMax
  ,@Pitch
  ,@Yaw
  ,@Roll
  ,@BoostedPitch
  ,@BoostedYaw
  ,@BoostedRoll
  ,@PowerConsumption
  ,@CMDecoyCount
  ,@CMNoiseCount
  ,@HitPoints
  ,@CargoSize
  ,@VehicleLength
  ,@VehicleWidth
  ,@VehicleHeight
  ,@VehicleMass
  ,@HydrogenTank
  ,@QuantiumTank
  ,@ClaimTimeInSeconds
  ,@ExpediteTimeInSeconds
  ,@ExpediteCost
  ,@Pledged
  ,@InGame
GO


DECLARE @RC INT = null
DECLARE @Id INT = NULL 
DECLARE @VehicleName varchar(40) = 'Pulse';
DECLARE @Manufacturer varchar(60) = 'Mirai'
DECLARE @VehicleRole varchar(40) = 'Combat'
DECLARE @Career varchar(40) = 'Ground'
DECLARE @Size char(4)= 'S1'
DECLARE @CrewSizeMin int = 1 
DECLARE @CrewSizeMax int = 1
DECLARE @ScmSpeed int = 204
DECLARE @ScmBoostForward int = 284
DECLARE @ScmBoostBackward int = 124
DECLARE @NavMax int = 561
DECLARE @Pitch int = 84
DECLARE @Yaw int = 84
DECLARE @Roll int = 135
DECLARE @BoostedPitch int = 101
DECLARE @BoostedYaw int = 101
DECLARE @BoostedRoll int = 162
DECLARE @PowerConsumption int = 2
DECLARE @CMDecoyCount int = 0
DECLARE @CMNoiseCount int = 0
DECLARE @HitPoints int = 1150
DECLARE @CargoSize INT = 0
DECLARE @VehicleLength float = 1.5
DECLARE @VehicleWidth float = 3.5
DECLARE @VehicleHeight float = 2.5
DECLARE @VehicleMass INT= 2140
DECLARE @HydrogenTank float = 0.6
DECLARE @QuantiumTank float = 0
DECLARE @ClaimTimeInSeconds INT = 9
DECLARE @ExpediteTimeInSeconds INT = 3
DECLARE @ExpediteCost INT = 75
DECLARE @Pledged bit = 0
DECLARE @InGame bit = 1

EXECUTE @RC = [dbo].[UpsertVehicle] 
   @Id
  ,@VehicleName
  ,@Manufacturer
  ,@VehicleRole
  ,@Career
  ,@Size
  ,@CrewSizeMin
  ,@CrewSizeMax
  ,@ScmSpeed
  ,@ScmBoostForward
  ,@ScmBoostBackward
  ,@NavMax
  ,@Pitch
  ,@Yaw
  ,@Roll
  ,@BoostedPitch
  ,@BoostedYaw
  ,@BoostedRoll
  ,@PowerConsumption
  ,@CMDecoyCount
  ,@CMNoiseCount
  ,@HitPoints
  ,@CargoSize
  ,@VehicleLength
  ,@VehicleWidth
  ,@VehicleHeight
  ,@VehicleMass
  ,@HydrogenTank
  ,@QuantiumTank
  ,@ClaimTimeInSeconds
  ,@ExpediteTimeInSeconds
  ,@ExpediteCost
  ,@Pledged
  ,@InGame
GO

DECLARE @RC INT = null
DECLARE @Id INT = NULL 
DECLARE @VehicleName VARCHAR(40) = 'Starlancer MAX';
DECLARE @Manufacturer VARCHAR(60)  = 'MISC'
DECLARE @VehicleRole VARCHAR(40) = 'Medium Freight'
DECLARE @Career VARCHAR(40) = 'Transporter'
DECLARE @Size CHAR(4) = 'S5'
DECLARE @CrewSizeMin INT = 1
DECLARE @CrewSizeMax INT = 4
DECLARE @ScmSpeed INT = 160
DECLARE @ScmBoostForward INT = 325
DECLARE @ScmBoostBackward INT = 165
DECLARE @NavMax INT = 990
DECLARE @Pitch INT = 31
DECLARE @Yaw INT = 31
DECLARE @Roll INT = 65
DECLARE @BoostedPitch INT = 37
DECLARE @BoostedYaw INT = 37
DECLARE @BoostedRoll INT = 78
DECLARE @PowerConsumption INT = 6
DECLARE @CMDecoyCount INT = 100
DECLARE @CMNoiseCount INT = 60
DECLARE @HitPoints INT = 84200
DECLARE @CargoSize INT = 224
DECLARE @VehicleLength float = 60
DECLARE @VehicleWidth float = 390
DECLARE @VehicleHeight float = 20
DECLARE @VehicleMass INT = 498071
DECLARE @HydrogenTank float = 50
DECLARE @QuantiumTank float = 3.6
DECLARE @ClaimTimeInSeconds INT = 12*60+19
DECLARE @ExpediteTimeInSeconds INT = 3*60+4
DECLARE @ExpediteCost INT = 5190
DECLARE @Pledged BIT = 1
DECLARE @InGame BIT = 0

EXECUTE @RC = [dbo].[UpsertVehicle] 
   @Id
  ,@VehicleName
  ,@Manufacturer
  ,@VehicleRole
  ,@Career
  ,@Size
  ,@CrewSizeMin
  ,@CrewSizeMax
  ,@ScmSpeed
  ,@ScmBoostForward
  ,@ScmBoostBackward
  ,@NavMax
  ,@Pitch
  ,@Yaw
  ,@Roll
  ,@BoostedPitch
  ,@BoostedYaw
  ,@BoostedRoll
  ,@PowerConsumption
  ,@CMDecoyCount
  ,@CMNoiseCount
  ,@HitPoints
  ,@CargoSize
  ,@VehicleLength
  ,@VehicleWidth
  ,@VehicleHeight
  ,@VehicleMass
  ,@HydrogenTank
  ,@QuantiumTank
  ,@ClaimTimeInSeconds
  ,@ExpediteTimeInSeconds
  ,@ExpediteCost
  ,@Pledged
  ,@InGame
GO
