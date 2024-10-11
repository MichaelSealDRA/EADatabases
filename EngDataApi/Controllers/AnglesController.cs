using DataAccess;
using Microsoft.AspNetCore.Authorization;
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
    [HttpGet("All", Name = "GetAllAngles")]
    public async Task<IResult> GetAllAngles()
    {
        try
        {
            var results = await _data.GetAllAngles();
            return Results.Ok(results);
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }

    [HttpGet(Name = "GetAngles")]
    public async Task<IResult> GetAngles(
    [FromQuery] int? id,
    [FromQuery] string? standard,
    [FromQuery] string? description,
    [FromQuery] string? designation)
    {
        try
        {
            var results = await _data.GetAngles(id, standard, description, designation);
            if (results == null)
                return Results.NotFound("No angle found matching the specified criteria.");

            return Results.Ok(results);
        }
        catch (Exception ex)
        {
            return Results.Problem("An error occurred: " + ex.Message);
        }
    }

    [HttpGet("id={id}", Name = "GetAngleById")]
    public async Task<IResult> GetAngle(int id)
    {
        try
        {
            var results = await _data.GetAngleById(id);
            if (results == null) return Results.NotFound();
            return Results.Ok(results);
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }

    [HttpPost(Name = "InsertAngle")]
    public async Task<IResult> InsertAngle([FromBody] AngleProfile profile)
    {
        try
        {
            await _data.InsertAngle(profile);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }
    [HttpPut(Name = "UpdateAngle")]
    public async Task<IResult> UpdateAngle([FromBody] AngleProfile profile)
    {
        try
        {
            await _data.UpdateAngle(profile);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }
    [HttpDelete("{id}", Name = "DeleteAngle")]
    public async Task<IResult> DeleteAngle(int id)
    {
        try
        {
            await _data.DeleteAngle(id);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }
}
