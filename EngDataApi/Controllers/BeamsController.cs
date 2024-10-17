using DataAccess;
using EngDataApi;
using Microsoft.AspNetCore.Mvc;

namespace EADatabaseApi.Controllers;

[Route("SteelProfiles/[controller]")]
[ApiController]
public class BeamsController : ControllerBase
{
    private readonly IBeamData _data;

    public BeamsController(IBeamData data)
    {
        _data = data;
    }

    [HttpGet("All", Name = "GetAllBeams")]
    public async Task<IResult> GetAllBeams()
    {
        try
        {
            var results = await _data.GetAllBeams();
            var listResults = ControllerMethods.FilterByAccess(results.ToList(), User);
            return Results.Ok(listResults);
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }

    [HttpGet(Name = "GetBeams")]
    public async Task<IResult> GetBeams(
        [FromQuery] string? standard,
        [FromQuery] string? variation,
        [FromQuery] string? designation)
    {
        try
        {
            var results = await _data.GetBeams(standard, variation, designation);
            if (results == null)
                return Results.NotFound("No Beam found matching the specified criteria.");
            return Results.Ok(results);
        }
        catch (Exception ex)
        {
            return Results.Problem("An error occurred: " + ex.Message);
        }
    }

    [HttpGet("id={id}", Name = "GetBeamById")]
    public async Task<IResult> GetBeam(int id)
    {
        try
        {
            var results = await _data.GetBeamById(id);
            if (results == null) return Results.NotFound();
            return Results.Ok(results);
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }

    [HttpPost(Name = "InsertBeam")]
    public async Task<IResult> InsertBeam([FromBody] BeamDTO profile)
    {
        var userName = ControllerMethods.GetUserName(User);

        try
        {
            await _data.InsertBeam(profile, userName);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }

    [HttpPut(Name = "UpdateBeam")]
    public async Task<IResult> UpdateBeam([FromBody] BeamDTO profile)
    {
        try
        {
            await _data.UpdateBeam(profile);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }

    [HttpPut("{id}", Name = "ArchiveBeam")]
    public async Task<IResult> ArchiveBeam(int id)
    {
        try
        {
            await _data.ArchiveBeam(id);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }

    [HttpDelete("{id}", Name = "DeleteBeam")]
    public async Task<IResult> DeleteBeam(int id)
    {
        try
        {
            await _data.DeleteBeam(id);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }
}