// Program.cs (.NET 10)
// Usage examples:
//   dotnet run -- salute
//   dotnet run -- fireburst
//   dotnet run -- help

namespace AmpligameInterface
{
    class Program
    {
        static int Main(string[] args)
        {

             if (args.Length != 1)
             {
                 PrintUsage();
                 return 2;
             }

             var commandName = args[0].Trim();
            

            //var commandName = "Landed";

            Dictionary<string, MacroCommand> commands;
            try
            {
                commands = CommandRegistry.LoadFromJsonAsync("Commands.json");
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine($"Failed to load commands.json: {ex.Message}");
                return 3;
            }

            if (commandName.Equals("help", StringComparison.OrdinalIgnoreCase))
            {
                PrintAvailable(commands);
                return 0;
            }

            if (!commands.TryGetValue(commandName, out var command))
            {
                Console.Error.WriteLine($"Unknown command: '{commandName}'");
                PrintAvailable(commands);
                return 1;
            }


            Console.WriteLine($"Running command '{commandName}' ({command.Steps.Count} step(s))...");
            command.Run();
            Console.WriteLine("Done.");
            return 0;
        }

        static void PrintUsage()
        {
            Console.WriteLine("Usage: <app> <CommandName>");
            Console.WriteLine("Try:   <app> help");
        }

        static void PrintAvailable(IReadOnlyDictionary<string, MacroCommand> commands)
        {
            Console.WriteLine("Available commands:");
            foreach (var name in commands.Keys.OrderBy(k => k))
                Console.WriteLine($"  {name}");
        }
    }
}
