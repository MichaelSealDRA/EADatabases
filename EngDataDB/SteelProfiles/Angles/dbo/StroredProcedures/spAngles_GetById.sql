CREATE PROCEDURE [dbo].[spAngles_GetById]
	@Id int
AS
begin
	select Id, Standard, Description, Designation, Height, Width, Thickness, InsideRadius, OutsideRadius, a_x, a_y
	from dbo.[Angles]
	where Id = @Id;
end
