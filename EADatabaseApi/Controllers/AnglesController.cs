using DataAccess;
using Microsoft.AspNetCore.Mvc;

namespace EADatabaseApi.Controllers;

[Route("api/[controller]")]
[ApiController]
public class AnglesController : ControllerBase
{
    private readonly IAngleData _data;
    public AnglesController(IAngleData data)
    {
        _data = data;
    }
    [HttpGet(Name = "GetAllAngles")]
    public async Task<IResult> GetAllAngles()
    {
        try
        {
            var results = await _data.GetAngles();
            return Results.Ok(results);
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }

    [HttpGet("id={id}", Name = "GetAngleById")]
    public async Task<IActionResult> GetAngleById(int id)
    {
        try
        {
            var results = await _data.GetAngle(id);
            if (results == null) return NotFound();
            return Ok(results);
        }
        catch (Exception ex)
        {
            return Problem(ex.Message);
        }
    }

    [HttpGet("designation={designation}", Name = "GetAngleByDesignation")]
    public async Task<IResult> GetAngleByDesignation(string designation)
    {
        try
        {
            var results = await _data.GetAngle(designation);
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

    [HttpPut("{id}", Name = "UpdateAngle")]
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
