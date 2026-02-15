using Dapper;
using FastEndpoints;
using Microsoft.Data.SqlClient;
using PiStarDTO;
using System.Data;

namespace PiStarEndpoints.Loot.Endpoints
{
    public class GetLootItemTypesEndpoint : Endpoint<EmptyRequest, List<LootItemTypeDTO>>
    {
        private readonly Func<SqlConnection> _connFactory;

        public GetLootItemTypesEndpoint(Func<SqlConnection> connFactory) => _connFactory = connFactory;

        public override void Configure()
        {
            Get("/api/loot/types");
            AllowAnonymous();
        }

        public override async Task HandleAsync(EmptyRequest req, CancellationToken ct)
        {
            var loot = await GetLootListTypesAsync(ct);
            await Send.OkAsync(loot, ct);
        }

        private async Task<List<LootItemTypeDTO>> GetLootListTypesAsync(CancellationToken ct)
        {
            await using var conn = _connFactory();
            await conn.OpenAsync(ct);

            var command = new CommandDefinition(
                "dbo.GetLootList",
                commandType: CommandType.StoredProcedure,
                cancellationToken: ct);

            var loot = await conn.QueryAsync<LootItemTypeDTO>(command);
            return loot.AsList();
        }
    }
}