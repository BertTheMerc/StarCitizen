using ChapterAndVerse.Components;
using System.Net.Http.Json;
using FastEndpoints;

public partial class Program
{
    private static void Main(string[] args)
    {
        var builder = WebApplication.CreateBuilder(args);

        // Add services to the container.
        builder.Services.
            AddRazorComponents().
            AddInteractiveServerComponents();

        builder.Services.AddHttpClient<ChapterAndVerse.Domain.LootablesAPI>(client =>
        {
            client.BaseAddress = new Uri(builder.Configuration["FastEndpoints:BaseUrl_Live"]!);
            // client.DefaultRequestHeaders.Add("Accept", "application/json");
        });

        var app = builder.Build();

        // Configure the HTTP request pipeline.
        if (!app.Environment.IsDevelopment())
        {
            app.UseExceptionHandler("/Error", createScopeForErrors: true);
            // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
            app.UseHsts();
        }
        app.UseStatusCodePagesWithReExecute("/not-found", createScopeForStatusCodePages: true);
        app.UseHttpsRedirection();

        app.UseAntiforgery();

        app.MapStaticAssets();
        app.MapRazorComponents<App>()
            .AddInteractiveServerRenderMode();

        app.Run();
    }
}