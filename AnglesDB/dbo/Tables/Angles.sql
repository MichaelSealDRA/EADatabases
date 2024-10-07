CREATE TABLE [dbo].[Angles]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Designation] NVARCHAR(50) NOT NULL, 
    [Height] FLOAT NOT NULL, 
    [Width] FLOAT NOT NULL, 
    [Thickness] FLOAT NOT NULL, 
    [InsideRadius] FLOAT NOT NULL, 
    [OutsideRadius] FLOAT NOT NULL, 
    [a_x] FLOAT NOT NULL, 
    [a_y] FLOAT NOT NULL
)
