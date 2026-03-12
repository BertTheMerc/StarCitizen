namespace PiStarDTO
{
    public record ComponentItemDTO
    {
        public required string CategoryName { get; set; }
        public required int ComponentId { get; set; }
        public required string ComponentName { get; set; }
        public required string ManufacturerName { get; set; }
        public required string ManufacturerCode { get; set; }
        public required int SizeOfComponent { get; set; }
        public required string Class { get; set; }
        public required string Grade { get; set; }
        public required string WeaponType { get; set; }
        public required string TrackingSignalType { get; set; }
        public required int Health { get; set; }
        public required int Price { get; set; }
        public required int SCUSize { get; set; }
        public required int SalePrice { get; set; }

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
