CREATE PROCEDURE [dbo].[spBeams_GetById]
    @Id INT
AS
BEGIN
    SELECT 
        Id, Standard, Modified, Metric, Preferred, Variation, Designation, Description, 
        G, h, b, s, t, A, r1, r2, Beta, Ix, Sx, Rx, Iy, Sy, Ry, Tr, Ts, 
        Verified, Reference, Official, Comments, Date, Active, Uploader, Access
    FROM dbo.[Beams]
    WHERE Id = @Id;
END;