CREATE PROCEDURE [dbo].[spAngles_Get]
	@Id int
AS
begin
	select Id, Designation, Height, Width, Thickness, InsideRadius, OutsideRadius, a_x, a_y
	from dbo.[Angles]
	where Id = @Id;
end
