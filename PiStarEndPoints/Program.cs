using FastEndpoints;
using Microsoft.Data.SqlClient;
using PiStarEndpoints.Properties;

public partial class Program
{
    private static void Main(string[] args)
    {
        var builder = WebApplication.CreateBuilder();

        builder.Services.AddMemoryCache();
        builder.Services.AddFastEndpoints();

        var app = builder.Build();
        app.UseFastEndpoints();
        app.Run();
    }
}