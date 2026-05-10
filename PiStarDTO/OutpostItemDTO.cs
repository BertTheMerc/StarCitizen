namespace PiStarDTO
{
    public record OutpostItemDTO
    {
        public int Id { get; set; }

        public string SystemName { get; set; } = string.Empty;

        public string SubSystemName { get; set; } = string.Empty;

        public string Area { get; set; } = default!;

        public string OutpostName { get; set; } = default!;

        public string PadSizes { get; set; } = default!;

        public bool Cargo { get; set; } = default!;

        public bool Repair { get; set; } = default!;

        public bool Garage { get; set; } = default!;
        
        public OutpostCategory Category { get; init; }

        public OutpostItemDTO()
        {
            Category = new OutpostCategory(this.SystemName, this.SubSystemName);
        }       
    }

    public sealed record OutpostCategory(string SystemName, string SubSystemName)
    {
        public override string ToString() =>
        string.IsNullOrWhiteSpace(SystemName)
            ? SubSystemName
            : $"{SystemName} → {SubSystemName}";
    }
}
