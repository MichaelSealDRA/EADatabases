using DataAccess;
using EngDataApi;
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

    private IResult HandleException(Exception ex)
    {
        // Log the exception
        return Results.Problem(ex.Message);
    }

    [HttpGet("all", Name = "GetAllChannels")]
    public async Task<IResult> GetAllChannels()
    {
        try
        {
            var results = await _data.GetAllChannels();
            var filteredResults = ControllerMethods.FilterByAccess(results.ToList(), User);
            return Results.Ok(filteredResults);
        }
        catch (Exception ex)
        {
            return HandleException(ex);
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
            return results is not null && results.Any()
                ? Results.Ok(results)
                : Results.NotFound("No channels found matching the specified criteria.");
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }

    [HttpGet("id={id:guid}", Name = "GetChannelById")]
    public async Task<IResult> GetChannelById(Guid id)
    {
        try
        {
            var result = await _data.GetChannelById(id);
            return result is not null
                ? Results.Ok(result)
                : Results.NotFound($"Channel with ID {id} not found.");
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }

    [HttpPost(Name = "InsertChannel")]
    public async Task<IResult> InsertChannel([FromBody] ChannelDTO profile)
    {
        if (!ModelState.IsValid)
            return Results.BadRequest(ModelState);

        var userName = ControllerMethods.GetUserName(User);

        try
        {
            await _data.InsertChannel(profile, userName);
            return Results.Ok("Channel inserted successfully.");
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }

    [HttpPut(Name = "UpdateChannel")]
    public async Task<IResult> UpdateChannel([FromBody] ChannelDTO profile)
    {
        if (!ModelState.IsValid)
            return Results.BadRequest(ModelState);

        try
        {
            await _data.UpdateChannel(profile);
            return Results.Ok("Channel updated successfully.");
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }

    [HttpPut("{id:guid}", Name = "ArchiveChannel")]
    public async Task<IResult> ArchiveChannel(Guid id)
    {
        try
        {
            await _data.ArchiveChannel(id);
            return Results.Ok("Channel archived successfully.");
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }

    [HttpDelete("{id:guid}", Name = "DeleteChannel")]
    public async Task<IResult> DeleteChannel(Guid id)
    {
        try
        {
            await _data.DeleteChannel(id);
            return Results.Ok("Channel deleted successfully.");
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }
}