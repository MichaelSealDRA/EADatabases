CREATE PROCEDURE [dbo].[spChannels_GetAll]
AS
begin
	select Id, Standard, Modified, Metric, Preferred, Variation, Designation, Description, G, h, b, s, t, A, r1, r2, Beta, Ix, Sx, Rx, Iy, Sy, Ry,Tr, Ts, ac, ay, Verified, Reference, Official, Comments, Date, Active, Uploader, Access
	from dbo.[Channels];
end
