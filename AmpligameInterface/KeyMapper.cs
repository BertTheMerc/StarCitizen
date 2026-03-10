using System.Text.Json;
using System.Text.Json.Serialization;
using WindowsInput.Native;

namespace AmpligameInterface
{
    public static class KeyMapper
    {
        public static VirtualKeyCode ParseKey(string key)
        {
            if (string.IsNullOrWhiteSpace(key))
                throw new ArgumentException("Key cannot be empty.");

            key = key.Trim().ToUpperInvariant();

            // If single letter A-Z
            if (key.Length == 1 && key[0] is >= 'A' and <= 'Z')
            {
                return Enum.Parse<VirtualKeyCode>($"VK_{key}");
            }

            // If already formatted like VK_U
            if (key.StartsWith("VK_"))
            {
                return Enum.Parse<VirtualKeyCode>(key, true);
            }

            throw new ArgumentException($"Unsupported key '{key}'.");
        }

        public static VirtualKeyCode?[] ParseKeys(string keys)
        {

            if (string.IsNullOrWhiteSpace(keys))
                return null;

            var tmp = VirtualKeyCode.CONTROL; // just to force the enum type for the array
            return [tmp];


            return [.. keys.Split('+', StringSplitOptions.RemoveEmptyEntries).Select(k => ParseKey(k))];
        }
    }
}