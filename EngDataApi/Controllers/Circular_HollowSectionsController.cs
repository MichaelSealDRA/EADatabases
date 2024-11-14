using DataAccess;
using EngDataApi;
using Microsoft.AspNetCore.Mvc;

namespace EADatabaseApi.Controllers;

[Route("SteelProfiles/[controller]")]
[ApiController]
public class Circular_HollowSectionsController : ControllerBase
{
    private readonly ICircular_HollowSectionData _data;

    public Circular_HollowSectionsController(ICircular_HollowSectionData data)
    {
        _data = data;
    }

    private IResult HandleException(Exception ex)
    {
        // Log the exception
        return Results.Problem(ex.Message);
    }

    [HttpGet("all", Name = "GetAllCircularHollowSections")]
    public async Task<IResult> GetAllCircularHollowSections()
    {
        try
        {
            var results = await _data.GetAllCircular_HollowSections();
            var filteredResults = ControllerMethods.FilterByAccess(results.ToList(), User);
            return Results.Ok(filteredResults);
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }

    [HttpGet(Name = "GetCircularHollowSections")]
    public async Task<IResult> GetCircularHollowSections(
        [FromQuery] string? standard,
        [FromQuery] string? variation,
        [FromQuery] string? designation)
    {
        try
        {
            var results = await _data.GetCircular_HollowSections(standard, variation, designation);
            return results is not null && results.Any()
                ? Results.Ok(results)
                : Results.NotFound("No circular hollow sections found matching the specified criteria.");
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }

    [HttpGet("id={id:guid}", Name = "GetCircularHollowSectionById")]
    public async Task<IResult> GetCircularHollowSectionById(Guid id)
    {
        try
        {
            var result = await _data.GetCircular_HollowSectionById(id);
            return result is not null
                ? Results.Ok(result)
                : Results.NotFound($"Circular hollow section with ID {id} not found.");
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }

    [HttpPost(Name = "InsertCircularHollowSection")]
    public async Task<IResult> InsertCircularHollowSection([FromBody] Circular_HollowSectionDTO profile)
    {
        if (!ModelState.IsValid)
            return Results.BadRequest(ModelState);

        var userName = ControllerMethods.GetUserName(User);

        try
        {
            await _data.InsertCircular_HollowSection(profile, userName);
            return Results.Ok("Circular hollow section inserted successfully.");
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }

    [HttpPut(Name = "UpdateCircularHollowSection")]
    public async Task<IResult> UpdateCircularHollowSection([FromBody] Circular_HollowSectionDTO profile)
    {
        if (!ModelState.IsValid)
            return Results.BadRequest(ModelState);

        try
        {
            await _data.UpdateCircular_HollowSection(profile);
            return Results.Ok("Circular hollow section updated successfully.");
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }

    [HttpPut("{id:guid}", Name = "ArchiveCircularHollowSection")]
    public async Task<IResult> ArchiveCircularHollowSection(Guid id)
    {
        try
        {
            await _data.ArchiveCircular_HollowSection(id);
            return Results.Ok("Circular hollow section archived successfully.");
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }

    [HttpDelete("{id:guid}", Name = "DeleteCircularHollowSection")]
    public async Task<IResult> DeleteCircularHollowSection(Guid id)
    {
        try
        {
            await _data.DeleteCircular_HollowSection(id);
            return Results.Ok("Circular hollow section deleted successfully.");
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }
}