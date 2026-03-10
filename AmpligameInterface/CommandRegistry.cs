using System.Text.Json;
using System.Text.Json.Serialization;

namespace AmpligameInterface
{
    public static class CommandRegistry
    {
        public static Dictionary<string, MacroCommand> LoadFromJsonAsync(string jsonPath)
        {
            if (!File.Exists(jsonPath))
                throw new FileNotFoundException($"commands file not found: {jsonPath}");

            var options = new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true,
                ReadCommentHandling = JsonCommentHandling.Skip,
                
                AllowTrailingCommas = true
            };
            options.Converters.Add(new JsonStringEnumConverter());

            var commandsFile = File.ReadAllText(jsonPath);
            var config = JsonSerializer.Deserialize<CommandsConfig>(commandsFile, options);
            
            if (config.Commands is null || config.Commands.Count == 0)
                throw new InvalidOperationException("No commands found in JSON.");

            // Convert JSON DTOs -> runtime commands
            var result = new Dictionary<string, MacroCommand>(StringComparer.OrdinalIgnoreCase);

            foreach (var (name, stepsDto) in config.Commands)
            {
                if (string.IsNullOrWhiteSpace(name))
                    continue;

                if (stepsDto is null || stepsDto.Count == 0)
                    throw new InvalidOperationException($"Command '{name}' has no steps.");

                var steps = stepsDto.Select(dto => dto.ToMacroStep(name)).ToList();
                result[name] = new MacroCommand(name, steps);
            }

            return result;
        }
    }

    public sealed class CommandsConfig
    {
        public Dictionary<string, List<MacroStepDto>> Commands { get; set; } = [];
    }

    public sealed class MacroStepDto
    {
        public MacroOp Op { get; set; }
        
        public string? Modifiers { get; set; } // e.g. "Ctrl+Shift"

        public string? Key { get; set; }

        public string? AppName { get; set; }

        public int Milliseconds { get; set; }

        public MacroStep ToMacroStep(string commandName)
        {
            // Basic validation so bad JSON fails loudly.
            switch (Op)
            {
                case MacroOp.KeyDown:
                case MacroOp.KeyUp:
                    if (string.IsNullOrWhiteSpace(Key))
                        throw new InvalidOperationException($"Command '{commandName}': {Op} requires Key.");
                    
                    return new MacroStep(Op, AppName, KeyMapper.ParseKeys(Modifiers), KeyMapper.ParseKey(Key), 0);

                case MacroOp.Tap:
                    if (string.IsNullOrWhiteSpace(Key))
                        throw new InvalidOperationException($"Command '{commandName}': Tap requires Key.");
                    if (Milliseconds <= 0) Milliseconds = 30; // default hold
                    return new MacroStep(Op, AppName, KeyMapper.ParseKeys(Modifiers), KeyMapper.ParseKey(Key), Milliseconds);

                case MacroOp.Delay:
                    if (Milliseconds < 0)
                        throw new InvalidOperationException($"Command '{commandName}': Delay milliseconds must be >= 0.");
                    return new MacroStep(Op, AppName, null, null, Milliseconds);

                case MacroOp.ModifiedStroke:
                    if (Milliseconds < 0)
                        throw new InvalidOperationException($"Command '{commandName}': Delay milliseconds must be >= 0.");
                    return new MacroStep(Op, AppName, KeyMapper.ParseKeys(Modifiers), KeyMapper.ParseKey(Key), Milliseconds);


                default:
                    throw new InvalidOperationException($"Command '{commandName}': Unsupported Op '{Op}'.");
            }
        }
    }
}