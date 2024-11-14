CREATE PROCEDURE [dbo].[spCircular_HollowSections_Insert]
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
    INSERT INTO dbo.[Circular_HollowSections] 
    (
        StandardId, Modified, Preferred, Variation, Designation, Date, Active, Uploader,
        D, T, M, A, Ix, Iy, Rx, Ry
    )
    VALUES 
    (
        @StandardId, @Modified, @Preferred, @Variation, @Designation, @Date, @Active, @Uploader,
        @D, @T, @M, @A, @Ix, @Iy, @Rx, @Ry
    );
END;