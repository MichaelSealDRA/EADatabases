CREATE TABLE [dbo].[Standards]
(
	[Id] UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    [Code] NVARCHAR(50) NOT NULL, 
    [FullCode] NVARCHAR(50) NOT NULL, 
    [Description] NVARCHAR(100) NOT NULL, 
    [Metric] BIT NOT NULL, 
    [Associated] NVARCHAR(200) NULL, 
    [Verified] BIT NOT NULL, 
    [Reference] NVARCHAR(50) NULL, 
    [Official] BIT NOT NULL, 
    [Comments] NVARCHAR(500) NULL, 
    [Access] NVARCHAR(50) NOT NULL, 
)
