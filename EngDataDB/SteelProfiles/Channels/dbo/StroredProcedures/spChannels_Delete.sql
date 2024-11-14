CREATE PROCEDURE [dbo].[spChannels_Delete]
    @Id UNIQUEIDENTIFIER
AS
BEGIN
    DELETE FROM dbo.[Channels]
    WHERE Id = @Id;
END;