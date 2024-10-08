CREATE PROCEDURE [dbo].[spChannels_Get]
	@Id int
AS
begin
	select Id, Designation, Height, Width, WebThickness, FlangeThickness, InsideRadius, OutsideRadius, InsideHeight, WallAngle, a_c, a_y
	from dbo.[Channels]
	where Id = @Id;
end
