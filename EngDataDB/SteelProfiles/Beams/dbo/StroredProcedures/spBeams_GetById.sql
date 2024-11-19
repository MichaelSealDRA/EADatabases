CREATE PROCEDURE [dbo].[spBeams_GetById]
    @Id UNIQUEIDENTIFIER
AS
BEGIN
    SELECT 
        BeamsTable.Id, 
        BeamsTable.StandardId, 
        BeamsTable.Modified, 
        BeamsTable.Preferred, 
        BeamsTable.Variation, 
        BeamsTable.Designation, 
        BeamsTable.Date, 
        BeamsTable.Active, 
        BeamsTable.Uploader,
        BeamsTable.G, 
        BeamsTable.h, 
        BeamsTable.b, 
        BeamsTable.s, 
        BeamsTable.t, 
        BeamsTable.A, 
        BeamsTable.r1, 
        BeamsTable.r2, 
        BeamsTable.Beta, 
        BeamsTable.Ix, 
        BeamsTable.Sx, 
        BeamsTable.Rx, 
        BeamsTable.Iy, 
        BeamsTable.Sy, 
        BeamsTable.Ry, 
        BeamsTable.Tr, 
        BeamsTable.Ts,
        BeamsTable.Tapered,
        StandardsTable.Code AS Standard, 
        StandardsTable.Description, 
        StandardsTable.Metric, 
        StandardsTable.Verified, 
        StandardsTable.Access
    FROM 
        dbo.[Beams] BeamsTable
    INNER JOIN 
        dbo.[Standards] StandardsTable 
        ON BeamsTable.StandardId = StandardsTable.Id
    WHERE 
        BeamsTable.Id = @Id;
END;