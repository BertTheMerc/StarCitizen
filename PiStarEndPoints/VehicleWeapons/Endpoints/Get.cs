using FastEndpoints;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Caching.Memory;
using PiStarDTO;
using System.Text.Json;

namespace PiStarEndpoints.VehicleWeapons.Endpoints
{
    public class Get : Endpoint<EmptyRequest, List<VehicleWeaponItemDTO>>
    {
        private readonly BlobService _blobService;

        private const string cacheKey = "weapons:list";
        private const string fileName = "vehicleweapons.json";

        private readonly IMemoryCache _cache;
        private readonly IWebHostEnvironment _environment;

        public Get(IMemoryCache cache, IWebHostEnvironment environment, BlobService blobService)
        {
            _cache = cache;
            _environment = environment;
            _blobService = blobService;
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
            return await _cache.GetOrCreateAsync(cacheKey, async entry =>
            {
                entry.AbsoluteExpirationRelativeToNow = TimeSpan.FromMinutes(30);

                var stream = await _blobService.ReadBlobStreamAsync(fileName);
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
                    throw new InvalidDataException($"Failed to deserialize vehicle weapon data from file: {fileName}", ex);
                }
                catch (Exception ex)
                {
                    throw new Exception($"Error while reading the vehicle weapon data file: {fileName}", ex);
                }
            }) ?? new List<VehicleWeaponItemDTO>();
        }
    }
}
