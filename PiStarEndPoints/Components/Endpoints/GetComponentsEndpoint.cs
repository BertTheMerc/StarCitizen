using Dapper;
using FastEndpoints;
using Microsoft.Data.SqlClient;
using PiStarDTO;
using System.Data;

namespace PiStarEndpoints.Components.Endpoints
{
    public class GetComponentsEndpoint : Endpoint<EmptyRequest, List<ComponentItemDTO>>
    {
        private readonly Func<SqlConnection> _connFactory;

        public GetComponentsEndpoint(Func<SqlConnection> connFactory) => _connFactory = connFactory;

        public override void Configure()
        {
            Get("/api/components");
            AllowAnonymous();
        }

        public override async Task HandleAsync(EmptyRequest req, CancellationToken ct)
        {
            var components = await GetComponentsAsync(ct);
            await Send.OkAsync(components, ct);
        }

        private async Task<List<ComponentItemDTO>> GetComponentsAsync(CancellationToken ct)
        {
            await using var conn = _connFactory();
            await conn.OpenAsync(ct);

            var command = new CommandDefinition(
                "dbo.GetComponentList",
                commandType: CommandType.StoredProcedure,
                cancellationToken: ct);

            var item = await conn.QueryAsync<ComponentItemDTO>(command);
            return item.AsList();
        }



    }
}