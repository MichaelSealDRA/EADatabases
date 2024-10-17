CREATE PROCEDURE [dbo].[spBeams_Get]
    @Standard NVARCHAR(50) = NULL,
    @Variation NVARCHAR(50) = NULL,
    @Designation NVARCHAR(50) = NULL
AS
BEGIN
    SELECT Id, Standard, Modified, Metric, Preferred, Variation, Designation, Description, 
           G, h, b, s, t, A, r1, r2, Beta, Ix, Sx, Rx, Iy, Sy, Ry, Tr, Ts, 
           Verified, Reference, Official, Comments, Date, Active, Uploader, Access
    FROM dbo.[Beams]
    WHERE (@Standard IS NULL OR Standard = @Standard)
      AND (@Variation IS NULL OR Variation = @Variation)
      AND (@Designation IS NULL OR Designation = @Designation);
END;