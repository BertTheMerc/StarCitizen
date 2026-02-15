using Dapper;
using FastEndpoints;
using Microsoft.Data.SqlClient;
using PiStarDTO;
using System.Data;

namespace PiStarEndpoints.Loot.Endpoints
{
    public class GetLootListEndpoint : Endpoint<EmptyRequest, List<LootItemDTO>>
    {
        private readonly Func<SqlConnection> _connFactory;

        public GetLootListEndpoint(Func<SqlConnection> connFactory) => _connFactory = connFactory;

        public override void Configure()
        {
            Get("/api/loot");
            AllowAnonymous();
        }

        public override async Task HandleAsync(EmptyRequest req, CancellationToken ct)
        {
            var loot = await GetLootListAsync(ct);
            await Send.OkAsync(loot, ct);
        }

        private async Task<List<LootItemDTO>> GetLootListAsync(CancellationToken ct)
        {
            await using var conn = _connFactory();

            var command = new CommandDefinition(
                "dbo.GetLootList",
                commandType: CommandType.StoredProcedure,
                cancellationToken: ct);

            var loot = await conn.QueryAsync<LootItemDTO>(command);
            return loot.AsList();
        }
    }
}