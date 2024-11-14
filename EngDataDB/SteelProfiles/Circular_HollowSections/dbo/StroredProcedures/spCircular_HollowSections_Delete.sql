CREATE PROCEDURE [dbo].[spCircular_HollowSections_Delete]
    @Id UNIQUEIDENTIFIER
AS
BEGIN
    DELETE FROM dbo.[Circular_HollowSections]
    WHERE Id = @Id;
END;