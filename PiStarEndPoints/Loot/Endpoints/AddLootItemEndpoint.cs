using Dapper;
using FastEndpoints;
using Microsoft.Data.SqlClient;
using SCAPI.Loot.DTO;
using System.Data;

namespace SCAPI.Loot.Endpoints
{
    public class AddLootItemEndpoint : Endpoint<LootItemDTO, int>
    {
        private readonly Func<SqlConnection> _connFactory;

        public AddLootItemEndpoint(Func<SqlConnection> connFactory) => _connFactory = connFactory;

        public override void Configure()
        {
            Get("/api/loot/add");
            AllowAnonymous();
        }

        public override async Task HandleAsync(LootItemDTO item, CancellationToken ct)
        {
            await using var conn = _connFactory();
            await conn.OpenAsync(ct);

            var newId = await conn.QuerySingleAsync<int>(
                "dbo.InsertLootItem",
                new
                {
                    item.ItemTypeNameId,
                    item.SubItemTypeNameId,
                    item.ItemName,
                    item.Size,
                    item.CargoSaleValue
                },
                commandType: CommandType.StoredProcedure);

            await Send.OkAsync(newId, ct); 
        }
    }
}