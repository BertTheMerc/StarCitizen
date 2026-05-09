using FastEndpoints;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Caching.Memory;
using PiStarDTO;
using System.Text.Json;

namespace PiStarEndpoints.VehicleComponents.Endpoints
{
    public class Get : Endpoint<EmptyRequest, List<VehicleComponentItemDTO>>
    {
        private readonly BlobService _blobService;

        private const string cacheKey = "components:list";
        private const string fileName = "vehiclecomponents.json";

        private readonly IMemoryCache _cache;
        private readonly IWebHostEnvironment _environment;

        public Get(IMemoryCache cache, IWebHostEnvironment environment, BlobService blobService)
        {
            _cache = cache;
            _environment = environment;
        }

        public override void Configure()
        {
            Get("/api/vehiclecomponents");
            AllowAnonymous();
        }

        public override async Task HandleAsync(EmptyRequest req, CancellationToken ct)
        {
            var components = await GetComponentsAsync(ct);
            await Send.OkAsync(components, ct);
        }

        private async Task<List<VehicleComponentItemDTO>> GetComponentsAsync(CancellationToken ct)
        {
            return await _cache.GetOrCreateAsync(cacheKey, async entry =>
            {
                entry.AbsoluteExpirationRelativeToNow = TimeSpan.FromMinutes(30);

                try
                {
                    var stream = await _blobService.ReadBlobStreamAsync(fileName);

                    var components = await JsonSerializer.DeserializeAsync<List<VehicleComponentItemDTO>>(
                        stream,
                        new JsonSerializerOptions
                        {
                            PropertyNameCaseInsensitive = true
                        },
                        ct);

                    return components ?? new List<VehicleComponentItemDTO>();
                }
                catch (JsonException ex)
                {
                    throw new InvalidDataException($"Failed to deserialize Component data from file: {fileName}", ex);
                }
                catch (Exception ex)
                {
                    throw new Exception($"Error while reading the data file: {fileName}", ex);
                }
            }) ?? new List<VehicleComponentItemDTO>();
        }
    }
}
