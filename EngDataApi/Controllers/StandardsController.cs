using DataAccess;
using EngDataApi;
using Microsoft.AspNetCore.Mvc;

namespace EADatabaseApi.Controllers;

[Route("SteelProfiles/[controller]")]
[ApiController]
public class StandardsController : ControllerBase
{
    private readonly IStandardsData _data;

    public StandardsController(IStandardsData data)
    {
        _data = data;
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
            return Results.Problem(ex.Message);
        }
    }

    
    [HttpPost(Name = "InsertStandard")]
    public async Task<IResult> InsertAngle([FromBody] StandardDTO profile)
    {
        var userName = ControllerMethods.GetUserName(User);

        try
        {
            await _data.InsertStandard(profile, userName);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }

}