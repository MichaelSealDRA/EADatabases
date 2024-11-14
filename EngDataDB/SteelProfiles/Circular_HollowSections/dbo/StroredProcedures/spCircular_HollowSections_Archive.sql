CREATE PROCEDURE [dbo].[spCircular_HollowSections_Archive]
    @Id UNIQUEIDENTIFIER,
    @Date DATETIME
AS
BEGIN
    UPDATE dbo.[Circular_HollowSections]
    SET Date = @Date, Active = 0
    WHERE Id = @Id;
END;