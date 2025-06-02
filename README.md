# Dotfiles Repository

This repository manages terminal and shell configuration for multiple environments using [Dotbot](https://github.com/anishathalye/dotbot).

## Features
- Profile-based setup for macOS, Debian, and shared/common configs
- Automated installation using Dotbot
- Modular Zsh and Oh My Zsh configuration
- Package lists for each environment

## Requirements
- `git`
- `bash`
- [Dotbot](https://github.com/anishathalye/dotbot) (included as a submodule)
- For macOS: [Homebrew](https://brew.sh/), optionally a `Brewfile` for package management
- For Zsh plugins: `rbenv`, `nodenv`, `pyenv` (optional, but scripts check for them)

## Setup
1. **Clone the repository:**
   ```sh
   git clone --recursive <repo-url>
   cd dotfiles
   ```
2. **Run the install script:**
   ```sh
   ./install
   ```
   The script will auto-detect your environment and apply the appropriate profile.

3. **(Optional) Homebrew packages on macOS:**
   Consider using a `Brewfile` for reproducible package management. See [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle).

## Extending
- Add new profiles in the `profiles/` directory with a `detect` script and `install.conf.yaml`.
- Place custom Zsh scripts in the appropriate `oh-my-zsh/custom/` directory.
- Update package lists as needed for each environment.

## Security
- Do **not** store secrets or API keys directly in these files. Use environment variables or secret managers.

## Troubleshooting
- If you see errors about missing tools, ensure all requirements are installed.
- For plugin issues, check that the relevant plugin managers (e.g., `rbenv`, `nodenv`, `pyenv`) are installed.

---

*For more details, see the comments in each configuration file.*