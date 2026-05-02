namespace PiStarDTO
{
    public record MaterialItemDTO
    {
        public int Id { get; set; }

        public required string Name { get; set; }

        public int IR { get; set; }

        public int Max { get; set; }
    }
}
