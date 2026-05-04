using FastEndpoints;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Caching.Memory;
using PiStarDTO;
using System.Text.Json;

namespace PiStarEndpoints.Outpost.Endpoints
{
    public class GetOutpostEndpoint : Endpoint<EmptyRequest, List<OutpostItemDTO>>
    {
        private readonly BlobService _blobService;

        private const string cacheKey = "Outposts:list";
        private const string fileName = "outposts.json";

        private readonly IMemoryCache _cache;
        private readonly IWebHostEnvironment _environment;

        public GetOutpostEndpoint(IMemoryCache cache, IWebHostEnvironment environment, BlobService blobService)
        {
            _cache = cache;
            _environment = environment;
            _blobService = blobService;
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
            return await _cache.GetOrCreateAsync(cacheKey, async entry =>
            {
                entry.AbsoluteExpirationRelativeToNow = TimeSpan.FromMinutes(30);

                var stream = await _blobService.ReadBlobStreamAsync(fileName);

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
                    throw new InvalidDataException($"Failed to deserialize Outpost data from file: {fileName}", ex);
                }
                catch (Exception ex)
                {
                    throw new Exception($"Error while reading the Outpost data file: {fileName}", ex);
                }
            }) ?? new List<OutpostItemDTO>();
        }
    }
}