CREATE PROCEDURE [dbo].[spAngles_Insert]
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
	insert into dbo.[Angles] (Designation, Height, Width, Thickness, InsideRadius, OutsideRadius, a_x, a_y)
	values (@Designation, @Height, @Width, @Thickness, @InsideRadius, @OutsideRadius, @a_x, @a_y);
end