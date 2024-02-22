#!/usr/bin/env zsh

# install java
source $MPC_CONFIG/src/setup/brew-install-java.zsh

# jenv to manage the java sdks
# ls -1 /Library/Java/JavaVirtualMachines
# jenv add <path>
source $MPC_CONFIG/src/setup/install-jenv.zsh

# rbenv
source $MPC_CONFIG/src/setup/install-rbenv.zsh

# Git
source $MPC_CONFIG/src/setup/git.zsh

# FNM install
# Its 40x faster than NVM
# https://github.com/Schniz/fnm
if ! [ $(command -v fnm) ]; then
  curl -fsSL https://fnm.vercel.app/install | bash -s -- --install-dir $HOME/.fnm --skip-shell
  eval "$(fnm env)"
  fnm install ${DEFAULT_NODE_VERSION:-20}
fi

# nvm install
# https://github.com/nvm-sh/nvm#git-install
# if ! [[ $(command -v nvm) || -d $HOME/.nvm ]]; then
#   git clone https://github.com/nvm-sh/nvm.git $HOME/.nvm && cd $HOME/.nvm && git checkout v0.39.1
#   cd $MPC_CONFIG
# fi

source $MPC_CONFIG/src/setup/setup-xcode-node-file-permissions.zsh

# direnv
[ $(command -v direnv) ] || brew install direnv