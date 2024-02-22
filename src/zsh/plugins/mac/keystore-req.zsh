#!/bin/zsh

get-credential(){
    security find-generic-password -w -s $credential_keychain -a $account_id
}

# get-credential | sudo -S sysctl -w kern.maxfiles=10485760 kern.maxfilesperproc=1048576
# launchctl directly sets sysctl
# get-credential | sudo -S launchctl limit maxfiles 1048576 10485760