CREATE PROCEDURE [dbo].[spAngles_Delete]
    @Id uniqueidentifier
AS
BEGIN
    DELETE FROM dbo.[Angles]
    WHERE Id = @Id;
END;