using FastEndpoints;
using Microsoft.Data.SqlClient;
using PiStarEndpoints.Properties;

public partial class Program
{
    private static void Main(string[] args)
    {
        var builder = WebApplication.CreateBuilder();


        builder.Services.AddSingleton<Func<SqlConnection>>(_ =>
        {
            var connString = Resources.DATABASE_CONNECTION_STRING;
            return () => new SqlConnection(connString);
        });

        builder.Services.AddFastEndpoints();

        var app = builder.Build();
        app.UseFastEndpoints();
        app.Run();
    }
}