using FastEndpoints;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Caching.Memory;
using PiStarDTO;
using System.Text.Json;

namespace PiStarEndpoints.Vehicle.Endpoints
{
    public class GetVehiclesEndpoint : Endpoint<EmptyRequest, List<VehicleItemDTO>>
    {
        private const string CacheKey = "vehicles:list";
        private const string JsonFileName = "vehicles.json";

        private readonly IMemoryCache _cache;
        private readonly IWebHostEnvironment _environment;

        public GetVehiclesEndpoint(IMemoryCache cache, IWebHostEnvironment environment)
        {
            _cache = cache;
            _environment = environment;
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
            return await _cache.GetOrCreateAsync(CacheKey, async entry =>
            {
                entry.AbsoluteExpirationRelativeToNow = TimeSpan.FromMinutes(30);

                var filePath = Path.Combine(
                    _environment.ContentRootPath,
                    "Data",
                    JsonFileName);

                if (!File.Exists(filePath))
                {
                    throw new FileNotFoundException($"Vehicle data file was not found: {filePath}", filePath);
                }

                await using var stream = File.OpenRead(filePath);

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
                    throw new InvalidDataException($"Failed to deserialize vehicles data from file: {filePath}", ex);
                }
                catch (Exception ex)
                {
                    throw new Exception($"Error while reading the vehicles data file: {filePath}", ex);
                }
                
            }) ?? new List<VehicleItemDTO>();
        }
    }
}
