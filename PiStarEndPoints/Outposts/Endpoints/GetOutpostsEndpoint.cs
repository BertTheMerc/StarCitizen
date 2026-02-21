using Dapper;
using FastEndpoints;
using Microsoft.Data.SqlClient;
using PiStarDTO;
using System.Data;

namespace PiStarEndpoints.Outposts.Endpoints
{
    public class GetOutpostsEndpoint : Endpoint<EmptyRequest, List<OutpostDTO>>
    {
        private readonly Func<SqlConnection> _connFactory;

        public GetOutpostsEndpoint(Func<SqlConnection> connFactory) => _connFactory = connFactory;

        public override void Configure()
        {
            Get("/api/outposts");
            AllowAnonymous();
        }

        public override async Task HandleAsync(EmptyRequest req, CancellationToken ct)
        {
            var outposts = await GetOutpostsAsync(ct);
            await Send.OkAsync(outposts, ct);
        }

        private async Task<List<OutpostDTO>> GetOutpostsAsync(CancellationToken ct)
        {
            await using var conn = _connFactory();
            await conn.OpenAsync(ct);

            var command = new CommandDefinition(
                "dbo.GetOutpostList",
                commandType: CommandType.StoredProcedure,
                cancellationToken: ct);

            var outposts = await conn.QueryAsync<OutpostDTO>(command);
            return outposts.AsList();
        }



    }
}