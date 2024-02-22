#!/usr/bin/env zsh

STEP_NAME="-> jenv"

echo "starting $STEP_NAME"

if ! [[ -n "$(command -v jenv)" ]]; then
    echo "installing $STEP_NAME"
    brew install jenv

    echo "success $STEP_NAME"

    # this will also be in the .zshrc file
    export PATH="$HOME/.jenv/bin:$PATH"
    eval "$(jenv init -)"
    
    else 
        echo "skipped: $STEP_NAME -> already installed"
fi