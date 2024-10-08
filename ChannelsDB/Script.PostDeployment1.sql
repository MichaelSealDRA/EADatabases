if not exists (select 1 from dbo.[Channels])
begin
	insert into dbo.[Channels] (Designation, Height, Width, WebThickness,FlangeThickness,InsideRadius, OutsideRadius, InsideHeight, WallAngle, a_c, a_y)
	values('PC100x50', 100,50,5,8.4,8.4,0,66.4,90, 34.1,17.3),
		  ('PC200x75', 200,75,7.5,11.4,11.4,0,154,90,45.7,22.5)
end