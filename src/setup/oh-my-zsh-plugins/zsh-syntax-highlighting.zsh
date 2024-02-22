cloneTarget=$MPC_CONFIG_LIBS/zsh-syntax-highlighting

if [[ ! -d $cloneTarget ]]; then
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git $cloneTarget
fi

# To link with oh-my-zsh this will need to be symlinked into the plugins section