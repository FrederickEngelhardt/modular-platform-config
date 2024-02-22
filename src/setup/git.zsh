#!/usr/bin/env zsh

# configures git
git config --global init.defaultBranch main

# installs latest git (not xcode git)
# xcode git may need to be manually removed
if [[ $(command -v git) != "/usr/local/bin/git" ]]; then 
    echo "Detected macosx default git, installing latest git locally with brew."
    brew install git;
fi

# Config a global ignore
if [ -d $MPC_CONFIG ]; then
    git config --global core.excludesFile $MPC_CONFIG/.gitignore_global
fi