CREATE PROCEDURE [dbo].[spStandards_InsertWithId]
    @Id uniqueidentifier,
    @Code nvarchar(50), 
    @FullCode nvarchar(50), 
    @Description nvarchar(200), 
    @Metric bit, 
    @Associated nvarchar(200), 
    @Verified bit, 
    @Reference nvarchar(200), 
    @Official bit, 
    @Comments nvarchar(500), 
    @Access nvarchar(200),
    @Date datetime,
    @Active bit,
    @Uploader nvarchar(50)
AS
BEGIN
    INSERT INTO dbo.[Standards] (Id, Code, FullCode, Description, Metric, Associated, Verified, Reference, Official, Comments, Access, Date, Active, Uploader)
    VALUES (@Id, @Code, @FullCode, @Description, @Metric, @Associated, @Verified, @Reference, @Official, @Comments, @Access, @Date, @Active, @Uploader);
END;