using FastEndpoints;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Caching.Memory;
using PiStarDTO;
using System.Text.Json;

namespace PiStarEndpoints.Material.Endpoints
{
    public class GetMaterialEndpoint : Endpoint<EmptyRequest, List<MaterialItemDTO>>
    {
        private const string MaterialCacheKey = "Materials:list";
        private const string MaterialJsonFileName = "Materials.json";

        private readonly IMemoryCache _cache;
        private readonly IWebHostEnvironment _environment;

        public GetMaterialEndpoint(IMemoryCache cache, IWebHostEnvironment environment)
        {
            _cache = cache;
            _environment = environment;
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
            return await _cache.GetOrCreateAsync(MaterialCacheKey, async entry =>
            {
                entry.AbsoluteExpirationRelativeToNow = TimeSpan.FromMinutes(30);

                var filePath = Path.Combine(
                    _environment.ContentRootPath,
                    "Data",
                    MaterialJsonFileName);

                if (!File.Exists(filePath))
                {
                    throw new FileNotFoundException($"Material data file was not found: {filePath}", filePath);
                }

                await using var stream = File.OpenRead(filePath);
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
                    throw new InvalidDataException($"Failed to deserialize Material data from file: {filePath}", ex);
                }
                catch (Exception ex)
                {
                    throw new Exception($"Error while reading the Material data file: {filePath}", ex);
                }
            }) ?? new List<MaterialItemDTO>();
        }
    }
}