CREATE PROCEDURE [dbo].[spAngles_Insert]
	@Standard nvarchar(50),
	@Description nvarchar(50),
	@Designation nvarchar(50),
	@Height float,
	@Width float,
	@Thickness float,
	@InsideRadius float,
	@OutsideRadius float,
	@a_x float,
	@a_y float
AS
begin
	insert into dbo.[Angles] (Standard, Description, Designation, Height, Width, Thickness, InsideRadius, OutsideRadius, a_x, a_y)
	values (@Standard, @Description, @Designation, @Height, @Width, @Thickness, @InsideRadius, @OutsideRadius, @a_x, @a_y);
End