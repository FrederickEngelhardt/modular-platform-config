#!/usr/bin/env zsh
# Direnv allows for hooks and callbacks to clean up directory based sideeffects 
# URL https://direnv.net/docs/hook.html
# Any file you create for direnv should be ignored optionally mutate your global git ignore

if [ $(command -v _evalcache) ];
  then 
    _evalcache direnv hook zsh
  else
    eval "$(direnv hook zsh)"
fi
