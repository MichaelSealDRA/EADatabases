CREATE PROCEDURE [dbo].[spBeams_Delete]
    @Id INT
AS
BEGIN
    DELETE FROM dbo.[Beams]
    WHERE Id = @Id;
END;