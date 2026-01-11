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
            await using var conn = _connFactory();
            await conn.OpenAsync(ct);

            var lootTypes = await conn.QueryAsync<LootItemTypeDTO>(
                "dbo.GetLootItemTypeList",
                commandType: CommandType.StoredProcedure);

            await Send.OkAsync(lootTypes.AsList(), ct); 
        }
    }
}