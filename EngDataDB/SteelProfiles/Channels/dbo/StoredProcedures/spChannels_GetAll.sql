﻿CREATE PROCEDURE [dbo].[spChannels_GetAll]
AS
begin
	select Id, Standard, Description, Designation, Height, Width, WebThickness, FlangeThickness, InsideRadius, OutsideRadius, InsideHeight, WallAngle, a_c, a_y
	from dbo.[Channels];
end
