# Configuration and Settings

## Purpose

- Unify all of my configurations across devices
- Save time

## Initial Setup

```bash
npm install;
npm run update; # creates your zshrc file structure
npm run zshrc:symlink; # only run on initial setup
```

## homebrew

- Install latest version of homebrew [here](https://docs.brew.sh/Installation)

## ZSH

- Follow [oh-my-zsh installation guide](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)
- Optional add [spaceship](https://github.com/denysdovhan/spaceship-prompt)

## ripgrep

- Fast way to search a repo for something, find it [here](https://github.com/BurntSushi/ripgrep)

## NVM

- Follow installation guide [here](https://gist.github.com/nijicha/e5615548181676873118df79953cb709)

## DIRENV

- A powerful tool that allows for project based configuration allowing you to swap NVM and other dependencies on a per project basis
- [Link](https://direnv.net/)

## Yarn

- `brew install yarn --ignore-dependencies` Allows for use of NVM
- Set the default alias to current LTS ex: `nvm alias default 10.16`

## Python 3.7

- Install python 3.7
- Go into ZSH and add anaconda to your path `PATH=$HOME/anaconda3/bin:$PATH`

## IDE and Other Software

- Phpstorm
  - [Plugins](./docs/phpstorm-plugins.md)
  - Add custom script to open PHPStorm client inside of JetBrain Toolbox (go into the root of this toolbox and find the generated phpstorm script. Copy the path and then create a alias in ~/.zshrc file)
- Xcode (get latest version)
- Android Studio
  - Create a empty project and open it
  - Access the SDK manager
    - Install Android 4.1 -> Latest
    - Install Android Emulator, NDK, CMake, GPU Debugging tools
  - Access AVD Manager
    - Install at least one phone option for notable version of android
- iTerm2
  - Install iTerm2
  - Set as default

## Scripts:

\_Scripts require `chmod +x <script path>` to be allowed to execute

- Xpedite
  - **M** will take you to root directory of xpedite
  - **rs** will run the server in developer mode

## Quality of Life Software

- Note Taking: [notion](https://www.notion.so/)
- Time Tracking: [toggle](https://toggl.com/)
- Network Tracking: [Little Snitch](https://www.obdev.at/products/littlesnitch/index.html)
- Window Management: [spectacle](https://www.spectacleapp.com/)
- Copy/Paste history: [CopyClip](https://apps.apple.com/us/app/copyclip-clipboard-history/id595191960?mt=12)
- Notification Filtering for embarassing Screenshares: [muzzle](https://muzzleapp.com/)
- Screenshotting/Drawing/Annotating: [skitch](https://evernote.com/products/skitch)
- Wireframing: [Sketch](https://www.sketch.com/)

## Windows fix for docksal

Go [here](./docs/wsl-docksal.md)
