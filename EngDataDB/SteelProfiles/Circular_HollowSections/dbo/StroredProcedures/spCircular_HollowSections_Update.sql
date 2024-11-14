CREATE PROCEDURE [dbo].[spCircular_HollowSections_Update]
    @Id UNIQUEIDENTIFIER,
    @StandardId UNIQUEIDENTIFIER,
    @Modified BIT,
    @Preferred BIT,
    @Variation NVARCHAR(50),
    @Designation NVARCHAR(50),
    @Date DATETIME,
    @Active BIT,
    @Uploader NVARCHAR(50),

    @D FLOAT,
    @T FLOAT,
    @M FLOAT,
    @A FLOAT,
    @Ix FLOAT,
    @Iy FLOAT,
    @Rx FLOAT,
    @Ry FLOAT
AS
BEGIN
    UPDATE dbo.[Circular_HollowSections]
    SET 
        StandardId = @StandardId,
        Modified = @Modified,
        Preferred = @Preferred,
        Variation = @Variation,
        Designation = @Designation,
        Date = @Date,
        Active = @Active,
        Uploader = @Uploader,
        D = @D,
        T = @T,
        M = @M,
        A = @A,
        Ix = @Ix,
        Iy = @Iy,
        Rx = @Rx,
        Ry = @Ry
    WHERE 
        Id = @Id;
END;