CREATE PROCEDURE [dbo].[spChannels_Get]
    @Id int = NULL,
    @Standard nvarchar(50) = NULL,
    @Description nvarchar(50) = NULL,
    @Designation nvarchar(50) = NULL
AS
BEGIN
    SELECT 
        Id, Standard, Description, Designation, 
        Height, Width, WebThickness, FlangeThickness, InsideRadius, OutsideRadius, InsideHeight, WallAngle,
        a_c, a_y
    FROM dbo.[Channels]
    WHERE 
        (@Id IS NULL OR Id = @Id) AND
        (@Standard IS NULL OR Standard = @Standard) AND
        (@Description IS NULL OR Description = @Description) AND
        (@Designation IS NULL OR Designation = @Designation);
END