CREATE PROCEDURE [dbo].[spAngles_GetAll]
AS
BEGIN
    SELECT Id, Standard, Modified, Metric, Preferred, Variation, Designation, Description, G, h, b, t, A, r1, r2, Ix, Sx, Rx, Iy, Sy, Ry, Tr, Ts, ax, ay, Verified, Reference, Official, Comments, Date, Active, Uploader, Access
    FROM dbo.[Angles];
END;