#!/usr/bin/env zsh

# FNM
# `brew install fnm` for mac or WSL w/ homebrew

# directory can be different. Useful for anti-virus ignores
if [ -d "$HOME/workspaces/.fnm" ]; then
  FNM_DIR=$HOME/workspaces/.fnm
else
  FNM_DIR=$HOME/.fnm
fi

if [ $(command -v fnm) ]; then
  eval "$(fnm env --use-on-cd --fnm-dir $FNM_DIR)"
fi

fnm-get-default-version(){
  local version="$($FNM_DIR/aliases/default/bin/node --version)"

  if [[ "$version" == "$1" ]]; then
      return 1
  else
    return 0
  fi
}