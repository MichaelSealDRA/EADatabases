CREATE TABLE [dbo].[Circular_HollowSections]
(
    [Id] UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    [StandardId] UNIQUEIDENTIFIER NOT NULL,
    [Modified] BIT NOT NULL,
    [Preferred] BIT NOT NULL,
    [Variation] NVARCHAR(50) NOT NULL,
    [Designation] NVARCHAR(50) NOT NULL,
    [Date] DATETIME NOT NULL,
    [Active] BIT NOT NULL,
    [Uploader] NVARCHAR(50) NULL,

    [D] FLOAT NULL,
    [T] FLOAT NULL,
    [M] FLOAT NULL,
    [A] FLOAT NULL,
    [Ix] FLOAT NULL,
    [Iy] FLOAT NULL,
    [Rx] FLOAT NULL,
    [Ry] FLOAT NULL
);