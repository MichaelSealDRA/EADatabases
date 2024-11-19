﻿CREATE TABLE [dbo].[Channels]
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

    [G] FLOAT NULL,
    [h] FLOAT NOT NULL,
    [b] FLOAT NOT NULL,
    [s] FLOAT NULL,
    [t] FLOAT NULL,
    [A] FLOAT NULL,
    [r1] FLOAT NULL,
    [r2] FLOAT NULL,
    [Beta] FLOAT NULL,
    [Ix] FLOAT NULL,
    [Sx] FLOAT NULL,
    [Rx] FLOAT NULL,
    [Iy] FLOAT NULL,
    [Sy] FLOAT NULL,
    [Ry] FLOAT NULL,
    [Tr] FLOAT NULL,
    [Ts] FLOAT NULL,
    [ac] FLOAT NULL,
    [ay] FLOAT NULL,
    [Tapered] bit NOT NULL,
);