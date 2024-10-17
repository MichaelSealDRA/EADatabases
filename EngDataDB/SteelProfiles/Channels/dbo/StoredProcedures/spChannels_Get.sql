CREATE PROCEDURE [dbo].[spChannels_Get]
    @Standard nvarchar(50) = NULL,
    @Variation nvarchar(50) = NULL,
    @Designation nvarchar(50) = NULL
AS
BEGIN
    SELECT 
        Id, Standard, Modified, Metric, Preferred, Variation, Designation, Description, G, h, b, s, t, A, r1, r2, Beta, Ix, Sx, Rx, Iy, Sy, Ry,Tr, Ts, ac, ay, Verified, Reference, Official, Comments, Date, Active, Uploader, Access
    FROM dbo.[Channels]
    WHERE 
        (@Standard IS NULL OR Standard = @Standard) AND
        (@Variation IS NULL OR Variation = @Variation) AND
        (@Designation IS NULL OR Designation = @Designation);
END