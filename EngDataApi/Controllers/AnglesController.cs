using DataAccess;
using EngDataApi;
using Microsoft.AspNetCore.Mvc;

namespace EADatabaseApi.Controllers;

[Route("SteelProfiles/[controller]")]
[ApiController]
public class AnglesController : ControllerBase
{
    private readonly IAngleData _data;

    public AnglesController(IAngleData data)
    {
        _data = data;
    }
    private IResult HandleException(Exception ex)
    {
        // Log the exception
        return Results.Problem(ex.Message);
    }

    [HttpGet("all", Name = "GetAllAngles")]
    public async Task<IResult> GetAllAngles()
    {
        try
        {
            var results = await _data.GetAllAngles();
            var filteredResults = ControllerMethods.FilterByAccess(results.ToList(), User);
            return Results.Ok(filteredResults);
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }

    [HttpGet(Name = "GetAngles")]
    public async Task<IResult> GetAngles(
        [FromQuery] string? standard,
        [FromQuery] string? variation,
        [FromQuery] string? designation)
    {
        try
        {
            var results = await _data.GetAngles(standard, variation, designation);
            return results is not null && results.Any()
                ? Results.Ok(results)
                : Results.NotFound("No angles found matching the specified criteria.");
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }

    [HttpGet("id={id:guid}", Name = "GetAngleById")]
    public async Task<IResult> GetAngleById(Guid id)
    {
        try
        {
            var result = await _data.GetAngleById(id);
            return result is not null 
                ? Results.Ok(result) 
                : Results.NotFound($"Angle with ID {id} not found.");
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }

    [HttpPost(Name = "InsertAngle")]
    public async Task<IResult> InsertAngle([FromBody] AngleDTO profile)
    {
        if (!ModelState.IsValid)
            return Results.BadRequest(ModelState);

        var userName = ControllerMethods.GetUserName(User);

        try
        {
            await _data.InsertAngle(profile, userName);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }

    [HttpPut(Name = "UpdateAngle")]
    public async Task<IResult> UpdateAngle([FromBody] AngleDTO profile)
    {
        if (!ModelState.IsValid)
            return Results.BadRequest(ModelState);
        try
        {
            await _data.UpdateAngle(profile);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }

    [HttpPut("{id:guid}", Name = "ArchiveAngle")]
    public async Task<IResult> ArchiveAngle(Guid id)
    {
        try
        {
            await _data.ArchiveAngle(id);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }

    [HttpDelete("{id:guid}", Name = "DeleteAngle")]
    public async Task<IResult> DeleteAngle(Guid id)
    {
        try
        {
            await _data.DeleteAngle(id);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }
}