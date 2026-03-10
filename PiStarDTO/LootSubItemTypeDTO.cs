namespace PiStarDTO
{
    public record LootSubItemTypeDTO
    {
        public int Id { get; set; }

        public int ItemTypeNameId { get; set; }

        public string SubItemTypeName { get; set; } = string.Empty;
    }
}
