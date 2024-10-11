CREATE PROCEDURE [dbo].[spAngles_Update]
	@Id int,
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
	update dbo.[Angles]
	set Standard = @Standard,
	Description = @Description,
	Designation = @Designation,
	Height = @Height,
	Width = @Width,
	Thickness = @Thickness,
	InsideRadius = @InsideRadius,
	OutsideRadius = @OutsideRadius,
	a_x = @a_x,
	a_y = @a_y

	where Id = @Id
End
