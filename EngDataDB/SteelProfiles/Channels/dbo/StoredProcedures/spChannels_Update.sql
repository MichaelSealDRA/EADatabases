CREATE PROCEDURE [dbo].[spChannels_Update]
	@Id int,

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
	update dbo.[Channels]
	set Standard = @Standard,
	Modified = @Modified,
	Metric = @Metric,
	Preferred = @Preferred,
	Variation = @Variation,
	Designation = @Designation,
	Description = @Description, 

	G = @G,
	h = @h,
	b = @b,
	s = @s,
	t = @t,
	A = @A,
	r1 = @r1,
	r2 = @r2,
	Beta = @Beta,
	Ix = @Ix,
	Sx = @Sx,
	Rx = @Rx,
	Iy = @Iy,
	Sy = @Sy,
	Ry = @Ry,
	Tr = @Tr,
	Ts = @Ts,
	ac = @ac,
	ay = @ay,

	Verified = @Verified,
	Reference = @Reference,
	Official = @Official,
	Comments = @Comments,

	Date = @Date,
	Active = @Active,
	Uploader = @Uploader,
	Access = @Access

	where Id = @Id
End
