using PiStarDTO;

namespace PiStarEndpoints.Vehicle.Response
{
    public class VehicleResponse
    {
        public List<VehicleItemDTO> Vehicles { get; set; } = new List<VehicleItemDTO>();
    }
}
