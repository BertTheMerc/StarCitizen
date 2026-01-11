namespace SCAPI.Loot.DTO
{
    public class LootItemDTO
    {
        public int Id { get; set; }
        public int ItemTypeNameId { get; set; }
        public int SubItemTypeNameId { get; set; }
        public string ItemName { get; set; } = default!;
        public int Size { get; set; }
        public int CargoSaleValue { get; set; }
    }
}
