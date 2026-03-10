using System.Diagnostics;
using System.Runtime.InteropServices;
using WindowsInput;
using WindowsInput.Native;

namespace AmpligameInterface
{
    public sealed record MacroStep(MacroOp Op, string AppName, VirtualKeyCode?[] Modifiers, VirtualKeyCode? Key, int Milliseconds = 0);

    public enum MacroOp
    {
        KeyDown,
        KeyUp,
        Delay,
        Tap,       // convenience: down -> short delay -> up
        RepeatTap,  // convenience: tap N times with interval
        ModifiedStroke // convenience: press modifiers, then key, then release all 
    }

    public sealed class MacroCommand(string name, IReadOnlyList<MacroStep> steps)
    {
        [DllImport("user32.dll")]
        static extern bool SetForegroundWindow(IntPtr hWnd);

        public string Name { get; } = name;

        public IReadOnlyList<MacroStep> Steps { get; } = steps;

        public void Run()
        {
            foreach (var step in Steps)
            {
                //Console.WriteLine($"[{Name}] ModifiedStroke '{step.Key}' with modifiers [{string.Join(", ", step.Modifiers)}] in '{step.AppName}'");

                var process = Process.GetProcessesByName(step.AppName)[0];
                SetForegroundWindow(process.MainWindowHandle);
                InputSimulator isim = new();

                switch (step.Op)
                {
                    case MacroOp.KeyDown:
                        Console.WriteLine($"[{Name}] KeyDown '{step.Key}' in '{step.AppName}'");
                        isim.Keyboard.KeyDown(step.Key.Value);
                        break;

                    case MacroOp.KeyUp:
                        Console.WriteLine($"[{Name}] KeyUp '{step.Key}' in '{step.AppName}'");
                        isim.Keyboard.KeyUp(step.Key.Value);
                        break;

                    case MacroOp.Delay:
                        Console.WriteLine($"[{Name}] Delay");
                        Thread.Sleep(step.Milliseconds);
                        break;

                    case MacroOp.Tap:
                        {
                            Console.WriteLine($"[{Name}] Tap '{step.Key}' in '{step.AppName}'");
                            var hold = step.Milliseconds <= 0 ? 30 : step.Milliseconds;
                            isim.Keyboard.KeyDown(step.Key.Value);
                            isim.Keyboard.Sleep(hold);
                            isim.Keyboard.KeyUp(step.Key.Value);
                            break;
                        }
                    case MacroOp.RepeatTap:
                        // For RepeatTap, encode: Key=..., Milliseconds=interval, and store count in Key like "F:5" if you want,
                        // but better: just create steps explicitly. Included here to show the idea.
                        throw new NotSupportedException("Use explicit steps or extend MacroStep with a Count field.");
                    case MacroOp.ModifiedStroke:
                        {
                            Console.WriteLine($"[{Name}] ModifiedStroke '{step.Key}' with modifiers [{string.Join(", ", step.Modifiers)}] in '{step.AppName}'");
                            var hold = step.Milliseconds <= 0 ? 30 : step.Milliseconds;
                            foreach (var mod in step.Modifiers)
                                isim.Keyboard.KeyDown(mod.Value);
                            isim.Keyboard.KeyDown(step.Key.Value);
                            isim.Keyboard.Sleep(hold);
                            isim.Keyboard.KeyUp(step.Key.Value);
                            foreach (var mod in step.Modifiers.Reverse())
                                isim.Keyboard.KeyUp(mod.Value);
                            break;
                        }
                }
            }
        }
    }
}
