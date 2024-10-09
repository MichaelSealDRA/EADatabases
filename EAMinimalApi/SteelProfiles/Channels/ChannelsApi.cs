using DataAccess;

namespace DatabaseApi;

public static class ChannelsApi
{
    public static void ConfigureChannelsApi(this WebApplication app)
    {
        // All of my API endpoint mapping
        app.MapGet("/Channels", GetChannels);
        app.MapGet("/Channels/id={id}", GetChannel);
        app.MapGet("/Channels/designation={designation}", GetChannelByDesignation);
        app.MapPost("/Channels", InsertChannel);
        app.MapPut("/Channels", UpdateChannel);
        app.MapDelete("/Channels", DeleteChannel);
    }

    private static async Task<IResult> GetChannels(IChannelData data)
    {
        try
        {
            return Results.Ok(await data.GetChannels());
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }
    private static async Task<IResult> GetChannel(int id, IChannelData data)
    {
        try
        {
            var results = await data.GetChannel(id);
            if (results == null) return Results.NotFound();
            return Results.Ok(results);
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }
    private static async Task<IResult> GetChannelByDesignation(string designation, IChannelData data)
    {
        try
        {
            var results = await data.GetChannel(designation);
            if (results == null) return Results.NotFound();
            return Results.Ok(results);
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }
    private static async Task<IResult> InsertChannel(ChannelProfile profile, IChannelData data)
    {
        try
        {
            await data.InsertChannel(profile);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }
    private static async Task<IResult> UpdateChannel(ChannelProfile profile, IChannelData data)
    {
        try
        {
            await data.UpdateChannel(profile);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }
    private static async Task<IResult> DeleteChannel(int id, IChannelData data)
    {
        try
        {
            await data.DeleteChannel(id);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }
}
