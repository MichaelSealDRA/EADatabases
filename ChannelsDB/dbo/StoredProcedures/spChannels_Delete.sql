CREATE PROCEDURE [dbo].[spChannels_Delete]
	@Id int
AS
begin
	delete 
	from dbo.[Channels]
	where Id = @Id;
end
