CREATE TABLE [dbo].[Standards]
(
	[Id] UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    [Code] NVARCHAR(50) NOT NULL, 
    [FullCode] NVARCHAR(50) NOT NULL, 
    [Description] NVARCHAR(200) NOT NULL, 
    [Metric] BIT NOT NULL, 
    [Associated] NVARCHAR(200) NULL, 
    [Verified] BIT NOT NULL, 
    [Reference] NVARCHAR(200) NULL, 
    [Official] BIT NOT NULL, 
    [Comments] NVARCHAR(500) NULL, 
    [Access] NVARCHAR(200) NOT NULL, 
    [Date] DATETIME NOT NULL, 
    [Active] BIT NOT NULL, 
    [Uploader] NVARCHAR(50) NULL, 
)
