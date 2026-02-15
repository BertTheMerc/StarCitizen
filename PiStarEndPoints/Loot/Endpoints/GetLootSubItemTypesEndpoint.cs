using Dapper;
using FastEndpoints;
using Microsoft.Data.SqlClient;
using PiStarDTO;
using System.Data;

namespace PiStarEndpoints.Loot.Endpoints
{
    public class GetLootSubItemTypeEndpoint : Endpoint<EmptyRequest, List<LootSubItemTypeDTO>>
    {
        private readonly Func<SqlConnection> _connFactory;

        public GetLootSubItemTypeEndpoint(Func<SqlConnection> connFactory) => _connFactory = connFactory;

        public override void Configure()
        {
            Get("/api/loot/subtypes");
            AllowAnonymous();
        }

        public override async Task HandleAsync(EmptyRequest req, CancellationToken ct)
        {
            var loot = await GetLootSubListTypesAsync(ct);
            await Send.OkAsync(loot, ct);
        }

        private async Task<List<LootSubItemTypeDTO>> GetLootSubListTypesAsync(CancellationToken ct)
        {
            await using var conn = _connFactory();
            await conn.OpenAsync(ct);

            var command = new CommandDefinition(
                "dbo.GetLootSubTypeList",
                commandType: CommandType.StoredProcedure,
                cancellationToken: ct);

            var loot = await conn.QueryAsync<LootSubItemTypeDTO>(command);
            return loot.AsList();
        }

    }
}