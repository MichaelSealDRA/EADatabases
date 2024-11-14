using DataAccess;
using System.Security.Claims;

namespace EngDataApi;

public static class ControllerMethods
{
    public static string? GetUserName(ClaimsPrincipal user)
    {
        var name = user.Claims.FirstOrDefault(c => c.Type == ClaimTypes.GivenName)?.Value;
        var surname = user.Claims.FirstOrDefault(c => c.Type == ClaimTypes.Surname)?.Value;
        return name + " " + surname;
    }
    public static string? GetAccessLevel(ClaimsPrincipal user)
    {
        var access = user.Claims.FirstOrDefault(c => c.Type == "Access")?.Value;
        return access;
    }
    public static List<TsteelProfile> FilterByAccess<TsteelProfile>(List<TsteelProfile> originalList, ClaimsPrincipal user) where TsteelProfile : ISteelProfileDTO
    {
        string userAccess = GetAccessLevel(user) ?? "public";
        List<TsteelProfile> filteredList = new List<TsteelProfile>();

        foreach (TsteelProfile profile in originalList)
        {
            // Early exit for public profiles to optimize performance
            if (profile.Access.Contains("public", StringComparison.OrdinalIgnoreCase))
            {
               filteredList.Add(profile);
               continue; 
            }

            //Splitting and cleaning up access levels from the profile access string
            string[] accessLevels = profile.Access.Split(',')
                .Select(x => x.Trim())                      // Trim each entry
                .Where(x => !string.IsNullOrWhiteSpace(x))  // Exclude white-space only entries
                .ToArray();
            
            // Check if any of the profiles's access levels match the user's access level
            if (accessLevels.Any(level => userAccess.Contains(level, StringComparison.OrdinalIgnoreCase)))
            {
                filteredList.Add(profile);
            }
        }
        return filteredList;
    }
}
