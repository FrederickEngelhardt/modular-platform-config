#!/usr/bin/env zsh
# Possible bonuses are forcing GPU to use hardware -gpu host 
EMULATOR_DEFAULT_ARGS='-no-audio'

note9(){
    emulator -avd Note9-API-${1:-33} $EMULATOR_DEFAULT_ARGS;
}
# Android Quick-Boot Aliases
pixel5(){
  emulator -avd pixel5 $EMULATOR_DEFAULT_ARGS
}