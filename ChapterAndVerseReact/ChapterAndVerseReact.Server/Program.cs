 var builder = WebApplication.CreateBuilder(args);

// Add service defaults & Aspire client integrations.
builder.AddServiceDefaults();

// Add services to the container.
builder.Services.AddProblemDetails();

builder.Services.AddHttpClient<PiStarApiClient>(client =>
{
    client.BaseAddress = new Uri(builder.Configuration["FastEndpoints:PiStarApi:BaseUrl_TEST"]!);
    client.DefaultRequestHeaders.Accept.ParseAdd("application/json");
});

// Learn more about configuring OpenAPI at https://aka.ms/aspnet/openapi
builder.Services.AddOpenApi();

var app = builder.Build();

// Configure the HTTP request pipeline.
app.UseExceptionHandler();
///app.UseDefaultFiles();
///app.UseStaticFiles();


if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
}

var api = app.MapGroup("/api");

api.MapGet("loot", async (PiStarApiClient client, CancellationToken ct) =>
{
    var items = await client.GetLootAsync(ct);

    return items.Select(item => new
    {
        item.ItemType,
        item.SubType,
        item.ItemName,
        item.SCUSize,
        item.CargoSaleValue,
        Return = Math.Round((double)item.CargoSaleValue * 1000 / item.SCUSize, 0)
    });
});

api.MapGet("outposts", async (PiStarApiClient client, CancellationToken ct) =>
{
    var items = await client.GetOutpostsAsync(ct);

    return items.Select(item => new
    {
        item.Id,
        item.SystemName,
        item.SubSystemName,
        item.Area,
        item.OutpostName,
        item.PadSizes,
        item.Cargo,
        item.Repair,
        item.Garage
    });
});

api.MapGet("components", async (PiStarApiClient client, CancellationToken ct) =>
{
    var items = await client.GetComponentsAsync(ct);

    return items.Select(item => new
    {
        item.CategoryName,
        item.ComponentId,
        item.ComponentName,
        item.ManufacturerName,
        item.ManufacturerCode,
        item.SizeOfComponent,
        item.Class,
        item.Grade,
        item.WeaponType,
        item.TrackingSignalType,
        item.Health,
        item.Price,
        item.SCUSize,
        item.SalePrice
    });
});

app.MapDefaultEndpoints();

app.UseDefaultFiles();
app.UseStaticFiles();
app.MapFallbackToFile("index.html");

app.Run();

public sealed class PiStarApiClient(HttpClient http)
{
    public async Task<PiStarDTO.LootItemDTO[]> GetLootAsync(CancellationToken ct)
    {
        var items = await http.GetFromJsonAsync<PiStarDTO.LootItemDTO[]>("api/loot", ct);
        return items ?? [];
    }

    public async Task<PiStarDTO.OutpostItemDTO[]> GetOutpostsAsync(CancellationToken ct)
    {
        var items = await http.GetFromJsonAsync<PiStarDTO.OutpostItemDTO[]>("api/outposts", ct);
        return items ?? [];
    }

    public async Task<PiStarDTO.VehicleComponentItemDTO[]> GetComponentsAsync(CancellationToken ct)
    {
        var items = await http.GetFromJsonAsync<PiStarDTO.VehicleComponentItemDTO[]>("api/vehiclecomponents", ct);
        return items ?? [];
    }
}
