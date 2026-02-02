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

        public ItemCategory Category { get; init; }

        public int Return
        {
            get
            {
                if (SCUSize > 0)
                    return Convert.ToInt32(CargoSaleValue / (SCUSize / 100.0) * 100);
                else
                    return 0;
            }
        }

        public LootItemDTO()
        {
            Category = new ItemCategory(this.ItemTypeName, this.SubItemTypeName);
        }       
    }

    public sealed record ItemCategory(string ItemTypeName, string SubItemTypeName)
    {
        public override string ToString() =>
        string.IsNullOrWhiteSpace(ItemTypeName)
            ? SubItemTypeName
            : $"{ItemTypeName} → {SubItemTypeName}";
    }
}
