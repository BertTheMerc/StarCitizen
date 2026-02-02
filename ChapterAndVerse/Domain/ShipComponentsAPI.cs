namespace ChapterAndVerse.Domain
{
    using FastEndpoints;
    using PiStarDTO;

    public sealed class ShipComponentsAPI
    {
        private readonly HttpClient _http;

        public ShipComponentsAPI(HttpClient http) => _http = http;

        // Example: GET /customers/123
        public async Task<List<LootItemDTO>> GetLootableItems(CancellationToken ct = default)
            => await _http.GetFromJsonAsync<List<LootItemDTO>>($"/api/loot", ct) ?? new List<LootItemDTO>();

        public async Task<List<LootItemTypeDTO>> GetLootTypes(CancellationToken ct = default)
            => await _http.GetFromJsonAsync<List<LootItemTypeDTO>>($"/api/loot/types", ct) ?? new List<LootItemTypeDTO>();

        public async Task<List<LootSubItemTypeDTO>> GetLootSubTypes(CancellationToken ct = default)
            => await _http.GetFromJsonAsync<List<LootSubItemTypeDTO>>($"/api/loot/subtypes", ct) ?? new List<LootSubItemTypeDTO>();

        // Example: POST /customers/search
        /* public async Task<SearchResultDto?> SearchCustomersAsync(SearchRequestDto req, CancellationToken ct = default)
         {
             var res = await _http.PostAsJsonAsync("/customers/search", req, ct);
             res.EnsureSuccessStatusCode();
             return await res.Content.ReadFromJsonAsync<SearchResultDto>(cancellationToken: ct);
         }
        */
    }
}
