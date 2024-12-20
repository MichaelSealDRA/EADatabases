﻿using DataAccess;
namespace TestApp;

public class Program
{
    static async Task Main(string[] args)
    {
        //string excelFilePath = @"C:\Users\Michael.Seal\Desktop\Databases\DB_SteelProfiles.xlsx";
        string excelFilePath = @"C:\OneDrive\DRA Global\EA - 2. Development\2. Databases\SteelProfiles\DB_SteelProfiles.xlsx";

        await PopulateDBMethods.PopulateStandards(excelFilePath, "Standards");

        await PopulateDBMethods.PopulateSteelProfiles<AngleDTO>(excelFilePath, "Angles");
        await PopulateDBMethods.PopulateSteelProfiles<BeamDTO>(excelFilePath, "Beams");
        await PopulateDBMethods.PopulateSteelProfiles<ChannelDTO>(excelFilePath, "Channels");
        await PopulateDBMethods.PopulateSteelProfiles<Circular_HollowSectionDTO>(excelFilePath, "Circular_HollowSections");

    }


}