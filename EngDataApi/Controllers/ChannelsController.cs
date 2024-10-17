using DataAccess;
using EngDataApi;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace EADatabaseApi.Controllers;

[Route("SteelProfiles/[controller]")]
[ApiController]
public class ChannelsController : ControllerBase
{
    private readonly IChannelData _data;
    public ChannelsController(IChannelData data)
    {
        _data = data;
    }

    [HttpGet("All", Name = "GetAllChannels")]
    public async Task<IResult> GetAllChannels()
    {
        try
        {
            var results = await _data.GetAllChannels();

            var listResults = ControllerMethods.FilterByAccess(results.ToList(), User);

            return Results.Ok(listResults);
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }

    [HttpGet(Name = "GetChannels")]
    public async Task<IResult> GetChannels(
    [FromQuery] string? standard,
    [FromQuery] string? variation,
    [FromQuery] string? designation)
    {
        try
        {
            var results = await _data.GetChannels(standard, variation, designation);

            if (results == null)
                return Results.NotFound("No Channel found matching the specified criteria.");
               
            return Results.Ok(results);
        }
        catch (Exception ex)
        {
            return Results.Problem("An error occurred: " + ex.Message);
        }
    }

    [HttpGet("id={id}", Name = "GetChannelById")]
    public async Task<IResult> GetChannel(int id)
    {
        try
        {
            var results = await _data.GetChannelById(id);
            if (results == null) return Results.NotFound();
            return Results.Ok(results);
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }

    [HttpPost(Name = "InsertChannel")]
    public async Task<IResult> InsertChannel([FromBody] ChannelDTO profile)
    {
        var userName = ControllerMethods.GetUserName(User);

        try
        {
            await _data.InsertChannel(profile, userName);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }
    [HttpPut(Name = "UpdateChannel")]
    public async Task<IResult> UpdateChannel([FromBody] ChannelDTO profile)
    {
        try
        {
            await _data.UpdateChannel(profile);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }
    [HttpPut("{id}", Name = "ArchiveChannel")]
    public async Task<IResult> ArchiveChannel(int id)
    {
        try
        {
            await _data.ArchiveChannel(id);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }
    [HttpDelete("{id}", Name = "DeleteChannel")]
    public async Task<IResult> DeleteChannel(int id)
    {
        try
        {
            await _data.DeleteChannel(id);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }
}
