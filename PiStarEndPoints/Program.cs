using FastEndpoints;
using PiStarEndpoints;

public partial class Program
{
    private static void Main(string[] args)
    {
        var builder = WebApplication.CreateBuilder();

        builder.Services.AddMemoryCache();
        builder.Services.AddFastEndpoints();
        builder.Services.AddSingleton<BlobService>();

        var app = builder.Build();
        app.UseFastEndpoints();
        app.Run();
    }
}