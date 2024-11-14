﻿CREATE PROCEDURE [dbo].[spAngles_Archive]
    @Id uniqueidentifier,
    @Date DATETIME
AS
BEGIN
    UPDATE dbo.[Angles]
    SET Date = @Date, Active = 0
    WHERE Id = @Id;
END;