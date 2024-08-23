# Modular Platform Config

Take control of your zsh environment by utilizing modern configuration. Aims for a Zero config install.

Inspired by the numerous destructive scripts that mutated a machine's base config :confounded:, need for efficiency, and need for cross-platform / multi computer config setups.

Fork and clone if you need to customize this. Otherwise open to PRs if the changes are extensible. See Contributing section for more details.

## Why use this?

- TONS of hours saved via shortening commands
- Your fingers will thank you in 2-3 years
- easily version and track all changes made across your dev machine's environment.
- Maintainability
  - Prevent dumb scripts from nuking unsaved changes

## What this does

- Manages your entire [zsh](https://en.wikipedia.org/wiki/Z_shell) environment with one repo.
- Allows users to save their config and share it across multiple computers and platforms
- Provides a few example scripts.
- Apps
  - Organizes app configs under the apps. (e.g)
    - Iterm2 presets.
    - Android studio settings
    - Cisco Any Connect / Secure Client cli commands
    - Automator commands to mute a Macbook Pro microphone directly from MacOS software instead of in app (which can still be recording).
- Installs
  - Homebrew - autoinstalls and updates
  - git
    - auto installs latest git (not xcode git)
    - installed-by: `homebrew`
  - oh-my-zsh
    - installed-by: `curl`
    - ZSH THEME: [powerline-10k](https://github.com/romkatv/powerlevel10k) (p10k)
      - colors and theme for oh-my-zsh
      - installs within modular-platform-config
      - Auto installs the P10k icons too...super helpful as it normally is a manual painful process.
  - **Node Manager - _[fnm](https://github.com/Schniz/fnm)_** or **[nvm](https://github.com/nvm-sh/nvm)** (defaults to fnm because its at least 40x faster)
    - adds hooks to auto swap nvm or fnm selected node version. These hooks use to not be auto configurable.
    - installed-by: `curl`
  - **Java** auto installer for 11 and 17
    - auto installs Java 11 and Java 17 using azul which supports ARM and intel versions for both 11 and 17 avoiding rosetta throttling for apple silicon.
    - Adds jenv to allonaging and swapping the environment.
    - Also supplies a `jdk` alias allowing quick swapping between major versions of java
    - installed-by: `brew`  
- **aliases** - less typing
  - yarn aliases such as `ys="yarn start"`
  - npm aliases - such as `nr="npm run"`
  - git
    - `gcan`: git commit --amend
    - `gpn`: git push -u origin HEAD. There is a simpler command to just set the upstream push to automatically `git config --global push.autoSetupRemote true` but that's not included here.
    - `gpa` push to multiple remotes with the same branch to effectively sync branches across all remotes.
  - android studio - commands such as adbReverse to automatically tcp reverse to 8081
  - ...many more (I'm probably missing some docs)
- **MacOS configuration**
  - adds commands for setting macOS max open files which will significantly speedup a machine. See here [set-max-file-limit.sh](src/apps/watchman/set-max-file-limit.sh)
  - Ignore node_modules in macos spotlight to prevent massive slowdowns see [spotlightfix](src/apps/mac/spotlight-fix.sh)
- **Allows for extensibility** by ignoring files like src/zsh/constructors/init.zsh and final.sh. Allowing you to preload personal config before or after the initialization of scripts.
  - (e.g) authorization files you would never commit to a open source repo or even private repo.
  - Paths that need to be overridden on only that machine

### Support MacOS, Linux, and partial Windows WSL

MacOS has the most support as this is my main workflow.

## Getting Started

1. Fork and clone the repo. You may need to change code
   or add items to this. Always save your changes on the remote repo to avoid losing your setup if your dev machine breaks.
    1. Backup your $HOME/.zshrc, the setup script, if ran multiple times, will give the option to overwrite and delete the auto backedup file. Most likely do dont want to do that. Example command `cp $HOME/.zshrc $HOME/.zshrc_backup`
1. Change directories into the root of the repo and run
   `chmod +x ./run-setup.zsh && ./run-setup.zsh`
   - It possible you will only need to run `./run-setup.zsh` depending on your system.
1. The setup script will install a bunch of required dependencies on your machine.
1. Open a new shell window (CMD+N) and check to see if the changes were applied.
    - You should see a color shell window and the should be no path errors or link problems or messages about directories not existing.
1. If not, make sure you fix any missing packages or remove conflicting files. Also submit a bug report if this problem is on latest release.

## Updating / Sync latest fixes

To auto-update please run the command `./run-sync.zsh` under the repo. Eventually there could be a simple cli to run this and other helper methods.

- `run-sync.zsh` syncs the latest tag branch but will not update beyond the major version.
  - to sync with `main` instead of latest major version of the cli,. Please use the following command and arguments `false main`

    ```zsh
    run-sync.zsh false main
    ```

## Recommended Apps

### MacOS

Please go to [this document](docs/recommended-apps-macos.md) for more details

### Windows 11

Please go to [this document](docs/recommended-apps-windows.md) for more details

## Contributing

> Love the repo enough to use it and improve it?

If you want to improve this repo please consider the following before creating a pull request. I'll add this to a template soon.

1. Does this feature regress anything?
2. Does this feature have hard coded paths?
    - If so please add a variable for the path and dynamically generate it when running the setup script.
3. Does this feature cause issues when setup is run multiple times.
    - This must be fixed before the PR can be approved.
4. Does this feature only apply to a specific platform?
   - If so, please only include the script for those platforms and exclude unsupported platforms.
