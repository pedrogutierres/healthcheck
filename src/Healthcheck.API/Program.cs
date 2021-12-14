var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

var app = builder.Build();

// Configure the HTTP request pipeline.
app.Logger.LogInformation("Aplicação iniciada");

var handler = () => {
    app.Logger.LogInformation("Nova consulta Healthy");
    return new { status = "Healthy" };
};

app.MapGet("/", handler);
app.MapGet("/healthcheck", handler);

app.Run();