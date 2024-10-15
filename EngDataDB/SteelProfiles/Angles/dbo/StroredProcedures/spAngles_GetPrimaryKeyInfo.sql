CREATE PROCEDURE [dbo].[spAngles_GetPrimaryKeyInfo]
    @Standard nvarchar(50) = NULL,
    @Description nvarchar(50) = NULL,
    @Designation nvarchar(50) = NULL
AS
BEGIN
    SELECT 
        Standard, Description, Designation
    FROM dbo.[Angles]
    WHERE 
        (@Standard IS NULL OR Standard = @Standard) AND
        (@Description IS NULL OR Description = @Description) AND
        (@Designation IS NULL OR Designation = @Designation);
END