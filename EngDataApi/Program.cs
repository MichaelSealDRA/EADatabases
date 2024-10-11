using EADatabaseApi;

var builder = WebApplication.CreateBuilder(args);

builder.AddCustomServices();
builder.AddHealthCheckServices();
builder.AddStandardServices();
//builder.AddAuthServices();

var app = builder.Build();

app.UseSwagger();
app.UseSwaggerUI();

app.UseHttpsRedirection();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.MapHealthChecks("/health").AllowAnonymous();

app.Run();
