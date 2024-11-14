CREATE PROCEDURE [dbo].[spStandards_Update]
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
    UPDATE dbo.[Standards]
    SET 
        Code = @Code,
        FullCode = @FullCode,
        Description = @Description,
        Metric = @Metric,
        Associated = @Associated,
        Verified = @Verified,
        Reference = @Reference,
        Official = @Official,
        Comments = @Comments,
        Access = @Access,
        Date = @Date,
        Active = @Active,
        Uploader = @Uploader

    WHERE Id = @Id;
END;