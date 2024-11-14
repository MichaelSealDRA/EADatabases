CREATE PROCEDURE [dbo].[spCircular_HollowSections_Get]
    @Standard NVARCHAR(50) = NULL,
    @Variation NVARCHAR(50) = NULL,
    @Designation NVARCHAR(50) = NULL
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
        ON SectionsTable.StandardId = StandardsTable.Id
    WHERE 
        (@Standard IS NULL OR StandardsTable.Code = @Standard)
        AND (@Variation IS NULL OR SectionsTable.Variation = @Variation)
        AND (@Designation IS NULL OR SectionsTable.Designation = @Designation);
END;