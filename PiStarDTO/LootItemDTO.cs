namespace PiStarDTO
{
    public record LootItemDTO
    {
        public int Id { get; set; }

        public string ItemType { get; set; } = string.Empty;

        public string SubType { get; set; } = string.Empty;

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
            Category = new ItemCategory(this.ItemType, this.SubType);
        }       
    }

    public sealed record ItemCategory(string ItemType, string SubItemType)
    {
        public override string ToString() =>
        string.IsNullOrWhiteSpace(ItemType)
            ? SubItemType
            : $"{ItemType} → {SubItemType}";
    }
}
