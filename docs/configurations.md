# Configuration and Settings

## Purpose

- Unify all of my configurations across devices
- Save time

## Initial Setup MACOS

Install and change directory into the clone repo

Please clone the repo and move it into a folder that you will not relocate.

(e.g) change to user home ($HOME/~) directory on macOS and create a dev folder that has a config folder in it.

```bash
cd $HOME;
mkdir -p dev/config
```

Example for installing the latest version 1.x.x

```bash
git clone https://github.com/FrederickEngelhardt/modular-platform-config.git
cd modular-platform-config
git checkout v1.x.x
git pull
```

Run the zero install script

```bash
./run-setup.zsh
```

## Setup Steps

### homebrew

- Installs latest version of homebrew [here](https://docs.brew.sh/Installation)

### ZSH

- Follow [oh-my-zsh installation guide](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)
- Optional add [spaceship](https://github.com/denysdovhan/spaceship-prompt)

### ripgrep

- Fast way to search a repo for something, find it [here](https://github.com/BurntSushi/ripgrep)

### FNM

- Follow installation guide [here](https://gist.github.com/nijicha/e5615548181676873118df79953cb709)

### DIRENV

- A powerful tool that allows for project based configuration allowing you to swap NVM and other dependencies on a per project basis
- [Link](https://direnv.net/)

### Yarn

- `brew install yarn --ignore-dependencies` Allows for use of NVM
- Set the default alias to current LTS ex: `nvm alias default 10.16`

### Python 3.9

- Installs python 3.9

## IDE and Other Software

## Scripts:

\_Scripts may require `chmod +x <script path>` to be allowed to execute.

## Windows fix for docksal

Go [here](./docs/wsl-docksal.md)
