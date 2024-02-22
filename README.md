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

- Manages your entire zsh environment with one repo
- Allows users to scale out their config
- Provides a few example scripts.
- Installs
  - Homebrew
  - oh-my-zsh
  - powerline-10k (p10k)
  - nvm or fnm (defaults to fnm because its faster)
    - adds hooks to auto swap nvm or fnm selected node version
  - auto installs java 11
  - auto installs latest git (not xcode git)
  - Adds a bunch of yarn and npm aliases for shorthand scripting
- **Allows for extensibility** by ignoring files like src/zsh/constructors/init.zsh and final.sh. Allowing you to preload personal config before or after the initialization of scripts.
  - example authorization files you would never commit
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

## Recommended Apps to Install

Install these manually. Typically latest version is ideal. Most of these apps relate to software development, design, productivity, and security. 

**Everyone** can benefit from productivity modules...your workflows should speedup significantly.

The security options are not focused about total solutions like disc scanning, but solutions that prevent spyware and extensive tracking from services.

### IDEs and Terminal for Mac

- [Iterm2](https://iterm2.com/downloads.html). Way better than mac osx terminal
- [Xcode](https://developer.apple.com/download/all/?q=xcode%20command)
- [VSCode](https://code.visualstudio.com/)
- [Android Studio](https://developer.android.com/studio)

### Productivity (move windows with hotkeys)

  - [Rectangle](https://rectangleapp.com/) Free but there is a paid version
  - [Copy Clip 2](https://apps.apple.com/us/app/copyclip-2-clipboard-manager/id1020812363?mt=12) PAID but there is a free version

### Design
  - [Miro](https://miro.com/) great for brainstorming. Sketch can do this well too.
  - [Sketch](https://www.sketch.com/) PAID. Design tool makes it very easy to create mockups and vector/raster image assets.

### Networking & Security

- [Little Snitch](https://www.obdev.at/products/littlesnitch/download.html) Paid


## Contributing

> Love the repo enough to use it and improve it?

If you want to improve this repo please consider the following before creating a pull request

1. Does this feature regress anything?
2. Does this feature have hard coded paths?
  - If so please add a variable for the path and dynamically generate it when running the setup script.
3. Does this feature cause issues when setup is run multiple times.
  - This must be fixed before the PR can be approved.
4. Does this feature only apply to a specific platform?
  - If so, please only include the script for those platforms and exclude unsupported platforms.
