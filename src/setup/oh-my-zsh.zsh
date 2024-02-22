#!/usr/bin/env zsh

# oh-my-zsh will destructively nuke .zshrc file
export ZSH=$MPC_CONFIG_LIBS/oh-my-zsh;

echo "running oh-my-zsh install"
echo $MPC_CONFIG_LIBS
if [[ ! -d $MPC_CONFIG_LIBS ]]; then 
    mkdir $MPC_CONFIG_LIBS
fi
if [[ ! -d $MPC_CONFIG_LIBS/oh-my-zsh ]]; then
    cd $MPC_CONFIG_LIBS;
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi