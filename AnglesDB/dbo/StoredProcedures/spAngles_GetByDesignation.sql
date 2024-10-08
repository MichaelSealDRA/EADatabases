CREATE PROCEDURE [dbo].[spAngles_GetByDesignation]
	@Designation nvarchar(50)
AS
begin
	select Id, Designation, Height, Width, Thickness, InsideRadius, OutsideRadius, a_x, a_y
	from dbo.[Angles]
	where Designation = @Designation;
end
