CREATE PROCEDURE [dbo].[spChannels_Insert]
	@Designation nvarchar(50),
	@Height float,
	@Width float,
	@WebThickness float,
	@FlangeThickness float,
	@InsideRadius float,
	@OutsideRadius float,
	@InsideHeight float,
	@WallAngle float,
	@a_c float,
	@a_y float
AS
begin
	insert into dbo.[Channels] (Designation, Height, Width, WebThickness, FlangeThickness, InsideRadius, OutsideRadius,InsideHeight, WallAngle, a_c, a_y)
	values (@Designation, @Height, @Width, @WebThickness, @FlangeThickness, @InsideRadius, @OutsideRadius, @InsideHeight, @WallAngle, @a_c, @a_y);
end