using PiStarDTO;

namespace PiStarEndpoints.Loot.Response
{
    public class LootListResponse
    {
        public List<LootItemDTO> Loot { get; set; } = new List<LootItemDTO>();
    }
}
