CREATE PROCEDURE [dbo].[spChannels_Insert]
	@Standard nvarchar(50),
	@Description nvarchar(50),
	@Designation nvarchar(50),
	@Height float,
	@Width float,
	@WebThickness float,
	@FlangeThickness float,
	@InsideRadius float,
	@OutsideRadius float,
	@InsideHeight float,
	@WallAngle Float,
	@a_c float,
	@a_y float
AS
begin
	insert into dbo.[Channels] (Standard, Description, Designation, Height, Width, WebThickness, FlangeThickness, InsideRadius, OutsideRadius, InsideHeight, WallAngle, a_c, a_y)
	values (@Standard, @Description, @Designation, @Height, @Width, @WebThickness, @FlangeThickness, @InsideRadius, @OutsideRadius, @InsideHeight, @WallAngle, @a_c, @a_y);
End