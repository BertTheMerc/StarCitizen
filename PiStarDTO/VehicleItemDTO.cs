namespace PiStarDTO
{
    public record VehicleItemDTO
    {
        public int Id { get; set; }
        public string VehicleName { get; set; }
        public string Manufacturer { get; set; }
        public string VehicleRole { get; set; }
        public string Career { get; set; }
        public string Size { get; set; }
        public int CrewSizeMin { get; set; }
        public int CrewSizeMax { get; set; }
        public int ScmSpeed { get; set; }
        public int ScmBoostForward { get; set; }
        public int ScmBoostBackward { get; set; }
        public int NavMax { get; set; }
        public int Pitch { get; set; }
        public int Yaw { get; set; }
        public int Roll { get; set; }
        public int BoostedPitch { get; set; }
        public int BoostedYaw { get; set; }
        public int BoostedRoll { get; set; }
        public int PowerConsumption { get; set; }
        public int CMDecoyCount { get; set; }
        public int CMNoiseCount { get; set; }
        public int HitPoints { get; set; }
        public int CargoSize { get; set; }
        public float VehicleLength { get; set; }
        public float VehicleWidth { get; set; }
        public float VehicleHeight { get; set; }
        public int VehicleMass { get; set; }
        public float HydrogenTank { get; set; }
        public float QuantiumTank { get; set; }
        public int ClaimTimeInSeconds { get; set; }
        public int ExpediteTimeInSeconds { get; set; }
        public int ExpediteCost { get; set; }
        public bool Pledged { get; set; }
        public bool InGame { get; set; }
    }
}
