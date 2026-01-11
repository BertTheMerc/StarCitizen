using FastEndpoints;
using Microsoft.Data.SqlClient;

public partial class Program
{
    private static void Main(string[] args)
    {
        var builder = WebApplication.CreateBuilder();


        builder.Services.AddSingleton<Func<SqlConnection>>(_ =>
        {
            var connString = builder.Configuration["StarCitizenDatabase:ConnectionString"]!;
            return () => new SqlConnection(connString);
        });

        builder.Services.AddFastEndpoints();

        var app = builder.Build();
        app.UseFastEndpoints();
        app.Run();
    }
}