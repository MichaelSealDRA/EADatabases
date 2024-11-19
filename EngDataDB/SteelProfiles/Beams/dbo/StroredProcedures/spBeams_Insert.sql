CREATE PROCEDURE [dbo].[spBeams_Insert]
    @StandardId UNIQUEIDENTIFIER,
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
    @s FLOAT,
    @t FLOAT,
    @A FLOAT,
    @r1 FLOAT,
    @r2 FLOAT,
    @Beta FLOAT,
    @Ix FLOAT,
    @Sx FLOAT,
    @Rx FLOAT,
    @Iy FLOAT,
    @Sy FLOAT,
    @Ry FLOAT,
    @Tr FLOAT,
    @Ts FLOAT,
    @Tapered BIT
AS
BEGIN
    INSERT INTO dbo.[Beams] 
    (
        StandardId, Modified, Preferred, Variation, Designation, Date, Active, Uploader,
        G, h, b, s, t, A, r1, r2, Beta, Ix, Sx, Rx, Iy, Sy, Ry, Tr, Ts, Tapered
    )
    VALUES 
    (
        @StandardId, @Modified, @Preferred, @Variation, @Designation, @Date, @Active, @Uploader,
        @G, @h, @b, @s, @t, @A, @r1, @r2, @Beta, @Ix, @Sx, @Rx, @Iy, @Sy, @Ry, @Tr, @Ts, @Tapered
    );
END;