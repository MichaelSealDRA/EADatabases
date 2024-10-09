using DataAccess;

internal class Program
{
    static async Task Main(string[] args)
    {
        IAngleProfile angle = await DatabaseAccess.GetSteelProfile<AngleProfile>("80x80x10");
        Console.WriteLine("Designation: " + angle.Designation);
        Console.WriteLine("Height: " + angle.Height);
        Console.WriteLine("Width: " + angle.Width);
        Console.WriteLine("Thickness: " + angle.Thickness);
        Console.WriteLine();

        IChannelProfile channel = await DatabaseAccess.GetSteelProfile<ChannelProfile>("PC100x50");
        Console.WriteLine("Designation: " + channel.Designation);
        Console.WriteLine("Height: " + channel.Height);
        Console.WriteLine("Width: " + channel.Width);
        Console.WriteLine("WebThickness: " + channel.WebThickness);
        Console.WriteLine("FlangeThickness: " + channel.FlangeThickness);
        Console.ReadLine();
    }
}