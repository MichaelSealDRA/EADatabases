CREATE PROCEDURE [dbo].[spAngles_Archive]
    @Id INT,
    @Date DATETIME
AS
BEGIN
    UPDATE dbo.[Angles]
    SET Date = @Date, Active = 0
    WHERE Id = @Id;
END;