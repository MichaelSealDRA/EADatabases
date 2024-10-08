CREATE PROCEDURE [dbo].[spChannels_Update]
	@Id int,
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
	update dbo.[Channels]
	set Designation = @Designation,
	Height = @Height,
	Width = @Width,
	WebThickness = @WebThickness,
	FlangeThickness = @FlangeThickness,
	InsideRadius = @InsideRadius,
	OutsideRadius = @OutsideRadius,
	InsideHeight = @InsideHeight,
	WallAngle = @WallAngle,
	a_c = @a_c,
	a_y = @a_y

	where Id = @Id
end
