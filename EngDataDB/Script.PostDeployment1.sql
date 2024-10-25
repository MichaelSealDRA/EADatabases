DECLARE @StandardId UNIQUEIDENTIFIER;

-- Create a temporary table to capture the output of the inserted Id from Standards
DECLARE @InsertedStandard TABLE (Id UNIQUEIDENTIFIER);

-- Insert into Standards if it does not exist and capture the new StandardId
IF NOT EXISTS (SELECT 1 FROM dbo.[Standards] WHERE [Code] = 'BS EN 10365' AND [FullCode] = 'BS EN 10365:2017')
BEGIN
    INSERT INTO dbo.[Standards] 
        (Id, Code, FullCode, Description, Metric, Associated, Verified, Reference, Official, Comments, Access)
    OUTPUT inserted.Id INTO @InsertedStandard
    VALUES 
        (NEWID(), 'BS EN 10365', 'BS EN 10365:2017', 
         'Hot rolled steel channels, I and H sections. Dimensions and masses', 
         1, 'AENOR UNE-EN 10365;DANSK DS/EN 10365;NS-EN 10365;DIN EN 10365', 
         1, 'BS EN 10365:2017', 1, 'Comments', 'public');

    -- Retrieve the new StandardId from the temp table
    SELECT @StandardId = Id FROM @InsertedStandard;
END
ELSE
BEGIN
    -- If the standard already exists, get its Id for use in Pipes insertion
    SELECT @StandardId = Id FROM dbo.[Standards] WHERE [Code] = 'BS EN 10365' AND [FullCode] = 'BS EN 10365:2017';
END;

-- Check if there are already entries for the given variations and designation
IF NOT EXISTS (SELECT 1 FROM dbo.[Pipes] WHERE [Variation] = 'VariationA' AND [Designation] = 'DesignationA')
BEGIN
    -- Insert multiple rows into Pipes with the captured StandardId
    INSERT INTO dbo.[Pipes] 
        (Id, StandardId, Variation, Designation)
    VALUES 
        (NEWID(), @StandardId, 'VariationA', 'DesignationA'),
        (NEWID(), @StandardId, 'VariationB', 'DesignationA'),
        (NEWID(), @StandardId, 'VariationC', 'DesignationA'),
        (NEWID(), @StandardId, 'VariationD', 'DesignationA'),
        (NEWID(), @StandardId, 'VariationE', 'DesignationA'),
        (NEWID(), @StandardId, 'VariationF', 'DesignationA'),
        (NEWID(), @StandardId, 'VariationG', 'DesignationA'),
        (NEWID(), @StandardId, 'VariationH', 'DesignationA');
END;