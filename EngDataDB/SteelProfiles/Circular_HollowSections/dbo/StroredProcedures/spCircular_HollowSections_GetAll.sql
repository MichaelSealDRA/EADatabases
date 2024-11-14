CREATE PROCEDURE [dbo].[spCircular_HollowSections_GetAll]
AS
BEGIN
    SELECT 
        SectionsTable.Id, 
        SectionsTable.StandardId, 
        SectionsTable.Modified, 
        SectionsTable.Preferred, 
        SectionsTable.Variation, 
        SectionsTable.Designation, 
        SectionsTable.Date, 
        SectionsTable.Active, 
        SectionsTable.Uploader,
        SectionsTable.D, 
        SectionsTable.T, 
        SectionsTable.M, 
        SectionsTable.A, 
        SectionsTable.Ix, 
        SectionsTable.Iy, 
        SectionsTable.Rx, 
        SectionsTable.Ry,
        StandardsTable.Code AS Standard, 
        StandardsTable.Description, 
        StandardsTable.Metric, 
        StandardsTable.Verified, 
        StandardsTable.Access
    FROM 
        dbo.[Circular_HollowSections] SectionsTable
    INNER JOIN 
        dbo.[Standards] StandardsTable 
        ON SectionsTable.StandardId = StandardsTable.Id;
END;