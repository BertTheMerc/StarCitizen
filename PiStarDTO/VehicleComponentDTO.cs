namespace PiStarDTO
{
    public record VehicleComponentItemDTO
    {
        public required string CategoryName { get; set; }
        public required int ComponentId { get; set; }
        public required string ComponentName { get; set; }
        public required string ManufacturerName { get; set; }
        public required string ManufacturerCode { get; set; }
        public int SizeOfComponent { get; set; }
        public string Class { get; set; } = string.Empty;
        public string Grade { get; set; } = string.Empty;
        public string WeaponType { get; set; } = string.Empty;
        public string TrackingSignalType { get; set; } = string.Empty;
        public int Health { get; set; }
        public int Price { get; set; }
        public int SCUSize { get; set; }
        public int SalePrice { get; set; }

        public int Return
        {
            get
            {
                if (SCUSize > 0)
                    return Convert.ToInt32(SalePrice / (SCUSize / 100.0) * 100);
                else
                    return 0;
            }
        }  
    }
}
