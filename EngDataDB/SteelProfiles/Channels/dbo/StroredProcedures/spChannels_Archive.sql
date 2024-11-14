CREATE PROCEDURE [dbo].[spChannels_Archive]
    @Id UNIQUEIDENTIFIER,
    @Date DATETIME
AS
BEGIN
    UPDATE dbo.[Channels]
    SET Date = @Date, Active = 0
    WHERE Id = @Id;
END;