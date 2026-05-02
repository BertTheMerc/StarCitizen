using PiStarDTO;

namespace PiStarEndpoints.Outposts.Response
{
    public class OutpostListResponse
    {
        public List<MaterialItemDTO> Loot { get; set; } = new List<MaterialItemDTO>();
    }
}
