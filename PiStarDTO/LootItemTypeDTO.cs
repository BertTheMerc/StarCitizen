namespace PiStarDTO
{
    public record LootItemTypeDTO
    {
        public int Id { get; set; }

        public string ItemTypeName { get; set; } = string.Empty;
    }
}
