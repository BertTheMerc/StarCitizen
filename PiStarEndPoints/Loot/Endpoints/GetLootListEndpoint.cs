using Dapper;
using FastEndpoints;
using Microsoft.Data.SqlClient;
using SCAPI.Loot.DTO;
using System.Data;

namespace SCAPI.Loot.Endpoints
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
            await using var conn = _connFactory();
            await conn.OpenAsync(ct);

            var loot = await conn.QueryAsync<LootItemDTO>(
                "dbo.GetLootList",
                commandType: CommandType.StoredProcedure);

            await Send.OkAsync(loot.AsList(), ct); 
        }
    }
}