CREATE PROCEDURE [dbo].[spAngles_Insert]
    @Standard NVARCHAR(50),
    @Modified BIT,
    @Metric BIT,
    @Preferred BIT,
    @Variation NVARCHAR(50),
    @Designation NVARCHAR(50),
    @Description NVARCHAR(50),
    @G FLOAT,
    @h FLOAT,
    @b FLOAT,
    @t FLOAT,
    @A FLOAT,
    @r1 FLOAT,
    @r2 FLOAT,
    @Ix FLOAT,
    @Sx FLOAT,
    @Rx FLOAT,
    @Iy FLOAT,
    @Sy FLOAT,
    @Ry FLOAT,
    @Tr FLOAT,
    @Ts FLOAT,
    @ax FLOAT,
    @ay FLOAT,
    @Verified BIT,
    @Reference NVARCHAR(50),
    @Official BIT,
    @Comments NVARCHAR(500),
    @Date DATETIME,
    @Active BIT,
    @Uploader NVARCHAR(50),
    @Access NVARCHAR(200)
AS
BEGIN
    INSERT INTO dbo.[Angles] (Standard, Modified, Metric, Preferred, Variation, Designation, Description, G, h, b, t, A, r1, r2, Ix, Sx, Rx, Iy, Sy, Ry, Tr, Ts, ax, ay, Verified, Reference, Official, Comments, Date, Active, Uploader, Access)
    VALUES (@Standard, @Modified, @Metric, @Preferred, @Variation, @Designation, @Description, @G, @h, @b, @t, @A, @r1, @r2, @Ix, @Sx, @Rx, @Iy, @Sy, @Ry, @Tr, @Ts, @ax, @ay, @Verified, @Reference, @Official, @Comments, @Date, @Active, @Uploader, @Access);
END;