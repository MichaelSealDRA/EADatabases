CREATE PROCEDURE [dbo].[spAngles_Get]
    @Standard NVARCHAR(50) = NULL,
    @Variation NVARCHAR(50) = NULL,
    @Designation NVARCHAR(50) = NULL
AS
BEGIN
    SELECT AnglesTable.Id, AnglesTable.StandardId, AnglesTable.Modified, AnglesTable.Preferred, AnglesTable.Variation, AnglesTable.Designation, AnglesTable.Date, AnglesTable.Active, AnglesTable.Uploader,
    AnglesTable.G, AnglesTable.h, AnglesTable.b, AnglesTable.t, AnglesTable.A, AnglesTable.r1, AnglesTable.r2, AnglesTable.Ix, AnglesTable.Sx, AnglesTable.Rx, AnglesTable.Iy, AnglesTable.Sy, AnglesTable.Ry, AnglesTable.Tr, AnglesTable.Ts, AnglesTable.ax, AnglesTable.ay,
    StandardsTable.Code as Standard, StandardsTable.Description, StandardsTable.Metric, StandardsTable.Verified, StandardsTable.Access

    FROM dbo.[Angles] AnglesTable
    INNER JOIN dbo.[Standards] StandardsTable ON AnglesTable.StandardId = StandardsTable.Id

    WHERE (@Standard IS NULL OR StandardsTable.Code = @Standard)
      AND (@Variation IS NULL OR AnglesTable.Variation = @Variation)
      AND (@Designation IS NULL OR AnglesTable.Designation = @Designation);
END;