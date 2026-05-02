using FastEndpoints;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Caching.Memory;
using PiStarDTO;
using System.Text.Json;

namespace PiStarEndpoints.VehicleWeapons.Endpoints
{
    public class Get : Endpoint<EmptyRequest, List<VehicleWeaponItemDTO>>
    {
        private const string CacheKey = "components:list";
        private const string JsonFileName = "vehiclecomponents.json";

        private readonly IMemoryCache _cache;
        private readonly IWebHostEnvironment _environment;

        public Get(IMemoryCache cache, IWebHostEnvironment environment)
        {
            _cache = cache;
            _environment = environment;
        }

        public override void Configure()
        {
            Get("/api/vehicleweapons");
            AllowAnonymous();
        }

        public override async Task HandleAsync(EmptyRequest req, CancellationToken ct)
        {
            var components = await GetComponentsAsync(ct);
            await Send.OkAsync(components, ct);
        }

        private async Task<List<VehicleWeaponItemDTO>> GetComponentsAsync(CancellationToken ct)
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
                    throw new FileNotFoundException($"vehicle weapon data file was not found: {filePath}", filePath);
                }

                await using var stream = File.OpenRead(filePath);
                try
                {
                    var components = await JsonSerializer.DeserializeAsync<List<VehicleWeaponItemDTO>>(
                        stream,
                        new JsonSerializerOptions
                        {
                            PropertyNameCaseInsensitive = true
                        },
                        ct);

                    return components ?? new List<VehicleWeaponItemDTO>();
                }
                catch (JsonException ex)
                {
                    throw new InvalidDataException($"Failed to deserialize vehicle weapon data from file: {filePath}", ex);
                }
                catch (Exception ex)
                {
                    throw new Exception($"Error while reading the vehicle weapon data file: {filePath}", ex);
                }
            }) ?? new List<VehicleWeaponItemDTO>();
        }
    }
}
