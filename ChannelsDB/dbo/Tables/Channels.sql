CREATE TABLE [dbo].[Channels]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Designation] NVARCHAR(50) NOT NULL, 
    [Height] FLOAT NOT NULL, 
    [Width] FLOAT NOT NULL, 
    [WebThickness] FLOAT NOT NULL, 
    [FlangeThickness] FLOAT NOT NULL, 
    [InsideRadius] FLOAT NOT NULL, 
    [OutsideRadius] FLOAT NOT NULL, 
    [InsideHeight] FLOAT NOT NULL, 
    [WallAngle] FLOAT NOT NULL, 
    [a_c] FLOAT NOT NULL, 
    [a_y] FLOAT NOT NULL
)
