using DataAccess;
namespace TestApp;

public static class PopulateDBMethods
{
    public static async Task PopulateStandards(string excelFilePath, string worksheetName)
    {
        HttpClientService httpClientService = new HttpClientService(new HttpClient());
        EngDataDBService engDataDBService = new EngDataDBService(httpClientService);
        List<StandardDTO> allStandards = ExcelDBMethods.GetAllObjects<StandardDTO>(excelFilePath, worksheetName);
        await engDataDBService.InsertListOfStandards(allStandards);
    }
    public static async Task PopulateSteelProfiles<T>(string excelFilePath, string worksheetName) where T : ISteelProfileDTO, new()
    {
        HttpClientService httpClientService = new HttpClientService(new HttpClient());
        EngDataDBService engDataDBService = new EngDataDBService(httpClientService);
        List<T> allProfiles = ExcelDBMethods.GetAllObjects<T>(excelFilePath, worksheetName);
        await engDataDBService.InsertListOfSteelProfiles(allProfiles);
    }

}
