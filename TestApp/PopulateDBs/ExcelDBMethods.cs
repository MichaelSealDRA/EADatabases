using System.Reflection;
using OfficeOpenXml;

namespace TestApp;

public static class ExcelDBMethods
{
    static ExcelDBMethods()
    {
        ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
    }
    public static List<T> GetAllObjects<T>(string excelFilePath, string worksheetName) where T : new()
    {
        List<T> objects = new List<T>();
        using (ExcelPackage package = new ExcelPackage(new FileInfo(excelFilePath)))
        {
            ExcelWorksheet worksheet = package.Workbook.Worksheets[worksheetName];
            var propertyInfos = typeof(T).GetProperties().Where(p => p.CanWrite).ToDictionary(p => p.Name, p => p);

            for (int row = 2; row <= worksheet.Dimension.Rows; row++)
            {

                bool isEmpty = true;  // Assume the row is empty until proven otherwise.

                // Check if any cell in this row has a value.
                for (int col = 1; col <= worksheet.Dimension.Columns; col++)
                {
                    if (!string.IsNullOrEmpty(worksheet.Cells[row, col].Text))
                    {
                        isEmpty = false;  // Found a non-empty cell, the row is not empty.
                        break;  // Exit the column loop since no need to check further.
                    }
                }

                if (!isEmpty)  // Only process rows that are not empty.
                {
                    // Get the ID value from the current row
                    T obj = new T();
                    PopulatePropertiesFromRow(obj, worksheet, row, propertyInfos);
                    objects.Add(obj);
                }
            }
        }

        return objects;
    }
    private static void PopulatePropertiesFromRow<T>(T obj, ExcelWorksheet worksheet, int rowIndex, Dictionary<string, PropertyInfo> propertyInfos)
    {
        int colCount = worksheet.Dimension.Columns;

        for (int col = 1; col <= colCount; col++)
        {
            string propertyName = worksheet.Cells[1, col].Text; // Column heading
            string propertyValue = worksheet.Cells[rowIndex, col].Text.Trim(); // Cell value

            if (propertyInfos.TryGetValue(propertyName, out PropertyInfo property))
            {
                try
                {
                    object value = ConvertToType(propertyValue, property.PropertyType);
                    property.SetValue(obj, value);
                }
                catch (Exception ex)
                {
                    throw new InvalidOperationException($"Error setting property {propertyName} with value {propertyValue} on row {rowIndex}: {ex.Message}", ex);
                }
            }
        }
    }
    private static object ConvertToType(string input, Type targetType)
    {
        if (string.IsNullOrEmpty(input))
        {
            // Check if the target type is a generic nullable type or a string, which is naturally nullable
            if (targetType.IsGenericType && targetType.GetGenericTypeDefinition() == typeof(Nullable<>) || targetType == typeof(string))
                return null;
            else
                throw new InvalidCastException("Cannot convert an empty string to a non-nullable type.");
        }

        // Extract the underlying type if the target type is nullable
        Type effectiveType = targetType.IsGenericType && targetType.GetGenericTypeDefinition() == typeof(Nullable<>)
            ? Nullable.GetUnderlyingType(targetType)
            : targetType;

        try
        {
            // Handle GUID conversion separately since Convert.ChangeType does not support GUIDs
            if (effectiveType == typeof(Guid))
            {
                if (Guid.TryParse(input, out Guid result))
                    return result;
                else
                    throw new FormatException($"Failed to convert '{input}' to Guid.");
            }

            // Convert to the effective type, which is either the original or the underlying type if nullable
            return Convert.ChangeType(input, effectiveType);
        }
        catch (FormatException ex)
        {
            // Provide a more informative exception message, especially useful for debugging
            throw new FormatException($"Failed to convert '{input}' to {effectiveType.Name}.", ex);
        }
    }
}