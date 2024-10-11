using DataAccess;
using DatabaseApi;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddSingleton<ISqlDataAccess, SqlDataAccess>();
builder.Services.AddSingleton<IAngleData, AngleData>();
builder.Services.AddSingleton<IChannelData, ChannelData>();

var app = builder.Build();

app.UseSwagger();
app.UseSwaggerUI();

app.UseHttpsRedirection();

app.ConfigureAnglesApi();
app.ConfigureChannelsApi();

app.Run();
