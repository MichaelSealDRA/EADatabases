CREATE PROCEDURE [dbo].[spBeams_Delete]
    @Id UNIQUEIDENTIFIER
AS
BEGIN
    DELETE FROM dbo.[Beams]
    WHERE Id = @Id;
END;