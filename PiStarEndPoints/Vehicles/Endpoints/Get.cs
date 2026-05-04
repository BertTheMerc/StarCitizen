using FastEndpoints;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Caching.Memory;
using PiStarDTO;
using System.Text.Json;

namespace PiStarEndpoints.Vehicle.Endpoints
{
    public class GetVehiclesEndpoint : Endpoint<EmptyRequest, List<VehicleItemDTO>>
    {
        private readonly BlobService _blobService;

        private const string cacheKey = "vehicles:list";
        private const string fileName = "vehicles.json";

        private readonly IMemoryCache _cache;
        private readonly IWebHostEnvironment _environment;

        public GetVehiclesEndpoint(IMemoryCache cache, IWebHostEnvironment environment, BlobService blobService)
        {
            _cache = cache;
            _environment = environment;
            _blobService = blobService;
        }

        public override void Configure()
        {
            Get("/api/vehicles");
            AllowAnonymous();
        }

        public override async Task HandleAsync(EmptyRequest req, CancellationToken ct)
        {
            var vehicles = await GetDataAsync(ct);
            await Send.OkAsync(vehicles, ct);
        }

        private async Task<List<VehicleItemDTO>> GetDataAsync(CancellationToken ct)
        {
            return await _cache.GetOrCreateAsync(cacheKey, async entry =>
            {
                entry.AbsoluteExpirationRelativeToNow = TimeSpan.FromMinutes(30);
                
                var stream = await _blobService.ReadBlobStreamAsync(fileName);

                try
                {
                    var vehicles = await JsonSerializer.DeserializeAsync<List<VehicleItemDTO>>(
                        stream,
                        new JsonSerializerOptions
                        {
                            PropertyNameCaseInsensitive = true
                        },
                        ct);

                    return vehicles ?? new List<VehicleItemDTO>();
                }
                catch (JsonException ex)
                {
                    throw new InvalidDataException($"Failed to deserialize vehicles data from file: {fileName}", ex);
                }
                catch (Exception ex)
                {
                    throw new Exception($"Error while reading the vehicles data file: {fileName}", ex);
                }
                
            }) ?? new List<VehicleItemDTO>();
        }
    }
}
