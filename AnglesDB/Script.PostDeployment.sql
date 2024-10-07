if not exists (select 1 from dbo.[Angles])
begin
	insert into dbo.[Angles] (Designation, Height, Width, Thickness, InsideRadius, OutsideRadius, a_x, a_y)
	values('80x80x10', 80, 80, 10, 10, 5, 23.4, 23.4),
		  ('100x100x10', 100, 100, 10, 12, 6, 28.2, 28.2)
end