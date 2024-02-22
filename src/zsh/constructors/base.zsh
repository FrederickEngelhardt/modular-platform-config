#!/usr/bin/env zsh

source $MPC_ZSH_PLUGINS/brew.zsh

# oh-my-zsh
source $MPC_ZSH_PLUGINS/oh-my-zsh-config.zsh

# rbenv
source $MPC_ZSH_PLUGINS/rbenv.zsh

## DIRENV
[ $(command -v direnv) ] && source $MPC_ZSH_PLUGINS/direnv.zsh

# NVM
# source $MPC_ZSH_PLUGINS/node-managers/nvm.zsh

# FNM - Faster than NVM
[ $(command -v fnm) ] && source $MPC_ZSH_PLUGINS/node-managers/fnm.zsh

# Color MPC_ZSH_PLUGINS
source $MPC_ZSH_PLUGINS/ansi-colors.zsh

# CLI MPC_ZSH_PLUGINS
source $MPC_ZSH_PLUGINS/react-native.zsh
source $MPC_ZSH_PLUGINS/node.zsh
source $MPC_ZSH_PLUGINS/yarn.zsh
source $MPC_ZSH_PLUGINS/npm.zsh

# Git
source $MPC_ZSH_PLUGINS/git.zsh

# JAVA Path and selector
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
source $MPC_ZSH_PLUGINS/jenv.zsh

# Android
source $MPC_ZSH_PLUGINS/android/android-setup.zsh
source $MPC_ZSH_PLUGINS/android/android-adb.zsh
source $MPC_ZSH_PLUGINS/android/android-emulator.zsh

# shelljs
addShellJSFuncs(){
    local SHELLJS_FUNCTIONS=$SHELLJS_EXTENSIONS/__generated__shelljs-zsh-functions.zsh
    [ -f $SHELLJS_FUNCTIONS ] && source $SHELLJS_FUNCTIONS
}
addShellJSFuncs