CREATE PROCEDURE [dbo].[spAngles_Get]
    @Standard NVARCHAR(50) = NULL,
    @Variation NVARCHAR(50) = NULL,
    @Designation NVARCHAR(50) = NULL
AS
BEGIN
    SELECT Id, Standard, Modified, Metric, Preferred, Variation, Designation, Description, G, h, b, t, A, r1, r2, Ix, Sx, Rx, Iy, Sy, Ry, Tr, Ts, ax, ay, Verified, Reference, Official, Comments, Date, Active, Uploader, Access
    FROM dbo.[Angles]
    WHERE (@Standard IS NULL OR Standard = @Standard)
      AND (@Variation IS NULL OR Variation = @Variation)
      AND (@Designation IS NULL OR Designation = @Designation);
END;