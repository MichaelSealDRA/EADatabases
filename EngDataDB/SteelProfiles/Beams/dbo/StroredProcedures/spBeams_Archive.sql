﻿CREATE PROCEDURE [dbo].[spBeams_Archive]
    @Id UNIQUEIDENTIFIER,
    @Date DATETIME
AS
BEGIN
    UPDATE dbo.[Beams]
    SET Date = @Date, Active = 0
    WHERE Id = @Id;
END;