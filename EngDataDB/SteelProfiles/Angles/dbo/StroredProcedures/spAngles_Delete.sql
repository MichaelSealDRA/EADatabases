CREATE PROCEDURE [dbo].[spAngles_Delete]
    @Id INT
AS
BEGIN
    DELETE FROM dbo.[Angles]
    WHERE Id = @Id;
END;