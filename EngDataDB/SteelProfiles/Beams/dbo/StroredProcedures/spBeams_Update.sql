﻿CREATE PROCEDURE [dbo].[spBeams_Update]
    @Id UNIQUEIDENTIFIER,
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
    @Ts FLOAT
AS
BEGIN
    UPDATE dbo.[Beams]
    SET 
        StandardId = @StandardId,
        Modified = @Modified,
        Preferred = @Preferred,
        Variation = @Variation,
        Designation = @Designation,
        Date = @Date,
        Active = @Active,
        Uploader = @Uploader,

        G = @G,
        h = @h,
        b = @b,
        s = @s,
        t = @t,
        A = @A,
        r1 = @r1,
        r2 = @r2,
        Beta = @Beta,
        Ix = @Ix,
        Sx = @Sx,
        Rx = @Rx,
        Iy = @Iy,
        Sy = @Sy,
        Ry = @Ry,
        Tr = @Tr,
        Ts = @Ts

    WHERE Id = @Id;
END;