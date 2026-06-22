# myapplication

A HarmonyOS application built with [DevEco Studio](https://developer.huawei.com/consumer/en/deveco-studio/) and the **hvigor** build system, using ArkTS/TypeScript.

> This project is currently the default DevEco Studio scaffold (an empty `entry` module with no custom features added yet). This README documents the project structure and how to build/run it, and can be expanded as functionality is added.

## Tech Stack

- **Language:** TypeScript (ArkTS)
- **Platform:** HarmonyOS
- **SDK / API version:** 6.1.1 (API 24)
- **Build system:** hvigor
- **Package manager:** ohpm (OpenHarmony Package Manager)
- **Testing:** `@ohos/hypium`, `@ohos/hamock`

## Project Structure

```
myapplication/
├── AppScope/              # App-level configuration shared across modules
│   ├── app.json5          # App-level manifest (bundle name, version, icon, label)
│   └── resources/         # App-level resources (icons, strings, etc.)
├── entry/                 # Main application module
│   ├── src/               # Module source code (pages, abilities, resources)
│   └── ...                # Module-level build config
├── hvigor/                 # hvigor build tool wrapper and config
├── build-profile.json5     # Project-level build profile (SDK versions, modules, build modes)
├── code-linter.json5       # Code linting rules
├── hvigorfile.ts            # Project-level hvigor build script
├── oh-package.json5         # Project-level dependencies (ohpm)
├── oh-package-lock.json5    # Locked dependency versions
└── .gitignore
```

## Prerequisites

- [DevEco Studio](https://developer.huawei.com/consumer/en/deveco-studio/) (latest version recommended)
- HarmonyOS SDK **6.1.1 (API 24)** or compatible, installed via DevEco Studio's SDK Manager
- A HarmonyOS device or emulator for running/debugging the app

## Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/jantoandriano/myapplication.git
   cd myapplication
   ```

2. **Open in DevEco Studio**
   - Launch DevEco Studio
   - Select **Open** and choose the cloned `myapplication` folder
   - Let DevEco Studio sync the project and resolve dependencies (ohpm install runs automatically)

3. **Build the project**
   - Via DevEco Studio: **Build > Build Hap(s)/App(s)**
   - Via command line (from the project root):
     ```bash
     ./hvigorw assembleHap
     ```

4. **Run the app**
   - Connect a HarmonyOS device (with Developer Mode and USB debugging enabled) or start an emulator from DevEco Studio's Device Manager
   - Click **Run** in DevEco Studio, or run:
     ```bash
     ./hvigorw assembleHap --mode module -p product=default
     ```

## Testing

The project includes the standard HarmonyOS testing dependencies:

- **`@ohos/hypium`** — unit testing framework
- **`@ohos/hamock`** — mocking library for tests

Run tests from DevEco Studio via **Run > Run Tests**, or with:
```bash
./hvigorw test
```

## Build Configuration

Key settings (from `build-profile.json5`):

| Setting | Value |
|---|---|
| Target SDK | 6.1.1 (24) |
| Compatible SDK | 6.1.1 (24) |
| Runtime OS | HarmonyOS |
| Build modes | `debug`, `release` |
| Modules | `entry` |

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/your-feature`)
3. Commit your changes
4. Push to the branch and open a Pull Request

## License

No license has been specified for this repository. If you intend to share or distribute this project, consider adding a `LICENSE` file.
