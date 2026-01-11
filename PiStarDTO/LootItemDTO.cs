namespace PiStarDTO
{
    public class LootItemDTO
    {
        public int Id { get; set; }
        public int ItemTypeNameId { get; set; }

        public string ItemTypeName { get; set; } = string.Empty;
        
        public int SubItemTypeNameId { get; set; }

        public string SubItemTypeName { get; set; } = string.Empty;

        public string ItemName { get; set; } = default!;
        
        public int SCUSize { get; set; }
        
        public int CargoSaleValue { get; set; }

        public int Return { 
            get 
            {
                if (SCUSize > 0)
                    return Convert.ToInt32(CargoSaleValue / (SCUSize / 100.0) * 100);
                else
                    return 0;
            } 
        }
    }
}
