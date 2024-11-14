CREATE PROCEDURE [dbo].[spStandards_Delete]
    @Id uniqueidentifier
AS
BEGIN
    DELETE FROM dbo.[Standards]
    WHERE Id = @Id;
END;