using PiStarDTO;

namespace PiStarEndpoints.Outposts.Response
{
    public class OutpostListResponse
    {
        public List<OutpostDTO> Loot { get; set; } = new List<OutpostDTO>();
    }
}
