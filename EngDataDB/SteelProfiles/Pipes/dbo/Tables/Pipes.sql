﻿CREATE TABLE [dbo].[Pipes]
(
    [Id] UNIQUEIDENTIFIER PRIMARY KEY,
    [StandardId] UNIQUEIDENTIFIER NOT NULL,
        [Variation] NVARCHAR(50) NOT NULL, 
    [Designation] NVARCHAR(50) NOT NULL,
);