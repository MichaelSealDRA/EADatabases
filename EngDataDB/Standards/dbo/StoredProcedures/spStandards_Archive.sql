CREATE PROCEDURE [dbo].[spStandards_Archive]
    @Id uniqueidentifier,
    @Date DATETIME
AS
BEGIN
    UPDATE dbo.[Standards]
    SET Date = @Date, Active = 0
    WHERE Id = @Id;
END;