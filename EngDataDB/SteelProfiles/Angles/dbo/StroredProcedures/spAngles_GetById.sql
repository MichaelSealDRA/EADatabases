CREATE PROCEDURE [dbo].[spAngles_GetById]
    @Id uniqueidentifier
AS
BEGIN
    SELECT AnglesTable.Id, AnglesTable.StandardId, AnglesTable.Modified, AnglesTable.Preferred, AnglesTable.Variation, AnglesTable.Designation, AnglesTable.Date, AnglesTable.Active, AnglesTable.Uploader,
    AnglesTable.G, AnglesTable.h, AnglesTable.b, AnglesTable.t, AnglesTable.A, AnglesTable.r1, AnglesTable.r2, AnglesTable.Ix, AnglesTable.Sx, AnglesTable.Rx, AnglesTable.Iy, AnglesTable.Sy, AnglesTable.Ry, AnglesTable.Tr, AnglesTable.Ts, AnglesTable.ax, AnglesTable.ay,
    StandardsTable.Code as Standard, StandardsTable.Description, StandardsTable.Metric, StandardsTable.Verified, StandardsTable.Access

    FROM dbo.[Angles] AnglesTable
    INNER JOIN dbo.[Standards] StandardsTable ON AnglesTable.StandardId = StandardsTable.Id

    WHERE AnglesTable.Id = @Id;
END;