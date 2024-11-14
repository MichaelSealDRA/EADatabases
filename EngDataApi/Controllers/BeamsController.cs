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

    private IResult HandleException(Exception ex)
    {
        // Log the exception
        return Results.Problem(ex.Message);
    }

    [HttpGet("all", Name = "GetAllBeams")]
    public async Task<IResult> GetAllBeams()
    {
        try
        {
            var results = await _data.GetAllBeams();
            var filteredResults = ControllerMethods.FilterByAccess(results.ToList(), User);
            return Results.Ok(filteredResults);
        }
        catch (Exception ex)
        {
            return HandleException(ex);
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
            return results is not null && results.Any()
                ? Results.Ok(results)
                : Results.NotFound("No beams found matching the specified criteria.");
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }

    [HttpGet("id={id:guid}", Name = "GetBeamById")]
    public async Task<IResult> GetBeamById(Guid id)
    {
        try
        {
            var result = await _data.GetBeamById(id);
            return result is not null
                ? Results.Ok(result)
                : Results.NotFound($"Beam with ID {id} not found.");
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }

    [HttpPost(Name = "InsertBeam")]
    public async Task<IResult> InsertBeam([FromBody] BeamDTO profile)
    {
        if (!ModelState.IsValid)
            return Results.BadRequest(ModelState);

        var userName = ControllerMethods.GetUserName(User);

        try
        {
            await _data.InsertBeam(profile, userName);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }

    [HttpPut(Name = "UpdateBeam")]
    public async Task<IResult> UpdateBeam([FromBody] BeamDTO profile)
    {
        if (!ModelState.IsValid)
            return Results.BadRequest(ModelState);
        try
        {
            await _data.UpdateBeam(profile);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }

    [HttpPut("{id:guid}", Name = "ArchiveBeam")]
    public async Task<IResult> ArchiveBeam(Guid id)
    {
        try
        {
            await _data.ArchiveBeam(id);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }

    [HttpDelete("{id:guid}", Name = "DeleteBeam")]
    public async Task<IResult> DeleteBeam(Guid id)
    {
        try
        {
            await _data.DeleteBeam(id);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }
}