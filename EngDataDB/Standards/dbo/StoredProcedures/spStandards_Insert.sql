CREATE PROCEDURE [dbo].[spStandards_Insert]
    @Code nvarchar(50), 
    @FullCode nvarchar(50), 
    @Description nvarchar(100), 
    @Metric bit, 
    @Associated nvarchar(200), 
    @Verified bit, 
    @Reference nvarchar(50), 
    @Official bit, 
    @Comments nvarchar(500), 
    @Access nvarchar(50)
AS
BEGIN
    INSERT INTO dbo.[Standards] (Code, FullCode, Description, Metric, Associated, Verified, Reference, Official, Comments, Access)
    VALUES (@Code, @FullCode, @Description, @Metric, @Associated, @Verified, @Reference, @Official, @Comments, @Access);
END;