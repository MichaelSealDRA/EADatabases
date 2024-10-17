﻿CREATE PROCEDURE [dbo].[spAngles_Update]
    @Id INT,
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
    UPDATE dbo.[Angles]
    SET 
        Standard = @Standard,
        Modified = @Modified,
        Metric = @Metric,
        Preferred = @Preferred,
        Variation = @Variation,
        Designation = @Designation,
        Description = @Description, 
        G = @G,
        h = @h,
        b = @b,
        t = @t,
        A = @A,
        r1 = @r1,
        r2 = @r2,
        Ix = @Ix,
        Sx = @Sx,
        Rx = @Rx,
        Iy = @Iy,
        Sy = @Sy,
        Ry = @Ry,
        Tr = @Tr,
        Ts = @Ts,
        ax = @ax,
        ay = @ay,
        Verified = @Verified,
        Reference = @Reference,
        Official = @Official,
        Comments = @Comments,
        Date = @Date,
        Active = @Active,
        Uploader = @Uploader,
        Access = @Access
    WHERE Id = @Id;
END;