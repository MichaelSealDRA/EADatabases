using DataAccess;
using Microsoft.AspNetCore.Mvc;

namespace EADatabaseApi.Controllers;

[Route("api/[controller]")]
[ApiController]
public class ChannelsController : ControllerBase
{
    private readonly IChannelData _data;
    public ChannelsController(IChannelData data)
    {
        _data = data;
    }
    [HttpGet(Name = "GetAllChannels")]
    public async Task<IResult> GetChannels()
    {
        try
        {
            var results = await _data.GetChannels();
            return Results.Ok(results);
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }

    [HttpGet("id={id}", Name = "GetChannelById")]
    public async Task<IActionResult> GetChannelById(int id)
    {
        try
        {
            var results = await _data.GetChannel(id);
            if (results == null) return NotFound();
            return Ok(results);
        }
        catch (Exception ex)
        {
            return Problem(ex.Message);
        }
    }

    [HttpGet("designation={designation}", Name = "GetChannelByDesignation")]
    public async Task<IResult> GetChannelByDesignation(string designation)
    {
        try
        {
            var results = await _data.GetChannel(designation);
            if (results == null) return Results.NotFound();
            return Results.Ok(results);
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }

    [HttpPost(Name = "InsertChannel")]
    public async Task<IResult> InsertChannel([FromBody] ChannelProfile profile)
    {
        try
        {
            await _data.InsertChannel(profile);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }

    [HttpPut("{id}", Name = "UpdateChannel")]
    public async Task<IResult> UpdateChannel([FromBody] ChannelProfile profile)
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
