using PiStarDTO;

namespace PiStarEndpoints.Components.Response
{
    public class VehicleComponentListResponse
    {
        public List<VehicleComponentItemDTO> Components { get; set; } = [];
    }
}
