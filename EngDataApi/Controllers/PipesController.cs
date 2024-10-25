using DataAccess;
using EngDataApi;
using Microsoft.AspNetCore.Mvc;

namespace EADatabaseApi.Controllers;

[Route("SteelProfiles/[controller]")]
[ApiController]
public class PipesController : ControllerBase
{
    private readonly IPrimaryInfoData _data;

    public PipesController(IPrimaryInfoData data)
    {
        _data = data;
    }

    
    [HttpGet(Name = "GetItems")]
    public async Task<IResult> GetItems(
        [FromQuery] string? standard,
        [FromQuery] string? variation,
        [FromQuery] string? designation)
    {
        try
        {
            var results = await _data.GetItems(standard, variation, designation);
            if (results == null)
                return Results.NotFound("No items found matching the specified criteria.");
            return Results.Ok(results);
        }
        catch (Exception ex)
        {
            return Results.Problem("An error occurred: " + ex.Message);
        }
    }
}