using PiStarDTO;

namespace PiStarEndpoints.Outposts.Response
{
    public class MaterialListResponse
    {
        public List<MaterialItemDTO> Materials { get; set; } = new List<MaterialItemDTO>();
    }
}
