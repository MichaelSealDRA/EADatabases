CREATE PROCEDURE [dbo].[spChannels_Archive]
	@Id int,
	@Date DateTime
AS
begin
	update dbo.[Channels]
	
	set Date = @Date,
	Active = 0

	where Id = @Id
end
