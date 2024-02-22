#!/usr/bin/env zsh

source $MPC_CONFIG_LIBS/powerlevel10k/powerlevel10k.zsh-theme

export ZSH="$MPC_CONFIG_LIBS/oh-my-zsh"

autoload -U promptinit; promptinit

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  evalcache git zsh-syntax-highlighting colorize pip python brew macos
)


source $MPC_CONFIG_LIBS/oh-my-zsh/oh-my-zsh.sh