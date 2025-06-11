# vim-easyenv

**vim-easyenv** is a lightweight Vim plugin for easily managing environment variables for your projects using a simple JSON configuration file. It automatically detects the root of your project based on common manifest files (like `package.json`, `pyproject.toml`, `pom.xml`, and more) and allows you to define environment variables for your project in a dedicated `.easyenv.json` file. These variables can then be loaded and unset with simple Vim commands, making it easier to keep project-specific environment variables isolated and under version control.

## Features

- **Automatic Project Root Detection**: Locates your project root by scanning for standard manifest files from a wide variety of ecosystems (Node.js, Python, Rust, Java, .NET, C/C++, Go, Docker, Kubernetes, and more).
- **Simple Environment File**: Use `.easyenv.json` in your project root to define environment variables under an `environment` key.
- **Easy Commands**:
  - `:EasyEnvCreate` — Creates a new `.easyenv.json` file in your project root.
  - `:EasyEnvLoad` — Loads and exports environment variables from `.easyenv.json` into your Vim session.
- **Automatic Unset**: Previously loaded environment variables are automatically unset before new ones are loaded, ensuring a clean environment.

## Getting Started

1. **Install the Plugin**  
   Use your favorite Vim plugin manager. For example, with [vim-plug](https://github.com/junegunn/vim-plug):

   ```vim
   Plug 'josstei/vim-easyenv'
   ```

2. **Initialize in Your Project**  
   In your project root, run in Vim:
   ```
   :EasyEnvCreate
   ```
   This creates a `.easyenv.json` file with a default structure.

3. **Edit `.easyenv.json`**  
   Define your environment variables under the `environment` key. Example:
   ```json
   {
     "environment": {
       "API_URL": "https://dev.local/api",
       "DEBUG": "1"
     }
   }
   ```

4. **Load Environment Variables**
   ```
   :EasyEnvLoad
   ```
   Your environment variables will be available in your Vim session as `$API_URL`, `$DEBUG`, etc.

## Supported Manifest Files

vim-easyenv detects the project root using (but not limited to) files such as:
- `package.json`, `pyproject.toml`, `Cargo.toml`, `pom.xml`, `build.gradle`, `Makefile`, `go.mod`, `Dockerfile`, `Chart.yaml`, `next.config.js`, etc.

This supports a wide variety of ecosystems including JavaScript, Python, Rust, Java, .NET, Go, Docker, Kubernetes, and major frontend frameworks.

## Example Workflow

1. Clone your project and open it in Vim.
2. Use `:EasyEnvCreate` to generate the config file if it doesn't exist.
3. Edit `.easyenv.json` and add your environment variables.
4. Use `:EasyEnvLoad` to load them into your session.
5. Variables are automatically unset before loading new ones.

## License

MIT License. See [LICENSE](LICENSE) for details.

---

**Note:** This plugin is under active development. Features and usage may change.
