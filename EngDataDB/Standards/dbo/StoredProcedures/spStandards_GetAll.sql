CREATE PROCEDURE [dbo].[spStandards_GetAll]
AS
BEGIN
    SELECT Id, Code, FullCode, Description, Metric, Associated, Verified, Reference, Official, Comments, Access
    FROM dbo.[Standards];
END;