#!/usr/bin/env zsh
# ANSI Colors
#Black        0;30     Dark Gray     1;30
#Red          0;31     Light Red     1;31
#Green        0;32     Light Green   1;32
#Brown/Orange 0;33     Yellow        1;33
#Blue         0;34     Light Blue    1;34
#Purple       0;35     Light Purple  1;35
#Cyan         0;36     Light Cyan    1;36
#Light Gray   0;37     White         1;37
ANSI(){
    SET="\033["
    COLOR="1;37m";
    case $1 in
      GREEN)
        echo "${SET}0;32m";
        ;;
      RED)
        echo "${SET}0;31m"
        ;;
      YELLOW)
        echo "${SET}1;33m"
        ;;
    esac
    printf "${SET}${COLOR}$2"
}