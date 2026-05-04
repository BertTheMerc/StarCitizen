using FastEndpoints;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Caching.Memory;
using PiStarDTO;
using System.Text.Json;

namespace PiStarEndpoints.Loot.Endpoints
{
    public class GetLootEndpoint : Endpoint<EmptyRequest, List<LootItemDTO>>
    {
        private readonly BlobService _blobService;


        private const string LootCacheKey = "loot:list";
        private const string fileName = "loot.json";

        private readonly IMemoryCache _cache;
        private readonly IWebHostEnvironment _environment;

        public GetLootEndpoint(IMemoryCache cache, IWebHostEnvironment environment, BlobService blobService)
        {
            _cache = cache;
            _environment = environment;
            _blobService = blobService;
        }

        public override void Configure()
        {
            Get("/api/loot");
            AllowAnonymous();
        }

        public override async Task HandleAsync(EmptyRequest req, CancellationToken ct)
        {
            var loot = await GetLootAsync(ct);
            await Send.OkAsync(loot, ct);
        }

        private async Task<List<LootItemDTO>> GetLootAsync(CancellationToken ct)
        {
            return await _cache.GetOrCreateAsync(LootCacheKey, async entry =>
            {
                entry.AbsoluteExpirationRelativeToNow = TimeSpan.FromMinutes(30);

                var stream = await _blobService.ReadBlobStreamAsync(fileName);

                /*var filePath = Path.Combine(
                    _environment.ContentRootPath,
                    "Data",
                    fileName);

                if (!File.Exists(filePath))
                {
                    throw new FileNotFoundException($"Loot data file was not found: {filePath}", filePath);
                }

                await using var stream = File.OpenRead(filePath);
                */
                try
                {
                    var loot = await JsonSerializer.DeserializeAsync<List<LootItemDTO>>(
                        stream,
                        new JsonSerializerOptions
                        {
                            PropertyNameCaseInsensitive = true
                        },
                        ct);

                    return loot ?? new List<LootItemDTO>();
                }
                catch (JsonException ex)
                {
                    throw new InvalidDataException($"Failed to deserialize loot data from file: {fileName}", ex);
                }
                catch (Exception ex)
                {
                    throw new Exception($"Error while reading the loot data file: {fileName}", ex);
                }
                
            }) ?? new List<LootItemDTO>();
        }
    }
}
