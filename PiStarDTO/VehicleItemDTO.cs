namespace PiStarDTO
{
    public record VehicleItemDTO
    {
        public required int Id { get; set; }
        public required string VehicleName { get; set; }
        public required string Manufacturer { get; set; }
        public required string VehicleRole { get; set; }
        public required string Career { get; set; }
        public required string Size { get; set; }
        public required int CrewSizeMin { get; set; }
        public required int CrewSizeMax { get; set; }
        public required int ScmSpeed { get; set; }
        public required int ScmBoostForward { get; set; }
        public required int ScmBoostBackward { get; set; }
        public required int NavMax { get; set; }
        public required int Pitch { get; set; }
        public required int Yaw { get; set; }
        public required int Roll { get; set; }
        public required int BoostedPitch { get; set; }
        public required int BoostedYaw { get; set; }
        public required int BoostedRoll { get; set; }
        public required int PowerConsumption { get; set; }
        public required int CMDecoyCount { get; set; }
        public required int CMNoiseCount { get; set; }
        public required int HitPoints { get; set; }
        public required int CargoSize { get; set; }
        public required float VehicleLength { get; set; }
        public required float VehicleWidth { get; set; }
        public required float VehicleHeight { get; set; }
        public required int VehicleMass { get; set; }
        public required float HydrogenTank { get; set; }
        public required float QuantiumTank { get; set; }
        public required int ClaimTimeInSeconds { get; set; }
        public required int ExpediteTimeInSeconds { get; set; }
        public required int ExpediteCost { get; set; }
        public required bool Pledged { get; set; }
        public required bool InGame { get; set; }
    }
}
