CREATE PROCEDURE [dbo].[spStandards_GetById]
    @Id NVARCHAR(50) = NULL
AS
BEGIN
    SELECT Id, Code, FullCode, Description, Metric, Associated, Verified, Reference, Official, Comments, Access, Date, Access, Uploader
    FROM dbo.[Standards]

    WHERE Id = @Id;
END;