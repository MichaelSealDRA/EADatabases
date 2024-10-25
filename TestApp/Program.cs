using DataAccess;
using PopulateDBs;

public class Program
{
    static async Task Main(string[] args)
    {
        //await Methods.PopulateDB();

        //IAngleProfile angle = await DatabaseAccess.GetSteelProfile<AngleProfile>("80x80x10");
        //Console.WriteLine("Designation: " + angle.Designation);
        //Console.WriteLine("Height: " + angle.Height);
        //Console.WriteLine("Width: " + angle.Width);
        //Console.WriteLine("Thickness: " + angle.Thickness);
        //Console.WriteLine();
        //
        //IChannelProfile channel = await DatabaseAccess.GetSteelProfile<ChannelProfile>("PC100x50");
        //Console.WriteLine("Designation: " + channel.Designation);
        //Console.WriteLine("Height: " + channel.h);
        //Console.WriteLine("Width: " + channel.b);
        //Console.WriteLine("WebThickness: " + channel.s);
        //Console.WriteLine("FlangeThickness: " + channel.t);
        //Console.ReadLine();

        //List<AngleDTO> angles = await DBAccess.GetSteelProfiles<AngleDTO>("AS 3679", "Equal Angles", "75x75x10");

        await PostNew();
    }
    static async Task PostNew()
    {
        await Methods.PopulateDB();
    }


}