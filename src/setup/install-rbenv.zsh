#!/usr/bin/env zsh

STEP_NAME="-> rbenv"

echo "started $STEP_NAME"

if ! [[ -n "$(command -v rbenv)" ]]; then
    echo "running $STEP_NAME"
    brew install rbenv ruby-build

    echo "success $STEP_NAME"

    rbenv init

    rbenv install $RUBY_DEFAULT_VERSION
    rbenv global $RUBY_DEFAULT_VERSION
    # this will also be in the .zshrc file
    else 
        echo "skipped $STEP_NAME -> already installed"
fi