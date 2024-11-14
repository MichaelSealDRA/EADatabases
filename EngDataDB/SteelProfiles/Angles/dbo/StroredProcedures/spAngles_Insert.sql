CREATE PROCEDURE [dbo].[spAngles_Insert]

    @StandardId uniqueidentifier,
    @Modified BIT,
    @Preferred BIT,
    @Variation NVARCHAR(50),
    @Designation NVARCHAR(50),

    @Date DATETIME,
    @Active BIT,
    @Uploader NVARCHAR(50),

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
    @ay FLOAT
AS
BEGIN
    INSERT INTO dbo.[Angles] (StandardId, Modified, Preferred, Variation, Designation, Date, Active, Uploader, G, h, b, t, A, r1, r2, Ix, Sx, Rx, Iy, Sy, Ry, Tr, Ts, ax, ay)
    VALUES (@StandardId, @Modified, @Preferred, @Variation, @Designation, @Date, @Active, @Uploader, @G, @h, @b, @t, @A, @r1, @r2, @Ix, @Sx, @Rx, @Iy, @Sy, @Ry, @Tr, @Ts, @ax, @ay);
END;