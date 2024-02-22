cloneTarget=$MPC_CONFIG_LIBS/evalcache

if [[ ! -d "$cloneTarget" ]]; then
    git clone --depth=1 https://github.com/mroth/evalcache $cloneTarget
fi

# To link with oh-my-zsh this will need to be symlinked into the plugins section