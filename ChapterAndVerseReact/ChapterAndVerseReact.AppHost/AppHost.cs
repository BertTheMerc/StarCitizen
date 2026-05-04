var builder = DistributedApplication.CreateBuilder(args);

var server = builder.AddProject<Projects.ChapterAndVerseReact_Server>("server")
    .WithHttpHealthCheck("/health")
    .WithExternalHttpEndpoints();

var webfrontend = builder.AddViteApp("webfrontend", "../frontend")
    .WithEnvironment("PORT", "5173")
    .WithReference(server)
    .WaitFor(server);

server.PublishWithContainerFiles(webfrontend, "wwwroot");

builder.Build().Run();
