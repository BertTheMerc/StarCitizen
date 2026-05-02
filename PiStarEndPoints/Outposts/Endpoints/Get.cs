using FastEndpoints;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Caching.Memory;
using PiStarDTO;
using System.Text.Json;

namespace PiStarEndpoints.Outpost.Endpoints
{
    public class GetOutpostEndpoint : Endpoint<EmptyRequest, List<OutpostItemDTO>>
    {
        private const string CacheKey = "Outposts:list";
        private const string JsonFileName = "outposts.json";

        private readonly IMemoryCache _cache;
        private readonly IWebHostEnvironment _environment;

        public GetOutpostEndpoint(IMemoryCache cache, IWebHostEnvironment environment)
        {
            _cache = cache;
            _environment = environment;
        }

        public override void Configure()
        {
            Get("/api/outposts");
            AllowAnonymous();
        }

        public override async Task HandleAsync(EmptyRequest req, CancellationToken ct)
        {
            var Outpost = await GetOutpostAsync(ct);
            await Send.OkAsync(Outpost, ct);
        }

        private async Task<List<OutpostItemDTO>> GetOutpostAsync(CancellationToken ct)
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
                    throw new FileNotFoundException($"Outpost data file was not found: {filePath}", filePath);
                }

                await using var stream = File.OpenRead(filePath);

                try
                {
                    var Outpost = await JsonSerializer.DeserializeAsync<List<OutpostItemDTO>>(
                        stream,
                        new JsonSerializerOptions
                        {
                            PropertyNameCaseInsensitive = true
                        },
                        ct);

                    return Outpost ?? new List<OutpostItemDTO>();
                }
                catch (JsonException ex)
                {
                    throw new InvalidDataException($"Failed to deserialize Outpost data from file: {filePath}", ex);
                }
                catch (Exception ex)
                {
                    throw new Exception($"Error while reading the Outpost data file: {filePath}", ex);
                }
            }) ?? new List<OutpostItemDTO>();
        }
    }
}