# this requires sudo due to /usr/local not being writeable without it

# for react-native the node binary needs to be symlinked into the folder from NVM or FNM binary location
setup_xcode_node(){
    sudo chown -R $(whoami) /usr/local/*
    ln -s $(which node) /usr/local/bin/node
}

setup_xcode_node