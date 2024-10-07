CREATE PROCEDURE [dbo].[spAngles_Delete]
	@Id int
AS
begin
	delete 
	from dbo.[Angles]
	where Id = @Id;
end
