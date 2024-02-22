#!/usr/bin/env zsh
# requires the keychain package
# sudo apt-get install keychain

# Registers all id_rsa files 
# Useful for when you have multiple id_rsa files and want to register them all
# id_rsa files will need to be matched using the ~/.ssh/config file and hostname to match directories and patterns
keychain-register-all(){
  /usr/bin/keychain --nogui ~/.ssh/[id_rsa]*[^.pub]
}

source ~/.keychain/$(hostname)-sh