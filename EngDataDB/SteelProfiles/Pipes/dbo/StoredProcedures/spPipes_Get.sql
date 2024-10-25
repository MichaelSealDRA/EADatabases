CREATE PROCEDURE [dbo].[spPipes_Get]
    @Code NVARCHAR(50) = NULL,
    @Variation NVARCHAR(50) = NULL,
    @Designation NVARCHAR(50) = NULL
AS
BEGIN
    SELECT s.Code, a.Variation, a.Designation, s.Description
    FROM dbo.[Pipes] a
    INNER JOIN dbo.[Standards] s ON a.StandardId = s.Id
    WHERE (@Code IS NULL OR s.Code = @Code)
      AND (@Variation IS NULL OR a.Variation = @Variation)
      AND (@Designation IS NULL OR a.Designation = @Designation);
END;