CREATE PROCEDURE [dbo].[spChannels_GetByDesignation]
	@Designation nvarchar(50)
AS
begin
	select Id, Designation, Height, Width, WebThickness, FlangeThickness, InsideRadius, OutsideRadius, InsideHeight, WallAngle, a_c, a_y
	from dbo.[Channels]
	where Designation = @Designation;
end
