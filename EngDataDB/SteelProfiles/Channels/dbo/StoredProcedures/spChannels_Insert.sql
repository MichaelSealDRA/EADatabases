CREATE PROCEDURE [dbo].[spChannels_Insert]
	@Standard nvarchar(50), 
	@Modified bit,
	@Metric bit,
	@Preferred bit,
	@Variation nvarchar(50),
	@Designation nvarchar(50), 
	@Description nvarchar(50), 

	@G float, 
	@h float, 
	@b float, 
	@s float, 
	@t float, 
	@A float, 
	@r1 float, 
	@r2 float, 
	@Beta float, 
	@Ix float, 
	@Sx float, 
	@Rx float, 
	@Iy float, 
	@Sy float, 
	@Ry float,
	@Tr float, 
	@Ts float, 
	@ac float, 
	@ay float,
	
	@Verified bit,
	@Reference nvarchar(50),
	@Official bit,
	@Comments nvarchar(500),

	@Date DateTime,
	@Active bit,
	@Uploader nvarchar(50),
	@Access nvarchar(200)

AS
begin
	insert into dbo.[Channels] (Standard, Modified, Metric, Preferred, Variation, Designation, Description, G, h, b, s, t, A, r1, r2, Beta, Ix, Sx, Rx, Iy, Sy, Ry,Tr, Ts, ac, ay, Verified, Reference, Official, Comments, Date, Active, Uploader, Access)
	values (@Standard, @Modified, @Metric, @Preferred, @Variation, @Designation, @Description, @G, @h, @b, @s, @t, @A, @r1, @r2, @Beta, @Ix, @Sx, @Rx, @Iy, @Sy, @Ry,@Tr, @Ts, @ac, @ay, @Verified, @Reference, @Official, @Comments, @Date, @Active, @Uploader, @Access);
End