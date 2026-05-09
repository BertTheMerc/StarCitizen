using FastEndpoints;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Caching.Memory;
using PiStarDTO;
using System.Text.Json;

namespace PiStarEndpoints.Material.Endpoints
{
    public class GetMaterialEndpoint : Endpoint<EmptyRequest, List<MaterialItemDTO>>
    {
        private readonly BlobService _blobService;

        private const string cacheKey = "Materials:list";
        private const string fileName = "materials.json";

        private readonly IMemoryCache _cache;
        private readonly IWebHostEnvironment _environment;

        public GetMaterialEndpoint(IMemoryCache cache, IWebHostEnvironment environment, BlobService blobService)
        {
            _cache = cache;
            _environment = environment;
            _blobService = blobService;
        }

        public override void Configure()
        {
            Get("/api/Materials");
            AllowAnonymous();
        }

        public override async Task HandleAsync(EmptyRequest req, CancellationToken ct)
        {
            var Material = await GetMaterialAsync(ct);
            await Send.OkAsync(Material, ct);
        }

        private async Task<List<MaterialItemDTO>> GetMaterialAsync(CancellationToken ct)
        {
            return await _cache.GetOrCreateAsync(cacheKey, async entry =>
            {
                entry.AbsoluteExpirationRelativeToNow = TimeSpan.FromMinutes(30);

                var stream = await _blobService.ReadBlobStreamAsync(fileName);
                try { 
                    var Material = await JsonSerializer.DeserializeAsync<List<MaterialItemDTO>>(
                        stream,
                        new JsonSerializerOptions
                        {
                            PropertyNameCaseInsensitive = true
                        },
                        ct);

                    return Material ?? new List<MaterialItemDTO>();
                }
                catch (JsonException ex)
                {
                    throw new InvalidDataException($"Failed to deserialize Material data from file: {fileName}", ex);
                }
                catch (Exception ex)
                {
                    throw new Exception($"Error while reading the Material data file: {fileName}", ex);
                }
            }) ?? new List<MaterialItemDTO>();
        }
    }
}