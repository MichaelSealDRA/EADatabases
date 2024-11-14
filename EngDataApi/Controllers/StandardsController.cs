using DataAccess;
using EngDataApi;
using Microsoft.AspNetCore.Mvc;

namespace EADatabaseApi.Controllers;

[Route("[controller]")]
[ApiController]
public class StandardsController : ControllerBase
{
    private readonly IStandardsData _data;

    public StandardsController(IStandardsData data)
    {
        _data = data;
    }
    private IResult HandleException(Exception ex)
    {
        // Log the exception
        return Results.Problem(ex.Message);
    }

    [HttpGet("All", Name = "GetAllStandards")]
    public async Task<IResult> GetAllStandards()
    {
        try
        {
            var results = await _data.GetAllStandards();
            return Results.Ok(results);
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }

    [HttpGet("id={id:guid}", Name = "GetStandardById")]
    public async Task<IResult> GetStandardById(Guid id)
    {
        try
        {
            var result = await _data.GetStandardById(id);
            return result is not null
                ? Results.Ok(result)
                : Results.NotFound($"Standard with ID {id} not found.");
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }

    [HttpGet("code={code}", Name = "GetStandardByCode")]
    public async Task<IResult> GetStandardByCode(string code)
    {
        try
        {
            var result = await _data.GetStandardByCode(code);
            return result is not null
                ? Results.Ok(result)
                : Results.NotFound($"Standard with code {code} not found.");
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }

    [HttpPost(Name = "InsertStandard")]
    public async Task<IResult> InsertStandard([FromBody] StandardDTO standard)
    {
        var userName = ControllerMethods.GetUserName(User);

        try
        {
            await _data.InsertStandard(standard, userName);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }
    [HttpPost("withid", Name = "InsertStandardWithId")]
    public async Task<IResult> InsertStandardWithId([FromBody] StandardDTO standard)
    {
        var userName = ControllerMethods.GetUserName(User);

        try
        {
            await _data.InsertStandardWithId(standard, userName);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }

    [HttpPut(Name = "UpdateStandard")]
    public async Task<IResult> UpdateStandard([FromBody] StandardDTO standard)
    {
        if (!ModelState.IsValid)
            return Results.BadRequest(ModelState);
        try
        {
            await _data.UpdateStandard(standard);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }

    [HttpPut("{id:guid}", Name = "ArchiveStandard")]
    public async Task<IResult> ArchiveStandard(Guid id)
    {
        try
        {
            await _data.ArchiveStandard(id);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }

    [HttpDelete("{id:guid}", Name = "DeleteStandard")]
    public async Task<IResult> DeleteStandard(Guid id)
    {
        try
        {
            await _data.DeleteStandard(id);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return HandleException(ex);
        }
    }
}