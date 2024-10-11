if not exists (select 1 from dbo.[Angles])
begin
	insert into dbo.[Angles] (Standard, Description, Designation, Height, Width, Thickness, InsideRadius, OutsideRadius, a_x, a_y)
	values('Standard1', 'Description1','80x80x10', 80, 80, 10, 10, 5, 23.4, 23.4),
		  ('Standard1', 'Description2','100x100x10', 100, 100, 10, 12, 6, 28.2, 28.2),
		  ('Standard2', 'Description1','80x80x10', 80, 80, 10, 10, 5, 23.4, 23.4),
		  ('Standard2', 'Description2','100x100x10', 100, 100, 10, 12, 6, 28.2, 28.2),
		  ('Standard3', 'Description1','80x80x10', 80, 80, 10, 10, 5, 23.4, 23.4),
		  ('Standard3', 'Description2','100x100x10', 100, 100, 10, 12, 6, 28.2, 28.2)
end

if not exists (select 1 from dbo.[Channels])
begin
	insert into dbo.[Channels] (Standard, Description, Designation, Height, Width, WebThickness, FlangeThickness, InsideRadius, OutsideRadius, InsideHeight, WallAngle, a_c, a_y)
	values('Standard1', 'Description1','PC100x50', 100,50,5,8.4,8.4,0,66.4,90, 34.1,17.3),
		  ('Standard1', 'Description2','PC200x75', 200,75,7.5,11.4,11.4,0,154,90,45.7,22.5),
		  ('Standard2', 'Description1','PC100x50', 100,50,5,8.4,8.4,0,66.4,90, 34.1,17.3),
		  ('Standard2', 'Description2','PC200x75', 200,75,7.5,11.4,11.4,0,154,90,45.7,22.5),
		  ('Standard3', 'Description1','PC100x50', 100,50,5,8.4,8.4,0,66.4,90, 34.1,17.3),
		  ('Standard3', 'Description2','PC200x75', 200,75,7.5,11.4,11.4,0,154,90,45.7,22.5)
end