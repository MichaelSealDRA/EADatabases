CREATE TABLE [dbo].[Channels]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 

    [Standard] NVARCHAR(50) NOT NULL,
    [Modified] BIT NOT NULL DEFAULT 0,
    [Metric] BIT NOT NULL DEFAULT 1,
    [Preferred] BIT NOT NULL DEFAULT 0,
    [Variation] NVARCHAR(50) NOT NULL, 
    [Designation] NVARCHAR(50) NOT NULL,
    [Description] NVARCHAR(50) NOT NULL,
    
    [G] Float NULL,
    [h] Float NOT NULL,
    [b] Float NOT NULL,
    [s] Float NULL,
    [t] Float NULL,
    [A] Float NULL,
    [r1] Float NULL,
    [r2] Float NULL,
    [Beta] Float NULL,
    [Ix] Float NULL,
    [Sx] Float NULL,
    [Rx] Float NULL,
    [Iy] Float NULL,
    [Sy] Float NULL,
    [Ry] Float NULL,
    [Tr] Float NULL,
    [Ts] Float NULL,
    [ac] Float NULL,
    [ay] Float NULL,

    [Verified] BIT NOT NULL DEFAULT 0,
    [Reference] NVARCHAR(50) NULL,
    [Official] BIT NOT NULL DEFAULT 1, 

    [Comments] nvarchar(500) NUll,

    [Date] DATETIME NULL,
    [Active] bit NULL DEFAULT 1,
    [Uploader] nvarchar(50) NUll,
    [Access] nvarchar(200) NUll,
    
    
)
