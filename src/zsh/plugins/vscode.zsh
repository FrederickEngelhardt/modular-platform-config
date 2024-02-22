#!/usr/bin/env zsh
code () {
    VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;
}

alias c="code"