#!/usr/bin/env zsh
relative_dir="$(dirname "$0")"

# generic directory path resolutions
source src/zsh/constants/paths.zsh
source src/zsh/constants/versions.zsh

# symlinks the repo + .zshrc
source src/setup/initialize-repo-symlinks.zsh

# Call all methods
handleRepoLink

# homebrew
source src/setup/install-brew.zsh

# sets up and installs everything
source src/setup/platform-mac-setup.zsh

# oh-my-zsh
source src/setup/oh-my-zsh.zsh

# plugins related to running oh-my-zsh
source src/setup/install-oh-my-zsh-plugins.zsh

# symlink everything else (functions from initialize-repo-symlinks.zsh)
handleZshrcLink
handleOhMyZshPluginIntegration

# chmod +x src/setup/scripts/initialize-symlinks.sh && ./scripts/initialize-symlinks.sh