#!/usr/bin/env zsh

REACT_EDITOR="code"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh";
  typeset -g POaWERLEVEL9K_INSTANT_PROMPT=quiet;
fi

# powerlevel10k
[[ ! -f $MPC_ZSH_PLUGINS/p10k.zsh ]] || source $MPC_ZSH_PLUGINS/p10k.zsh

# Mac OSX Config

# Mac Extensions
source $MPC_ZSH_PLUGINS/tar/pbzip2.zsh

# Mac OSX Scripts
source $MPC_ZSH_PLUGINS/mac/deletion-commands.zsh

# managers (like fnm, nvm, rbenv, etc)
source $MPC_ZSH_PLUGINS/pyenv.sh

# xcode Commands
source $MPC_ZSH_PLUGINS/mac/xcode-commands.zsh

# cocoapods
source $MPC_ZSH_PLUGINS/mac/cocoapods/nuke.zsh

# Mac OS shortcuts
source $MPC_ZSH_PLUGINS/mac/egpu.zsh

# Browser Scripts
source $MPC_ZSH_PLUGINS/mac/browsers.zsh

### Python CLI Path
PYTHON_3_BIN=$HOME/Library/Python/3.7/bin
if [ -z ${PYTHON_3_BIN+x} ];
  then;
  else;
    export PATH=$PATH:$PYTHON_3_BIN
fi

# VSCode
source $MPC_ZSH_PLUGINS/vscode.zsh


