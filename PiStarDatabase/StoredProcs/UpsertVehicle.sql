CREATE PROCEDURE dbo.UpsertVehicle
    @Id INT = NULL,   -- If provided and exists → UPDATE, otherwise INSERT

    @VehicleName VARCHAR(40),
    @Manufacturer VARCHAR(60),
    @VehicleRole VARCHAR(40),
    @Career VARCHAR(40),
    @Size CHAR(4),
    @CrewSizeMin INT,
    @CrewSizeMax INT,
    @ScmSpeed INT,
    @ScmBoostForward INT,
    @ScmBoostBackward INT,
    @NavMax INT,
    @Pitch INT,
    @Yaw INT,
    @Roll INT,
    @BoostedPitch INT,
    @BoostedYaw INT,
    @BoostedRoll INT,
    @PowerConsumption INT,
    @CMDecoyCount INT,
    @CMNoiseCount INT,
    @HitPoints INT,
    @CargoSize INT,
    @VehicleLength FLOAT,
    @VehicleWidth FLOAT,
    @VehicleHeight FLOAT,
    @VehicleMass INT,
    @HydrogenTank FLOAT,
    @QuantiumTank FLOAT,
    @ClaimTimeInSeconds INT,
    @ExpediteTimeInSeconds INT,
    @ExpediteCost INT,
    @Pledged BIT,
    @InGame BIT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        /* =========================
           VALIDATION
        ========================== */
        IF @CrewSizeMin > @CrewSizeMax
            THROW 50001, 'CrewSizeMin cannot be greater than CrewSizeMax.', 1;

        IF @CrewSizeMin < 1 OR @CrewSizeMax < 1
            THROW 50002, 'Crew sizes cannot be negative.', 1;

        IF @VehicleLength <= 0 OR @VehicleWidth <= 0 OR @VehicleHeight <= 0
            THROW 50003, 'Vehicle dimensions must be greater than zero.', 1;

        IF @VehicleMass <= 0
            THROW 50004, 'VehicleMass must be greater than zero.', 1;

        IF @ScmSpeed < 0 OR @NavMax < 0
            THROW 50005, 'Speed values cannot be negative.', 1;

        /* =========================
           UPSERT LOGIC
        ========================== */
        IF @Id IS NOT NULL AND EXISTS (SELECT 1 FROM dbo.Vehicles WHERE Id = @Id)
        BEGIN
            -- UPDATE
            UPDATE dbo.Vehicles
            SET
                VehicleName = @VehicleName,
                Manufacturer = @Manufacturer,
                VehicleRole = @VehicleRole,
                Career = @Career,
                Size = @Size,
                CrewSizeMin = @CrewSizeMin,
                CrewSizeMax = @CrewSizeMax,
                ScmSpeed = @ScmSpeed,
                ScmBoostForward = @ScmBoostForward,
                ScmBoostBackward = @ScmBoostBackward,
                NavMax = @NavMax,
                Pitch = @Pitch,
                Yaw = @Yaw,
                Roll = @Roll,
                BoostedPitch = @BoostedPitch,
                BoostedYaw = @BoostedYaw,
                BoostedRoll = @BoostedRoll,
                PowerConsumption = @PowerConsumption,
                CMDecoyCount = @CMDecoyCount,
                CMNoiseCount = @CMNoiseCount,
                HitPoints = @HitPoints,
                CargoSize = @CargoSize,
                VehicleLength = @VehicleLength,
                VehicleWidth = @VehicleWidth,
                VehicleHeight = @VehicleHeight,
                VehicleMass = @VehicleMass,
                HydrogenTank = @HydrogenTank,
                QuantiumTank = @QuantiumTank,
                ClaimTimeInSeconds = @ClaimTimeInSeconds,
                ExpediteTimeInSeconds = @ExpediteTimeInSeconds,
                ExpediteCost = @ExpediteCost,
                Pledged = @Pledged,
                InGame = @InGame
            WHERE Id = @Id;
        END
        ELSE
        BEGIN
            -- INSERT
            INSERT INTO dbo.Vehicles
            (
                VehicleName,
                Manufacturer,
                VehicleRole,
                Career,
                Size,
                CrewSizeMin,
                CrewSizeMax,
                ScmSpeed,
                ScmBoostForward,
                ScmBoostBackward,
                NavMax,
                Pitch,
                Yaw,
                Roll,
                BoostedPitch,
                BoostedYaw,
                BoostedRoll,
                PowerConsumption,
                CMDecoyCount,
                CMNoiseCount,
                HitPoints,
                CargoSize,
                VehicleLength,
                VehicleWidth,
                VehicleHeight,
                VehicleMass,
                HydrogenTank,
                QuantiumTank,
                ClaimTimeInSeconds,
                ExpediteTimeInSeconds,
                ExpediteCost,
                Pledged,
                InGame
            )
            VALUES
            (
                @VehicleName,
                @Manufacturer,
                @VehicleRole,
                @Career,
                @Size,
                @CrewSizeMin,
                @CrewSizeMax,
                @ScmSpeed,
                @ScmBoostForward,
                @ScmBoostBackward,
                @NavMax,
                @Pitch,
                @Yaw,
                @Roll,
                @BoostedPitch,
                @BoostedYaw,
                @BoostedRoll,
                @PowerConsumption,
                @CMDecoyCount,
                @CMNoiseCount,
                @HitPoints,
                @CargoSize,
                @VehicleLength,
                @VehicleWidth,
                @VehicleHeight,
                @VehicleMass,
                @HydrogenTank,
                @QuantiumTank,
                @ClaimTimeInSeconds,
                @ExpediteTimeInSeconds,
                @ExpediteCost,
                @Pledged,
                @InGame
            );

            SET @Id = SCOPE_IDENTITY();
        END

        /* =========================
           RETURN ID
        ========================== */
        SELECT @Id AS VehicleId;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO
