using DataAccess;

namespace DatabaseApi;

public static class AnglesApi
{
    public static void ConfigureAnglesApi(this WebApplication app)
    {
        // All of my API endpoint mapping
        app.MapGet("/Angles", GetAngles);
        app.MapGet("/Angles/id={id}", GetAngleById);
        app.MapGet("/Angles/designation={designation}", GetAngleByDesignation);
        app.MapPost("/Angles", InsertAngle);
        app.MapPut("/Angles", UpdateAngle);
        app.MapDelete("/Angles", DeleteAngle);
    }

    private static async Task<IResult> GetAngles(IAngleData data)
    {
        try
        {
            return Results.Ok(await data.GetAngles());
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }
    private static async Task<IResult> GetAngleById(int id, IAngleData data)
    {
        try
        {
            var results = await data.GetAngle(id);
            if (results == null) return Results.NotFound();
            return Results.Ok(results);
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }
    private static async Task<IResult> GetAngleByDesignation(string designation, IAngleData data)
    {
        try
        {
            var results = await data.GetAngle(designation);
            if (results == null) return Results.NotFound();
            return Results.Ok(results);
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }
    private static async Task<IResult> InsertAngle(AngleProfile profile, IAngleData data)
    {
        try
        {
            await data.InsertAngle(profile);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }
    private static async Task<IResult> UpdateAngle(AngleProfile profile, IAngleData data)
    {
        try
        {
            await data.UpdateAngle(profile);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }
    private static async Task<IResult> DeleteAngle(int id, IAngleData data)
    {
        try
        {
            await data.DeleteAngle(id);
            return Results.Ok();
        }
        catch (Exception ex)
        {
            return Results.Problem(ex.Message);
        }
    }
}
