#!/usr/bin/env zsh
# rbenv lets you choose which ruby version you want!
# RBENV_SHIMS=$HOME/.rbenv/shims
RBENV_SHIMS="$HOME/.rbenv"

if [ -z ${RBENV_SHIMS+x} ];
then;
else;
  export RBENV_SHELL=zsh
  export PATH=$RBENV_SHIMS:$PATH

  # rbenv spawns slowly so using evalcache speedsup terminal spawn speed
  if [ $(command -v _evalcache) ];
    then 
      _evalcache rbenv init - zsh
    else
      eval "$(rbenv init - zsh)"
  fi
fi