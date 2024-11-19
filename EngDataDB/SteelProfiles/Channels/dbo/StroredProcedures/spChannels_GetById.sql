CREATE PROCEDURE [dbo].[spChannels_GetById]
    @Id UNIQUEIDENTIFIER
AS
BEGIN
    SELECT 
        ChannelsTable.Id, 
        ChannelsTable.StandardId, 
        ChannelsTable.Modified, 
        ChannelsTable.Preferred, 
        ChannelsTable.Variation, 
        ChannelsTable.Designation, 
        ChannelsTable.Date, 
        ChannelsTable.Active, 
        ChannelsTable.Uploader,
        ChannelsTable.G, 
        ChannelsTable.h, 
        ChannelsTable.b, 
        ChannelsTable.s, 
        ChannelsTable.t, 
        ChannelsTable.A, 
        ChannelsTable.r1, 
        ChannelsTable.r2, 
        ChannelsTable.Beta, 
        ChannelsTable.Ix, 
        ChannelsTable.Sx, 
        ChannelsTable.Rx, 
        ChannelsTable.Iy, 
        ChannelsTable.Sy, 
        ChannelsTable.Ry, 
        ChannelsTable.Tr, 
        ChannelsTable.Ts, 
        ChannelsTable.ac, 
        ChannelsTable.ay,
        ChannelsTable.Tapered,
        StandardsTable.Code AS Standard, 
        StandardsTable.Description, 
        StandardsTable.Metric, 
        StandardsTable.Verified, 
        StandardsTable.Access
    FROM 
        dbo.[Channels] ChannelsTable
    INNER JOIN 
        dbo.[Standards] StandardsTable 
        ON ChannelsTable.StandardId = StandardsTable.Id
    WHERE 
        ChannelsTable.Id = @Id;
END;